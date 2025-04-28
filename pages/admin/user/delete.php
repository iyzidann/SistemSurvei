<?php
$db = new Database();
$conn = $db->conn;

$deleteError = "";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["delete_user"])) {
    if (isset($_POST["delete_user_id"])) {
        $id = $_POST["delete_user_id"];

        $sql = "DELETE FROM m_user WHERE user_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $id);

        if ($stmt->execute()) {
            echo "<script>window.location.href = '?page=admin/user';</script>";
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

<div class="modal fade" id="deleteDataModal" tabindex="-1" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Hapus Data Uer</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Apakah anda yakin menghapus data ini?</p>
                <form action="#" method="POST">
                    <input type="hidden" name="delete_user_id" id="deleteUserId">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tidak</button>
                        <button type="submit" name="delete_user" class="btn btn-danger">Iya, Hapus</button>
                    </div>
                </form>
                <?php if (!empty($deleteError)) echo "<div class='alert alert-danger'>$deleteError</div>"; ?>
            </div>
        </div>
    </div>
</div>

<script>
function openDeleteModal(userId) {
    document.getElementById('deleteUserId').value = userId;
    var deleteModal = new bootstrap.Modal(document.getElementById('deleteDataModal'));
    deleteModal.show();
}
</script>