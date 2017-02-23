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

$submit = filter_input(INPUT_POST, 'submit');

if (isset($submit) && $submit === 'enter') {
    
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
        <title>Add &DoubleVerticalBar; Edit Trivia</title>
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
        <link rel="stylesheet" href="lib/css/stylesheet.css">
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
                <h2 id="subheading">Don't Drive Drunk, Play this Game Instead!</h2>
            </div>
            <nav class="nav-bar">
                <ul class="topnav" id="myTopnav">
                    <li><a class="top-link" href="#" >&nbsp;</a></li>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="addTrivia.php">Add Trivia</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                    <li class="icon">
                        <a href='#'>&#9776;</a>
                    </li>    
                </ul>
            </nav>
            <form id="add-categories-form" action="totalRecords.php" method="post">
                <section id="first" class="section">
                    <div class="radioContainer">
                        <input type="radio" name="modify" value="new_entry" id="radio-1" checked>
                        <label for="radio-1"><span class="radio">New Entry</span></label>
                    </div>
                    <div class="radioContainer">
                        <input type="radio" name="modify" value="edit_entry" id="radio-2">
                        <label for="radio-2"><span class="radio">Edit Entry</span></label>
                    </div>
                </section>
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
                <input id="submitBtn" type="button" name="submit" value="submit">
            </form>     
            <form id="addTrivia" action="update_trivia.php" method="post">
                <fieldset>
                    <legend id="legend">Add Trivia Question(s)</legend>
                    <input id="id" type="hidden" name="id" value="0">
                    <input id="cat" type="hidden" name="category" value="">
                    <textarea id="addQuestion" name="question" tabindex="1" placeholder="Add question here..." autofocus></textarea>
                    <label for="addAnswer1">Answer 1</label>
                    <input id="addAnswer1" type="text" name="answer1" value="" tabindex="2">
                    <label for="addAnswer2">Answer 2</label>
                    <input id="addAnswer2" type="text" name="answer2" value="" tabindex="3">
                    <label for="addAnswer3">Answer 3</label>
                    <input id="addAnswer3" type="text" name="answer3" value="" tabindex="4">
                    <label for="addAnswer4">Answer 4</label>
                    <input id="addAnswer4" type="text" name="answer4" value="" tabindex="5">   
                    <label for="addCorrect">Answer</label>
                    <input id="addCorrect" type="text" name="correct" value="" tabindex="6">
                    <input id="prevBtn" type="submit" name="submit" value="prev" tabindex="7">
                    <input id="saveBtn" type="button" name="enter" value="save" tabindex="8">
                    <input id="nextBtn" type="submit" name="submit" value="next" tabindex="9">
                </fieldset>
            </form>
            <noscript>
            <div id="noScriptBox">
                <p class="noscript">Sorry, This quiz requires Javascript to be enabled!</p>
                <a href="https://www.pepster.com" title="Pepster's Place Website">https://www.pepster.com</a>
            </div>
            </noscript>
        </div>
        <div id="myFooter">
            <p>&copy;<?php echo date("Y"); ?> John R. Pepp</p>
        </div>
        <script src="lib/js/modify.js"></script>
    </body>
</html>            