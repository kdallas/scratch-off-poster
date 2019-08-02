<?php

include('MovieListSettings.php');

class MovieList {

	private $dbSrv = DB_SERVER;
	private $dbName = DB_NAME;
	private $dbUser = DB_USER;
	private $dbPass = DB_PASSWORD;
	private $dbConn = null;

	private $listID = 0;

	public  $watched = [];
	public  $movieList = [];
	public  $movieDBrecs = [];
	public  $total = 0;
	public  $lists = [];

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

	private function loadPageData()
	{
		$userID = $this->getUserID(); // DF6 == mine!

		// retreive watched movie list from the database
		$watched = [];
		$result = $this->dbConn->query("SELECT watched_list FROM users WHERE userID = $userID LIMIT 1");
		if ($result->num_rows) {
			if($row = $result->fetch_assoc()) {
				$watched = json_decode($row["watched_list"]);
			}
		}
		unset($result);

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
		} else {
			die("0 results");
		}

		$this->watched = $watched;
		$this->movieList = $movieList;
		$this->total = $total;
	}

	private function getUserID()
	{
		if (isset($_SESSION['movieLists'][$this->listID])) {
			$userID = hexdec($_SESSION['movieLists'][$this->listID]['userCode']);
			// check the cookie has been set
			if (!isset($_COOKIE['movieLists'])) {
				$this->setUserCode($userID, false);
			} else {
				// still need to check if the userID for this list has been set
				$cookieIsSet = true;
				foreach (json_decode($_COOKIE['movieLists']) as $cKey=>$cVal) {
					if ($cKey == $this->listID && $_SESSION['movieLists'][$this->listID]['userCode'] != $cVal->userCode) {
						$cookieIsSet = false;
					}
				}

				if (!$cookieIsSet) {
					$this->setUserCode($userID, false);
				}
			}
		} elseif (isset($_COOKIE['movieLists'])) {
			$sessionSet = false;
			foreach (json_decode($_COOKIE['movieLists']) as $cKey=>$cVal) {
				if ($cKey == $this->listID) {
					$_SESSION['movieLists'][$this->listID] = ['userCode'=>$cVal->userCode];
					$sessionSet = true;
				}
			}

			if ($sessionSet) {
				$userID = hexdec($_SESSION['movieLists'][$this->listID]['userCode']);
			} else {
				$userID = $this->generateUserID();
				$this->setUserCode($userID);
			}
		} else {
			// if we don't have a userCode set yet, grab a generated one excluding those we've already saved before
			$userID = $this->generateUserID();

			// set the _SESSION and _COOKIE
			$this->setUserCode($userID);
		}

		return $userID;
	}

	private function setUserCode($userID, $setSession=true)
	{
		if ($setSession) {
			$_SESSION['movieLists'][$this->listID] = ['userCode'=>self::userID2Code($userID)];
		}

		// need to change this to only run once on page load (i.e. for ALL lists, not one at a time)
		/*
		setcookie(
			"movieLists",
			json_encode($_SESSION['movieLists']),
			time() + (365 * 24 * 60 * 60) // 1 year
		);
		*/
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

	private function prepareInsert($table, $record)
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

	public function insertListLink($record)
	{
		// check if we have already linked this movie to this list before
		$result = $this->dbConn->query("SELECT `id` FROM `list_links` WHERE movie_id=".$record["movie_id"]." AND list_id=".$record["list_id"]." LIMIT 1");
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
		if (!isset($_SESSION['activeMovieListID'])) {
			$_SESSION['activeMovieListID'] = 1;
		}

		if (!isset($_SESSION['sfxMuted'])) {
			$_SESSION['sfxMuted'] = false;
		}

		$result = $this->dbConn->query("SELECT * FROM lists");
		if ($result->num_rows) {
			while($row = $result->fetch_assoc()) {
				$row["selected"] = ($row["id"] == $_SESSION['activeMovieListID']);
				$this->lists[] = $row;
			}
		}
		unset($result);
	}

	public function loadUserCode($userCode)
	{
		if ($userID = $this->checkUserExists(hexdec($userCode))) {
			// set the _SESSION and _COOKIE
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
