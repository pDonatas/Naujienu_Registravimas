<?php
require '../maincore.php';
require '../functions.php';
if(!$_SESSION['login']) header("location: index.php");
if(!is_admin($_SESSION['user'])) header("location: index.php");
$query = $pdo->prepare("DELETE FROM `news_archive` WHERE `id` = ?");
$query->execute([$_GET['id']]);
header("location: archive-news.php");