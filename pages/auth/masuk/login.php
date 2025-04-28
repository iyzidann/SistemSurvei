<?php
    include "config/database.php";

    if(isset($_SESSION["is_login"])) {
        header("location: ?page=survey");
    }

    if(isset($_POST['login'])) {
        $db = new Database();
        $conn = $db ->conn;
        $username = $_POST["username"];
        $password = $_POST["password"];

        $sql = "SELECT * FROM m_user WHERE username=? AND password=?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $username, $password);
        $stmt->execute();
        $result = $stmt -> get_result();
        

        if($result->num_rows > 0) {
            $data = $result->fetch_assoc();
            $_SESSION["username"] = $data["username"];
            $_SESSION["is_login"] = true;
            $_SESSION["role"] = $data["role"];
            header("location: ?page=survey");
        } else {
            echo "<script>alert('Gagal, Ulangi Lagi');</script>";
        }
    }
?>

<section class="bg-primary-2">
    <div class="container-fluid py-4">
        <h1 class="text-heading-xl font-lato fw-bolder">MASUK</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="index.php">Beranda</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="?page=masuk">Masuk</a>
                </li>
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
                        <h1 class="text-heading-lg font-poppins my-0">Silahkan Melakukan Login Akun Survei Kepuasan Pelanggan Polinema</h1>
                    </div>
                    <form action="?page=login" method="POST">
                        <div class="d-flex flex-column gap-3">
                            <div class="form-group">
                                <label class="form-label">Username</label>
                                <input type="text" name="username" class="form-control" placeholder="Contoh: iyzidann">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Kata Sandi</label>
                                <input type="password" name="password" class="form-control" placeholder="Kata Sandi">
                            </div>
                            <div class="d-flex flex-column gap-3 mt-3">
                                <button type="submit" name="login" class="btn btn-sm btn-primary">Masuk</button>
                                <p class="text-center">
                                    Belum punya akun?
                                    <a href="?page=masuk" class="text-primary-1"> Daftar sekarang</a>
                                </p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>