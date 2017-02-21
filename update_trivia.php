<?php

require_once 'lib/includes/utilities.inc.php';

use website_project\trivia_game\Trivia;

$e = [];
$trivia = new Trivia();


$data['id'] = htmlspecialchars($_POST['id']);
$data['question'] = htmlspecialchars($_POST['question']);
$data['answer1'] = htmlspecialchars($_POST['answer1']);
$data['answer2'] = htmlspecialchars($_POST['answer2']);
$data['answer3'] = htmlspecialchars($_POST['answer3']);
$data['answer4'] = htmlspecialchars($_POST['answer4']);
$data['correct'] = htmlspecialchars($_POST['correct']);

$result = $trivia->update($data);
if ($result) {
    output("Data Successfully Update!");
}

function errorOutput($output, $code = 500) {
    http_response_code($code);
    echo json_encode($output);
}

/*
 * If everything validates OK then send success message to Ajax / JavaScript
 */

function output($output) {
    http_response_code(200);
    echo json_encode($output);
}
