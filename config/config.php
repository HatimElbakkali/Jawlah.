<?php

require_once __DIR__ . '/../vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../');
$dotenv->load();

class MailConfig
{
    public static function get(string $key): mixed
    {
        return $_ENV[$key] ?? null;
    }
}

class connectionDB
{
    private string $host;
    private string $dbName;
    private string $name;
    private string $password;
    private PDO $connect;

    public function __construct()
    {
        $this->host = $_ENV['DB_HOST'];
        $this->dbName = $_ENV['DB_NAME'];
        $this->name = $_ENV['DB_USER'];
        $this->password = $_ENV['DB_PASSWORD'];

        try {
            $this->connect = new PDO(
                "mysql:host={$this->host};dbname={$this->dbName};charset=utf8mb4",
                $this->name,
                $this->password
            );

            $this->connect->setAttribute(
                PDO::ATTR_ERRMODE,
                PDO::ERRMODE_EXCEPTION
            );

        } catch (PDOException $e) {
            die("DataBase connection failed: " . $e->getMessage());
        }
    }

    public function getConnection(): PDO
    {
        return $this->connect;
    }
}