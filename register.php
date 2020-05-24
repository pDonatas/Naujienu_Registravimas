<?php
$title = 'Registracija';
require('head.php');
if($_SESSION['login']) header('location: index.php');
?>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">Registracija</div>
            <div class="card-body">
                <?php
                if(isset($_SESSION['message'])) {
                    echo $_SESSION['message'];
                    unset($_SESSION['message']);
                }
                ?>
                <form method="post">
                    <div class="form-group">
                        <label for="name">Vardas</label>
                        <input type="text" name="name" class="form-control" id="name" required/>
                    </div>
                    <div class="form-group">
                        <label for="surname">Pavardė</label>
                        <input type="text" name="surname" class="form-control" id="surname" required/>
                    </div>
                    <div class="form-group">
                        <label for="email">El. Paštas:</label>
                        <input type="email" name="email" class="form-control" id="email" required/>
                    </div>
                    <div class="form-group">
                        <label for="password">Slaptažodis</label>
                        <input type="password" name="password" class="form-control" id="password" required/>
                    </div>
                    <div class="form-group">
                        <label for="password_confirm">Pakartokite slaptažodį</label>
                        <input type="password" name="password_confirm" class="form-control" id="password_confirm" required/>
                    </div>
                    <div class="form-group">
                        <label for="gender">Lytis</label>
                        <select id="gender" name="gender" class="form-control">
                            <option disabled selected>Pasirinkite lytį</option>
                            <option value="0">Vyras</option>
                            <option value="1">Moteris</option>
                            <option value="2">Kita</option>
                        </select>
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
        if ($query->rowCount() == 0) {
            //Slaptažodžiai sutampa
            if ($_POST['password'] == $_POST['password_confirm']) {
                $query = $pdo->prepare("INSERT INTO `user` (`name`, `surname`, `email`, `password`, `last_login`, `last_ip`, `type`, `created_at`, `updated_at`) VALUES (
                ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                $query->execute([
                    $_POST['name'],
                    $_POST['surname'],
                    $_POST['email'],
                    md5($_POST['password']),
                    date("Y-m-d"),
                    $_SERVER['REMOTE_ADDR'],
                    $_POST['gender'],
                    date("Y-m-d"),
                    date("Y-m-d")
                ]);
                $_SESSION['message'] = '
                <div class="alert alert-success"><strong>Pavyko!</strong> Jūs sėkmingai užsiregistravote</div>
                ';
            } else { //Slaptažodžiai nesutampa
                $_SESSION['message'] = '
                <div class="alert alert-danger"><strong>Klaida!</strong> Slaptažodžiai nesutampa</div>
                ';
            }
        } else { //El. Paštas registruotas
            $_SESSION['message'] = '
                <div class="alert alert-danger"><strong>Klaida!</strong> Toks el. paštas jau egzistuoja</div>
                ';
        }
    }
    header('location: register.php');
}