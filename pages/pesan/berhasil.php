<?php 
    if(isset($_POST["logout"])) {
        session_unset();
        session_destroy();

        header("location: ?page=beranda");
    }
?>

<section class="bg-primary-2">
    <div class="container-fluid py-4">
        <h1 class="text-heading-xl font-lato fw-bolder">BERHASIL</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="index.php">Beranda</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Pesan</li>
            </ol>
        </nav>
    </div>
</section>
<div class="container-fluid my-4">
    <section class="card">
        <div class="card-body p-5">
            <div class="d-flex align-items-center flex-column gap-4">
                <img src="./assets/img/pesan-berhasil.png" alt="Image" width="164" height="164">
                <div class="card text-bg-light" style="width: 40vw;">
                    <div class="card-body">
                        <div class="d-flex flex-column gap-2">
                            <div class="d-flex flex-column gap-1">
                                <h1 class="text-heading-lg font-poppins my-0 text-secondary">Terima Kasih!</h1>
                                <hr>
                            </div>
                            <form action="?page=pesan-berhasil" method="POST">
                                <p class="text-body-md font-poppins my-0">Terima kasih atas waktu Anda - Umpan balik Anda sangat membantu kami dalam upaya meningkatkan pelayanan Polinema</p>
                                <button class="btn btn-danger btn-sm d-block mx-auto mt-4" name="logout">Keluar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>