<?php
$title = 'Naujienos rašymas';
require_once('head.php');
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
    <div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">Naujienos rašymas</div>
            <div class="card-body">
                <form method="post" action="post.php" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="title">Pavadinimas</label>
                        <input type="text" name="title" id="title" class="form-control" required/>
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
    </div>
<?php
include('footer.php');
?>