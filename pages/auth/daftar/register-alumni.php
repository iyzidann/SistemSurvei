<?php
    include "config/database.php";

    $db = new Database();

    if(isset($_SESSION["is_login"])) {
        header("location: ?page=survey");
    }
    
    $error = "";
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $role = 'alumni';

        $nama = $_POST['nama'];
        $nim = $_POST['nim'];
        $prodi = $_POST['prodi'];
        $email = $_POST['email'];
        $hp = $_POST['hp'];
        $tahun_lulus = $_POST['tahun'];

        if (empty($username) || empty($password) || empty($nama) || empty($nim) || empty($prodi) || empty($email) || empty($hp) || empty($tahun_lulus)) {
            $error = "Mohon isi semua data terlebih dahulu";
        } else {
            $sql = "INSERT INTO m_user (username, password, role) VALUES ('$username', '$password', '$role')";
            
            if ($db->conn->query($sql)) {
                $user_id = $db->conn->insert_id;

                $sql_alumni = "INSERT INTO t_responden_alumni (user_id, responden_nim, responden_nama, responden_prodi, responden_email, responden_hp, tahun_lulus, responden_tanggal) 
                VALUES ('$user_id', '$nim', '$nama', '$prodi', '$email', '$hp', '$tahun_lulus', NOW())";
                
                if ($db->conn->query($sql_alumni)) {
                    echo "<script>alert('Berhasil, Silahkan Masuk');</script>";
                } else {
                    $error = "Gagal, Silahkan Ulangi";
                }
            } else {
                $error = "Gagal, Silahkan Ulangi";
            }
        }
    }
?>  

<section class="bg-primary-2">
    <div class="container-fluid py-4">
        <h1 class="text-heading-xl font-lato fw-bolder">DAFTAR</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="index.php">Beranda</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="?page=masuk">Daftar</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Alumni</li>
            </ol>
        </nav>
    </div>
</section>
<section class="bg-primary-1">
    <div class="container py-5">
        <div class="card w-50 d-block mx-auto">
            <div class="card-body p-5">
                <div class="d-flex flex-column gap-5">
                    <div class="d-flex align-items-center gap-3">
                        <img src="./assets/img/logo-polinema.png" alt="Logo" width="64" height="64">
                        <h1 class="text-heading-lg font-poppins my-0">Silahkan Melakukan Daftar Akun Survei Kepuasan Pelanggan Polinema</h1>
                    </div>
                    <form action="?page=register-alumni" method="POST">
                        <div class="d-flex flex-column gap-3">
                            <div class="form-group">
                                <label class="form-label">Username</label>
                                <input type="text" name="username" class="form-control" placeholder="Contoh: iyzidann">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Kata Sandi</label>
                                <input type="password" name="password" class="form-control" placeholder="Kata Sandi">
                            </div>
                            <div class="form-group">
                            <br>
                            <h6>Isi Data Alumni</h6><hr>
                                <label class="form-label">Nama Lengkap</label>
                                <input type="text" name="nama" class="form-control" placeholder="Contoh: Muhammad Iyazuz Zidan">
                            </div>
                            <div class="form-group">
                                <label class="form-label">NIM</label>
                                <input type="text" name="nim" class="form-control" placeholder="Contoh: 123456765">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Prodi</label>
                                <input type="text" name="prodi" class="form-control" placeholder="Contoh: D4 Sistem Informasi Bisnis">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Email</label>
                                <input type="email" name="email" class="form-control" placeholder="Contoh: iyazuzzidan@gmail.com">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Nomor Handphone</label>
                                <input type="text" name="hp" class="form-control" placeholder="Contoh: 0812000000">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Tahun Lulus</label></label>
                                <input type="text" name="tahun" class="form-control" placeholder="Contoh: 2022">
                            </div>
                            <div class="form-group">
                            <div class="d-flex flex-column gap-3 mt-3">
                                <button type="submit" name="register" class="btn btn-sm btn-primary">Daftar</button>
                                <p class="text-center">
                                    Sudah punya akun?
                                    <a href="?page=login" class="text-primary-1">Masuk sekarang</a>
                                </p>
                                <?php if (!empty($error)) { ?>
                                    <div class="alert alert-danger"><?php echo $error; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>