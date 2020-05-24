<?php
require '../maincore.php';
require '../functions.php';
if(!$_SESSION['login']) header("location: index.php");
if(!is_admin($_SESSION['user'])) header("location: index.php");
if(!user_exist($_GET['id'])) header("location: index.php");
remove_comments($_GET['id'], 2);;
remove_reviews($_GET['id'], 2);
remove_media($_GET['id'], 2);
remove_news($_GET['id']);
$query = $pdo->prepare("DELETE FROM `user` WHERE `id` = ?");
$query->execute([$_GET['id']]);
header("location: users.php");