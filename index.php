<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POLINEMA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/255fd51aa4.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link rel="stylesheet" href="./assets/styles/styles.css">
    <link rel="stylesheet" href="./assets/styles/stylesAdmin.css">
</head>

<body>
    <?php
        include('./components/navbar.php');
    ?>

    <main>
        <?php
        if (isset($_GET['page'])) {
            if ($_GET['page'] === 'beranda') {
                include('./pages/beranda.php');
            } else if ($_GET['page'] === 'masuk') {
                include('./pages/auth/index.php');
            } else if ($_GET['page'] === 'login') {
                include('./pages/auth/masuk/login.php');
            } else if ($_GET['page'] === 'loginAdmin') {
                include('./pages/auth/masuk/loginAdmin.php');
            // REGISTER
            } else if ($_GET['page'] === 'register-mhs') {
                include('./pages/auth/daftar/register-mhs.php');
            } else if ($_GET['page'] === 'register-alumni') {
                include('./pages/auth/daftar/register-alumni.php');
            } else if ($_GET['page'] === 'register-dosen') {
                include('./pages/auth/daftar/register-dosen.php');
            } else if ($_GET['page'] === 'register-industri') {
                include('./pages/auth/daftar/register-industri.php');
            } else if ($_GET['page'] === 'register-ortu') {
                include('./pages/auth/daftar/register-ortu.php');
            } else if ($_GET['page'] === 'register-tendik') {
                include('./pages/auth/daftar/register-tendik.php');
            } else if ($_GET['page'] === 'survey') {
                include('./pages/survey/index.php');
            // ADMIN
            } else if ($_GET['page'] === 'admin') {
                include('./pages/admin/index.php');
            } else if ($_GET['page'] === 'admin/survey') {
                include('./pages/admin/survey/index.php');
            } else if ($_GET['page'] === 'admin/create') {
                include('./pages/admin/survey/create.php');
            } else if ($_GET['page'] === 'admin/user') {
                include('./pages/admin/user/index.php');
            } else if ($_GET['page'] === 'admin/create') {
                include('./pages/admin/user/create.php');
            // SURVEY MAHASISWA
            } else if ($_GET['page'] === 'mahasiswa/isi-survey') {
                include('./pages/survey/mahasiswa/isi-survey.php');
            } else if ($_GET['page'] === 'mahasiswa/riwayat-survey') {
                include('./pages/survey/mahasiswa/riwayat-survey.php');
            } else if ($_GET['page'] === 'mahasiswa/survey-kualitas-pendidikan') {
                include('./pages/survey/mahasiswa/survey-kualitas-pendidikan.php');
            } else if ($_GET['page'] === 'mahasiswa/survey-fasilitas') {
                include('./pages/survey/mahasiswa/survey-fasilitas.php');
            } else if ($_GET['page'] === 'mahasiswa/survey-pelayanan') {
                include('./pages/survey/mahasiswa/survey-pelayanan.php');
            // SURVEY ALUMNI
            } else if ($_GET['page'] === 'alumni/isi-survey') {
                include('./pages/survey/alumni/isi-survey.php');
            } else if ($_GET['page'] === 'alumni/riwayat-survey') {
                include('./pages/survey/alumni/riwayat-survey.php');
            } else if ($_GET['page'] === 'alumni/survey-kualitas-pendidikan') {
                include('./pages/survey/alumni/survey-kualitas-pendidikan.php');
            } else if ($_GET['page'] === 'alumni/survey-fasilitas') {
                include('./pages/survey/alumni/survey-fasilitas.php');
            } else if ($_GET['page'] === 'alumni/survey-pelayanan') {
                include('./pages/survey/alumni/survey-pelayanan.php');
            } else if ($_GET['page'] === 'alumni/survey-lulusan') {
                include('./pages/survey/alumni/survey-lulusan.php');
            // SURVEY DOSEN
            } else if ($_GET['page'] === 'dosen/isi-survey') {
                include('./pages/survey/dosen/isi-survey.php');
            } else if ($_GET['page'] === 'dosen/riwayat-survey') {
                include('./pages/survey/dosen/riwayat-survey.php');
            } else if ($_GET['page'] === 'dosen/survey-fasilitas') {
                include('./pages/survey/dosen/survey-fasilitas.php');
            } else if ($_GET['page'] === 'dosen/survey-pelayanan') {
                include('./pages/survey/dosen/survey-pelayanan.php');
            // SURVEY INDUSTRI
            } else if ($_GET['page'] === 'industri/isi-survey') {
                include('./pages/survey/industri/isi-survey.php');
            } else if ($_GET['page'] === 'industri/riwayat-survey') {
                include('./pages/survey/industri/riwayat-survey.php');
            } else if ($_GET['page'] === 'industri/survey-fasilitas') {
                include('./pages/survey/industri/survey-fasilitas.php');
            } else if ($_GET['page'] === 'industri/survey-pelayanan') {
                include('./pages/survey/industri/survey-pelayanan.php');
            } else if ($_GET['page'] === 'industri/survey-lulusan') {
                include('./pages/survey/industri/survey-lulusan.php');
            // SURVEY ORANG TUA
            } else if ($_GET['page'] === 'orangtua/isi-survey') {
                include('./pages/survey/orangtua/isi-survey.php');
            } else if ($_GET['page'] === 'orangtua/riwayat-survey') {
                include('./pages/survey/orangtua/riwayat-survey.php');
            } else if ($_GET['page'] === 'orangtua/survey-fasilitas') {
                include('./pages/survey/orangtua/survey-fasilitas.php');
            } else if ($_GET['page'] === 'orangtua/survey-pelayanan') {
                include('./pages/survey/orangtua/survey-pelayanan.php');
            } else if ($_GET['page'] === 'orangtua/survey-lulusan') {
                include('./pages/survey/orangtua/survey-lulusan.php');
            // SURVEY TENDIK
            } else if ($_GET['page'] === 'tendik/isi-survey') {
                include('./pages/survey/tendik/isi-survey.php');
            } else if ($_GET['page'] === 'tendik/riwayat-survey') {
                include('./pages/survey/tendik/riwayat-survey.php');
            } else if ($_GET['page'] === 'tendik/survey-fasilitas') {
                include('./pages/survey/tendik/survey-fasilitas.php');
            } else if ($_GET['page'] === 'tendik/survey-pelayanan') {
                include('./pages/survey/tendik/survey-pelayanan.php');
            // 
            } else if ($_GET['page'] === 'pesan-berhasil') {
                include('./pages/pesan/berhasil.php');
            } else if ($_GET['page'] === 'profil') {
                include('./pages/profil/index.php');
            } else if ($_GET['page'] === 'profil/profil-admin') {
                include('./pages/profil/profil-admin.php');
            // SAW
            } else if ($_GET['page'] === 'admin/saw/alternatif') {
                include('./pages/admin/saw/alternatif.php');
            } else if ($_GET['page'] === 'admin/saw/bobot') {
                include('./pages/admin/saw/bobot.php');
            } else if ($_GET['page'] === 'admin/saw/matriks') {
                include('./pages/admin/saw/matriks.php');
            }
        } else {
            include('./pages/beranda.php');
        }
        ?>
    </main>

    <?php
        include('./components/footer.php');
    ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>