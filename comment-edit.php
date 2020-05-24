<?php
$title = 'Komentaro redagavimas';
require('head.php');
if(!$_SESSION['login']) header("location: index.php");
//Patvirtinimas
if(isset($_POST['ok'])){
    $query = $pdo->prepare("UPDATE `comment` SET `text` = ? WHERE `id` = ?");
    $query->execute([
        $_POST['text'],
        $_GET['id']
    ]);
    header("location: index.php");
}

if($_SESSION['login']) {
    if (comment_exist($_GET['id'])) {
        $query = $pdo->prepare("SELECT * FROM `comment` WHERE `id` = ?");
        $query->execute([$_GET['id']]);
        $row = $query->fetch(PDO::FETCH_BOTH);
        if($row['fk_USERid'] == $_SESSION['user']){
            //Vartotojas - savininkas, galima rodyti redagavimo formą
            echo '
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">Komentaro redagavimas</div>
                        <div class="card-body">
                            <form method="post" action="comment-edit.php?id='.$_GET['id'].'">
                                <div class="form-group">
                                    <label for="text">Komentaro tekstas</label>
                                    <textarea class="form-control" name="text" id="text">'.$row['text'].'</textarea>
                                </div>
                                <input type="submit" name="ok" class="btn btn-primary form-control" value="Patvirtinti" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            ';
        }else{
            echo 'Jūs nesate šio komentaro savininkas';
        }
    }else{
        echo 'Toks komentaras neegzistuoja';
    }
}