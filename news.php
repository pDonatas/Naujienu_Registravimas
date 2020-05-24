<?php
if(!isset($_GET['id'])) header('location: index.php');
require_once 'maincore.php';
$query = $pdo->prepare("SELECT * FROM `news` WHERE `id` = ?");
$query->execute([$_GET['id']]);
if($query->rowCount() == 0) header('location: index.php');
$row = $query->fetch(PDO::FETCH_BOTH);
$title = $row['title'];
require_once('head.php');
$media = Media($_GET['id']);
?>
    <div class="row">
    <div class="col-md-12">
        <?php
        if(Count($media) > 0){
            echo '
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        ';
            for($i = 0; $i < Count($media); $i++){
                if($media[$i]['type'] == 1) {
                    echo '<div class="carousel-item';
                    if ($i == 0) echo ' active';
                    echo '">
                            <img class="d-block w-100" src="' . $media[$i]['url'] . '" alt="">
                        </div>';
                }else{
                    echo '<div class="carousel-item';
                    if ($i == 0) echo ' active';
                    echo '">
                            <div class="embed-responsive embed-responsive-16by9">
                                <iframe class="embed-responsive-item" src="'.$media[$i]['url'].'" allowfullscreen></iframe>
                            </div>
                        </div>';
                }
            }
            echo '
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>';
        }
        ?>
        <div class="card">
            <div class="card-header"><?=$row['title'];?></div>
            <div class="card-body">
                <?=$row['text'];?>
            </div>
            <div class="card-footer">
                Autorius: <?=username($row['fk_USERid']);?>
                <?php
                if($row['status'] == 0 && is_admin($_SESSION['user'])){
                    echo '<br/><a href="admin/confirm.php?id='.$row['id'].'"><button class="btn btn-success">Patvirtinti naujieną</button></a>';
                }
                ?>
                <span class="text-right">
                    Įvertinimas: <?=votes($row['id']);?>/10 Balų
                    <?php
                    if($_SESSION['login'] && !is_voted($_SESSION['user'], $row['id']) && $row['status'] == 1){
                        //Jei vartotojas dar nebalsavo jam galime rodyti balsavimo formą
                        echo '
                        <form method="post" action="vote.php?id='.$row['id'].'">
                            <select name="vote" class="form-control" required>
                                <option selected disabled>Pasirinkite balsą</option>
                                ';
                                for($i = 1; $i <= 10; $i++)
                                    echo '<option value="'.$i.'">'.$i.' balų</option>';
                                echo '
                            </select>
                            <input type="submit" class="form-control btn btn-primary" value="Patvirtinti"/>
                        </form>
                        ';
                    }
                    if($_SESSION['login'] && $row['fk_USERid'] == $_SESSION['user']){
                        echo '<a href="edit-news.php?id='.$_GET['id'].'"><button class="btn btn-outline-dark">Redagavimas</button></a>';
                    }
                    ?>
                </span>
            </div>
        </div>
        <?php
        //Jei komentarai įjungti
        if($row['comment_status'] == 1){?>
        <div class="card">
            <div class="card-header">Komentarai</div>
            <div class="card-body">
                <?php
                foreach(comments($_GET['id']) as $row){
                    if($row['approved'] == 1) {
                        if(!is_admin($_SESSION['user']))
                            echo show_comment($row['id'],false);
                        else
                            echo show_comment($row['id'],true);
                    }else{
                        if(is_admin($_SESSION['user'])){
                            echo show_comment($row['id'], true);
                        }
                    }
                    echo '<hr/>';
                }
                if($_SESSION['login']){
                ?>
                <form method="post" action="comment.php">
                    <div class="form-group">
                        <label for="text">Jūsų komentaras</label>
                        <textarea class="form-control" name="text" id="text" placeholder="Komentaras"></textarea>
                    </div>
                    <input type="hidden" name="newsid" value="<?=$_GET['id'];?>">
                    <input type="submit" name="ok" class="btn btn-primary form-control" value="Patvirtinti" />
                </form>
                <?php
                }
                 ?>
            </div>
        </div>
        <?php
        }
        ?>
    </div>
<?php
include('footer.php');
?>