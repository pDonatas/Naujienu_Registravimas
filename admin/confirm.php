<?php
require('../maincore.php');
require('../functions.php');
if(!$_SESSION['login'] || !is_admin($_SESSION['user'])) header('location: ../index.php');
if(!news_exist($_GET['id'])) header("location: news.php");
if(!isset($_GET['type'])) {
    $query = $pdo->prepare("SELECT `status` FROM `news` WHERE `id` = ?");
    $query->execute([$_GET['id']]);
    $row = $query->fetch(PDO::FETCH_BOTH);
    if ($row['status'] == 1) header('location: news.php');
    else {
        $query = $pdo->prepare("UPDATE `news` SET `status` = 1, `fk_ADMINid` = ?, `updated_at` = ? WHERE `id` = ?");
        $query->execute([admin_id($_SESSION['user']), date("Y-m-d"), $_GET['id']]);
        header("location: news.php");
    }
}else{
    $query = $pdo->prepare("SELECT `approved` FROM `comment` WHERE `id` = ?");
    $query->execute([$_GET['id']]);
    $row = $query->fetch(PDO::FETCH_BOTH);
    if ($row['approved'] == 1) header('location: comments.php');
    else {
        $query = $pdo->prepare("UPDATE `comment` SET `approved` = 1, `fk_ADMINid` = ?, `updated_at` = ? WHERE `id` = ?");
        $query->execute([admin_id($_SESSION['user']), date("Y-m-d"), $_GET['id']]);
        header("location: comments.php");
    }
}