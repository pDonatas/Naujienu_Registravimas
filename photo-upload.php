<?php
require 'maincore.php';
if(!$_SESSION['login']) header('location: index.php');
if(isset($_POST['ok'])) {
    if ($_POST['media'] > 0) {
        for ($i = 1; $i <= $_POST['media']; $i++) {
            //Pradedam įkėlimą
            $ext = pathinfo($_FILES['media' . $i]["name"], PATHINFO_EXTENSION);
            $filename = md5($_FILES['media' . $i]['name'] . date("Y-m-d H:i:s") . $_SESSION['user']) . "." . $ext;
            if (move_uploaded_file($_FILES['media' . $i]["tmp_name"], "img/photos/" . $filename)) {
                $query = $pdo->prepare("INSERT INTO `photo` (`url`, `fk_USERid`) VALUES (?, ?)");
                $query->execute(["img/photos/" . $filename, $_SESSION['user']]);
                echo "Failas įkeltas";
            } else {
                die("Nepavyko įkelti failų");
            }
        }
    }
    header('location: profile.php');
}