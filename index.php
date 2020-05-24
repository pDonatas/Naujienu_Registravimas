<?php
$title = 'Pagrindinis';
require_once('head.php');
?>
    <div class="row">
    <div class="col-md-12">
        <h3>Naujienos</h3>
        <?php
        //Gaunam visas naujienas, kurios nėra archyve bei publikuojamos
        if(!isset($_GET['page'])) $page = 1;
        else $page = $_GET['page'];
        if($page > 1) {
            $query = $pdo->prepare("SELECT * FROM `news` ORDER BY `updated_at` DESC LIMIT 20 OFFSET ?");
            $query->execute([$page * 10]);
        }else{
            $query = $pdo->query("SELECT * FROM `news` ORDER BY `updated_at` DESC LIMIT 20 OFFSET 0");
        }
        foreach ($query as $row) {
            //Kreipiamės į duombazę ir tikrinam ar naujiena nėra sena
            $old = $pdo->prepare("SELECT * FROM `news_archive` WHERE `fk_NEWSid` = ?");
            $old->execute([$row['id']]);
            if ($old->rowCount() == 0) {
                //Tikrinam ar naujiena nėra ateities publikacijose
                $too_new_too_publish = $pdo->prepare("SELECT * FROM `future_news` WHERE `fk_NEWSid` = ?");
                $too_new_too_publish->execute([$row['id']]);
                if ($too_new_too_publish->rowCount() == 0) {
                    //Ar naujiena patvirtinta?
                    if ($row['status'] == 1) {
                        echo '<div class="card">
                                    <div class="card-header">' . $row['title'] . ' <span class="text-right">Paskelbė: ' . username($row['fk_USERid']) . ' ' . $row['updated_at'] . '</span></div>
                                    <div class="card-body">
                                        ' . $row['text'] . '
                                    </div>
                                    <div class="card-footer text-center"><a href="news.php?id='.$row['id'].'">Skaityti daugiau</a></div>
                                </div>';
                    }
                }
            }
        }
        ?>
    </div>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <?php
            $query = $pdo->query("SELECT * FROM `news`");
            $all = $query->rowCount();
            if($page > 1)
                echo '
            <li class="page-item">
                <a class="page-link" href="index.php?page='.($page-1).'" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>';
            for($i = 1; $i < ($all/10); $i++) {
                if($i != $page)
                    echo '<li class="page-item"><a class="page-link" href="index.php?page='.$i.'">'.$i.'</a></li>';
            }
            if($page != (int)($all/10) && (int)($all / 10) != 0){
                echo '
            <li class="page-item">
                <a class="page-link" href="index.php?page='.($page+1).'" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>';
            }
            ?>
        </ul>
    </nav>
<?php
include('footer.php');
?>