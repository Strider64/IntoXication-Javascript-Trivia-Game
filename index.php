<?php
require_once 'lib/includes/utilities.inc.php';
?>
<!DOCTYPE html>
<!--
Trivia Game Version 2.02 beta with XML;
by John Pepp
Started: January 31, 2017
Revised: February 13, 2017
-->
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="initial-scale=1.0, width=device-width" />
        <title>Trivia IntoXication</title>
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
        <link rel="stylesheet" href="lib/css/stylesheet.css">
    </head>
    <body>
        <div id="container">
            <div id="heading">
                <h1>Trivia<span id="toxic">IntoXication</span></h1>
                <h2 id="subheading">Don't Drive Drunk, Play this Game Instead!</h2>
            </div>
            <noscript>
            <div id="noScriptBox">
                <p class="noscript">Sorry, This quiz requires Javascript to be enabled!</p>
                <a href="https://www.pepster.com" title="Pepster's Place Website">https://www.pepster.com</a>
            </div>
            </noscript>
        </div>
        <div id="myFooter">
            <p class="footer-text">&copy;<?php echo date("Y"); ?> John R. Pepp</p>
        </div>
        <script src="lib/js/trivia.js"></script>
    </body>
</html>