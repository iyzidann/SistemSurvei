<?php
$db = new Database();
$conn = $db->conn;

$deleteError = "";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["delete_survey"])) {
    if (isset($_POST["delete_soal_id"])) {
        $soal_id = $_POST["delete_soal_id"];

        $sql = "DELETE FROM m_survey_soal WHERE soal_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $soal_id);

        if ($stmt->execute()) {
            echo "<script>window.location.href = '?page=admin/survey';</script>";
            exit();
        } else {
            $deleteError = "Error: " . $stmt->error;
        }

        $stmt->close();
        $conn->close();
    } else {
        $deleteError = "Invalid request.";
    }
}
?>

<div class="modal fade" id="deleteDataModal" tabindex="-1" aria-labelledby="deleteModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Hapus Data Survei</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Apakah anda yakin menghapus data ini?</p>
                <form action="#" method="POST">
                    <input type="hidden" name="delete_soal_id" id="deleteSoalId">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tidak</button>
                        <button type="submit" name="delete_survey" class="btn btn-danger">Iya, Hapus</button>
                    </div>
                </form>
                <?php if (!empty($deleteError)) echo "<div class='alert alert-danger'>$deleteError</div>"; ?>
            </div>
        </div>
    </div>
</div>


<script>
function openDeleteSurveyModal(soalId) {
    document.getElementById('deleteSoalId').value = soalId;

    var deleteModal = new bootstrap.Modal(document.getElementById('deleteDataModal'));
    deleteModal.show();
}
</script>