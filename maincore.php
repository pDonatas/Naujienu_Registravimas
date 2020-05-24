<?php
ob_start();
if(!isset($_SESSION)) session_start();

//MySQL Duomenys
$host   = 'localhost';
$user   = 'root';
$pass   = '';
$db     = 'db_laboras';

try{
    $pdo = new PDO('mysql:host='.$host.';dbname='.$db, $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    $pdo->query("SET Names 'utf8'");
}catch(PDOException $e){
    die($e->getMessage());
}
//-------------------
if(!isset($_SESSION['login'])) $_SESSION['login'] = false;
if(!isset($_SESSION['user'])) $_SESSION['user'] = 0;
if($_SESSION['login']){
    $query = $pdo->prepare("SELECT * FROM `user` WHERE `id` = ?");
    $query->execute([$_SESSION['user']]);
    $user = $query->fetch(PDO::FETCH_BOTH);
}

//Sistemos darbai
//Patikrinam būsimas naujienas
$query = $pdo->prepare("SELECT * FROM `future_news` WHERE `publish_date` <= ?");
$query->execute([date("Y-m-d")]);
foreach($query as $row){
    $query2 = $pdo->prepare("SELECT * FROM `news` WHERE `id` = ?");
    $query2->execute([$row['fk_NEWSid']]);

    $row2 = $query2->fetch(PDO::FETCH_BOTH);
    if($row2['status'] == 1) {
        $query = $pdo->prepare("UPDATE `news` SET `updated_at` = ? WHERE `id` = ?");
        $query->execute([date("Y-m-d"), $row['fk_NEWSid']]);

        $query = $pdo->prepare("DELETE FROM `future_news` WHERE `id` = ?");
        $query->execute([$row['id']]);
    }
}