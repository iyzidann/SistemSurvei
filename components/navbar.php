<nav class="navbar navbar-expand-lg bg-primary-1">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <div class="d-flex align-items-center gap-3">
                <img src="./assets/img/logo-polinema.png" alt="Logo" width="36" height="36">
                <span class="text-white font-poppins text-heading-lg">POLITEKNIK NEGERI MALANG</span>
                <img src="./assets/img/logo-blu.png" alt="Logo" width="42" height="36">
            </div>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa-solid fa-bars text-white"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0 gap-lg-4">
            <?php
                // Check if session is started
                session_start();
                if (isset($_SESSION['username'])) {
                    if ($_SESSION['role'] == 'admin') {
                    // If session started, show profile button
                    ?>
                    <li class="nav-item">
                        <a class="nav-link text-white" aria-current="page">Selamat Datang, Admin!</a>
                    </li>
                    <?php
                    // Check if the user has the 'admin' role
                    } else if ($_SESSION['role'] !== 'admin') {
                        ?>
                        <li class="nav-item">
                            <a class="nav-link text-white" aria-current="page" href="?page=beranda">Beranda</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" aria-current="page" href="?page=profil">Profil</a>
                        </li>
                    <?php
                    }
                } else {
                    // If session is not started, show Beranda and Login Admin links
                    ?>
                    <li class="nav-item">
                        <a class="nav-link text-white" aria-current="page" href="?page=beranda">Beranda</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" aria-current="page" href="?page=loginAdmin">Masuk Admin</a>
                    </li>
                <?php
                }
                ?>
            </ul>
        </div>
    </div>
    </div>
</nav>
