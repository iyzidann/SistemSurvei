<?php

require_once __DIR__ . '/../config/database.php';

class SAW {
    protected $table = 'm_kategori';
    private $db;

    public function __construct() {
        $this->db = new Database();
    }

    public function getData() {
        $conn = $this->db->conn;
        $sql = "SELECT kategori_id, kategori_nama FROM {$this->table}";
        $result = $conn->query($sql);

        $dataList = [];
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $dataList[] = $row;
            }
        }
        return $dataList;
    }

    public function getBobotData() {
        $conn = $this->db->conn;
        $sql = "SELECT kriteria, bobot, atribut FROM bobot";
        $result = $conn->query($sql);

        $dataList = [];
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $dataList[] = $row;
            }
        }
        return $dataList;
    }
}
?>
