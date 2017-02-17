<?php
$server_name = filter_input(INPUT_SERVER, 'SERVER_NAME', FILTER_SANITIZE_URL);
define('BASE_PATH', realpath(dirname(__FILE__)));
/* Setup constants for local server and remote server */
define('EMAIL_HOST', 'your_email_host');
define('EMAIL_USERNAME', 'your_email_username');
define('EMAIL_PASSWORD', 'your_email_password');
define('EMAIL_ADDRESS', 'your_email_address');
define('EMAIL_PORT', 587);
define('PRIVATE_KEY', 'your_private_key');
if (filter_input(INPUT_SERVER, 'SERVER_NAME', FILTER_SANITIZE_URL) == "localhost") {
  define('DATABASE_HOST', 'local_host');
  define('DATABASE_NAME', 'your_db_name');
  define('DATABASE_USERNAME', 'root');
  define('DATABASE_PASSWORD', 'your_db_password');
  define('DATABASE_TABLE', 'users');
} else {
  define('DATABASE_HOST', 'your_remote_host');
  define('DATABASE_NAME', 'your_remote_database');
  define('DATABASE_USERNAME', 'your_remote_username');
  define('DATABASE_PASSWORD', 'your_remote_password');
  define('DATABASE_TABLE', 'users');
}
