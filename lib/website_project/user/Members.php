<?php

namespace website_project\users;

use PDO;
use website_project\database\Database as DB;

//use website_project\database\PDOConnection as PDOConnect;

class Members {

    private $connectPDO;
    private $pdo;
    protected $id = NULL;
    protected $query = NULL;
    protected $stmt = NULL;
    protected $result = NULL;
    protected $queryParams = NULL;
    protected $row = NULL;
    protected $loginStatus = false;
    protected $confirmation_code = NULL;
    public $user = NULL;
    public $userArray = [];
    public $username = NULL;

    /* Create (Insert) new users information */

    public function __construct() {
        
    }

// End of constructor:

    /* This method also takes an array of data and utilizes the constructor. */

    public function create($data) {
        if (is_array($data)) { // If statement probably not needed:
            $db = DB::getInstance();
            $pdo = $db->getConnection();
            /* Secure the Password by hashing the user's password. */
            $data['password'] = password_hash($data['password'], PASSWORD_BCRYPT, array("cost" => 15));


            /* Set the query variable */
            $this->query = 'INSERT INTO users (username, password, confirmation_code, email, date_added) VALUES (:username, :password, :confirmation_code, :email, NOW())';

            /* Prepare the query */
            $this->stmt = $pdo->prepare($this->query);

            /* Execute the query with the stored prepared values */
            $this->result = $this->stmt->execute([
                ':username' => $data['username'],
                ':password' => $data['password'],
                ':confirmation_code' => $data['confirmation_code'],
                ':email' => $data['email']
            ]); // End of execution:
            return TRUE;
        } // End of main if-statement:
    }

    public function read($username = NULL, $password = NULL) {
        $db = DB::getInstance();
        $pdo = $db->getConnection();
        /* Setup the Query for reading in login data from database table */
        $this->query = 'SELECT id, username, password, security_level, first_name, last_name, email, home_phone, cell_phone, gender, birthday FROM users WHERE username=:username';


        $this->stmt = $pdo->prepare($this->query); // Prepare the query:
        $this->stmt->execute([':username' => $username]); // Execute the query with the supplied user's parameter(s):

        $this->stmt->setFetchMode(PDO::FETCH_OBJ);
        $this->user = $this->stmt->fetch();
        if (!$this->user) {
            return \FALSE;
        }
        /*
         * If password matches database table match send back true otherwise send back false.
         */
        if (password_verify($password, $this->user->password)) {
            $this->userArray['id'] = $this->user->id;
            $this->userArray['username'] = $this->user->username;
            $this->userArray['security_level'] = $this->user->security_level;
            $this->userArray['email'] = $this->user->email;
            $this->userArray['csrf_token'] = $_SESSION['csrf_token'];
            $_SESSION['user'] = (object) $this->userArray;
            return $this->userArray['csrf_token'];
        } else {
            return \FALSE;
        }
    }

    public function securityLevel($confirm_number) {
        $db = DB::getInstance();
        $pdo = $db->getConnection();
        $this->confirmation_code = $confirm_number;
        $this->query = 'UPDATE users SET security_level=:security_level WHERE confirmation_code=:confirmation_code';
        $this->stmt = $pdo->prepare($this->query);
        $this->result = $this->stmt->execute([':security_level' => 'member', ':confirmation_code' => $this->confirmation_code]);
        if ($this->result) {
            return TRUE;
        }
    }

    public function update(array $data = NULL) {
        $db = DB::getInstance();
        $pdo = $db->getConnection();
        $this->id = $data['id'];

        $this->query = 'UPDATE users 
                    SET first_name=:first_name, 
                        last_name=:last_name,
                        home_phone=:home_phone,
                        cell_phone=:cell_phone,
                        birthday=:birthday

                    WHERE id=:id';


        $this->stmt = $pdo->prepare($this->query);
        $this->result = $this->stmt->execute([ ':first_name' => $data['first_name'], ':last_name' => $data['last_name'], ':home_phone' => $data['home_phone'], ':cell_phone' => $data['cell_phone'], ':birthday' => $data['birthday'], ':id' => $this->id]);

        if ($this->result) {
            $this->readUsersRec();
            return true;
        } else {
            return false;
        }
    }

    /* Logoff Current User */

    public function delete($id = NULL) {
        unset($id);
        unset($this->user);
        unset($_SESSION['user']);
        session_destroy();
        $_SESSION['user'] = NULL;
        return TRUE;
    }

}

// End of Users class: