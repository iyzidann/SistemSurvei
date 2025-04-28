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
        $role = 'orangtua';

        $nama = $_POST['nama'];
        $jk = $_POST['jk'];
        $umur = $_POST['umur'];
        $hp = $_POST['hp'];
        $pendidikan = $_POST['pendidikan'];
        $pekerjaan = $_POST['pekerjaan'];
        $penghasilan = $_POST['penghasilan'];
        $nim = $_POST['nim'];
        $namaMhs = $_POST['namaMhs'];
        $prodi = $_POST['prodi'];


        if (empty($username)) {
            $error = "Mohon isi semua data terlebih dahulu";
        } else {
            $sql = "INSERT INTO m_user (username, password, role) VALUES ('$username', '$password', '$role')";
            
            if ($db->conn->query($sql)) {
                $user_id = $db->conn->insert_id;

                $sql_ortu = "INSERT INTO t_responden_ortu (user_id, responden_nama, responden_jk, responden_umur, responden_hp, responden_pendidikan, responden_pekerjaan, responden_penghasilan, mahasiswa_nim, mahasiswa_nama, mahasiswa_prodi, responden_tanggal) 
                VALUES ('$user_id', '$nama', '$jk', '$umur', '$hp', '$pendidikan', '$pekerjaan', '$penghasilan', '$nim', '$namaMhs', '$prodi', NOW())";
                
                if ($db->conn->query($sql_ortu)) {
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
                <li class="breadcrumb-item active" aria-current="page">Orang Tua</li>
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
                    <form action="?page=register-ortu" method="POST">
                        <div class="d-flex flex-column gap-3">
                            <div class="form-group">
                                <label class="form-label">Username</label>
                                <input type="text" name="username" class="form-control" placeholder="Contoh: iyzidann" required>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Kata Sandi</label>
                                <input type="password" name="password" class="form-control" placeholder="Kata Sandi" required>
                            </div>
                            <div class="form-group">
                            <br>
                            <h6>Isi Data Orang Tua</h6><hr>
                                <label class="form-label">Nama Lengkap</label>
                                <input type="text" name="nama" class="form-control" placeholder="Contoh: Muhammad Iyazuz Zidan" required>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Jenis Kelamin</label>
                                <select name="jk" class="form-select" required>
                                    <option value="L">Laki-laki</option>
                                    <option value="P">Perempuan</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Umur</label>
                                <input type="text" name="umur" class="form-control" placeholder="Contoh: 20">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Nomor Handphone</label>
                                <input type="text" name="hp" class="form-control" placeholder="Contoh: 0812000000">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Pendidikan</label>
                                <input type="text" name="pendidikan" class="form-control" placeholder="Contoh: D3">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Pekerjaan</label>
                                <input type="text" name="pekerjaan" class="form-control" placeholder="Contoh: PNS">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Penghasilan</label>
                                <input type="text" name="penghasilan" class="form-control" placeholder="Contoh: Rp. 1.000.000">
                            </div>
                            <div class="form-group">
                                <label class="form-label">NIM Mahasiswa</label>
                                <input type="text" name="nim" class="form-control" placeholder="Contoh: 224176XXXX">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Nama Mahasiswa</label></label>
                                <input type="text" name="namaMhs" class="form-control" placeholder="Contoh: Muhammad Iyazuz Zidan">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Prodi Mahasiswa</label>
                                <input type="text" name="prodi" class="form-control" placeholder="Contoh: D4 Sistem Informasi Bisnis">
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