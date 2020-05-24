<?php
$title = 'Vartotojo profilio redagavimas';
require_once('head.php');
if(!$_SESSION['login']) header("location: index.php");
$profile = user($_SESSION['user']);

if(isset($_POST['ok'])){
    $query = $pdo->prepare("UPDATE `user` SET `name` = ?, `surname` = ?, `email` = ?, `type` = ?, `updated_at` = ? WHERE `id` = ?");
    $query->execute([
        $_POST['name'],
        $_POST['surname'],
        $_POST['email'],
        $_POST['gender'],
        date("Y-m-d"),
        $_SESSION['user']
    ]);
    header("location: profile.php?id=".$_SESSION['user']);
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
                        <label for="name">Vardas</label>
                        <input type="text" name="name" class="form-control" id="name" value="<?=$profile['name'];?>" required/>
                    </div>
                    <div class="form-group">
                        <label for="surname">Pavardė</label>
                        <input type="text" name="surname" class="form-control" id="surname" value="<?=$profile['surname'];?>" required/>
                    </div>
                    <div class="form-group">
                        <label for="email">El. Paštas:</label>
                        <input type="email" name="email" class="form-control" id="email" value="<?=$profile['email'];?>" required/>
                    </div>
                    <div class="form-group">
                        <label for="gender">Lytis</label>
                        <select id="gender" name="gender" class="form-control">
                            <option disabled selected>Pasirinkite lytį</option>
                            <?php
                            echo '
                            <option'; if($profile['type'] == 0) echo ' selected'; echo ' value="0">Vyras</option>
                            <option'; if($profile['type'] == 1) echo ' selected'; echo ' value="1">Moteris</option>
                            <option'; if($profile['type'] == 2) echo ' selected'; echo ' value="2">Kita</option>';
                            ?>
                        </select>
                    </div>
                    <input type="submit" name="ok" class="form-control btn btn-primary" value="Patvirtinti">
                </form>
            </div>
        </div>
    </div>
<?php
include('footer.php');
?>