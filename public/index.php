<?php

use App\Controller\ErrorController;
use App\Routing\AbstractRouter;
use App\Routing\ArticleRouter;
use App\Routing\HomeRouter;
use App\Routing\UserRouter;
use App\Routing\CommentRouter;

require __DIR__ . '/../include.php';
session_start();

//check if page and method are present
$page = isset($_GET['c']) ? AbstractRouter::secure($_GET['c']) : 'home';
$method = isset($_GET['a']) ? AbstractRouter::secure($_GET['a']) : 'index';

// controller.
switch ($page) {
    case 'home':
        HomeRouter::route();
        break;
    case 'user':
        UserRouter::route($method);
        break;
    case 'article':
        ArticleRouter::route($method);
        break;
    case 'comment':
        CommentRouter::route($method);
        break;
    default:
        (new ErrorController())->error404($page);
}