<?php
$title = 'Prisijungimas';
require_once('head.php');
if($_SESSION['login']) header('location: index.php');
?>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Prisijungimas</div>
                <div class="card-body">
                    <?php
                    if(isset($_SESSION['message'])) {
                        echo $_SESSION['message'];
                        unset($_SESSION['message']);
                    }
                    ?>
                    <form method="post">
                        <div class="form-group">
                            <label for="email">El. Paštas</label>
                            <input type="email" name="email" class="form-control" id="email" required/>
                        </div>
                        <div class="form-group">
                            <label for="password">Slaptažodis</label>
                            <input type="password" name="password" class="form-control" id="password" required/>
                        </div>
                        <input type="submit" name="ok" class="form-control btn btn-primary" value="Patvirtinti">
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php
//Formos patvirtinimas
if(isset($_POST['ok'])) { // Forma patvirtinta
    if (!$_SESSION['login']) { // Vartotojas nėra prisijungęs
        $query = $pdo->prepare("SELECT * FROM `user` WHERE `email` = ?");
        $query->execute([$_POST['email']]);
        //Vartotojas neegzistuoja
        if ($query->rowCount() >= 1) {
            $query = $pdo->prepare("SELECT * FROM `user` WHERE `email` = ? AND `password` = ?");
            $query->execute([$_POST['email'], md5($_POST['password'])]);
            if($query->rowCount() > 0){
                $_SESSION['login'] = true;
                $_SESSION['user'] = $query->fetch(PDO::FETCH_BOTH)['id'];
                $query = $pdo->prepare("UPDATE `user` SET `last_login` = ?, `last_ip` = ?, `updated_at` = ? WHERE `id` = ?");
                $query->execute([date("Y-m-d"), $_SERVER['REMOTE_ADDR'], date("Y-m-d"), $_SESSION['user']]);
                header("location: index.php");
            } else { //Slaptažodis neteisingas
                $_SESSION['message'] = '
                <div class="alert alert-danger"><strong>Klaida!</strong> Slaptažodis neteisingas</div>
                ';
                header('location: login.php');
            }
        } else { //El. Paštas neregistruotas
            $_SESSION['message'] = '
                <div class="alert alert-danger"><strong>Klaida!</strong> Tokio el. pašto mūsų duomenų bazėje nėra</div>
                ';
            header('location: login.php');
        }
    }
}