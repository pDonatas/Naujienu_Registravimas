<?php
$title = 'Administravimas';
require('../head.php');
if(!$_SESSION['login']) header("location: index.php");
if(!is_admin($_SESSION['user'])) header("location: index.php");
include('side.php');
?>
<div class="card">
    <div class="card-header">Statistika</div>
    <div class="card-body">
        <ul class="list-group">
            <li class="list-group-item">
                Viso vartotojų: <?=count_items(2);?>
            </li>
            <li class="list-group-item">
                Viso naujienų: <?=count_items(1);?>
            </li>
        </ul>
    </div>
</div>

    <div class="card">
        <div class="card-header">Naujienų ataskaita</div>
        <div class="card-body">
            <?php
            if(!isset($_POST['ok'])){
            echo '
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="nuo">Naujienos paskelbimo data nuo:</label>
                    <input type="date" name="nuo" id="nuo" class="form-control" value="'.date("Y-m-d").'" required>
                </div>
                <div class="form-group">
                    <label for="iki">Naujienos paskelbimo data iki:</label>
                    <input type="date" name="iki" id="iki" class="form-control" value="'.date("Y-m-d").'" required>
                </div>
                <div class="form-group">
                    <label for="status">Įterpti nepatvirtintas naujienas:</label>
                    <input type="checkbox" name="status" id="status" class="form-control">
                </div>
                <input type="submit" name="ok" class="btn btn-outline-primary" value="Patvirtinti" />
            </form>';
            }else{
                echo '<table class="table">
                <tr>
                <th>#</th>
                <th>Pavadinimas</th>
                <th>Autorius</th>
                <th>Patvirtinęs administratorius</th>
                <th>Medijos kiekis</th>
                <th>Naujienos tipas</th>
                </tr>';
                $nuo = $_POST['nuo'];
                $iki = $_POST['iki'];
                $where = "`news`.`updated_at` >= '$nuo' AND `news`.`updated_at` <= '$iki'";
                if(empty($_POST['status'])){
                    $where = $where." AND `news`.`status` > 0";
                }
                $query = "
                SELECT `news`.`id`, `news`.`title`, `adm`.`name` AS `admin`, `author`.`name` as `author`, COUNT(*) AS `media_count` FROM `news`
                RIGHT JOIN `media` as `m` ON `m`.`fk_NEWSid` = `news`.`id`
                LEFT JOIN `admin` ON `admin`.`id` = `news`.`fk_ADMINid`
                LEFT JOIN `user` as adm ON `adm`.`id` = `admin`.`fk_USERid`
                INNER JOIN `user` as author ON `author`.`id` = `news`.`fk_USERid`
                WHERE $where GROUP BY `m`.`fk_NEWSid`";
                $db = $pdo->query($query);

                foreach($db as $row){
                    echo '
                    <tr>
                        <td>'.$row['id'].'</td>
                        <td>'.$row['title'].'</td>
                        <td>'.$row['author'].'</td>
                        <td>'.$row['admin'].'</td>
                        <td>'.$row['media_count'].'</td>
                        <td>'.news_type($row['id']).'</td>
                    </tr>
                    ';
                }
                echo '</table>';
                // Viso medijos
                $query = $pdo->query("SELECT COUNT(`media`.`id`) FROM `media`");
                $medijos_kiekis = $query->fetch(PDO::FETCH_BOTH)['COUNT(`media`.`id`)'];
                //Vidutiniskai medijos
                $query = $pdo->query("SELECT ROUND(count(*) / count(distinct `media`.`fk_NEWSid`)) as `avg`
  FROM `media` ");
                $vidutiniskai = $query->fetch(PDO::FETCH_BOTH)['avg'];
                echo 'Viso medijos: '.$medijos_kiekis.'<br/>';
                echo 'Viudtinis medijos kiekis: '.$vidutiniskai;
            }
            ?>
        </div>
    </div>
<?php
require('bottom.php');
?>