<?php
$title = 'Vartotojo profilio redagavimas';
require_once('head.php');
if(!$_SESSION['login']) header("location: index.php");
$profile = user($_SESSION['user']);

if(isset($_POST['ok'])){

    if(md5($_POST['old']) == $profile['password']){
        if($_POST['new'] == $_POST['confirm']){
            $query = $pdo->prepare("UPDATE `user` SET `password` = ? WHERE `id` = ?");
            $query->execute([
                md5($_POST['new']),
                $_SESSION['user']
            ]);
            header("location: profile.php?id=".$_SESSION['user']);
        }else{
            echo '<div class="alert alert-danger">Slaptažodžiai nesutampa</div>';
        }
    }else{
        echo '<div class="alert alert-danger">Blogas slaptažodis</div>';
    }
}

?>
    <div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <?=$profile['name'];?>
            </div>
            <div class="card-body">
                <hr>
                <h3>Pagrindinė informacija</h3>
                <hr>
                <form method="post">
                    <div class="form-group">
                        <label for="old">Senas slaptažodis:</label>
                        <input type="password" name="old" class="form-control" id="old" required/>
                    </div>
                    <div class="form-group">
                        <label for="new">Naujas slaptažodis:</label>
                        <input type="password" name="new" class="form-control" id="new" required/>
                    </div>
                    <div class="form-group">
                        <label for="confirm">Pakartokite slaptažodį:</label>
                        <input type="password" name="confirm" class="form-control" id="confirm" required/>
                    </div>
                    <input type="submit" name="ok" class="form-control btn btn-primary" value="Patvirtinti">
                </form>
            </div>
        </div>
    </div>
<?php
include('footer.php');
?>