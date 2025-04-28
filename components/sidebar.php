<?php
if (isset($_POST["logout"])) {
    session_unset();
    session_destroy();

    header("location: ?page=beranda");
}
?>

<aside id="sidebar">
    <div class="d-flex">
        <button class="toggle-btn" type="button">
            <i class="lni lni-grid-alt"></i>
        </button>
        <div class="sidebar-logo">
            <h6><b>Polinema</b></h6>
        </div>
    </div>
    <ul class="sidebar-nav">
        <li class="sidebar-item">
            <a href="?page=profil/profil-admin" class="sidebar-link link-underline link-underline-opacity-0">
                <i class="lni lni-user"></i>
                <span>Profil</span>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="?page=admin" class="sidebar-link link-underline link-underline-opacity-0">
                <i class="lni lni-home"></i>
                <span>Beranda</span>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="#" class="sidebar-link link-underline link-underline-opacity-0 collapsed has-dropdown"
                data-bs-toggle="collapse" data-bs-target="#saw" aria-expanded="false" aria-controls="saw">
                <i class="lni lni-stats-up"></i>
                <span>SBP - SAW</span>
            </a>
            <ul id="saw" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                <li class="sidebar-item">
                    <a href="?page=admin/saw/alternatif"
                        class="sidebar-link link-underline link-underline-opacity-0">Alternatif</a>
                </li>
                <li class="sidebar-item">
                    <a href="?page=admin/saw/bobot" class="sidebar-link link-underline link-underline-opacity-0">Bobot &
                        Kriteria</a>
                </li>
                <li class="sidebar-item">
                    <a href="?page=admin/saw/matriks"
                        class="sidebar-link link-underline link-underline-opacity-0">Matriks</a>
                </li>
            </ul>
        </li>
        <li class="sidebar-item">
            <a href="?page=admin/survey" class="sidebar-link link-underline link-underline-opacity-0">
                <i class="lni lni-layout"></i>
                <span>Data Survei</span>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="?page=admin/user" class="sidebar-link link-underline link-underline-opacity-0">
                <i class="lni lni-cog"></i>
                <span>Pengaturan Pengguna</span>
            </a>
        </li>
    </ul>
    <div class="sidebar-footer">
        <form class="d-flex" method="POST">
            <button type="submit" name="logout" class="btn sidebar-link link-underline link-underline-opacity-0">
                <i class="lni lni-exit"></i>
            </button>
            <div class="sidebar-logo">
                <h6>Keluar</h6>
            </div>
        </form>
    </div>
</aside>

<script>
const hamBurger = document.querySelector(".toggle-btn");

hamBurger.addEventListener("click", function() {
    document.querySelector("#sidebar").classList.toggle("expand");
});
</script>