<?php
require_once ('maincore.php');
if($_SESSION['login']) $_SESSION['login'] = false;
session_destroy();
header('location: index.php');
?>