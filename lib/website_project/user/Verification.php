<?php

namespace website_project\users;

class Verification {

    protected $name = NULL;
    protected $emailAddress = NULL;
    protected $message = NULL;
    protected $emailSubject = NULL;
    protected $mail;
    protected $confirmation_code = NULL;

    /* Generate secure confirmation number, I'm using OPEN_SSL */

    private function generate_confirmation_number() {
        for ($i = -1; $i <= 16; $i++) {
            $bytes = openssl_random_pseudo_bytes($i, $cstrong);
            $hex = bin2hex($bytes);
        }

        return $hex;
    }

    public function __construct(array $data) {
        $this->name = $data['username'];
        $this->emailAddress = $data['email'];
        $this->emailSubject = "Confirmation code has been sent to " . $this->emailAddress . " for verification purposes only.";
        $this->confirmation_code = $this->generate_confirmation_number();
        if (filter_input(INPUT_SERVER, 'SERVER_NAME', FILTER_SANITIZE_URL) == "localhost") {
            /* Local Server */
            $this->message = 'Thank you for registering at Interactive Trivia Online and to gain full access to the forums simply click or copy the following link:<br><br> <a style="text-decoration:none;color=darkblue" href="http://localhost:8000/notice.php?confirm_number=' . $this->confirmation_code . '">http://localhost:8000/notice.php?confirm_number=' . $this->confirmation_code . '</a>';
        } else {
            /* Web Server */
            $this->message = 'Thank you for registering at Interactive Trivia Online and to gain full access to the forums simply click or copy the following link:<br><br> <a style="text-decoration:none;color=darkblue" href="https://www.interactivetrivia.xyz/notice.php?confirm_number=' . $this->confirmation_code . '">https://www.interactivetrivia.xyz/notice.php?confirm_number=' . $this->confirmation_code . '</a>';
        }
    }

    public function getConfirmationCode() {
        return $this->confirmation_code;
    }

    public function sendEmailVerification() {

        $this->mail = new \PHPMailer(); // Set up a new instance of PHPMailer:

        $this->mail->Host = EMAIL_HOST; // You're email host (I'm using a define() constant):
        if (filter_input(INPUT_SERVER, 'SERVER_NAME', FILTER_SANITIZE_URL) == "localhost") {
            $this->mail->isSmtp(); // Local Host:
            $this->mail->Port = EMAIL_PORT; // Local Host Port: (Usually 587)
        } else {
            $this->mail->isSendMail(); // Remote Host:
        }
        $this->mail->SMTPAuth = true;
        $this->mail->Username = EMAIL_ADDRESS; // SMTP username:
        $this->mail->Password = EMAIL_PASSWORD; // SMTP password:
        $this->mail->SMTPSecure = 'tls'; // Enable encryption, 'ssl' also accepted:

        $this->mail->From = EMAIL_ADDRESS;
        $this->mail->FromName = 'John Pepp';
        $this->mail->addAddress($this->emailAddress, $this->name);
        $this->mail->WordWrap = 50;                                 // Set word wrap to 50 characters
        $this->mail->Subject = $this->emailSubject;
        $this->mail->Body = '<img src="https://www.interactivetrivia.xyz/images/online-trivia-game.png"><p style="color:green;font-family:sans-serif;">' . $this->message . '</p>';
        $this->mail->AltBody = $this->message;
        $this->mail->isHTML(true);

        if (!$this->mail->send()) {
            echo 'Mailer Error: ' . $this->mail->ErrorInfo;
            exit;
        } else {
            return $this->getConfirmationCode();
        }
    }

}
