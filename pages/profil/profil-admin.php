<?php
// Periksa apakah pengguna sudah login
if (!isset($_SESSION['username'])) {
    // Jika tidak ada sesi username, arahkan pengguna ke halaman login atau lakukan tindakan lain yang sesuai
    header("Location: login.php");
    exit();
}

// Sambungkan ke database
include "config/database.php";

$db = new Database;

// Ambil username dari sesi
$username = $_SESSION['username'];
$role = $_SESSION['role'];

// Query SQL untuk mengambil data pengguna yang sedang login
$sql = "SELECT * FROM m_user WHERE username = '$username' AND role = '$role'";

// Eksekusi query
$result = $db->conn->query($sql);

// Periksa apakah data ditemukan
if ($result->num_rows > 0) {
    // Ambil data dari setiap baris hasil
    $row = $result->fetch_assoc();
    $username = $row["username"];
    $role = $row["role"];
} else {
    // Jika data tidak ditemukan, atur nilai default atau tindakan lain yang sesuai
    $username = "Username";
    $role = "role";
}

// Tombol Logout
if(isset($_POST['logout'])){
    session_unset();
    session_destroy();

    header("location: ?page=beranda");
    exit();
}
?>

<div class="wrapper">
<?php include('./components/sidebar.php') ?>
    <div class="main my-3 p-5 bg-body rounded shadow-sm">
        <main class="content px-4 py-5">
            <div class="container-fluid">
                <div class="mb-3">
                    <h5 class="fw-bold fs-4 mb-3 text-center">Profil</h5>
                    <div class="card text-bg-light d-block mx-auto" style="width: 50vw;">
                        <div class="card-header bg-primary-2">
                            <h1 class="text-heading-lg font-poppins my-2">Data Pengguna</h1>
                        </div>
                        <div class="card-body">
                            <div class="d-flex flex-column">
                                <div class="p-3 border-bottom">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <p class="text-body-md font-poppins my-0">Username</p>
                                        <p class="text-heading-md font-poppins my-0"><?php echo $username;?></p>
                                    </div>
                                </div>
                                <div class="p-3 border-bottom">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <p class="text-body-md font-poppins my-0">Role</p>
                                        <p class="text-heading-md font-poppins my-0"><?php echo $role;?></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
        </main>
    </div>
</div>