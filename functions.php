<?php
//Funkcijos
function username(int $userid) : string
{
    require 'maincore.php';
    $query = $pdo->prepare("SELECT * FROM `user` WHERE `id` = ?");
    $query->execute(array($userid));

    return $query->fetch(PDO::FETCH_BOTH)['name'];
}

function votes(int $newsid) : float
{
    require 'maincore.php';
    $query = $pdo->prepare("SELECT * FROM `review` WHERE `fk_NEWSid` = ?");
    $query->execute(array($newsid));
    $votes = 0;
    $num = 0;
    foreach($query as $row){
        $votes += $row['vote'];
        $num++;
    }
    if($num > 0)
        $votes = $votes/$num;
    return round((float)$votes, 2);
}

function is_voted(int $userid, int $news) : bool
{
    require 'maincore.php';
    $query = $pdo->prepare("SELECT * FROM `review` WHERE `fk_NEWSid` = ? AND `fk_USERid` = ?");
    $query->execute([$news, $userid]);

    if($query->rowCount() == 0) return false;
    return true;
}

function news_exist(int $news) : bool
{
    require 'maincore.php';
    $query = $pdo->prepare("SELECT * FROM `news` WHERE `id` = ?");
    $query->execute(array($news));
    if($query->rowCount() > 0) return true;
    return false;
}

function comment_exist(int $news) : bool
{
    require 'maincore.php';
    $query = $pdo->prepare("SELECT * FROM `comment` WHERE `id` = ?");
    $query->execute(array($news));
    if($query->rowCount() > 0) return true;
    return false;
}

function is_admin(int $userid) : bool
{
    require('maincore.php');
    $query = $pdo->prepare("SELECT * FROM `admin` WHERE `fk_USERid` = ?");
    $query->execute([$userid]);
    if($query->rowCount() > 0) return true;
    return false;
}

function count_items($type){
    require('maincore.php');
    $count = 0;
    switch($type){
        case '1':
            $query = $pdo->query("SELECT COUNT(*) as count FROM `news`");
            $count = $query->fetch(PDO::FETCH_BOTH)['count'];
            break;
        case '2':
            $query = $pdo->query("SELECT COUNT(*) as count FROM `user`");
            $count = $query->fetch(PDO::FETCH_BOTH)['count'];
            break;
    }
    return $count;
}

function remove_reviews($id, $type = 0){
    require 'maincore.php';
    if($type == 0) {
        $query = $pdo->prepare("DELETE FROM `review` WHERE `fk_NEWSid` = ?");
        $query->execute([$id]);
    }else if($type == 2){
        $query = $pdo->prepare("DELETE FROM `review` WHERE `fk_USERid` = ?");
        $query->execute([$id]);
    }
}

function remove_comments($id, $type = 0){
    require 'maincore.php';
    if($type == 0) {
        $query = $pdo->prepare("DELETE FROM `comment` WHERE `fk_NEWSid` = ?");
        $query->execute([$id]);
    }else if($type == 2){
        $query = $pdo->prepare("DELETE FROM `comment` WHERE `fk_USERid` = ?");
        $query->execute([$id]);
    }
}

function remove_media($id, $type = 0){
    require 'maincore.php';
    if($type == 0) {
        $query = $pdo->prepare("DELETE FROM `media` WHERE `fk_NEWSid` = ?");
        $query->execute([$id]);
    }else if($type == 2) {
        $query = $pdo->prepare("DELETE FROM `photo` WHERE `fk_USERid` = ?");
        $query->execute([$id]);
    }
}

function remove_news($userid)
{
    require('maincore.php');
    $query = $pdo->prepare("SELECT * FROM `news` WHERE `fk_USERid` = ?");
    $query->execute([$userid]);
    foreach($query as $row){
        remove_reviews($row['id']);
        remove_comments($row['id']);
        remove_media($row['id']);
        $query2 = $pdo->prepare("DELETE FROM `news` WHERE `id` = ?");
        $query2->execute([$row['id']]);
    }
}

function gender($type){
    switch($type){
        case '0': return 'Vyras';
        case '1': return 'Moteris';
        case '2': return 'Kita';
        default: return 'Nenustatyta';
    }
}

function is_banned(int $id) : bool
{
    require 'maincore.php';
    $query = $pdo->prepare("SELECT * FROM `banned` WHERE `fk_USERid` = ?");
    $query->execute([$id]);
    if($query->rowCount() > 0) return true;
    else return false;
}

function user_exist(int $id) : bool
{
    require 'maincore.php';
    $query = $pdo->prepare("SELECT * FROM `user` WHERE `id` = ?");
    $query->execute(array($id));
    if($query->rowCount() > 0) return true;
    return false;
}

function admin_id($userid){
    require 'maincore.php';
    if(!is_admin($userid)) return -1;
    else{
        $query = $pdo->prepare("SELECT `id` FROM `admin` WHERE `fk_USERid` = ?");
        $query->execute([$userid]);
        $row = $query->fetch(PDO::FETCH_BOTH);
        return $row['id'];
    }
}

function Media($newsid){
    require('maincore.php');
    $query = $pdo->prepare("SELECT * FROM `media` WHERE `fk_NEWSid` = ?");
    $query->execute([$newsid]);

    return $query->fetchAll(PDO::FETCH_BOTH);
}

function comments($newsid){
    require('maincore.php');
    $query = $pdo->prepare("SELECT * FROM `comment` WHERE `fk_NEWSid` = ?");
    $query->execute([$newsid]);

    return $query->fetchAll();
}

function show_comment($comment, $admin){
    require('maincore.php');
    $query = $pdo->prepare("SELECT * FROM `comment` WHERE `id` = ?");
    $query->execute([$comment]);
    $crow = $query->fetch(PDO::FETCH_BOTH);
    $text = '
        <div class="comment">
            <a href="profile.php?id=' . $crow['fk_USERid'] . '">' . username($crow['fk_USERid']) . '</a>';
            if ($admin == true) {
                $text = $text.'
            <span class="text-right"> 
                ';
                if($crow['approved'] == 0) $text = $text.'<a href="admin/approve-comment.php?id=' . $crow['id'] . '">Patvirtinti</a> ';
                $text = $text. '
                <a href="admin/remove-comment.php?id=' . $crow['id'] . '">Ištrinti</a> 
                <a href="admin/user-ban.php?id=' . $crow['fk_USERid'] . '">Blokuoti vartotoją</a>
                <a href="admin/comment-edit.php?id=' . $crow['id'] . '">Redaguoti</a>
            </span>';
            }else{
                if($crow['fk_USERid'] == $_SESSION['user'] && !is_admin($_SESSION['user'])){
                    $text = $text.'
                    <span class="text-right"> 
                        <a href="comment-remove.php?id=' . $crow['id'] . '">Ištrinti</a> 
                        <a href="comment-edit.php?id=' . $crow['id'] . '">Redaguoti</a>
                    </span>';
                }
            }
            $text = $text.'
            <hr>
                <div class="text">' . $crow['text'] . '</div>
        </div>';
    return $text;
}

function news_title($newsid){
    require ('maincore.php');
    $query = $pdo->prepare("SELECT `title` FROM `news` WHERE `id` = ?");
    $query->execute([$newsid]);

    return $query->fetch(PDO::FETCH_BOTH)['title'];
}

function getNews($id){
    require('maincore.php');
    $query = $pdo->prepare("SELECT * FROM `news` WHERE `id` = ?");
    $query->execute([$id]);

    return $query->fetch(PDO::FETCH_BOTH);
}

function future_exists($id){
    require('maincore.php');
    $query = $pdo->prepare("SELECT * FROM `future_news` WHERE `fk_NEWSid` = ?");
    $query->execute([$id]);

    if($query->rowCount() > 0) return true;
    return false;
}

function archive_exists($id){
    require('maincore.php');
    $query = $pdo->prepare("SELECT * FROM `news_archive` WHERE `fk_NEWSid` = ?");
    $query->execute([$id]);

    if($query->rowCount() > 0) return true;
    return false;
}

function user($id){
    require('maincore.php');
    $query = $pdo->prepare("SELECT * FROM `user` WHERE `id` =?");
    $query->execute([$id]);
    return $query->fetch(PDO::FETCH_BOTH);
}

function news_type($id){
    require 'maincore.php';
    //Archyvas
    $query = $pdo->prepare("SELECT * FROM `news_archive` WHERE `fk_NEWSid` = ?");
    $query->execute([$id]);
    if($query->rowCount() > 0) return 'Archyvuota naujiena';
    //Būsima
    $query = $pdo->prepare("SELECT * FROM `future_news` WHERE `fk_NEWSid` = ?");
    $query->execute([$id]);
    if($query->rowCount() > 0) return 'Būsima naujiena';
    //Paprasta
    return 'Paprasta naujiena';
}