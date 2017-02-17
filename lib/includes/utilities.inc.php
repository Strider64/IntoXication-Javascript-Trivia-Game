<?php

/* Turn on error reporting */
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
if (filter_input(INPUT_SERVER, 'SERVER_NAME', FILTER_SANITIZE_URL) == "localhost") {
    error_reporting(-1); // -1 = on || 0 = off
} else {
    error_reporting(0); // -1 = on || 0 = off
}
date_default_timezone_set('America/Detroit');

include 'connect/connect.php'; // Connection Variables:
require 'lib/website_project/website_project.inc.php';

use website_project\database\Database as DB;

$db = DB::getInstance();
$pdo = $db->getConnection();