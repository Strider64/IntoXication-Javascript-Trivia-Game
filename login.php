<?php
include_once 'vendor/swiftmailer/swiftmailer/lib/swift_required.php';
require_once 'lib/includes/utilities.inc.php';
include 'lib/functions/functions.inc.php';

$submit = filter_input(INPUT_POST, 'action', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
if (isset($submit) && $submit === 'enter') {
    $result = login($pdo);
    header('Location: addTrivia.php');
    exit();
}
?>
<!DOCTYPE html>
<!--
Trivia Game Version 3.0 beta with XML;
by John Pepp
Started: January 31, 2017
Revised: February 27, 2017
-->
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="initial-scale=1.0, width=device-width" />
        <title>Login</title>
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
        <link rel="stylesheet" href="lib/css/stylesheet.css">
        <link rel="stylesheet" href="lib/css/register_stylesheet.css">
    </head>
    <body>
        <div id="shadow">
            <div class="textBox">
                <h2>Data Successfully Saved!</h2>
            </div>
        </div>
        <div id="container" >
            <div id="heading">
                <h1>Trivia<span id="toxic">IntoXication</span></h1>
                <h2 id="subheading">Don't Drive Drunk! Play this Game Instead!</h2>
            </div>
            <nav class="nav-bar">
                <ul class="topnav" id="myTopnav">
                    <li><a class="top-link" href="#" >&nbsp;</a></li>
                    <li><a href="index.php">Home</a></li>
                    <?php
                    if (isset($_SESSION['user']->id) && ( $_SESSION['user']->security === 'member' || $_SESSION['user']->security === 'admin' )) {
                        echo '<li><a href="addTrivia.php">Add Trivia</a></li>';
                    }
                    ?>
                    <li><a href="register.php">Register</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                    <li class="icon">
                        <a href='#'>&#9776;</a>
                    </li>    
                </ul>
            </nav>


            <div class="mainContent">
                <form id="login" action="login.php" method="post">
                    <fieldset>
                        <legend>Login Form</legend>
                        <input type="hidden" name="action" value="enter">
                        <label for="email">Email</label>
                        <input id="email" type="text" name="email" value="" tabindex="1" autofocus>
                        <label for="password">Password</label>
                        <input id="password" type="password" name="password" tabindex="2">
                        <input type="submit" name="submit" value="enter" tabindex="3">
                    </fieldset>
                </form>
            </div>
        </div>
        <div id="myFooter">
            <p class="footer-text">&copy;<?php echo date("Y"); ?> John R. Pepp <span>Dedicated to my mom 11-29-1928 / 02-26-2017</span></p>
        </div>
    </body>
</html>

