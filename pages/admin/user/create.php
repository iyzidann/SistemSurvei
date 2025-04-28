<?php
$db = new Database();
$conn = $db->conn;

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["username"]) && isset($_POST["password"]) && isset($_POST["role"])) {
        $username = $_POST["username"];
        $password = $_POST["password"];
        $role = $_POST["role"];

        $sql = "INSERT INTO m_user (username, password, role) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sss", $username, $password, $role);

        if ($stmt->execute()) {
            echo "<script>window.location.href = '?page=admin/user';</script>";
            exit();
        } else {
            $error = "Error: " . $stmt->error;
        }

        $stmt->close();
        $conn->close();
    } else {
        $error = "Please fill in all fields.";
    }
}
?>

<div class="modal fade" id="inputDataModal" tabindex="-1" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Input Data</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="#" method="POST">
                    <div class="form-group">
                        <label>Username</label>
                        <input type="text" name="username" class="form-control" placeholder="Masukkan Username"
                            required>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Masukkan Password"
                            required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Role</label>
                        <select name="role" class="form-select" required>
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
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
                <?php if (!empty($error)) echo "<div class='alert alert-danger'>$error</div>"; ?>
            </div>
        </div>
    </div>
</div>