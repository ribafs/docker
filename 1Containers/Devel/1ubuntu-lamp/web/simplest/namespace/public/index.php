<?php
// FrontController, única entrada para o aplicativo

if(!file_exists('../vendor')) {
    die ('<h3 align="center">You need to run the command first<br>composer du</h3>');
}

require_once '../Core/CONSTANTS.php';

// Load application settings (error reporting etc.)
require_once ROOT . 'config.php';

// This is the auto-loader for the Composer dependencies (to update the namespace in your project run: composer dumpautoload).
require_once ROOT . 'vendor/autoload.php';

use Core\Router;

new Router;

