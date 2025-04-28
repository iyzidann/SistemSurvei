<?php
    if(isset($_SESSION["is_login"])) {
        header("location: ?page=survey");
    }
?>

<!-- Breadcrumb Header -->
<section class="bg-primary-2">
    <div class="container-fluid py-4">
        <h1 class="text-heading-xl font-lato fw-bolder">DAFTAR</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="index.php">Beranda</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Daftar</li>
            </ol>
        </nav>
    </div>
</section>
<div class="container-fluid my-4">
    <!-- Card Group -->
    <div class="card">
        <div class="card-body py-5">
            <div class="container">
                <div class="d-flex flex-column gap-5">
                    <p class="text-body-md font-lato my-0 text-center">Silakan pilih salah satu untuk melakukan registrasi sebelum mengisi kuesioner survei </p>
                    <div class="d-block mx-auto" style="width: 100vh;">
                        <div class="row" style="row-gap: 32px;">
                            <div class="col-6 col-lg-4 d-flex justify-content-center">
                                <div class="card bg-primary-2 w-100">
                                    <div class="card-body">
                                        <img src="./assets/img/mahasiswa.png" alt="Image" width="124" height="124" class="d-block mx-auto">
                                        <a href="?page=register-mhs" class="btn btn-primary btn-sm text-white d-block mx-auto">Mahasiswa</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-lg-4 d-flex justify-content-center">
                                <div class="card bg-primary-2 w-100">
                                    <div class="card-body">
                                        <img src="./assets/img/dosen.png" alt="Image" width="84" height="124" class="d-block mx-auto">
                                        <a href="?page=register-dosen" class="btn btn-primary btn-sm text-white d-block mx-auto">Dosen</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-lg-4 d-flex justify-content-center">
                                <div class="card bg-primary-2 w-100">
                                    <div class="card-body">
                                        <img src="./assets/img/tendik.png" alt="Image" width="124" height="124" class="d-block mx-auto">
                                        <a href="?page=register-tendik" class="btn btn-primary btn-sm text-white d-block mx-auto">Tendik</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-lg-4 d-flex justify-content-center">
                                <div class="card bg-primary-2 w-100">
                                    <div class="card-body">
                                        <img src="./assets/img/industri.png" alt="Image" width="84" height="124" class="d-block mx-auto">
                                        <a href="?page=register-industri" class="btn btn-primary btn-sm text-white d-block mx-auto">Industri</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-lg-4 d-flex justify-content-center">
                                <div class="card bg-primary-2 w-100">
                                    <div class="card-body">
                                        <img src="./assets/img/alumni.png" alt="Image" width="124" height="124" class="d-block mx-auto">
                                        <a href="?page=register-alumni" class="btn btn-primary btn-sm text-white d-block mx-auto">Alumni</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 col-lg-4 d-flex justify-content-center">
                                <div class="card bg-primary-2 w-100">
                                    <div class="card-body">
                                        <img src="./assets/img/orangtua.png" alt="Image" width="124" height="124" class="d-block mx-auto">
                                        <a href="?page=register-ortu" class="btn btn-primary btn-sm text-white d-block mx-auto">Orang Tua</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>