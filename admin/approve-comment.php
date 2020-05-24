<?php
require('../head.php');
if(!$_SESSION['login']) header("location: index.php");
if(!is_admin($_SESSION['user'])) header("location: ../index.php");
if(!comment_exist($_GET['id'])) header("location: index.php");
$query = $pdo->prepare("UPDATE `comment` SET `approved` = 1 WHERE `id` = ?");
$query->execute([$_GET['id']]);

$query = $pdo->prepare("SELECT `fk_NEWSid` FROM `comment` WHERE `id` = ?");
$query->execute([$_GET['id']]);
$row = $query->fetch(PDO::FETCH_BOTH);

header("location: ../news.php?id=".$row['fk_NEWSid']);