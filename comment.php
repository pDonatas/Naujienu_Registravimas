<?php
require 'maincore.php';
if($_SESSION['login']){
    if(isset($_POST['ok'])){
        $query = $pdo->prepare("INSERT INTO `comment`(`text`, `created_at`, `updated_at`, `approved`, `fk_NEWSid`, `fk_USERid`) VALUES 
        (?, ?, ?, ?, ?, ?)");
        $query->execute([
            $_POST['text'],
            date("Y-m-d"),
            date("Y-m-d"),
            0,
            $_POST['newsid'],
            $_SESSION['user']
        ]);
        header("location: news.php?id=".$_POST['newsid']);
    }
}