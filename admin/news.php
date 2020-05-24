<?php
$title = 'Naujienos';
require('../head.php');
if(!$_SESSION['login']) header("location: index.php");
if(!is_admin($_SESSION['user'])) header("location: index.php");
include('side.php');
?>
<script>
    function addFields(){
        var number = document.getElementById("media").value;
        var container = document.getElementById("allmedia");
        while (container.hasChildNodes()) {
            container.removeChild(container.lastChild);
        }
        for (i=1;i<=number;i++){
            //Inputas
            var div = document.createElement("div");
            div.className = "form-group";
            container.appendChild(div);

            var label = document.createElement("label");
            label.htmlFor = "media"+i;
            label.textContent = "Elemento failas:";
            container.appendChild(label);

            var input = document.createElement("input");
            input.type = "file";
            input.className = "form-control";
            input.id = "media"+i;
            input.name ="media"+i;
            container.appendChild(input);
            //Tipas
            var div2 = document.createElement("div");
            div2.className = "form-group";
            container.appendChild(div2);

            var label2 = document.createElement("label");
            label2.htmlFor = "mediatype"+i;
            label2.textContent = "Elemento tipas:";
            container.appendChild(label2);

            var select = document.createElement("select");
            select.className = "form-control";
            select.id = "mediatype"+i;
            select.name ="mediatype"+i;
            container.appendChild(select);
            var array = ["Paveikslas","Vaizdo įrašas"];
            //Pridedam tipus i selecta
            for (var j = 0; j < array.length; j++) {
                var option = document.createElement("option");
                var n = (j+1);
                option.value = n;
                option.text = array[j];
                select.appendChild(option);
            }
        }
    }
</script>
<h3>Naujienos rašymas</h3>
    <div class="card">
        <div class="card-header">Naujienos rašymas</div>
        <div class="card-body">
            <form method="post" action="admin/post.php" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="title">Pavadinimas</label>
                    <input type="text" name="title" id="title" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="text">Tekstas</label>
                    <textarea name="text" id="text" class="form-control" required></textarea>
                </div>
                <div class="form-group">
                    <label for="comment">Komentavimo būsena</label>
                    <input name="comment" id="comment" type="checkbox" data-toggle="toggle" data-on="Įjungta" data-off="Išjungta" data-size="sm">
                </div>
                <hr>
                <h3>Papildoma</h3>
                <hr>
                <div class="form-group">
                    <label for="media">Iveskite keliamų elementų kiekį (nuotraukos, vaizdo įrašai):</label>
                    <input type="text" id="media" class="form-control" name="media" value="0">
                    <button type="button" class="btn btn-primary" id="filldetails" onclick="addFields()">Pildyti</button>
                </div>
                <div id="allmedia"></div>
                <div class="form-group">
                    <label for="publish_date">Paskelbimo data</label>
                    <input type="date" name="publish_date" class="form-control" id="publish_date" value="<?=date("Y-m-d");?>" min="<?=date("Y-m-d");?>" required>
                </div>
                <input type="submit" name="ok" class="btn btn-outline-primary" value="Patvirtinti" />
            </form>
        </div>
    </div>
<h3>Naujienos</h3>
<table class="table">
    <tr>
        <th>Pavadinimas</th>
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
        $query = $pdo->prepare("SELECT * FROM `news` ORDER BY `id` DESC LIMIT 20 OFFSET ?");
        $query->execute([$page * 10]);
    }else{
        $query = $pdo->query("SELECT * FROM `news` ORDER BY `id` DESC LIMIT 20 OFFSET 0");
    }
    foreach ($query as $row) {
        echo '
                            <tr>
                                <td>' . $row['title'] . '</td>
                                <td>' . $row['text'] . '</td>
                                <td>' . username($row['fk_USERid']) . '</td>
                                <td>' . $row['updated_at'] . '</td>
                                <td>';
                                if($row['status'] == 1)
                                    echo 'Patvirtinta';
                                else echo 'Nepatvirtinta';

                                if(future_exists($row['id']))
                                    echo ' Būsima naujiena';
                                if(archive_exists($row['id']))
                                    echo ' Archivuota naujiena';
                                echo '</td>
                                <td>
                                <a href="admin/news-edit.php?id=' . $row['id'] . '">Redaguoti</a> 
                                <a href="admin/news-remove.php?id=' . $row['id'] . '">Šalinti</a>';
                                if($row['status'] == 0) echo ' <a href="admin/confirm.php?id='.$row['id'].'">Patvirtinti</a>';
                                if(!archive_exists($row['id'])){
                                    echo '<a href="admin/archive.php?id='.$row['id'].'"> Archyvuoti</a>';
                                }
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
            $query = $pdo->query("SELECT * FROM `news`");
            $all = $query->rowCount();
            if($page > 1)
                echo '
            <li class="page-item">
                <a class="page-link" href="admin/news.php?page='.($page-1).'" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>';
            for($i = 1; $i < ($all/10); $i++) {
                if($i != $page)
                echo '<li class="page-item"><a class="page-link" href="admin/news.php?page='.$i.'">'.$i.'</a></li>';
            }
            if($page != (int)($all/10) && (int)($all / 10) != 0){
                echo '
            <li class="page-item">
                <a class="page-link" href="admin/news.php?page='.($page+1).'" aria-label="Next">
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