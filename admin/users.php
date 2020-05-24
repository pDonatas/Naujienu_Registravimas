<?php
$title = 'Naujienos';
require('../head.php');
if(!$_SESSION['login']) header("location: index.php");
if(!is_admin($_SESSION['user'])) header("location: index.php");
include('side.php');
?>
    <table class="table">
        <tr>
            <th>Vardas</th>
            <th>Pavardė</th>
            <th>El. Paštas</th>
            <th>Tipas</th>
            <th>Veiksmas</th>
        </tr>
        <?php
        if(!isset($_GET['page'])) $page = 1;
        else $page = $_GET['page'];
        if($page > 1) {
            $query = $pdo->prepare("SELECT * FROM `user` ORDER BY `id` ASC LIMIT 20 OFFSET ?");
            $query->execute([$page * 10]);
        }else{
            $query = $pdo->query("SELECT * FROM `user` ORDER BY `id` ASC LIMIT 20 OFFSET 0");
        }
        foreach ($query as $row) {
            echo '
            <tr>
                <td>' . $row['name'] . '</td>
                <td>' . $row['surname'] . '</td>
                <td>' . $row['email'] . '</td>
                <td>' . gender($row['type']) . '</td>
                <td><a href="admin/user-edit.php?id=' . $row['id'] . '">Redaguoti</a> 
                <a href="admin/user-remove.php?id=' . $row['id'] . '">Šalinti</a> 
                ';
                if(!is_banned($row['id']))
                    echo '<a href="admin/user-ban.php?id='.$row['id'].'">Blokuoti</a>';
                else
                    echo '<a href="admin/user-ban.php?id='.$row['id'].'">Atblokuoti</a>';
                echo '
                </td>
            </tr>
            ';
        }
        ?>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <?php
            $query = $pdo->query("SELECT * FROM `user`");
            $all = $query->rowCount();
            if($page > 1)
                echo '
            <li class="page-item">
                <a class="page-link" href="admin/users.php?page='.($page-1).'" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>';
            for($i = 1; $i < ($all/10); $i++) {
                if($i != $page)
                    echo '<li class="page-item"><a class="page-link" href="admin/users.php?page='.$i.'">'.$i.'</a></li>';
            }
            if($page != (int)($all/10) && (int)($all / 10) != 0){
                echo '
            <li class="page-item">
                <a class="page-link" href="admin/users.php?page='.($page+1).'" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>';
            }
            ?>
        </ul>
    </nav>
<?php
require('bottom.php');
?>