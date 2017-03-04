<?php

function send_email(array $data) {
    /* Setup swiftmailer using your email server information */
    if (filter_input(INPUT_SERVER, 'SERVER_NAME', FILTER_SANITIZE_URL) == "localhost") {
        $transport = Swift_SmtpTransport::newInstance(EMAIL_HOST, EMAIL_PORT); // 25 for remote server 587 for localhost:
    } else {
        $transport = Swift_SmtpTransport::newInstance(EMAIL_HOST, 25);
    }

    $transport->setUsername(EMAIL_USERNAME);
    $transport->setPassword(EMAIL_PASSWORD);

    /* Setup To, From, Subject and Message */
    $message = Swift_Message::newInstance();

    $name = $data['name'];
    $subject = 'Activation to TriviaIntoXication';
    $email_from = 'jrpepp2014@jrpepp.com';
    if (filter_input(INPUT_SERVER, 'SERVER_NAME', FILTER_SANITIZE_URL) == "localhost") {
        $comments = 'Here is you confirmation link: http://localhost:8888/trivia_game_version_03_xml/activate.php?confirmation=' . $data['confirmation'];
    } else {
        $comments = 'Here is you confirmation link: https://www.triviaintoxication.com/activate.php?confirmation=' . $data['confirmation'];
    }
    $message->setTo([
        $data['email'] => $data['name']
    ]);

    $message->setSubject($subject); // Subject:
    $message->setBody($comments); // Message:
    $message->setFrom($email_from, 'TriviaIntoXication'); // From and Name:

    $mailer = Swift_Mailer::newInstance($transport); // Setting up mailer using transport info that was provided:
    $result = $mailer->send($message, $failedRecipients);

    if ($result) {
        return TRUE;
    } else {
        echo "<pre>" . print_r($failedRecipients, 1) . "</pre>";
        return FALSE;
    }
}

/*
 * Verify User's confirmation number
 */

function verifyConfirmation($email, $confirmation, $pdo = NULL) {
    $query = 'SELECT id, email, confirmation FROM login WHERE email=:email';

    $stmt = $pdo->prepare($query); // Prepare the query:
    $stmt->execute([':email' => $email]); // Execute the query with the supplied user's parameter(s):

    $stmt->setFetchMode(PDO::FETCH_OBJ);
    $user = $stmt->fetch();
    
    if (password_verify($confirmation, $user->confirmation)) {
        return $id = $user->id;
    }
}

/*
 * Upgrade user's account from public to member
 */

function upgradeAccount($id, $pdo = NULL) {
    $sql = "UPDATE login SET confirmation='confirmed', security='member' WHERE id=:id";

    $stmt = $pdo->prepare($sql);

    $result = $stmt->execute([':id' => $id]);

    return $result;
}

/*
 * Registration function of user:
 */

function registration(array $data, $pdo = NULL) {

    $password = password_hash($data['password'], PASSWORD_DEFAULT);
    $confirmation = password_hash($data['confirmation'], PASSWORD_DEFAULT);

    $query = 'INSERT INTO login(name, email, password, confirmation, dateCreated) VALUES ( :name, :email, :password, :confirmation, NOW())';
    $stmt = $pdo->prepare($query);
    $result = $stmt->execute([':name' => $data['name'], ':email' => $data['email'], ':password' => $password, ':confirmation' => $confirmation]);
    if ($result) {
        return TRUE;
    } else {
        return FALSE;
    }
}

/*
 * Login function of user:
 */

function login($pdo = NULL) {

    $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
    $password = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_FULL_SPECIAL_CHARS);

    $query = 'SELECT * FROM login WHERE email=:email';

    $stmt = $pdo->prepare($query); // Prepare the query:
    $stmt->execute([':email' => $email]); // Execute the query with the supplied user's parameter(s):

    $stmt->setFetchMode(PDO::FETCH_OBJ);
    $user = $stmt->fetch();

    /*
     * If password matches database table match send back true otherwise send back false.
     */
    if (password_verify($password, $user->password)) {

        $userArray['id'] = $user->id;
        $userArray['name'] = $user->name;
        $userArray['email'] = $user->email;
        $userArray['security'] = $user->security;
        //$userArray['csrf_token'] = $_SESSION['csrf_token'];
        $_SESSION['user'] = (object) $userArray;
        return TRUE;
    } else {
        $message = "Login credentials invalid, please Re-Enter!";
        return $message;
    }
}

function createTables() {
    try {
        if (filter_input(INPUT_SERVER, 'SERVER_NAME', FILTER_SANITIZE_URL) == "localhost") {
            $conn = new PDO("mysql:host=localhost:8889;dbname=jrpepp", DATABASE_USERNAME, DATABASE_PASSWORD);
        } else {
            $conn = new PDO('mysql:host=' . DATABASE_HOST . ';dbname=' . DATABASE_NAME, DATABASE_USERNAME, DATABASE_PASSWORD);
        }
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $table1 = "CREATE TABLE IF NOT EXISTS login (
                id INT(11) AUTO_INCREMENT PRIMARY KEY,
                name VARCHAR(60) NOT NULL,
                email VARCHAR(120) NOT NULL,
                password VARCHAR(255) NOT NULL,
                confirmation VARCHAR(255) NOT NULL,
                security VARCHAR(11) NOT NULL DEFAULT 'public',
                dateCreated DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00')";
        $conn->exec($table1);
        $use = 'use ' . DATABASE_NAME;
        $conn->exec($use);
        $conn = NULL;
    } catch (PDOException $e) {
        echo "Something went wrong" . $e->getMessage();
    }
}

function generateRandom() {
    $bytes = random_bytes(5); // length in bytes
    return bin2hex($bytes);
}

function logout() {
    unset($_SESSION['user']);
    session_destroy();
    $_SESSION['user'] = NULL;
    header("Location: index.php");
    exit();
}