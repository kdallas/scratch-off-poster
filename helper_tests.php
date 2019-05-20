<?php

session_start();
include('MovieList.php');

$movieList = new MovieList();

echo "\n". $movieList::userID2Code(3291); // CDB
echo "\n". $movieList::userID2Code(3574); // DF6
echo "\n\n";
