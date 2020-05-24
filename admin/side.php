<?php
require('../maincore.php');
require_once('../functions.php');
if(!is_admin($_SESSION['user'])) header('location: index.php');
?>
<div class="row">
    <div class="col-md-4">
        <div class="card">
            <div class="card-header">Navigacija</div>
            <div class="card-body">
                <?php
                $script = explode('/', $_SERVER['PHP_SELF']);
                $full = $script[3]; ?>
                <ul class="list-group">
                    <li class="list-group-item
                    <?php if($full == 'index.php') echo 'active'; ?>">
                        <a class="nav-link" href="admin/index.php">Pagrindinis</a>
                    </li>
                    <li class="list-group-item
                    <?php if($full == 'news.php') echo 'active'; ?>">
                        <a class="nav-link" href="admin/news.php">Naujienos</a>
                    </li>
                    <li class="list-group-item
                    <?php if($full == 'future-news.php') echo 'active'; ?>">
                        <a class="nav-link" href="admin/future-news.php">Būsimos naujienos</a>
                    </li>
                    <li class="list-group-item
                    <?php if($full == 'archive-news.php') echo 'active'; ?>">
                        <a class="nav-link" href="admin/archive-news.php">Naujienų archyvas</a>
                    </li>
                    <li class="list-group-item
                    <?php if($full == 'comments.php') echo 'active'; ?>">
                        <a class="nav-link" href="admin/comments.php">Komentarai</a>
                    </li>
                    <li class="list-group-item
                    <?php if($full == 'users.php') echo 'active'; ?>">
                        <a class="nav-link" href="admin/users.php">Vartotojai</a>
                    </li>
                    <li class="list-group-item
                    <?php if($full == 'subscription.php') echo 'active'; ?>">
                        <a class="nav-link" href="admin/subscription.php">Naujienlaiškiai</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-md-8">