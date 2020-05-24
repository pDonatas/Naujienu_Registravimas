<!DOCTYPE html>
<html lang="en">
<?php
require_once('maincore.php');
require_once('functions.php');
?>
<head>
    <base href="http://localhost/dblaboras/">
    <meta charset="UTF-8">
    <title><?=$title;?> :: Laboratorinis darbas</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link href="css/lightbox.css" rel="stylesheet" />
    <script
        src="js/jquery-3.5.0.min.js"
        integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
        crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
    <script src="js/lightbox.js"></script>
</head>
<body>
<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">L2</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.php">Pagrindinis <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="subscription.php">Naujienlaiškis</a>
                </li>
            </ul>
            <ul class="navbar-nav mr-5">
                <?php
                if(!$_SESSION['login']){
                echo '
                <li class="nav-item">
                    <a class="nav-link" href="login.php">Prisijungimas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="register.php">Registracija</a>
                </li>';
                }else{
                    if(is_admin($_SESSION['user'])){
                        echo '
                       <li class="nav-item">
                        <a class="nav-link" href="admin/index.php"><button class="btn btn-danger">Administravimas</button></a>
                       </li>';
                    }
                    echo '
                   <li class="nav-item">
                    <a class="nav-link" href="addnews.php"><button class="btn btn-primary">Rašyk naujieną</button></a>
                   </li>
                   <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      '.$user['name'].'
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="profile.php">Profilis</a>
                      <a class="dropdown-item" href="edit-profile.php">Profilio redagavimas</a>
                      <a class="dropdown-item" href="logout.php">Atsijungti</a>
                    </div>
                  </li>';
                }
                ?>
            </ul>
        </div>
    </nav>

