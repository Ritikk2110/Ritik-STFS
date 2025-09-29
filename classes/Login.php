<?php
require_once '../config.php';
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once '../PHPMailer-master/src/PHPMailer.php';
require_once '../PHPMailer-master/src/Exception.php';
require_once '../PHPMailer-master/src/SMTP.php';

class Login extends DBConnection {
	private $settings;
	public function __construct(){
		global $_settings;
		$this->settings = $_settings;

		parent::__construct();
		ini_set('display_error', 1);
	}
	public function __destruct(){
		parent::__destruct();
	}
	public function index(){
		echo "<h1>Access Denied</h1> <a href='".base_url."'>Go Back.</a>";
	}
	public function login(){
		extract($_POST);

		$stmt = $this->conn->prepare("SELECT * from users where username = ?");
		$stmt->bind_param('s',$username);
		$stmt->execute();
		$result = $stmt->get_result();
		if($result->num_rows > 0){
			$data = $result->fetch_array();
			if(password_verify($password, $data['password'])){
				foreach($data as $k => $v){
					if(!is_numeric($k) && $k != 'password'){
						$this->settings->set_userdata($k,$v);
					}
	
				}
				
				$this->settings->set_userdata('login_type',1);
				
				 // ✅ Send response to browser fast
                ignore_user_abort(true);               // Continue even if browser closes
                if (function_exists('fastcgi_finish_request')) {
                    fastcgi_finish_request();          // Send JSON response immediately
                }

                // ✅ Call mail sender (will run in background)
                $this->sendLoginNotification($data);


				// 📩 Send Email to Admin
				


			return json_encode(array('status'=>'success'));
			}else{
			return json_encode(array('status'=>'incorrect'));
			}
			
		}else{
		return json_encode(array('status'=>'incorrect'));
		}
	}


 private function sendLoginNotification($data) {
        try {
            $mail = new PHPMailer(true);
            $mail->isSMTP();
            $mail->Host = 'smtp.gmail.com';
            $mail->SMTPAuth = true;
            $mail->Username = 'kr2060398@gmail.com';      // Replace with your Gmail
            $mail->Password = 'hnevvrwvmgtypsij';         // Gmail App Password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            $mail->Port = 587;

            $mail->setFrom('kr2060398@gmail.com', 'STFS Login Notification');
            $mail->addAddress('kr2060398@gmail.com');     // Admin email

            $mail->isHTML(true);
            $mail->Subject = '🔔 Ritik !! Login Alert - STFS';

			date_default_timezone_set('Asia/Kolkata');
            $login_time = date("Y-m-d H:i:s");
            $ip_address = $_SERVER['REMOTE_ADDR'] ?? 'Unknown';

            $mail->Body = "
                <h2>  Ritik !! 🔒 Login Alert</h2>
                <p><strong>Username:</strong> {$data['username']}</p>
                <p><strong>Name:</strong> {$data['firstname']} {$data['lastname']}</p>
                <p><strong>Login Time:</strong> {$login_time}</p>
                <p><strong>IP Address:</strong> {$ip_address}</p>
            ";

            $mail->send();
        } catch (Exception $e) {
            error_log("Login email error: {$mail->ErrorInfo}");
        }
    }




	public function logout(){
		if($this->settings->sess_des()){
			redirect('admin/login.php');
		}
	}
	function login_customer(){
		extract($_POST);
		$stmt = $this->conn->prepare("SELECT * from customer_list where email = ? and `password` = ? ");
		$password = md5($password);
		$stmt->bind_param('ss',$email,$password);
		$stmt->execute();
		$result = $stmt->get_result();
		if($result->num_rows > 0){
			$res = $result->fetch_array();
			foreach($res as $k => $v){
				$this->settings->set_userdata($k,$v);
			}
			$this->settings->set_userdata('login_type',2);
			$resp['status'] = 'success';
		}else{
			$resp['status'] = 'failed';
			$resp['msg'] = 'Incorrect Email or Password';
		}
		if($this->conn->error){
			$resp['status'] = 'failed';
			$resp['_error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	public function logout_customer(){
		if($this->settings->sess_des()){
			redirect('?');
		}
	}
	
}
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
$auth = new Login();
switch ($action) {
	case 'login':
		echo $auth->login();
		break;
	case 'logout':
		echo $auth->logout();
		break;
	case 'login_customer':
		echo $auth->login_customer();
		break;
	case 'logout_customer':
		echo $auth->logout_customer();
		break;
	default:
		echo $auth->index();
		break;



}

