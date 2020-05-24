<?php
if(!isset($_GET['id'])) header("location: index.php");
require_once 'maincore.php';
require('functions.php');
if($_SESSION['login']){
    if(news_exist($_GET['id'])) {
        if (!is_voted($_SESSION['user'], $_GET['id'])) {
            $query = $pdo->prepare("INSERT INTO `review` (`vote`, `fk_NEWSid`, `fk_USERid`) VALUES (?, ?, ?)");
            $query->execute([
                $_POST['vote'], $_GET['id'], $_SESSION['user']
            ]);
        }
        header('location: news.php?id='.$_GET['id']);
    } else header('location: index.php');
}else header('location: index.php');