<?php
if(!isset($_GET['id'])) header('location: index.php');
$title = 'Naujienos redagavimas';
require('head.php');
//Patvirtinimas
if(isset($_POST['ok'])){
    $comment = 0;
    if(isset($_POST['comment']))
        $comment = 1;
    $query = $pdo->prepare("UPDATE `news` SET `title` = ?, `text` = ?, `comment_status` = ? WHERE `id` = ?");
    $query->execute([
        $_POST['title'],
        $_POST['text'],
        $comment,
        $_GET['id']
    ]);
    header("location: news.php?id=".$_GET['id']);
}

if($_SESSION['login']) {
    if (news_exist($_GET['id'])) {
        $query = $pdo->prepare("SELECT * FROM `news` WHERE `id` = ?");
        $query->execute([$_GET['id']]);
        $row = $query->fetch(PDO::FETCH_BOTH);
        if($row['fk_USERid'] == $_SESSION['user']){
            //Vartotojas - savininkas, galima rodyti redagavimo formą
            echo '
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">Naujienos redagavimas</div>
                        <div class="card-body">
                            <form method="post" action="edit-news.php?id='.$_GET['id'].'">
                                <div class="form-group">
                                    <label for="title">Pavadinimas</label>
                                    <input type="text" name="title" id="title" class="form-control" required value="'.$row['title'].'">
                                </div>
                                <div class="form-group">
                                    <label for="text">Tekstas</label>
                                    <textarea name="text" id="text" class="form-control" required>'.$row['text'].'</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="comment">Komentavimo būsena</label>
                                    <input name="comment" id="comment" type="checkbox" '; if($row['comment_status'] == 1) echo 'checked'; echo ' data-toggle="toggle" data-on="Įjungta" data-off="Išjungta" data-size="sm">
                                </div>
                                <input type="submit" name="ok" class="btn btn-outline-primary" value="Patvirtinti" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            ';
        }
    }
}