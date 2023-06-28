<?php
require_once ROOT . 'vendor/autoload.php';

define('URL_PUBLIC_FOLDER', 'public'); // public
define('URL_PROTOCOL', '//'); // //
define('URL_DOMAIN', $_SERVER['HTTP_HOST']); // localhost
define('URL_SUB_FOLDER', str_replace(URL_PUBLIC_FOLDER, '', dirname($_SERVER['SCRIPT_NAME'])));// Root application - /appfolder
define('URL', URL_PROTOCOL . URL_DOMAIN . URL_SUB_FOLDER);// /localhost/appfolder/
define('APP_TITTLE', 'Mini Framework RibaFS');
define('DEFAULT_CONTROLLER', 'product');
define('DEBUG', 'devel');

define('DB_TYPE', 'mysql'); // mysql or pgsql
define('DB_HOST', '127.0.0.1');
define('DB_NAME', 'mini_fw');
define('DB_USER', 'root');
define('DB_PASS', 'root');
define('DB_PORT', '3306');// 3306 or 5432
define('DB_CHARSET', 'utf8mb4');

$whoops = new Whoops\Run();

if (DEBUG == 'devel') {
	 
	// Configure the PrettyPageHandler:
	$errorPage = new Whoops\Handler\PrettyPageHandler();
	 
	$errorPage->setPageTitle("It's broken!"); // Set the page's title
	$errorPage->setEditor("sublime");         // Set the editor used for the "Open" link
	$errorPage->addDataTable("Extra Info", array(
		  "stuff"     => 123,
		  "foo"       => "bar",
		  "useful-id" => "baloney"
	));
	 
	$whoops->pushHandler($errorPage);
	$whoops->register();

//	throw new RuntimeException("Oopsie!");	

} else {
    $whoops->pushHandler(function($e){
        echo 'Todo: Friendly error page and send an email to the developer';
    });
}

