<?php

require_once 'lib/includes/utilities.inc.php';
$categories = [];

$stmt = $pdo->query('SELECT category FROM trivia_questions');
while ($row = $stmt->fetch()) {
    if (!in_array($row['category'], $categories)) {
        echo $row['category'] . "<br>\n";
        array_push($categories, $row['category']);
    }
}
