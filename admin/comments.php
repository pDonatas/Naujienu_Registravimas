<?php
$title = 'Komentarai';
require('../head.php');
if(!$_SESSION['login']) header("location: index.php");
if(!is_admin($_SESSION['user'])) header("location: index.php");
include('side.php');
?>
    <h3>Komentarai</h3>
    <table class="table">
        <tr>
            <th>Naujienos pavadinimas</th>
            <th>Turinys</th>
            <th>Autorius</th>
            <th>Įkėlimo data</th>
            <th>Tipas</th>
            <th>Veiksmas</th>
        </tr>
        <?php
        if(!isset($_GET['page'])) $page = 1;
        else $page = $_GET['page'];
        if($page > 1) {
            $query = $pdo->prepare("SELECT * FROM `comment` ORDER BY `approved` ASC LIMIT 20 OFFSET ?");
            $query->execute([$page * 10]);
        }else{
            $query = $pdo->query("SELECT * FROM `comment` ORDER BY `approved` ASC LIMIT 20 OFFSET 0");
        }
        foreach ($query as $row) {
            echo '
                            <tr>
                                <td>' . news_title($row['fk_NEWSid']) . '</td>
                                <td>' . $row['text'] . '</td>
                                <td>' . username($row['fk_USERid']) . '</td>
                                <td>' . $row['updated_at'] . '</td>
                                <td>'; if($row['approved'] == 1) echo 'Patvirtinta'; else echo 'Nepatvirtinta'; echo '</td>
                                <td><a href="admin/comment-edit.php?id=' . $row['id'] . '">Redaguoti</a> <a href="admin/comment-remove.php?id=' . $row['id'] . '">Šalinti</a>';if($row['approved'] == 0) echo ' <a href="admin/confirm.php?id='.$row['id'].'&type=2">Patvirtinti</a>';echo '</td>
                            </tr>
                            ';
        }
        ?>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <?php
            $query = $pdo->query("SELECT * FROM `comment`");
            $all = $query->rowCount();

            if($all > 0) {
                if ($page > 1)
                    echo '
            <li class="page-item">
                <a class="page-link" href="admin/comments.php?page=' . ($page - 1) . '" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>';
                for ($i = 1; $i < ($all / 10); $i++) {
                    if ($i != $page)
                        echo '<li class="page-item"><a class="page-link" href="admin/comments.php?page=' . $i . '">' . $i . '</a></li>';
                }
                if ($page != (int)($all / 10) && (int)($all / 10) != 0) {
                    echo '
            <li class="page-item">
                <a class="page-link" href="admin/comments.php?page=' . ($page + 1) . '" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>';
                }
            }
            ?>
        </ul>
    </nav>
<?php
require('bottom.php');
?>