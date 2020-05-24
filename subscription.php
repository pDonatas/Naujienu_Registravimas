<?php
$title = 'Naujienlaiškis';
require_once('head.php');
if(isset($_POST['ok']))
{
    $query = $pdo->prepare("SELECT * FROM `subscription` WHERE `email` = ?");
    $query->execute([$_POST['email']]);
    if($query->rowCount() == 0) {
        if ($_SESSION['login']) {
            $query = $pdo->prepare("INSERT INTO `subscription` (`email`, `fk_USERid`) VALUES (?, ?)");
            $query->execute([$_POST['email'], $_SESSION['user']]);
            echo '<div class="alert alert-success">Naujienlaiškis užprenumeruotas</div>';
        } else {
            $query = $pdo->prepare("INSERT INTO `subscription` (`email`) VALUES (?)");
            $query->execute([$_POST['email']]);
            echo '<div class="alert alert-success">Naujienlaiškis užprenumeruotas</div>';
        }
    }else{
        echo '<div class="alert alert-danger">Jūs jau esate užsiprenumeravę naujienlaiškį</div>';
    }
}
?>
    <div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">Naujienlaiškis</div>
            <div class="card-body">
                <form method="post">
                    <div class="form-group">
                        <label for="email">El. Paštas</label>
                        <input type="email" name="email" class="form-control"<?php if($_SESSION['login']) echo ' value="'.$user['email'].'"'; ?>>
                    </div>
                    <input type="submit" name="ok" class="btn btn-outline-primary" value="Patvirtinti" />
                </form>
            </div>
        </div>
    </div>
<?php
include('footer.php');
?>