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
        $role = 'industri';

        $nama = $_POST['nama'];
        $jabatan = $_POST['jabatan'];
        $perusahaan = $_POST['perusahaan'];
        $email = $_POST['email'];
        $hp = $_POST['hp'];
        $kota = $_POST['kota'];

        if (empty($username) || empty($password) || empty($nama) || empty($jabatan) || empty($perusahaan) || empty($email) || empty($hp) || empty($kota)) {
            $error = "Mohon isi semua data terlebih dahulu";
        } else {
            $sql = "INSERT INTO m_user (username, password, role) VALUES ('$username', '$password', '$role')";
            
            if ($db->conn->query($sql)) {
                $user_id = $db->conn->insert_id;

                $sql_industri = "INSERT INTO t_responden_industri (user_id, responden_nama, responden_jabatan, responden_perusahaan, responden_email, responden_hp, responden_kota, responden_tanggal) 
                VALUES ('$user_id', '$nama', '$jabatan', '$perusahaan', '$email', '$hp', '$kota', NOW())";
                
                if ($db->conn->query($sql_industri)) {
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
                <li class="breadcrumb-item active" aria-current="page">Industri</li>
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
                    <form action="?page=register-industri" method="POST">
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
                            <h6>Isi Data Industri</h6><hr>
                                <label class="form-label">Nama Lengkap</label>
                                <input type="text" name="nama" class="form-control" placeholder="Contoh: Muhammad Iyazuz Zidan">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Jabatan</label>
                                <input type="text" name="jabatan" class="form-control" placeholder="Contoh: Manager">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Perusahaan</label>
                                <input type="text" name="perusahaan" class="form-control" placeholder="Contoh: Pt. XXXXXXX">
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
                                <label class="form-label">Kota</label></label>
                                <input type="text" name="kota" class="form-control" placeholder="Contoh: Kota Malang">
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