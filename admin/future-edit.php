<?php
$title = 'Būsimos naujienos redagavimas';
require('../head.php');
if(!$_SESSION['login']) header("location: index.php");
if(!is_admin($_SESSION['user'])) header("location: index.php");
//Patvirtinimas
if(isset($_POST['ok'])){
    $query = $pdo->prepare("UPDATE `future_news` SET `publish_date` = ? WHERE `id` = ?");
    $query->execute([
        $_POST['publish_date'],
        $_GET['id']
    ]);
    header("location: future-news.php");
}

if($_SESSION['login']) {
    $query = $pdo->prepare("SELECT * FROM `future_news` WHERE `id` = ?");
    $query->execute([$_GET['id']]);
    $row = $query->fetch(PDO::FETCH_BOTH);
    if (is_admin($_SESSION['user'])) {
        //Vartotojas - savininkas, galima rodyti redagavimo formą
        echo '
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">Būsimos naujienos redagavimas</div>
                        <div class="card-body">
                            <form method="post" action="admin/future-edit.php?id=' . $_GET['id'] . '">
                                <div class="form-group">
                                    <label for="date">Naujienos pavadinimas</label>
                                    <input type="text" disabled name="date" id="title" class="form-control" required value="' . news_title($row['fk_NEWSid']) . '">
                                </div>
                                <div class="form-group">
                                    <label for="date">Paskelbimo data</label>
                                    <input type="date" name="publish_date" id="publish_date" class="form-control" required value="' . $row['publish_date'] . '">
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