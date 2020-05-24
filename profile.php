<?php
$title = 'Vartotojo profilis';
require_once('head.php');
if(!$_SESSION['login']) header("location: index.php");
if(isset($_GET['id'])) $id = $_GET['id'];
else $id = $_SESSION['user'];
if(!user_exist($id)) $id = $_SESSION['user'];
$profile = user($id);
?>
    <div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <?=$profile['name'];?>

                <?php
                if($id == $_SESSION['user'])
                {
                    echo '
                        <a href="upload-photo.php"><button class="btn btn-primary">Įkelti nuotrauką</button></a>
                        <a href="edit-profile.php"><button class="btn btn-primary">Redaguoti profilį</button></a>
                        <a href="change-password.php"><button class="btn btn-primary">Keisti slaptažodį</button></a>
                    ';
                }
                ?>
            </div>
            <div class="card-body">
                <hr>
                <h3>Pagrindinė informacija</h3>
                <hr>
                <ul class="list-group">
                    <li class="list-group-item">Vardas: <?=$profile['name'];?></li>
                    <li class="list-group-item">Pavardė: <?=$profile['surname'];?></li>
                    <li class="list-group-item">Lytis: <?=gender($profile['type']);?></li>
                    <li class="list-group-item">El. Paštas: <?=$profile['email'];?></li>
                    <li class="list-group-item">Profilio sukūrimo data: <?=$profile['created_at'];?></li>
                    <li class="list-group-item">Paskutinis prisijungimas: <?=$profile['last_login'];?></li>
                </ul>
                <hr>
                <h3>Nuotraukos</h3>
                <hr>
                <div class="row">
                <?php
                $query = $pdo->prepare("SELECT * FROM `photo` WHERE `fk_USERid` = ?");
                $query->execute([$id]);
                foreach($query as $row){
                    echo '<div class="col-md-3"><a href="'.$row['url'].'" data-lightbox="roadtrip"><img class="img-thumbnail" src="'.$row['url'].'" alt="Nuotrauka"/></a></div>';
                }
                ?>
                </div>
            </div>
        </div>
    </div>
<?php
include('footer.php');
?>