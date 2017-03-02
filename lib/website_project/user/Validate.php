<?php

namespace website_project\users;

use website_project\database\Database as DB;

class Validate {

    private $query;
    private $stmt;
    public $row;
    public $result;
    public $valid = ['validEmail' => true, 'matchEmail' => true, 'validPassword' => true, 'duplicate' => true, 'empty' => true];
    protected $data = [];
    public $resultArray = [];
    public $message = '';

    public function __construct() {
        
    }

    public function setData(array $data) {
        $this->data = $data;
    }

    public function contentCheck() {

        /* Make sure user just didn't type spaces in an attempt to make valid */
        foreach ($this->data as $key => $value) {
            $this->data[$key] = isset($value) ? trim($value) : '';
        }
        /* If there is nothing a field then valid empty index is false */
        if (in_array("", $this->data, true)) {
            $this->valid['empty'] = false;
        }
        $this->emailDuplicate($this->data['email']);
        $this->emailMatch($this->data['email'], $this->data['verify']);
        $this->passwordCheck($this->data['password']);
        $this->emailCheck($this->data['email']);
        return $this->validate();
    }

    protected function emailDuplicate($email) {
        $db = DB::getInstance();
        $pdo = $db->getConnection();
        try {
            $this->query = "SELECT 1 FROM login WHERE email = :email";
            $this->stmt = $pdo->prepare($this->query);
            $this->stmt->bindParam(':email', $email);
            $this->stmt->execute();
            $this->row = $this->stmt->fetch();
            if ($this->row) {
                $this->valid['duplicate'] = false; // Set to false if email address is already in database table:
            }
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }

    protected function emailMatch($email, $verify) {
        if ($email !== $verify) {
            $this->valid['matchEmail'] = false;
        }
    }

    protected function passwordCheck($password) {
        /*
         * 
         * Explaining !preg_match_all('$\S*(?=\S{8,})(?=\S*[a-z])(?=\S*[A-Z])(?=\S*[\d])(?=\S*[\W])\S*$', $password)
         * $ = beginning of string
         * \S* = any set of characters
         * (?=\S{8,}) = of at least length 8
         * (?=\S*[a-z]) = containing at least one lowercase letter
         * (?=\S*[A-Z]) = and at least one one uppercase letter
         * (?=\S*[\d]) = and at least one number
         * (?=\S*[\W]) = and at least a special character (non-word character)
         * $ = end of the string:
         * 
         */
        if (!\preg_match_all('$\S*(?=\S{8,})(?=\S*[a-z])(?=\S*[A-Z])(?=\S*[\d])\S*$', $password)) {
            $this->valid['validPassword'] = false; // False means it's an invalid password:
        }
    }

    protected function emailCheck($email) {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $this->valid['validEmail'] = false; //False means invalid email address:
        }
    }

    protected function validate() {
        foreach ($this->valid as $status) {
            if (!$status) {
                return $this->valid;
            }
        }
        return true;
    }

}
