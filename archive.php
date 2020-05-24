<?php
$title = 'Naujienų archyvas';
require_once('head.php');
?>
    <div class="row">
    <div class="col-md-12">
        <h3>Naujienų archyvas</h3>
        <?php
        //Gaunam visas naujienas, kurios nėra archyve bei publikuojamos
        $query = $pdo->query("SELECT * FROM `news_archive`");
        foreach ($query as $row) {
            //Išgaunam naujienos informaciją
            $query = $pdo->prepare("SELECT * FROM `news` WHERE `id` = ?");
            $query->execute([$row['fk_NEWSid']]);
            $news = $query->fetch(PDO::FETCH_BOTH);
                            echo '<div class="card">
                                    <div class="card-header">' . $news['title'] . ' <span class="text-right">Paskelbė: ' . username($news['fk_USERid']) . ' ' . $news['updated_at'] . '</span></div>
                                    <div class="card-body">
                                        ' . $news['text'] . '
                                    </div>
                                    <div class="card-footer text-center"><a href="news.php?id=' . $row['fk_NEWSid'] . '">Skaityti daugiau</a></div>
                                </div>';
        }
        ?>
    </div>
<?php
include('footer.php');
?>