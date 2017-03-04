<?php

require_once 'lib/includes/utilities.inc.php';

$x = 0;

function parseToXML($htmlStr) {
    $original = ['<', '>', '"', "", '&'];
    $replace = ['&lt;', '&gt;', '&quot;', '&#39;', '&amp;'];
    $xmlStr = str_replace($original, $replace, $htmlStr);
    return $xmlStr;
}

use website_project\trivia_game\Trivia;

$gamePlay = new Trivia();
$end = filter_input(INPUT_POST, 'end');


if (isset($end)) {
    $start = filter_input(INPUT_POST, 'start');
    $category = filter_input(INPUT_POST, 'category');
    $data = $gamePlay->readAll($start, $end, $category);
}

header("Content-type: text/xml");

// Start XML file, echo parent node
echo '<markers>';

while ($x < count($data)) {
    echo '<marker ';
    echo 'id="' . parseToXML($data[$x]->id) . '" ';
    echo 'hidden="' . parseToXML($data[$x]->hidden). '" ';
    echo 'question="' . parseToXML($data[$x]->question) . '" ';
    echo 'answer1="' . parseToXML($data[$x]->answer1) . '" ';
    echo 'answer2="' . parseToXML($data[$x]->answer2) . '" ';
    echo 'answer3="' . parseToXML($data[$x]->answer3) . '" ';
    echo 'answer4="' . parseToXML($data[$x]->answer4) . '" ';
    echo 'correct="' . parseToXML($data[$x]->correct) . '" ';
    echo 'category="' . parseToXML($data[$x]->category) . '" ';
    echo '/>';
    $x += 1;
}

echo '</markers>';
