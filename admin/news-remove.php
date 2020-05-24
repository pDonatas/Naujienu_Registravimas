<?php
require('../head.php');
if(!$_SESSION['login']) header("location: index.php");
if(!is_admin($_SESSION['user'])) header("location: ../index.php");
if(!news_exist($_GET['id'])) header("location: index.php");
remove_reviews($_GET['id']);
remove_comments($_GET['id']);
remove_media($_GET['id']);

$query = $pdo->prepare("DELETE FROM `future_news` WHERE `fk_NEWSid` = ?");
$query->execute([$_GET['id']]);

$query = $pdo->prepare("DELETE FROM `archive_news` WHERE `fk_NEWSid` = ?");
$query->execute([$_GET['id']]);

$query = $pdo->prepare("DELETE FROM `news` WHERE `id` = ?");
$query->execute([$_GET['id']]);
header("location: news.php");