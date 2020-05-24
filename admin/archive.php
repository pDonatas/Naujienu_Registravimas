<?php
require('../maincore.php');
require('../functions.php');
if(!$_SESSION['login']) header('location: ../login.php');
if(!is_admin($_SESSION['user'])) header("location: ../index.php");
if(news_exist($_GET['id'])){
    if(!future_exists($_GET['id'])) {
        $query = $pdo->prepare("SELECT * FROM `news_archive` WHERE `id` = ?");
        $query->execute([$_GET['id']]);
        if ($query->rowCount() == 0) {
            $query = $pdo->prepare("INSERT INTO `news_archive` (`fk_NEWSid`, `archive_date`) VALUES (?, ?)");
            $query->execute([$_GET['id'], date("Y-m-d")]);
        }
    }echo "Ši naujiena dar nepaskelbta";
}else{
    echo "Naujiena neegzistuoja";
}
header("location: archive-news.php");