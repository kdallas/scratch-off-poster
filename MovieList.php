<?php

include('MovieListSettings.php');

class MovieList
{
	private $dbSrv = DB_SERVER;
	private $dbName = DB_NAME;
	private $dbUser = DB_USER;
	private $dbPass = DB_PASSWORD;
	protected $dbConn = null;

	protected $listID = 0;
	public $watched = [];
	public $movieList = [];
	public $movieDBrecs = [];
	public $total = 0;
	public $lists = [];

	public function __construct($listID = 1)
	{
		$this->dbConn = new mysqli($this->dbSrv, $this->dbUser, $this->dbPass, $this->dbName);
		$this->dbConn->set_charset("UTF8");
		
		if ($this->dbConn->connect_error) {
			die("Connection failed: " . $this->dbConn->connect_error);
		}

		$this->loadListByID($listID);
	}

	public function __destruct()
	{
		$this->dbConn->close();
	}

	private function getDBrecs()
	{
		$result = $this->dbConn->query("
			SELECT
				list_links.pos_no AS `no`,
				movie_list.title,
				movie_list.poster_path,
				movie_list.tmdb_id,
				movie_list.imdb_id,
				movie_list.release_date,
				list_links.split
			FROM list_links, movie_list
			WHERE list_links.list_id = {$this->listID}
			AND movie_list.id = list_links.movie_id
			ORDER BY CAST((`pos_no` * 10) AS UNSIGNED)
		");

		if ($total = $result->num_rows) {
			$this->movieDBrecs = [];
			while($row = $result->fetch_assoc()) {
				$this->movieDBrecs[] = $row;
			}
		}
		unset($result);
	}

	protected function loadPageData()
	{
		// retreive watched movie list from the database
		$watched = [];

		if ($userID = $this->getUserID()) {
			$result = $this->dbConn->query("SELECT watched_list FROM users WHERE userID = $userID LIMIT 1");
			if ($result->num_rows) {
				if($row = $result->fetch_assoc()) {
					$watched = json_decode($row["watched_list"]);
				}
			}
			unset($result);
		}

		$movieList = [];
		if ($total = count($this->movieDBrecs)) {
			$i = $splitNo = 0;
			foreach ($this->movieDBrecs as $row) {
				$row["watched"] = 0;
				if (count($watched)) {
					foreach($watched as $noSeen) {
						if ($noSeen == $row["no"]) {
							$watchedClass = ' watched';
							$row["watched"] = 1;
						}
					}
				}

				if ($row["split"]) {
					$movieList[$i][] = $row;
					$splitNo++;
				} else {
					if ($splitNo) {
						$splitNo = 0;
						$i++;
					}
					$movieList[$i++] = $row;
				}
			}
		}

		$this->watched = $watched;
		$this->movieList = $movieList;
		$this->total = $total;
	}

	protected function getUserID($listID = 0)
	{
		$userID = NULL;
		if (!$listID) {
			$listID = $this->listID;
		}

		// use the cookie values but only when a new user Code hasn't been requested
		$updateCookies = isset($_SESSION['updateCookies']) ? $_SESSION['updateCookies'] : 0;

		if (isset($_SESSION['movieLists'][$listID])) {
			$userID = hexdec($_SESSION['movieLists'][$listID]['userCode']);
		} elseif (isset($_COOKIE['movieLists']) && !$updateCookies) {
			$listMatch = false;
			foreach (json_decode($_COOKIE['movieLists']) as $cKey=>$cVal) {
				// copy ALL cookie values to session
				$_SESSION['movieLists'][$cKey] = ['userCode'=>$cVal->userCode];
				if ($cKey == $listID) {
					$listMatch = true;
				}
			}
			if ($listMatch) {
				$userID = hexdec($_SESSION['movieLists'][$listID]['userCode']);
			}
		}

		return $userID;
	}

	public function setNewUserID($listID = 0)
	{
		// if we don't have a userCode set yet, grab a generated one excluding those we've already saved before
		$userID = $this->generateUserID();

		// set the _SESSION only
		$this->setUserCode($userID, true, false, $listID);
	}

	private function setUserCode($userID, $setSession=true, $setCookie=false, $listID = 0)
	{
		if (!$listID) {
			$listID = $this->listID;
		}

		if ($setSession) {
			$_SESSION['movieLists'][$listID] = ['userCode'=>self::userID2Code($userID)];
			// before page content is loaded, ensure the cookies are set
			$_SESSION['updateCookies'] = 1;
		}

		if ($setCookie) {
			$_SESSION['updateCookies'] = 0;
			setcookie(
				"movieLists",
				json_encode($_SESSION['movieLists']),
				time() + (365 * 24 * 60 * 60) // 1 year
			);
		}
	}

	private function checkUserExists($userID)
	{
		$result = $this->dbConn->query("SELECT userID FROM users WHERE userID = $userID AND list_id = {$this->listID} LIMIT 1");
		if ($result->num_rows) {
			if ($row = $result->fetch_assoc()) {
				return $row["userID"];
			}
		}

		return 0;
	}

	public static function userID2Code($userID)
	{
		return strtoupper(dechex($userID));
	}

	public function updateWatchList(&$post)
	{
		$userID = $this->getUserID();

		// if nothing recorded as watched, this is likely a new user -- so create one by doing an insert below (after checking if user exists here)
		$userExists = 1;
		if (!count($this->watched)) {
			$userExists = $this->checkUserExists($userID);
		}

		if ($post["action"]=='add') {
			$this->watched[] = $post["movieNo"];
		} else {
			$newWatched = [];
			foreach($this->watched as $noSeen) {
				if ($noSeen != $post["movieNo"]) {
					$newWatched[] = $noSeen;
				}
			}
			$this->watched = $newWatched;
		}

		if (count($this->watched) > 1) {
			sort($this->watched);
			$this->watched = array_keys(array_flip($this->watched)); // ensure uniqueness and integers will be saved as integers
		}

		if ($userExists) {
			$result = $this->dbConn->query("UPDATE `users` SET `watched_list`='" . json_encode($this->watched) . "' WHERE (`userID`=$userID)");
		} else {
			$result = $this->dbConn->query("INSERT INTO `users` (`id`, `userID`, `list_id`, `watched_list`) VALUES (NULL, '$userID', ".$post["listID"].", '" . json_encode($this->watched) . "')");
		}

		if ($result === TRUE) {
			echo $post["action"]=='add' ? 'added' : 'removed';
		} else {
			echo 'failed';
		}
	}

	public function updateMovieRec($record)
	{
		$id = array_shift($record);
		$fields = [];

		foreach($record as $field => $val) {
		   $fields[] = "`$field`='".$this->dbConn->real_escape_string($val)."'";
		}

		$sql = "UPDATE `movie_list` SET " . join(', ', $fields) . " WHERE (`id`='$id')";
		$result = $this->dbConn->query($sql);

		return $result;
	}

	protected function prepareInsert($table, $record)
	{
		$columns = implode("`, `", array_keys($record));
		$escaped_values = array_map('addslashes', array_values($record));
		$values  = implode("', '", $escaped_values);
		return "INSERT INTO `$table` (`$columns`) VALUES ('$values')";
	}

	public function getMovieRec($tmdb_id)
	{
		$row = [];
		$result = $this->dbConn->query("SELECT * FROM `movie_list` WHERE tmdb_id = $tmdb_id LIMIT 1");
		if ($result->num_rows) {
			$row = $result->fetch_assoc();
		}
		unset($result);
		return $row;
	}

	public function insertMovieRec($record)
	{
		if (isset($record["tmdb_id"])) {
			$row = $this->getMovieRec($record["tmdb_id"]);
			if (count($row)) {
				// already have it!
				return true;
			}

			$sql = $this->prepareInsert('movie_list', $record);
			$result = $this->dbConn->query($sql);
			return $result;
		}

		return false;
	}

	public function insertListLink($record, $type='movie_id')
	{
		// check if we have already linked this movie to this list before
		$result = $this->dbConn->query("SELECT `id` FROM `list_links` WHERE $type=".$record[$type]." AND list_id=".$record["list_id"]." LIMIT 1");
		if ($result->num_rows) {
			// already linked!
			return true;
		}
		unset($result);

		$sql = $this->prepareInsert('list_links', $record);
		$result = $this->dbConn->query($sql);
		return $result;
	}

	public function generateUserID()
	{
		$excludeIDs = [];

		$result = $this->dbConn->query("SELECT userID FROM users ORDER BY userID");
		if ($total = $result->num_rows) {
			while($row = $result->fetch_assoc()) {
				$excludeIDs[] = $row["userID"];
			}
		}
		unset($result);

		// also exclude userIDs from existing sessions
		if (isset($_SESSION['movieLists'])) {
			foreach($_SESSION['movieLists'] as $mList) {
				if (isset($mList['userCode'])) {
					$excludeIDs[] = hexdec($mList["userCode"]);
				}
			}
		}

		while(in_array(($userID = rand(100, 4094)), $excludeIDs));
		return $userID;
	}

	public function loadListByID($listID)
	{
		$this->setListID($listID);
		$this->getDBrecs();
		$this->loadPageData();
	}

	public function setListID($listID)
	{
		$this->listID = $listID;
	}

	public function loadLists()
	{
		if (!isset($_SESSION['activeListID'])) {
			$_SESSION['activeListID'] = 1;
		}

		if (!isset($_SESSION['sfxMuted'])) {
			$_SESSION['sfxMuted'] = 0;
		}

		$result = $this->dbConn->query("SELECT * FROM lists");
		if ($result->num_rows) {
			while($row = $result->fetch_assoc()) {
				$row["selected"] = ($row["id"] == $_SESSION['activeListID']);
				$this->lists[] = $row;
			}
		}
		unset($result);

		// if this is the first run, then only list 1 will have a session
		// iterate over the remaining list IDs and set up their sessions with a userCode
		foreach ($this->lists as $list) {
			if (!isset($_SESSION['movieLists'][$list['id']]['userCode'])) {
				$this->setNewUserID($list['id']);
			}
		}

		$updateCookies = isset($_SESSION['updateCookies']) ? $_SESSION['updateCookies'] : 0;

		// check & set COOKIES here as this will only be loaded once on initial GET request
		if (!isset($_COOKIE['movieLists']) || $updateCookies) {
			$this->setUserCode(0, false, true);
		} else {
			// if cookies are already set, then we should override the userCodes in the session
			// this is because they may have been randomly generated, and we should use whatever was already saved
			foreach (json_decode($_COOKIE['movieLists']) as $cKey=>$cVal) {
				foreach ($this->lists as $list) {
					if ($cKey == $list['id']) {
						$_SESSION['movieLists'][$cKey] = ['userCode'=>$cVal->userCode];
					}
				}
			}
		}
	}

	// called from POST only
	public function loadUserCode($userCode)
	{
		if ($userID = $this->checkUserExists(hexdec($userCode))) {
			// set the _SESSION only
			$this->setUserCode($userID);
		}

		echo $_SESSION['movieLists'][$this->listID]['userCode'];
	}

	public function displayCardInner($itemNos, $data)
	{
		echo '<div class="card-divider">';
		echo '<div class="item-no">'.$itemNos.'</div>';

		if (count($data) == 1) {
			echo '<div class="controls">';
			echo '<span class="icon icon-forward2 hide"></span>';
			if ($data[0]["watched"]) {
				echo '<span class="icon icon-cancel-circle"></span>';
				echo '<span class="icon icon-checkmark2"></span>';
			} else {
				echo '<span class="icon icon-cancel-circle hide"></span>';
				echo '<span class="icon icon-neutral"></span>';
			}
			echo '</div>';
		}

		echo '</div>'; // .card-divider


		if (count($data) == 1) {
			foreach ($data as $subItem) {
				echo '<div class="img" data-no="'.$subItem["no"].'" data-watched="'.$subItem["watched"].'">';
					echo '<img src="https://image.tmdb.org/t/p/w185/'.$subItem["poster_path"].'">';
					$watchedClass = $subItem["watched"] ? ' class="hide"' : '';
					echo '<canvas'.$watchedClass.'></canvas>';
					echo '</div>';
					echo '<div class="card-section">';
					echo '<p><a href="https://www.imdb.com/title/'.$subItem["imdb_id"].'/" target="_blank">'.$subItem["title"].'</a> ('.substr($subItem["release_date"],0,4).')</p>';
				echo '</div>';
			}
		} else {
			foreach ($data as $subItem) {
				echo '<div class="img">';

					echo '<span class="card-divider">';
						echo '<div class="controls">';
							echo '<div class="icon icon-forward2 hide"></div>';
							if ($subItem["watched"]) {
								echo '<div class="icon icon-cancel-circle"></div>';
								echo '<div class="icon icon-checkmark2"></div>';
							} else {
								echo '<div class="icon icon-cancel-circle hide"></div>';
								echo '<div class="icon icon-neutral"></div>';
							}
						echo '</div>';
					echo '</span>';

					echo '<div class="multi-img" data-no="'.$subItem["no"].'" data-watched="'.$subItem["watched"].'">';
						echo '<img src="https://image.tmdb.org/t/p/w185/'.$subItem["poster_path"].'">';
						$watchedClass = $subItem["watched"] ? ' class="hide"' : '';
						echo '<canvas'.$watchedClass.'></canvas>';
					echo '</div>';

				echo '</div>';

				echo '<div class="card-section">';
				echo '<p><a href="https://www.imdb.com/title/'.$subItem["imdb_id"].'/" target="_blank">'.$subItem["title"].'</a> ('.substr($subItem["release_date"],0,4).')</p>';
				echo '</div>';
			}
		}
	}
}
