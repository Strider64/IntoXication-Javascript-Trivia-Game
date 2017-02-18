<?php
require_once 'lib/includes/utilities.inc.php';
$categories = [];

$stmt = $pdo->query('SELECT category FROM trivia_questions'); // Grab ALL the categories:
/*
 * Only put unique category into categories array
 */
while ($row = $stmt->fetch()) {
    if (!in_array($row['category'], $categories)) {
        array_push($categories, $row['category']);
    }
}
?>
<!DOCTYPE html>
<!--
Trivia Game Version 2.50 beta with XML;
by John Pepp
Started: January 31, 2017
Revised: February 18, 2017
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
        <div id="container" >
            <div id="heading">
                <h1>Trivia<span id="toxic">IntoXication</span></h1>
                <h2 id="subheading">Don't Drive Drunk, Play this Game Instead!</h2>
            </div>
            <nav class="nav-bar">
                <ul class="topnav" id="myTopnav">
                    <li><a class="top-link" href="#" >&nbsp;</a></li>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Add Trivia</a></li>
                    <li><a href="#">Contact</a></li>
                    <li class="icon">
                        <a href='#'>&#9776;</a>
                    </li>    
                </ul>
            </nav>
            <noscript>
            <div id="noScriptBox">
                <p class="noscript">Sorry, This quiz requires Javascript to be enabled!</p>
                <a href="https://www.pepster.com" title="Pepster's Place Website">https://www.pepster.com</a>
            </div>
            </noscript>
            <form id="categories-form" action="totalRecords.php" method="post">
                <label for="category">Select a Trivia Category</label>
                <select id="category" name="category">
                    <?php
                    /*
                     * Only put unique categories into selection option value attribute
                     */
                    foreach ($categories as $category) {
                        echo '<option value="' . $category . '">' . $category . '</option>';
                    }
                    ?>
                </select>
                <input id="submitBtn" type="submit" name="submit" value="submit">
            </form>            

        </div>
        <div id="myFooter">
            <p class="footer-text">&copy;<?php echo date("Y"); ?> John R. Pepp</p>
        </div>
        <script src="lib/js/trivia.js"></script>
    </body>
</html>
