<?php
require 'maincore.php';
//Patvirtinimas
print_r($_POST);
if(isset($_POST['ok'])){
    $comment = 0;
    if(isset($_POST['comment']))
        $comment = 1;
    $query = $pdo->prepare("INSERT INTO `news` (`title`, `text`, `comment_status`, `fk_USERid`, `status`, `created_at`, `updated_at`) VALUES (?, ?, ?, ?, '0', ?, ?)");
    $query->execute([
        $_POST['title'],
        $_POST['text'],
        $comment,
        $_SESSION['user'],
        date("Y-m-d"),
        date("Y-m-d")
    ]);
    $id = $pdo->lastInsertId();
    $date = new DateTime($_POST['publish_date']);
    $today = new DateTime();
    if($date > $today);
    {
        $query = $pdo->prepare("INSERT INTO `future_news` (`fk_NEWSid`, `publish_date`) VALUES (?, ?)");
        $query->execute([$id, $_POST['publish_date']]);
    }
    //Paveiksliukai
    echo $_POST['media'];
    if($_POST['media'] > 0){
        for($i = 1; $i <= $_POST['media']; $i++){
            //Pradedam įkėlimą
            $ext = pathinfo($_FILES['media'.$i]["name"], PATHINFO_EXTENSION);
            $filename = md5($_FILES['media'.$i]['name'].date("Y-m-d H:i:s").$_SESSION['user']).".".$ext;
            if(move_uploaded_file($_FILES['media'.$i]["tmp_name"], "img/media/".$filename)){
                $query = $pdo->prepare("INSERT INTO `media` (`url`, `type`, `updated_at`, `fk_NEWSid`) VALUES (?, ?, ?, ?)");
                $query->execute(["img/media/".$filename, $_POST['mediatype'.+$i], date("Y-m-d"), $id]);
                echo "Failas įkeltas";
            }else{
                $query = $pdo->prepare("DELETE FROM `future_news` WHERE `fk_NEWSid` = ?");
                $query->execute([$id]);

                $query = $pdo->prepare("DELETE FROM `news` WHERE `id` = ?");
                $query->execute([$id]);
                die("Nepavyko įkelti failų, todėl naujienos kėlimas sustabdytas:");
            }
        }
    }
    header("location: news.php?id=".$id);
}
?>