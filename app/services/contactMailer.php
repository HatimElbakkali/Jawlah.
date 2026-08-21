<?php

use PHPMailer\PHPMailer\PHPMailer;

require_once __DIR__ . '/../../config/config.php';

class contactMailer
{
    public function sendContactEmail(
        string $name,
        string $email,
        string $phone,
        string $subject,
        string $message
    ): bool {
        $mail = new PHPMailer(true);

        try {
            $mail->isSMTP();

            $mail->Host = MailConfig::get('SMTP_HOST');

            $mail->SMTPAuth = filter_var(
                MailConfig::get('SMTP_AUTH'),
                FILTER_VALIDATE_BOOLEAN
            );

            $mail->Username = MailConfig::get('SMTP_USER');

            $mail->Password = preg_replace(
                '/\s+/',
                '',
                MailConfig::get('SMTP_PASS')
            );

            $mail->SMTPSecure =
                MailConfig::get('SMTP_SECURE') === 'ssl'
                    ? PHPMailer::ENCRYPTION_SMTPS
                    : PHPMailer::ENCRYPTION_STARTTLS;

            $mail->Port = (int) MailConfig::get('SMTP_PORT');

            $mail->CharSet = 'UTF-8';

            $mail->SMTPOptions = [
                'ssl' => [
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                ]
            ];

            $mail->setFrom(
                MailConfig::get('FROM_EMAIL'),
                MailConfig::get('FROM_NAME')
            );

            $mail->addAddress(
                MailConfig::get('FROM_EMAIL')
            );

            $mail->addReplyTo($email, $name);

            $mail->isHTML(true);
            $mail->Subject = $subject;

            $mail->Body = "
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>New Contact Message - JAWLAH</title>
</head>
<body style='margin:0; padding:0; background-color:#b2ae8a; font-family:Arial, Helvetica, sans-serif;'>
    <div style='width:100%; padding:40px 0; border-radius: 12px;'>
        <div style='max-width:650px; margin:0 auto; background:#fff;'>
            <div style='background:#231709; padding:30px 35px; text-align:center;'>
                <h1 style='margin:0; color:#9e8a45; font-size:30px; letter-spacing:2px;'>
                    JAWLAH
                </h1>
                <p style='margin:8px 0 0; color:#fff; font-size:13px;'>
                    New Contact Message
                </p>
            </div>

            <div style='padding:35px;'>
                <h2 style='margin:0 0 10px; color:#000; font-size:22px;'>
                    New Customer Inquiry
                </h2>

                <p style='margin:0 0 30px; color:#555; font-size:14px; line-height:1.6;'>
                    A new message has been submitted through the JAWLAH contact form.
                </p>

                <div style='border:1px solid #ddd; margin-bottom:25px;'>
                    <div style='background:#f5f5f5; padding:14px 18px; border-bottom:1px solid #ddd;'>
                        <strong style='color:#000; font-size:15px;'>
                            Customer Information
                        </strong>
                    </div>

                    <div style='padding:20px;'>
                        <p style='margin:0 0 14px; color:#000;'>
                            <strong>Name:</strong>
                            <span style='color:#555;'>{$name}</span>
                        </p>

                        <p style='margin:0 0 14px; color:#000;'>
                            <strong>Email:</strong>
                            <span style='color:#555;'>{$email}</span>
                        </p>

                        <p style='margin:0; color:#000;'>
                            <strong>Phone:</strong>
                            <span style='color:#555;'>{$phone}</span>
                        </p>
                    </div>
                </div>

                <div style='margin-bottom:25px;'>
                    <p style='margin:0 0 8px; color:#000; font-weight:bold;'>
                        Subject
                    </p>

                    <div style='padding:15px; border-left:4px solid #9e8a45; background:#f8f8f8; color:#000;'>
                        {$subject}
                    </div>
                </div>

                <div>
                    <p style='margin:0 0 8px; color:#000; font-weight:bold;'>
                        Message
                    </p>

                    <div style='padding:20px; background:#f8f8f8; border-left:4px solid #9e8a45; color:#333; line-height:1.7;'>
                        " . nl2br(htmlspecialchars($message, ENT_QUOTES, 'UTF-8')) . "
                    </div>
                </div>
            </div>

            <div style='background:#231709; padding:25px 35px; text-align:center;'>
                <p style='margin:0 0 8px; color:#9e8a45; font-size:14px; font-weight:bold;'>
                    JAWLAH
                </p>

                <p style='margin:0; color:#fff; opacity:0.7; font-size:11px;'>
                    This message was sent through the JAWLAH contact form.
                </p>

                <p style='margin:8px 0 0; color:#fff; opacity:0.5; font-size:11px;'>
                    &copy; " . date('Y') . " JAWLAH. All rights reserved.
                </p>
            </div>
        </div>
    </div>
</body>
</html>
";

            $mail->AltBody = "
JAWLAH - New Contact Message

Name: {$name}
Email: {$email}
Phone: {$phone}
Subject: {$subject}

Message:
{$message}
";

            return $mail->send();

        } catch (\Throwable $e) {
            error_log(
                "PHPMailer Contact Error: "
                . $mail->ErrorInfo
                . " | "
                . $e->getMessage()
            );

            return false;
        }
    }
}

class Mailer extends contactMailer
{
}