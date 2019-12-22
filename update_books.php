<?php

/*
spl_autoload_register(function ($class_name) {
    $class_name = str_replace('\\', '/', $class_name);
    if (file_exists('vendor/TMDB4PHP/' . $class_name . '.php')) {
        include 'vendor/TMDB4PHP/' . $class_name . '.php';
    }
});

session_start();
*/
include('MovieList.php');
/*
use TMDB\Client;
use TMDB\structures\Movie;

$db = Client::getInstance(TMDB_API_KEY);
$db->adult = true;  // return adult content

$movieList = new MovieList();
*/

include('BookList.php');

$bookList = new BookList();


/*
https://developers.google.com/books/docs/v1/using
https://developers.google.com/books/docs/v1/reference/bookshelves

example search:

https://www.googleapis.com/books/v1/volumes?q=harry+potter

--->

{
 "kind": "books#volumes",
 "totalItems": 1357,
 "items": [
  {
   "kind": "books#volume",
   "id": "2sSMCwAAQBAJ",
   "selfLink": "https://www.googleapis.com/books/v1/volumes/2sSMCwAAQBAJ",
   "volumeInfo": {
    "title": "Harry Potter and the Cursed Child – Parts One and Two (Special Rehearsal Edition)",
   ...

--->

http://books.google.com/books/content?id=2sSMCwAAQBAJ&printsec=frontcover&img=1&zoom=2


*/


$file = fopen("data/100_books_bucket.csv","r");
//print_r(fgetcsv($file));

$rows = [];
while(! feof($file)) {
	$rows[] = fgetcsv($file);
}

fclose($file);

/*
print_r($rows);
	[0] => Array
        (
            [0] => ﻿1
            [1] => American Gods
            [2] => Neil Gaiman
        )

    [1] => Array
        (
            [0] => 2
            [1] => Lord of the Flies
            [2] => William Golding
        )

[imageLinks] => stdClass Object
(
	[smallThumbnail] => http://books.google.com/books/content?id=fXfJCKXp5-kC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api
	[thumbnail] => http://books.google.com/books/content?id=fXfJCKXp5-kC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api
)

*/

//$booksAPIurl = 'https://www.googleapis.com/books/v1/volumes?q=intitle:'.urlencode().'+inauthor:William+Golding&maxResults=3&printType=books&projection=lite';

//$homepage = file_get_contents('http://www.example.com/');

$apiKey = GOOGLE_BOOKS_API_KEY;
$maxResults = 1;

// 61,The Handmaid's Tale,Margaret Attwood | mKOjMctROckC
$volumeID = 'mKOjMctROckC';

$i=0;
/*
foreach ($rows as $row) {

	if (++$i < 31) {
		continue;
	}

	$booksAPIurl = 'https://www.googleapis.com/books/v1/volumes?q=intitle:'.urlencode($row[1]).'+inauthor:'.urlencode($row[2]).'&maxResults='.$maxResults.'&printType=books&projection=lite&key='.$apiKey;
	//$booksAPIurl = 'https://www.googleapis.com/books/v1/volumes?q=intitle:'.urlencode($row[1]).'&maxResults='.$maxResults.'&printType=books&projection=lite&key='.$apiKey;
	//$booksAPIurl = 'https://www.googleapis.com/books/v1/volumes?q=inauthor:'.urlencode($row[2]).'+intitle:'.urlencode($row[1]).'&maxResults='.$maxResults.'&printType=books&projection=lite&key='.$apiKey;
	//$booksAPIurl = 'https://www.googleapis.com/books/v1/volumes/'.$volumeID.'&key='.$apiKey;
	//die($booksAPIurl);

	if (($apiJSONresponse = file_get_contents($booksAPIurl)) !== FALSE) {
		$apiResponse = json_decode($apiJSONresponse);
		//print_r($apiResponse);

		if (isset($apiResponse->items) && count($apiResponse->items)) {

			if (count($apiResponse->items) > 1) {
				print_r($apiResponse->items);
				die();
			}

			$book = array_shift($apiResponse->items);

//			print_r($book);
			if (isset($book->volumeInfo->authors)) {
				$author = array_shift($book->volumeInfo->authors);
			} else {
				$author = '';
			}

			//$author = $book->volumeInfo->authors[0];
			if (isset($book->volumeInfo->publishedDate)) {
				$date = $book->volumeInfo->publishedDate;
				if (strlen($date)==4) {
					$date .= '-01-01';
				}
			} else {
				$date = '';
				//$date = '1949-06-08'; // George Orwell, 1984
			}

			echo "volume_id: $book->id \n";
			echo "title: {$book->volumeInfo->title} \n";
			echo "author: $author \n";
			//echo "published_date: {$book->volumeInfo->publishedDate} \n";
			echo "published_date: $date \n";
			echo "\n";

			$bookList->insertBookRec([
				'title' => $book->volumeInfo->title,
				'author' => $author,
				'published_date' => $date,
				'volume_id' => $book->id,
			]);

		} else {
			echo "problem with: $row[1] \n\n";
		}

//		if ($i>21) {
			die();
//		}
	}
}
*/


/*
$booksAPIurl = 'https://www.googleapis.com/books/v1/volumes/'.$volumeID;
//die($booksAPIurl);

if (($apiJSONresponse = file_get_contents($booksAPIurl)) !== FALSE) {

	$book = json_decode($apiJSONresponse);

//			print_r($book);
	if (isset($book->volumeInfo->authors)) {
		$author = array_shift($book->volumeInfo->authors);
	} else {
		$author = '';
	}

	//$author = $book->volumeInfo->authors[0];
	if (isset($book->volumeInfo->publishedDate)) {
		$date = $book->volumeInfo->publishedDate;
		if (strlen($date)==4) {
			$date .= '-01-01';
		}
	} else {
		$date = '';
	}

	echo "volume_id: $book->id \n";
	echo "title: {$book->volumeInfo->title} \n";
	echo "author: $author \n";
	//echo "published_date: {$book->volumeInfo->publishedDate} \n";
	echo "published_date: $date \n";
	echo "\n";

	$bookList->insertBookRec([
		'title' => $book->volumeInfo->title,
		'author' => $author,
		'published_date' => $date,
		'volume_id' => $book->id,
	]);

}
*/


//print_r($bookList->bookDBrecs);

foreach ($rows as $row) {
	$i++;
	$match = 0;

	foreach ($bookList->bookDBrecs as $book) {
		if (!$match && strtolower($row[1]) == strtolower($book["title"])) {
			echo "title match for [$i]: $row[1] === {$book["title"]} \n";
			$match = $book["id"];
		} /*elseif (!$match && strtolower($row[2]) == strtolower($book["author"])) {
			//echo "author match for [$i]: $row[1] \n";
			echo "author match for [$i]: $row[1] === {$book["title"]} \n";
			$match = $book["id"];
		}*/
	}

	foreach ($bookList->bookDBrecs as $book) {
		/*if (!$match && strtolower($row[1]) == strtolower($book["title"])) {
			echo "title match for [$i]: $row[1] === {$book["title"]} \n";
			$match = $book["id"];
		} else*/ if (!$match && strtolower($row[2]) == strtolower($book["author"])) {
			//echo "author match for [$i]: $row[1] \n";
			echo "author match for [$i]: $row[1] === {$book["title"]} \n";
			$match = $book["id"];
		}
	}


	if ($match) {

		$bookList->insertListLink([
			'book_id' => $match,
			'pos_no' => $i,
			'list_id' => 3,
		], 'book_id');

	} else {
		echo "no match for [$i]: $row[1] \n";
	}
}







echo "done";
