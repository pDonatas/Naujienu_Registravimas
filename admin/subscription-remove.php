<?php
require('../head.php');
if(!$_SESSION['login']) header("location: index.php");
if(!is_admin($_SESSION['user'])) header("location: ../index.php");
$query = $pdo->prepare("DELETE FROM `subscription` WHERE `id` = ?");
$query->execute([$_GET['id']]);
header("location: subscription.php");