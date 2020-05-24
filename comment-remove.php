<?php
require('head.php');
if(!$_SESSION['login']) header("location: index.php");
if(!isset($_GET['id'])) header("location: index.php");
$query = $pdo->prepare("SELECT * FROM `comment` WHERE `id` = ?");
$query->execute([$_GET['id']]);
if($query->rowCount() == 0) header('location: index.php');
else {
    $row = $query->fetch(PDO::FETCH_BOTH);
    if($row['fk_USERid'] == $_SESSION['user']) {
        $query = $pdo->prepare("DELETE FROM `comment` WHERE `id` = ?");
        $query->execute([$_GET['id']]);
    }
    header("location: news.php?id=".$row['fk_NEWSid']);
}