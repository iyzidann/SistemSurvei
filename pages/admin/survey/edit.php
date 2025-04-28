<?php
$db = new Database();
$conn = $db->conn;

$updateError = "";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["update_survey"])) {
    if (isset($_POST["soal_id"]) && isset($_POST["kategori"]) && isset($_POST["jenis"]) && isset($_POST["no_urut"]) && isset($_POST["soal"]) && isset($_POST["kriteria"])) {
        $soal_id = $_POST["soal_id"];
        $kategori = $_POST["kategori"];
        $jenis = $_POST["jenis"];
        $no_urut = $_POST["no_urut"];
        $soal = $_POST["soal"];
        $kriteria = $_POST["kriteria"];

        $sql = "UPDATE m_survey_soal SET kategori_id = ?, soal_jenis = ?, no_urut = ?, soal_nama = ?, kriteria = ? WHERE soal_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sssssi", $kategori, $jenis, $no_urut, $soal, $kriteria, $soal_id);

        if ($stmt->execute()) {
            echo "<script>window.location.href = '?page=admin/survey';</script>";
            exit();
        } else {
            $updateError = "Error: " . $stmt->error;
        }

        $stmt->close();
        $conn->close();
    } else {
        $updateError = "Please fill in all fields.";
    }
}
?>

<div class="modal fade" id="updateDataModal" tabindex="-1" aria-labelledby="updateModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update Data Survei</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="#" method="POST">
                    <input type="hidden" name="soal_id" id="updateSoalId">
                    <div class="form-group">
                        <label>Kategori Survey</label>
                        <select name="kategori" id="updateKategori" class="form-select" required>
                            <option value="1">Kualitas Pendidikan</option>
                            <option value="2">Fasilitas</option>
                            <option value="3">Pelayanan</option>
                            <option value="4">Lulusan</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Jenis Survey</label>
                        <select name="jenis" id="updateJenis" class="form-select" required>
                            <option value="alumni">Alumni</option>
                            <option value="dosen">Dosen</option>
                            <option value="industri">Industri</option>
                            <option value="mahasiswa">Mahasiswa</option>
                            <option value="ortu">Orang Tua</option>
                            <option value="tendik">Tendik</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Nomor Urut</label>
                        <input type="text" name="no_urut" id="updateNoUrut" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Soal</label>
                        <textarea name="soal" id="updateSoal" class="form-control" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Kriteria Survey</label>
                        <select name="kriteria" id="updateKriteria" class="form-select" required>
                            <option value="Tangibles">Tangibles</option>
                            <option value="Reliability">Reliability</option>
                            <option value="Responsiveness">Responsiveness</option>
                            <option value="Assurance">Assurance</option>
                            <option value="Empathy">Empathy</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" name="update_survey" class="btn btn-primary">Update</button>
                    </div>
                </form>
                <?php if (!empty($updateError)) echo "<div class='alert alert-danger'>$updateError</div>"; ?>
            </div>
        </div>
    </div>
</div>

<script>
function openUpdateSurveyModal(soalId, kategoriId, jenis, noUrut, soal, kriteria) {
    document.getElementById('updateSoalId').value = soalId;
    document.getElementById('updateKategori').value = kategoriId;
    document.getElementById('updateJenis').value = jenis;
    document.getElementById('updateNoUrut').value = noUrut;
    document.getElementById('updateSoal').value = soal;
    document.getElementById('updateKriteria').value = kriteria;

    var updateModal = new bootstrap.Modal(document.getElementById('updateDataModal'));
    updateModal.show();
}
</script>