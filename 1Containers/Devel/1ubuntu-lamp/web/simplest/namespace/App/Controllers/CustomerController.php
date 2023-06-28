<?php
declare(strict_types = 1);

namespace App\Controllers;
use Core\View;

class CustomertController
{
    public function index()
    {
        $view = new View();
        $view->render('customers/index');
    }

    public function create()
    {
        $view = new View();
        $view->render('customers/create');
    }

}
