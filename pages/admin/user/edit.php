<?php
$db = new Database();
$conn = $db->conn;

$updateError = "";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["update_user"])) {
    if (isset($_POST["user_id"]) && isset($_POST["update_username"]) && isset($_POST["update_password"]) && isset($_POST["update_role"])) {
        $id = $_POST["user_id"];
        $username = $_POST["update_username"];
        $password = $_POST["update_password"];
        $role = $_POST["update_role"];

        $sql = "UPDATE m_user SET username = ?, password = ?, role = ? WHERE user_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sssi", $username, $password, $role, $id);

        if ($stmt->execute()) {
            echo "<script>window.location.href = '?page=admin/user';</script>";
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

<div class="modal fade" id="updateDataModal" tabindex="-1" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update Data</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="#" method="POST">
                    <input type="hidden" name="user_id" id="updateUserId">
                    <div class="form-group">
                        <label>Username</label>
                        <input type="text" name="update_username" id="updateUsername" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="update_password" id="updatePassword" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Role</label>
                        <select name="update_role" id="updateRole" class="form-select" required>
                            <option value="alumni">Alumni</option>
                            <option value="dosen">Dosen</option>
                            <option value="industri">Industri</option>
                            <option value="mahasiswa">Mahasiswa</option>
                            <option value="ortu">Orang Tua</option>
                            <option value="tendik">Tendik</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" name="update_user" class="btn btn-primary">Update</button>
                    </div>
                </form>
                <?php if (!empty($updateError)) echo "<div class='alert alert-danger'>$updateError</div>"; ?>
            </div>
        </div>
    </div>
</div>


<script>
function openUpdateModal(userId, username, password, role) {
    document.getElementById('updateUserId').value = userId;
    document.getElementById('updateUsername').value = username;
    document.getElementById('updatePassword').value = password;
    document.getElementById('updateRole').value = role;
    var updateModal = new bootstrap.Modal(document.getElementById('updateDataModal'));
    updateModal.show();
}
</script>