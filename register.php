<?php
include_once 'vendor/swiftmailer/swiftmailer/lib/swift_required.php';
require_once 'lib/includes/utilities.inc.php';
include 'lib/functions/functions.inc.php';

use website_project\users\Validate;

$errMessage = FALSE;

$validation = new Validate();
$submit = filter_input(INPUT_POST, 'action', FILTER_SANITIZE_FULL_SPECIAL_CHARS);

if (isset($submit) && $submit === 'enter') {
    $data['name'] = filter_input(INPUT_POST, 'name', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $data['password'] = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $data['email'] = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $data['verify'] = filter_input(INPUT_POST, 'verify', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $data['confirmation'] = generateRandom();

    $validation->setData($data);

    $result = $validation->contentCheck();
    if (!is_array($result)) { // If it is not an array then send verification and save user data to database table:
        $result = send_email($data);
        if ($result) {
            $info = registration($data, $pdo); // Save to db table mysimpleregistration calling registration function:
            if ($info) {
                header("Location: success.php");
                exit();
            } else {
                $errMessage = TRUE;
            }
        }
    } else {
        $errMessage = TRUE;
    }
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
        <title>Registration</title>
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
                    if ( isset( $_SESSION['user']->id ) && ( $_SESSION['user']->security === 'member' || $_SESSION['user']->security === 'admin' ) )  {
                        echo '<li><a href="addTrivia.php">Add Trivia</a></li>';
                    }
                    ?>
                    <li><a href="login.php">Login</a></li>
                    <li><a href="register.php">Register</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                    <li class="icon">
                        <a href='#'>&#9776;</a>
                    </li>    
                </ul>
            </nav>
            <?php if ($errMessage) { ?>
                <div class="mainContent">
                    <?php
                        echo ($result['empty'] === false) ? '<p>All fields are required, please re-enter!</p>' :NULL;
                        echo ($result['validPassword'] === false) ? '<p>Password must contain at least 8 characters, at least one uppercase and lowercase character, one numeric charater, please re-enter!</p>' :NULL;
                        echo ($result['validEmail'] === false) ? '<p>Invalid email address, please re-enter!</p>' :NULL;
                        echo ($result['matchEmail'] === false) ? '<p>Email address and verify email address did not match, please re-enter!</p>' :NULL;
                        echo ($result['duplicate'] === false)  ? '<p>Please re-enter email address</p>' : NULL; 
                        echo '<a class="registerAnchor" href="register.php">Click for Registration Form</a>' . "\n";
                    ?>
                </div>

            <?php } else { ?>
                <form id="register" action="register.php" method="post" autocomplete="off">
                    <fieldset>
                        <legend>Registration Form</legend>
                        <input type="hidden" name="action" value="enter">
                        <label for="name">name</label>
                        <input id="name" type="text" name="name" value="" autofocus tabindex="1">
                        <label for="password">password</label>
                        <input id="password" type="password" name="password" tabindex="2">
                        <label for="email">email address</label>
                        <input id="email" type="text" name="email" value="" tabindex="3">
                        <label for="verify_email">Verify Email</label>
                        <input id="verify_email" type="text" name="verify" value="" tabindex="4">
                        <input id="regBtn" type="submit" name="submit" value="enter" tabindex="5">
                    </fieldset>
                </form>
            <?php } ?>
        </div>
        <div id="myFooter">
            <p class="footer-text">&copy;<?php echo date("Y"); ?> John R. Pepp <span>Dedicated to my mom 11-29-1928 / 02-26-2017</span></p>
        </div>
    </body>
</html>