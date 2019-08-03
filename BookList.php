<?php

class BookList extends MovieList
{
	public $bookDBrecs = [];

	public function __construct($listID)
	{
		parent::__construct();
		// copy book records to the movies array, and treat their data the same as movies
		$this->setListID($listID);
		$this->getDBrecs();
		$this->movieDBrecs = $this->bookDBrecs;
		$this->loadPageData();
	}

	private function getDBrecs()
	{
		$result = $this->dbConn->query("
			SELECT
				list_links.pos_no AS `no`,
				book_list.title,
				book_list.author,
				book_list.published_date,
				book_list.volume_id,
				list_links.split
			FROM list_links, book_list
			WHERE list_links.list_id = {$this->listID}
			AND book_list.id = list_links.book_id
			ORDER BY CAST((`pos_no` * 10) AS UNSIGNED)
		");

		if ($total = $result->num_rows) {
			$this->bookDBrecs = [];
			while($row = $result->fetch_assoc()) {
				$this->bookDBrecs[] = $row;
			}
		}
		unset($result);
	}

	public function getBookRec($volume_id)
	{
		$row = [];
		$result = $this->dbConn->query("SELECT * FROM `book_list` WHERE volume_id = '$volume_id' LIMIT 1");
		if ($result->num_rows) {
			$row = $result->fetch_assoc();
		}
		unset($result);
		return $row;
	}

	public function insertBookRec($record)
	{
		if (isset($record["volume_id"])) {
			$row = $this->getBookRec($record["volume_id"]);
			if (count($row)) {
				// already have it!
				return true;
			}

			$sql = $this->prepareInsert('book_list', $record);
			$result = $this->dbConn->query($sql);
			return $result;
		}

		return false;
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

				$imgPath = 'assets/img/cache/'.urlencode($subItem["volume_id"]).'.png';
				// due to issues with CORS to Google Books API, it is far easier to "cache" the images first, rather than dynamically create canvasses from them
				if (!file_exists($imgPath)) {
					copy('https://books.google.com/books/content?id='.$subItem["volume_id"].'&printsec=frontcover&img=1&zoom=1&key='.GOOGLE_BOOKS_API_KEY, $imgPath);
				}
				echo '<img src="'.$imgPath.'" />';

				$watchedClass = $subItem["watched"] ? ' class="hide"' : '';
				echo '<canvas'.$watchedClass.'></canvas>';
				echo '</div>';
				echo '<div class="card-section">';
				echo '<p><a href="https://books.google.com.au/books?id='.$subItem["volume_id"].'" target="_blank">'.$subItem["title"].'</a> <span class="author">('.$subItem["author"].')</span></p>';
				echo '</div>';
			}
		}
	}
}
