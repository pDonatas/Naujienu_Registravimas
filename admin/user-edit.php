<?php
$title = 'Vartotojo redagavimas';
require('../head.php');
if(!$_SESSION['login']) header("location: index.php");
if(!is_admin($_SESSION['user'])) header("location: index.php");
if(!user_exist($_GET['id'])) header("location: index.php");
//Patvirtinimas
if(isset($_POST['ok'])){
    $query = $pdo->prepare("UPDATE `user` SET `name` = ?, `surname` = ?, `email` = ?, `type` = ?, `updated_at` = ? WHERE `id` = ?");
    $query->execute([
        $_POST['name'],
        $_POST['surname'],
        $_POST['email'],
        $_POST['gender'],
        date("Y-m-d"),
        $_GET['id']
    ]);
    header("location: ../profile.php?id=".$_GET['id']);
}

if($_SESSION['login']) {
    if (user_exist($_GET['id'])) {
        $query = $pdo->prepare("SELECT * FROM `user` WHERE `id` = ?");
        $query->execute([$_GET['id']]);
        $row = $query->fetch(PDO::FETCH_BOTH);
        if(is_admin($_SESSION['user'])){
            //Vartotojas - savininkas, galima rodyti redagavimo formą
            echo '
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">Vartotojo redagavimas</div>
                        <div class="card-body">
                            <form method="post">
                                                <div class="form-group">
                                                    <label for="name">Vardas</label>
                                                    <input type="text" name="name" class="form-control" id="name" value="'.$row['name'].'" required/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="surname">Pavardė</label>
                                                    <input type="text" name="surname" class="form-control" id="surname" value="'.$row['surname'].'" required/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="email">El. Paštas:</label>
                                                    <input type="email" name="email" class="form-control" id="email" value="'.$row['email'].'" required/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="gender">Lytis</label>
                                                    <select id="gender" name="gender" class="form-control">
                                                        <option disabled selected>Pasirinkite lytį</option>
                                                        <option'; if($row['type'] == 0) echo ' selected'; echo ' value="0">Vyras</option>
                                                        <option'; if($row['type'] == 1) echo ' selected'; echo ' value="1">Moteris</option>
                                                        <option'; if($row['type'] == 2) echo ' selected'; echo ' value="2">Kita</option>
                                                    </select>
                                                </div>
                                                <input type="submit" name="ok" class="form-control btn btn-primary" value="Patvirtinti">
                                            </form>
                        </div>
                    </div>
                </div>
            </div>
            ';
        }
    }
}