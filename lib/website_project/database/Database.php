<?php

namespace website_project\database;

# PDO database: only one connection is allowed. 

use PDO;

class Database {

    private $_connection;
    // Store the single instance.
    private static $_instance;

    // Get an instance of the Database.
    // @return Database: 
    public static function getInstance() {
        if (!self::$_instance) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    // Constructor - Build the PDO Connection:
    public function __construct() {
        $db_options = array(
            /* important! use actual prepared statements (default: emulate prepared statements) */
            PDO::ATTR_EMULATE_PREPARES => false
            /* throw exceptions on errors (default: stay silent) */
            , PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
            /* fetch associative arrays (default: mixed arrays)    */
            , PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        );
        $this->_connection = new PDO('mysql:host=' . DATABASE_HOST . ';dbname=' . DATABASE_NAME . ';charset=utf8', DATABASE_USERNAME, DATABASE_PASSWORD, $db_options);
    }

    // Empty clone magic method to prevent duplication:
    private function __clone() {
        
    }

    // Get the PDO connection:    
    public function getConnection() {
        return $this->_connection;
    }

}
