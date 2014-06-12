<?php

if(!defined('PATH_BASE'))
	define('PATH_BASE', dirname(__FILE__));
if(!defined('DS'))
	define('DS', DIRECTORY_SEPARATOR);

class App {
	public static $DB;
	
	public static function init() {
		App::init_db();
	}
	
	private static function init_db() {
		$dbtype		= "mysql";
		$dbhost 	= "localhost";
		$dbuser		= "adv_os";
		$dbpassword 	= "isepII2408";
		$dbname 	= "adv_os";
		App::$DB = new PDO("$dbtype:host=$dbhost;dbname=$dbname", $dbuser, $dbpassword);
		$stmt = App::$DB->prepare("SET NAMES 'UTF8'");
		$stmt->execute();
	}
}

App::init();

include_once(PATH_BASE . DS . "pdo.php");
include_once(PATH_BASE . DS . "model.php");
include_once(PATH_BASE . DS . "restaurant.php");
include_once(PATH_BASE . DS . "food_image.php");
include_once(PATH_BASE . DS . "function.php");
