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

if (isset($_POST["action"], $_POST["movieNo"])) {
	$movieList->updateWatchList($_POST);
	die();
}

if (isset($_POST["codeInput"])) {
	$movieList->loadUserCode($_POST["codeInput"]);
	die();
}

if (isset($_POST["codeRequest"])) {
	$userID = $movieList->generateUserID();
	$_SESSION['userCode'] = strtoupper(dechex($userID));
	echo $_SESSION['userCode'];
	die();
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>100 Movies Bucket List Scratch off Poster - How many can you scratch off?</title>
	<link href="./css/site.min.css" rel="stylesheet" />
	<link href="assets/img/movie-play-button-icon_r1.png" rel="icon" type="image/png" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
</head>
<body>

	<div class="master-container">
		<div class="content-container">

			<div class="grid-x">
				<div class="cell medium-6 large-6 introduction">
					<h2><small>100 Movies Bucket List Scratch off Poster</small></h2>
					<p>Gift Republic sells a series of scratch off posters that feature 100 places to visit, 100 books to read etc.  This is the movie version.</p>
					<p>Start by moving your mouse (or finger) over the greyed out panels. Click and hold the button down and get scratching!</p>
					<p>If you have a lot of movies to scratch off, you can speed things along when the fast-forward <span class="icon icon-forward2"></span> icon appears.</p>
					<p>To SAVE your progress, remember your user code so you can return at any time and enter it into the input box. You can also generate a new code and start over.</p>
				</div>
				<div class="cell medium-4 large-4 medium-offset-2 large-offset-2">
					<div class="callout">
						<h5>Attribution and inspiration...</h5>
						<ul>
							<li><a href="https://www.listchallenges.com/100-movies-bucket-list-scratch-off-poster" target="_blank">"100 Movies Bucket List Scratch off Poster"</a> on List Challenges by <a href="https://www.listchallenges.com/profile/272412">shyguy</a></li>
							<li><a href="https://codepen.io/dudleystorey/pen/yJQxLX" target="_blank">Scratch Reveal with <?=htmlspecialchars('<canvas>')?></a> by <a href="https://codepen.io/dudleystorey" target="_blank">Dudley Storey</a></li>
							<li><a href="https://github.com/sbrl/soundbox" target="_blank">SoundBox</a> by Starbeamrainbowlabs</li>
							<li>Poster images courtesy of <a href="https://www.themoviedb.org/" target="_blank">The Movie DB</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="content-container">
			<div class="grid-container full">
				<div class="grid-x cards-100-top">
                    <div class="cell small-12 medium-3 sub-title">
                        <h4><small>How many can you scratch off?</small></h4>
                    </div>
                    <div class="cell small-8 medium-6 user-code">
                        <h4>Your Code: <span class="userCode"><?php
                            echo '<input type="text" placeholder="Code" maxlength="4" value="'.$_SESSION['userCode'].'" data-code="'.$_SESSION['userCode'].'" />';
                        ?></span><button type="button" class="button">Get New Code</button><span class="waiting"></span></h4>
                    </div>
                    <div class="cell small-4 medium-3 counter">
                        <h4><small><span id="mute-btn" class="icon icon-volume-high" title="Mute"></span></small><span class="pipe">|</span> &nbsp;<small><span class="watched"><?=count($movieList->watched)?></span> of <span class="total"><?=$movieList->total?></span></small></h4>
                    </div>
				</div>
				<div class="grid-x cards-100-gallery hide">
					<?php
					foreach ($movieList->movieList as $item) {
						echo '<div class="gallery-cell">';
						if (isset($item[0])) {
							// card needs to be split
							$nos = [];
							foreach ($item as $subItem) {
								$nos[] = $subItem["no"];
							}
							$itemNos = implode(' &nbsp;|&nbsp; ', $nos);
							echo '<div class="card split">';
							$movieList->displayCardInner($itemNos, $item);
						} else {
							// normal card
							echo '<div class="card">';
							$movieList->displayCardInner($item["no"], [$item]);
						}
						echo '</div>';
						echo '</div>';
					}
					?>
				</div>
			</div>
		</div>

		<div class="content-container">
			<div class="grid-x grid-padding-x align-justify">
				<div class="cell small-4">Taxidermy farm-to-table ethical distillery 8-bit venmo.</div>
				<div class="cell small-4 text-right">
					<div class="themoviedb-logo"></div>
				</div>
			</div>
		</div>
	</div>

	<script src="./js/soundbox.min.js"></script>
	<script src="./js/100-movies-reveal.min.js"></script>
</body>
</html>