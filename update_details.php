<?php

spl_autoload_register(function ($class_name) {
    $class_name = str_replace('\\', '/', $class_name);
    if (file_exists('vendor/TMDB4PHP/' . $class_name . '.php')) {
        include 'vendor/TMDB4PHP/' . $class_name . '.php';
    }
});

session_start();
include('MovieList.php');

use TMDB\Client;
use TMDB\structures\Movie;

$db = Client::getInstance(TMDB_API_KEY);
$db->adult = true;  // return adult content


$movieList = new MovieList();

/*
foreach ($movieList->movieDBrecs as $movieRec) {
	$title = trim(substr($movieRec['title'],0,-6));
	$year = substr($movieRec['title'],-5,-1);
	echo $movieRec['id']." | ".$movieRec['no'].", ".$title.", $year \n";

//	if (!in_array($movieRec['id'], range(1, 13))) {
//	if (!in_array($movieRec['id'], range(1, 11)) && $movieRec['id']<14) {
//	if (in_array($movieRec['id'], [45,46,64])) {
	if (!$movieRec['imdb_id']) {
		$results = array_values($db->search('movie', ['query'=>htmlspecialchars($title), 'year'=>$year]));

		if (count($results)) {
			$first = reset($results);
			$movie = new Movie($first->id);

			echo "title: " . $movie->title . "\n";
			echo "poster_path: " . $movie->poster_path . "\n";
			echo "tmdb_id: " . $movie->id . "\n";
			echo "imdb_id: " . $movie->imdb_id . "\n";
			echo "release_date: " . $movie->release_date . "\n";

			$movieList->updateMovieRec([
				'id' => $movieRec['id'],
				'title' => $movie->title,
				'poster_path' => $movie->poster_path,
				'tmdb_id' => $movie->id,
				'imdb_id' => $movie->imdb_id,
				'release_date' => $movie->release_date
			]);
		}
	}

	echo "\n\n";
}
*/

$options = [
	'sort_by' => 'vote_average.desc',
	'include_video' => 'false',
	'with_original_language' => 'en',
	'vote_count.gte' => '7000',
	'vote_average.gte' => '7.5',
];

$db->paged = false;
$tmdbResult = $db->info('discover', 'movie', false, $options);

if (count($tmdbResult) && $tmdbResult->total_results > 1) {

	/*
	foreach($tmdbResult->results as $movieRec) {
		$movie = new Movie($movieRec->id);

		echo "title: " . $movie->title . "\n";
		echo "poster_path: " . $movie->poster_path . "\n";
		echo "tmdb_id: " . $movie->id . "\n";
		echo "imdb_id: " . $movie->imdb_id . "\n";
		echo "release_date: " . $movie->release_date . "\n\n";

		$movieList->insertMovieRec([
			'title' => $movie->title,
			'poster_path' => $movie->poster_path,
			'tmdb_id' => $movie->id,
			'imdb_id' => $movie->imdb_id,
			'release_date' => $movie->release_date
		]);
	}
	*/

	$pos = 0;
	foreach($tmdbResult->results as $movie) {
		echo "pos no: " . ++$pos . "\n";
		echo "title: " . $movie->title . "\n";
		echo "poster_path: " . $movie->poster_path . "\n";
		echo "tmdb_id: " . $movie->id . "\n";
		echo "release_date: " . $movie->release_date . "\n\n";

		$movieRec = $movieList->getMovieRec($movie->id);

		$movieList->insertListLink([
			'movie_id' => $movieRec["id"],
			'pos_no' => $pos,
			'list_id' => 2,
		]);
	}

}

echo "done";
