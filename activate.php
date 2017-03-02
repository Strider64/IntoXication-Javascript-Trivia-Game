<?php
include_once 'vendor/swiftmailer/swiftmailer/lib/swift_required.php';
require_once 'lib/includes/utilities.inc.php';
include 'lib/functions/functions.inc.php';

$message = NULL;

$confirmation = filter_input(INPUT_GET, 'confirmation', FILTER_SANITIZE_FULL_SPECIAL_CHARS);

$verify = filter_input(INPUT_POST, 'action', FILTER_SANITIZE_FULL_SPECIAL_CHARS);

if (isset($verify) && $verify === 'verify') {
    $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
    $confirm_number = filter_input(INPUT_POST, 'confirm_num');

    $id = verifyConfirmation($email, $confirm_number, $pdo);

    if ($id) {
        $status = upgradeAccount($id, $pdo);
        if ($status) {
            $message = "Account has been verified!";
        } else {
            echo "Error, Something went wrong!";
        }
    } else {
        $message = "Account has already been upgraded!";
    }
}
?>
<!DOCTYPE html>
<!--
Pepster's Place 
A Website Design & Development Company
President John R Pepp
-->
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Activate Account</title>
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
                    <li><a href="addTrivia.php">Add Trivia</a></li>
                    <li><a href="register.php">Register</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                    <li class="icon">
                        <a href='#'>&#9776;</a>
                    </li>    
                </ul>
            </nav>
        </div>
        <?php if ($message) { ?>
            <div class="mainContent">
                <h1><?php echo $message; ?></h1>
                <p>Please login for your account has been upgraded to member status. You will be able to add questions to the trivia database (once this feature is available) and there will be many other member only features.</p>
            </div>
        <?php }  else { ?>
        <div class="mainContent">
            <form id="activate" class="span6" action="activate.php" method="post" autocomplete="off">
                <fieldset>
                    <legend>Activation Page</legend>
                    <input type="hidden" name="action" value="verify">                    
                    <label for="email">Email Address</label>
                    <input id="email" type="text" name="email" placeholder="Enter Email Address here..." value="" tabindex="1">
                    <label for="confirmation">Confirmation Number</label>
                    <input id="confirmation" name="confirm_num" value="<?= (isset($confirmation)) ? $confirmation : NULL; ?>" tabindex="2">
                    <input type="submit" name="submit" value="confirm" tabindex="3">
                </fieldset>
            </form>        
        <?php } ?>
        </div>
        <div id="myFooter">
            <p class="footer-text">&copy;<?php echo date("Y"); ?> John R. Pepp <span>Dedicated to my mom 11-29-1928 / 02-26-2017</span></p>
        </div>        
    </body>
</html>
