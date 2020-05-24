<?php
$title = 'Vartotojo profilis';
require_once('head.php');
if(!$_SESSION['login']) header("location: index.php");
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
            }
        }
    </script>

    <div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <?=$user['name'];?> nuotraukų įkėlimas
            </div>
            <div class="card-body">
                <form method="post" action="photo-upload.php" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="media">Iveskite keliamų nuotraukų kiekį:</label>
                        <input type="text" id="media" class="form-control" name="media" value="0">
                        <button type="button" class="btn btn-primary" id="filldetails" onclick="addFields()">Pildyti</button>
                    </div>
                    <div id="allmedia"></div>
                    <input type="submit" name="ok" value="Patvirtinti" class="form-control btn btn-primary">
                </form>
            </div>
        </div>
    </div>
<?php
include('footer.php');
?>