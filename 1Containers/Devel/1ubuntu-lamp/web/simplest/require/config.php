<?php

define('APP_TITTLE', 'Simplest Router to PHP with MVC');
define('DEFAULT_CONTROLLER', 'product');
define('DEBUG', true);



use Spatie\Ignition\Ignition;

if ( DEBUG ) {
    error_reporting(E_ALL);
    ini_set('display_errors', 1);

    Ignition::make()->register();

    // Dark
    \Spatie\Ignition\Ignition::make()
        ->useDarkMode()
        ->register();

// Tratará somente os erros daqui pra frente neste arquivo ou nos demais que incluiram este
//    throw new Exception('Testando');

}else{
    error_reporting(0);
    ini_set('display_errors', 0);

    \Spatie\Ignition\Ignition::make()
        ->shouldDisplayException($inLocalEnvironment)
        ->register();
}

