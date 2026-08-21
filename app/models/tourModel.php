<?php
require_once __DIR__ . '/../../config/config.php';

class tourModel
{
    private PDO $connect;

    public function __construct()
    {
        $db = new connectionDB();
        $this->connect = $db->getConnection();
    }

    public function getDesertActivity(): array
    {
        $stmt = $this->connect->query("SELECT * FROM desert_activity WHERE status = 'available' ORDER BY created_at ASC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getDesertActivitiesPack(): array
    {
        $stmt = $this->connect->query("SELECT * FROM desert_activities_pack WHERE status = 'available' ORDER BY created_at ASC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
