<?php
require '../maincore.php';
require '../functions.php';
if(!$_SESSION['login']) header("location: index.php");
if(!is_admin($_SESSION['user'])) header("location: index.php");
if(!news_exist($_POST['news'])) header("location: index.php");
if(future_exists($_POST['news'])) header("location: index.php");
if(archive_exists($_POST['news'])) header("location: index.php");
if(!isset($_POST['ok'])) header("location: index.php");
$query = $pdo->prepare("INSERT INTO `future_news` (`fk_NEWSid`, `publish_date`) VALUES (?, ?)");
$query->execute([$_POST['news'], $_POST['date']]);
header("location: future-news.php");