<?php
$title = 'Vartotojų blokavimo posistemė';
require('../head.php');
if(!$_SESSION['login']) header("location: index.php");
if(!is_admin($_SESSION['user'])) header("location: index.php");

if(isset($_POST['ok'])){
    $query = $pdo->prepare("INSERT INTO `banned` (`reason`, `ban_date`, `ban_untill`, `fk_USERid`, `fk_ADMINid`) VALUES (?, ?, ?, ?, ?)");
    $query->execute([
        $_POST['reason'],
        date("Y-m-d"),
        $_POST['date'],
        $_POST['userid'],
        $_SESSION['user']
    ]);
    header("location: users.php");
    exit();
}

if(!user_exist($_GET['id'])) header("location: index.php");
//Ar vartotojas blokuotas?
$query = $pdo->prepare("SELECT * FROM `banned` WHERE `fk_USERid` = ?");
$query->execute([$_GET['id']]);
if($query->rowCount() > 0){ // Vartotojas blokuotas, atblokuojam
    $query = $pdo->prepare("DELETE FROM `banned` WHERE `fk_USERid` = ?");
    $query->execute([$_GET['id']]);
    echo '<div class="alert alert-success"><strong>Pavyko!</strong> Vartotojas sėkmingai atblokuotas</div>';
}else{
    echo '
    <div class="card">
        <div class="card-header">
            Vartotojų blokavimas
        </div>
        <div class="card-body">
            <form method="post">
                <div class="form-group">
                    <label for="reason">Priežastis</label>
                    <input type="text" name="reason" class="form-control" id="reason" required/>
                </div>
                <div class="form-group">
                    <label for="date">Galioja iki:</label>
                    <input type="date" name="date" class="form-control" id="date" required/>
                </div>
                <input type="hidden" name="userid" value="'.$_GET['id'].'">
                <input type="submit" name="ok" class="btn btn-primary" value="Patvirtinti">
            </form>
        </div>
    </div>
    ';
}