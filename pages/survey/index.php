<section class="bg-primary-2">
    <div class="container-fluid py-4">
        <h1 class="text-heading-xl font-lato fw-bolder">SURVEY</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="index.php">Beranda</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Survey</li>
            </ol>
        </nav>
    </div>
</section>
<div class="container-fluid my-4">
    <section class="card">
        <div class="card-body p-5">
            <div class="d-flex flex-column gap-5">
                <div class="d-flex flex-column align-items-center gap-2">
                    <h1 class="text-heading-lg font-poppins my-0">Pilihan Anda</h1>
                    <p class="text-body-md font-poppins my-0">Mulai isi survey atau lihat kembali survey yang sudah anda isi</p>
                </div>
                <div class="d-block mx-auto" style="width: 100vh;">
                    <div class="d-flex justify-content-center align-items-center gap-4">
                    <?php 
                    if(isset($_SESSION['role'])) {
                        $role = $_SESSION['role']; 
                        if($role == 'mahasiswa'){
                            echo '<a href="?page=mahasiswa/isi-survey" class="card w-50 bg-primary-2" style="text-decoration: none;">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center gap-4">
                                            <img src="./assets/img/survey1.png" alt="Survey" width="124" height="124">
                                            <p class="text-heading-md font-poppins my-0">Isi Survey</p>
                                        </div>
                                    </div>
                                </a>
                                <a href="?page=mahasiswa/riwayat-survey" class="card w-50 bg-primary-2" style="text-decoration: none;">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center gap-4">
                                            <img src="./assets/img/survey2.png" alt="Survey" width="124" height="124">
                                            <p class="text-heading-md font-poppins my-0">Riwayat Survey</p>
                                        </div>
                                    </div>
                                </a>';
                        } elseif($role == 'alumni'){
                            echo '<a href="?page=alumni/isi-survey" class="card w-50 bg-primary-2" style="text-decoration: none;">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center gap-4">
                                            <img src="./assets/img/survey1.png" alt="Survey" width="124" height="124">
                                            <p class="text-heading-md font-poppins my-0">Isi Survey</p>
                                        </div>
                                    </div>
                                </a>
                                <a href="?page=alumni/riwayat-survey" class="card w-50 bg-primary-2" style="text-decoration: none;">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center gap-4">
                                            <img src="./assets/img/survey2.png" alt="Survey" width="124" height="124">
                                            <p class="text-heading-md font-poppins my-0">Riwayat Survey</p>
                                        </div>
                                    </div>
                                </a>';
                        } elseif($role == 'dosen'){
                            echo '<a href="?page=dosen/isi-survey" class="card w-50 bg-primary-2" style="text-decoration: none;">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center gap-4">
                                            <img src="./assets/img/survey1.png" alt="Survey" width="124" height="124">
                                            <p class="text-heading-md font-poppins my-0">Isi Survey</p>
                                        </div>
                                    </div>
                                </a>
                                <a href="?page=dosen/riwayat-survey" class="card w-50 bg-primary-2" style="text-decoration: none;">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center gap-4">
                                            <img src="./assets/img/survey2.png" alt="Survey" width="124" height="124">
                                            <p class="text-heading-md font-poppins my-0">Riwayat Survey</p>
                                        </div>
                                    </div>
                                </a>';
                        }  elseif($role == 'industri'){
                            echo '<a href="?page=industri/isi-survey" class="card w-50 bg-primary-2" style="text-decoration: none;">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center gap-4">
                                            <img src="./assets/img/survey1.png" alt="Survey" width="124" height="124">
                                            <p class="text-heading-md font-poppins my-0">Isi Survey</p>
                                        </div>
                                    </div>
                                </a>
                                <a href="?page=industri/riwayat-survey" class="card w-50 bg-primary-2" style="text-decoration: none;">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center gap-4">
                                            <img src="./assets/img/survey2.png" alt="Survey" width="124" height="124">
                                            <p class="text-heading-md font-poppins my-0">Riwayat Survey</p>
                                        </div>
                                    </div>
                                </a>';
                        }  elseif($role == 'orangtua'){
                            echo '<a href="?page=orangtua/isi-survey" class="card w-50 bg-primary-2" style="text-decoration: none;">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center gap-4">
                                            <img src="./assets/img/survey1.png" alt="Survey" width="124" height="124">
                                            <p class="text-heading-md font-poppins my-0">Isi Survey</p>
                                        </div>
                                    </div>
                                </a>
                                <a href="?page=orangtua/riwayat-survey" class="card w-50 bg-primary-2" style="text-decoration: none;">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center gap-4">
                                            <img src="./assets/img/survey2.png" alt="Survey" width="124" height="124">
                                            <p class="text-heading-md font-poppins my-0">Riwayat Survey</p>
                                        </div>
                                    </div>
                                </a>';
                        } elseif($role == 'tendik'){
                            echo '<a href="?page=tendik/isi-survey" class="card w-50 bg-primary-2" style="text-decoration: none;">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center gap-4">
                                            <img src="./assets/img/survey1.png" alt="Survey" width="124" height="124">
                                            <p class="text-heading-md font-poppins my-0">Isi Survey</p>
                                        </div>
                                    </div>
                                </a>
                                <a href="?page=tendik/riwayat-survey" class="card w-50 bg-primary-2" style="text-decoration: none;">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center gap-4">
                                            <img src="./assets/img/survey2.png" alt="Survey" width="124" height="124">
                                            <p class="text-heading-md font-poppins my-0">Riwayat Survey</p>
                                        </div>
                                    </div>
                                </a>';
                        }
                    }
                    ?>    
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>