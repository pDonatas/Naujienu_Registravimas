<?php
require('../head.php');
if(!$_SESSION['login']) header("location: index.php");
if(!is_admin($_SESSION['user'])) header("location: ../index.php");
if(!comment_exist($_GET['id'])) header("location: index.php");
$query = $pdo->prepare("DELETE FROM `comment` WHERE `id` = ?");
$query->execute([$_GET['id']]);
header("location: comments.php");