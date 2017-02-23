<?php

require_once 'lib/includes/utilities.inc.php';

use website_project\trivia_game\Trivia;

$trivia = new Trivia();

$category = filter_input(INPUT_POST, 'category');
$modify = filter_input(INPUT_POST, 'modify');
if ($modify === 'edit_entry') {
    $data = $trivia->categories($category);
    output($data);
} else {
    $data = ['status' => 'new', 'category' => $category, 'total' => 0];
    output($data);
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

