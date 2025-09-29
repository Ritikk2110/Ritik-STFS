<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once(__DIR__.'/../PHPMailer-master/src/Exception.php');
require_once(__DIR__.'/../PHPMailer-master/src/PHPMailer.php');
require_once(__DIR__.'/../PHPMailer-master/src/SMTP.php');

function send_inquiry_mail($postData) {
    // 1. Email to Admin
    $mail = new PHPMailer(true);

    try {
        // SMTP Configuration
        $mail->isSMTP();
        $mail->Host       = 'smtp.gmail.com';
        $mail->SMTPAuth   = true;
        $mail->Username   = 'kr2060398@gmail.com';
        $mail->Password   = 'hnevvrwvmgtypsij';
        $mail->SMTPSecure = 'tls';
        $mail->Port       = 587;

        // Admin Mail
        $mail->setFrom('kr2060398@gmail.com', 'Ritik-STFS Website');
        $mail->addAddress('kr2060398@gmail.com', 'Admin');
         $mail->addReplyTo($postData['email'], $postData['name'] ?? '');

        // Embedded Logo
        $mail->AddEmbeddedImage(__DIR__.'/../assets/img/My_Logo.png', 'logoimg');

        // Content for Admin
        $mail->isHTML(true);
        $mail->Subject = 'New Inquiry Received';

        $body = '<img src="cid:logoimg" width="100" alt="Ritik-STFS Logo"><br>';
        $body .= "<h3>New Inquiry Details</h3><ul>";
        foreach($postData as $key => $value){
            $body .= "<li><strong>".ucfirst($key).":</strong> ".htmlspecialchars($value)."</li>";
        }
        $body .= "</ul>";
        $mail->Body = $body;

        $mail->send();  // Send to admin

    
    // 2. Auto-Reply to User
   // =========================
        // Now send auto-reply email
        // =========================

        $autoReply = new PHPMailer(true);
        $autoReply->isSMTP();
        $autoReply->Host       = 'smtp.gmail.com';
        $autoReply->SMTPAuth   = true;
        $autoReply->Username   = 'kr2060398@gmail.com';
        $autoReply->Password   = 'hnevvrwvmgtypsij';
        $autoReply->SMTPSecure = 'tls';
        $autoReply->Port       = 587;

        $autoReply->setFrom('kr2060398@gmail.com', 'Ritik-STFS Website');
        $autoReply->addAddress($postData['email'], $postData['name'] ?? '');
$autoReply->AddEmbeddedImage(__DIR__.'/../assets/img/My_Logo.png', 'logoimg');

        $autoReply->Subject = 'Thank you, ' . htmlspecialchars($postData['fullname'] ?? 'User') . ', for contacting us';

$autoReply->Body = "
    <p>Dear " . htmlspecialchars($postData['fullname'] ?? 'User') . ",</p>
    <p>Thank you  for reaching out to Ritik. I have received your inquiry and will respond shortly.</p>
    <p>Regards,<br><strong>Ritik-STFS</strong></p>
";


        $autoReply->send();

        return true;

    } catch (Exception $e) {
        error_log("Mailer Error: {$mail->ErrorInfo}");
        return false;
    }
}
