<?php
require_once __DIR__.("/../config/database.php");

class Crud {
    private $db;

    public function __construct() {
        $this->db = new Database();
    }

    public function readSoal($kategori_id, $soal_jenis){
        $conn =  $this->db->conn;
        $sql = "select * from m_survey_soal WHERE kategori_id = '$kategori_id' AND soal_jenis = '$soal_jenis'";
        $result = $conn->query($sql);
        
        $soalList = [];
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $soalList[] = $row;
            }
        }
        return $soalList;
    }

    public function showSurveyHistory() {
        // Dapatkan informasi pengguna yang sedang login
        if(isset($_SESSION['username'])) {
            $username = $_SESSION['username'];

            $query_user = "SELECT user_id, role FROM m_user WHERE username = ?";
            $stmt_user = $this->db->conn->prepare($query_user);
            $stmt_user->bind_param("s", $username);
            $stmt_user->execute();
            $result_user = $stmt_user->get_result();
            $user = $result_user->fetch_assoc();
            $user_id = $user['user_id'];
            $role = $user['role'];

            // Tentukan kategori survei yang sesuai dengan peran pengguna
            switch ($role) {
                case 'mahasiswa':
                    $kategori_ids = '1, 2, 3';
                    break;
                case 'dosen':
                    $kategori_ids = '2, 3';
                    break;
                case 'tendik':
                    $kategori_ids = '2, 3';
                    break;
                case 'industri':
                    $kategori_ids = '2, 3, 4';
                    break;
                case 'alumni':
                    $kategori_ids = '1, 2, 3, 4';
                    break;
                case 'orangtua':
                    $kategori_ids = '2, 3, 4';
                    break;
                default:
                    $kategori_ids = '';
            }

            // Ambil data riwayat survey berdasarkan kategori survei yang sesuai dengan peran pengguna
            if (!empty($kategori_ids)) {
                $query = "SELECT
                    m_survey.survey_id,
                    m_kategori.kategori_nama AS kategori_survey,
                    COALESCE(m_survey.survey_tanggal, '-') AS tanggal,
                    CASE
                        WHEN m_survey.soal_id IS NOT NULL THEN 'Terisi'
                        ELSE 'Belum'
                    END AS aksi
                FROM
                    m_kategori
                LEFT JOIN
                    m_survey ON m_kategori.kategori_id = m_survey.kategori_id AND m_survey.user_id = ?
                WHERE
                    m_kategori.kategori_id IN ($kategori_ids)
                ORDER BY
                    m_survey.survey_tanggal DESC";

                $stmt = $this->db->conn->prepare($query);
                $stmt->bind_param("i", $user_id);
                $stmt->execute();
                $result = $stmt->get_result();

                return $result;
            } else {
                // Kategori survei tidak tersedia untuk peran pengguna yang sedang login
                return null;
            }
        }
    }

    // alumni
    public function takeDataAlumni($username) {
        $conn = $this->db->conn;
        $stmt = $conn->prepare("SELECT responden_alumni_id, username, role
        FROM m_user
        INNER JOIN t_responden_alumni ON m_user.user_id = t_responden_alumni.user_id WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->bind_result($responden_id, $username, $role);
        $stmt->fetch();
        return array('responden_id' => $responden_id, 'username' => $username, 'role' => $role);
    }

    public function inputJawabanAlumni($responden_alumni_id,$soal_id,$jawaban){
        $conn = $this->db->conn;
        $stmt = $conn->prepare("INSERT INTO t_jawaban_alumni (responden_alumni_id, soal_id, jawaban) VALUES ( ?, ?, ?)");
        $stmt->bind_param("iii", $responden_alumni_id, $soal_id, $jawaban);
        $stmt->execute();
        $stmt->close();
    }

    // dosen
    public function takeDataDosen($username) {
        $conn = $this->db->conn;
        $stmt = $conn->prepare("SELECT responden_dosen_id, username, role
        FROM m_user
        INNER JOIN t_responden_dosen ON m_user.user_id = t_responden_dosen.user_id WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->bind_result($responden_id, $username, $role);
        $stmt->fetch();
        return array('responden_id' => $responden_id, 'username' => $username, 'role' => $role);
    }

    public function inputJawabanDosen($responden_dosen_id,$soal_id,$jawaban){
        $conn = $this->db->conn;
        $stmt = $conn->prepare("INSERT INTO t_jawaban_dosen (responden_dosen_id, soal_id, jawaban) VALUES ( ?, ?, ?)");
        $stmt->bind_param("iii", $responden_dosen_id, $soal_id, $jawaban);
        $stmt->execute();
        $stmt->close();
    }

    // industri
    public function takeDataIndustri($username) {
        $conn = $this->db->conn;
        $stmt = $conn->prepare("SELECT responden_industri_id, username, role
        FROM m_user
        INNER JOIN t_responden_industri ON m_user.user_id = t_responden_industri.user_id WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->bind_result($responden_id, $username, $role);
        $stmt->fetch();
        return array('responden_id' => $responden_id, 'username' => $username, 'role' => $role);
    }

    public function inputJawabanIndustri($responden_industri_id,$soal_id,$jawaban){
        $conn = $this->db->conn;
        $stmt = $conn->prepare("INSERT INTO t_jawaban_industri (responden_industri_id, soal_id, jawaban) VALUES ( ?, ?, ?)");
        $stmt->bind_param("iii", $responden_industri_id, $soal_id, $jawaban);
        $stmt->execute();
        $stmt->close();
    }

    // mahasiswa
    public function takeDataMahasiswa($username) {
        $conn = $this->db->conn;
        $stmt = $conn->prepare("SELECT responden_mahasiswa_id, username, role
        FROM m_user
        INNER JOIN t_responden_mahasiswa ON m_user.user_id = t_responden_mahasiswa.user_id WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->bind_result($responden_id, $username, $role);
        $stmt->fetch();
        return array('responden_id' => $responden_id, 'username' => $username, 'role' => $role);
    }

    public function inputJawabanMahasiswa($responden_mahasiswa_id,$soal_id,$jawaban){
        $conn = $this->db->conn;
        $stmt = $conn->prepare("INSERT INTO t_jawaban_mahasiswa (responden_mahasiswa_id, soal_id, jawaban) VALUES ( ?, ?, ?)");
        $stmt->bind_param("iii", $responden_mahasiswa_id, $soal_id, $jawaban);
        $stmt->execute();
        $stmt->close();
    }

    // ortu
    public function takeDataOrtu($username) {
        $conn = $this->db->conn;
        $stmt = $conn->prepare("SELECT responden_ortu_id, username, role
        FROM m_user
        INNER JOIN t_responden_ortu ON m_user.user_id = t_responden_ortu.user_id WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->bind_result($responden_id, $username, $role);
        $stmt->fetch();
        return array('responden_id' => $responden_id, 'username' => $username, 'role' => $role);
    }

    public function inputJawabanOrtu($responden_ortu_id,$soal_id,$jawaban){
        $conn = $this->db->conn;
        $stmt = $conn->prepare("INSERT INTO t_jawaban_ortu (responden_ortu_id, soal_id, jawaban) VALUES ( ?, ?, ?)");
        $stmt->bind_param("iii", $responden_ortu_id, $soal_id, $jawaban);
        $stmt->execute();
        $stmt->close();
    }

    // tendik
    public function takeDataTendik($username) {
        $conn = $this->db->conn;
        $stmt = $conn->prepare("SELECT responden_tendik_id, username, role
        FROM m_user
        INNER JOIN t_responden_tendik ON m_user.user_id = t_responden_tendik.user_id WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->bind_result($responden_id, $username, $role);
        $stmt->fetch();
        return array('responden_id' => $responden_id, 'username' => $username, 'role' => $role);
    }

    public function inputJawabanTendik($responden_tendik_id,$soal_id,$jawaban){
        $conn = $this->db->conn;
        $stmt = $conn->prepare("INSERT INTO t_jawaban_tendik (responden_tendik_id, soal_id, jawaban) VALUES ( ?, ?, ?)");
        $stmt->bind_param("iii", $responden_tendik_id, $soal_id, $jawaban);
        $stmt->execute();
        $stmt->close();
    }
}
?>