<?php

require_once __DIR__ . '/../../config/config.php';
require_once __DIR__ . '/../services/contactMailer.php';

class contactModel
{
    private PDO $connect;
    private Mailer $mailer;

    public function __construct()
    {
        $db = new connectionDB();
        $this->connect = $db->getConnection();
        $this->mailer = new Mailer();
    }

    public function sendContactInfo(): bool
    {
        $name = trim($_POST['name'] ?? '');
        $email = trim($_POST['email'] ?? '');
        $phone = trim($_POST['phone'] ?? '');
        $subject = trim($_POST['subject'] ?? '');
        $message = trim($_POST['message'] ?? '');

        if (
            empty($name) ||
            empty($email) ||
            empty($phone) ||
            empty($subject) ||
            empty($message)
        ) {
            return false;
        }

        if (!preg_match('/^[^\s@]+@[^\s@]+\.[^\s@]+$/', $email)) {
            return false;
        }

        $sqlstate = $this->connect->prepare(
            "INSERT INTO contact
            (name, email, phone, subject, message)
            VALUES (?, ?, ?, ?, ?)"
        );

        $saved = $sqlstate->execute([
            $name,
            $email,
            $phone,
            $subject,
            $message
        ]);

        if (!$saved) {
            return false;
        }

        $emailSent = $this->mailer->sendContactEmail(
            $name,
            $email,
            $phone,
            $subject,
            $message
        );
        return $emailSent;
    }
}
