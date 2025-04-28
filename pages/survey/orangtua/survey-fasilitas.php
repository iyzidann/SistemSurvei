<?php
    include "controller/crud.php";

    $kategori_id = 2;
    $soal_jenis = 'ortu';

    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        $db = new Database();
        $conn = $db->conn; 
        $crud = new crud();

        $username = $_SESSION["username"];
        $user_info= $crud->takeDataOrtu($username);
        $responden_ortu_id = $user_info['responden_id']; 

        $soalList = $crud->readSoal($kategori_id, $soal_jenis);
        
        foreach ($soalList as $soal) {  
            $soal_id = $soal['soal_id'];
            $jawaban_key = "rating_" . $soal['soal_id'];
            $jawaban = $_POST[$jawaban_key];
            $crud -> inputJawabanOrtu($responden_ortu_id , $soal_id , $jawaban);
        }
        header("location: ?page=pesan-berhasil");
    }
?>

<section class="bg-primary-2">
    <div class="container-fluid py-4">
        <h1 class="text-heading-xl font-lato fw-bolder">SURVEI FASILITAS</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="index.php">Beranda</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="?page=survey">Survey</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="?page=orangtua/isi-survey">Isi Survey</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Survei Fasilitas</li>
            </ol>
        </nav>
    </div>
</section>
<div class="container-fluid my-4">
    <section class="card">
        <div class="card-body p-5">
            <div class="d-flex flex-column gap-5">
                <div class="d-flex flex-column align-items-center gap-2">
                    <h1 class="text-heading-xl font-poppins my-0">Kuesioner Fasilitas</h1>
                    <p class="text-body-md font-poppins my-0">Isi survey dengan kondisi sebenarnya pada Politeknik Negeri Malang.</p>
                </div>
                <form action="#" method="POST">
                    <div class="d-block mx-auto" style="width: 100vh;">
                        <div class="d-flex flex-column gap-4">
                            <div class="d-flex flex-column gap-2">
                                <p class="text-heading-md font-poppins my-0">Keterangan</p>
                                <p class="text-body-md font-poppins my-0">
                                    1. Sangat tidak puas - 2. Tidak puas - 3. Biasa saja - 4. Puas - 5. Sangat puas
                                </p>
                            </div>
                            <?php
                                $crud = new CRUD;
                                $daftarSoal = $crud ->readSoal($kategori_id, $soal_jenis);
                                $no = 1;
                                foreach($daftarSoal as $soal): 
                            ?>
                                <div class="d-flex flex-column gap-2">
                                    <p class="text-heading-md font-poppins my-0"><?php echo $no . ". " . $soal['soal_nama']; ?></p>
                                    <div class="rating">
                                        <input type="radio" class="btn-check" id="rating_<?php echo $soal['soal_id']; ?>_1" name="rating_<?php echo $soal['soal_id']; ?>" value="1">
                                        <label class="btn btn-outline-secondary" for="rating_<?php echo $soal['soal_id']; ?>_1">1</label>

                                        <input type="radio" class="btn-check" id="rating_<?php echo $soal['soal_id']; ?>_2" name="rating_<?php echo $soal['soal_id']; ?>" value="2">
                                        <label class="btn btn-outline-secondary" for="rating_<?php echo $soal['soal_id']; ?>_2">2</label>

                                        <input type="radio" class="btn-check" id="rating_<?php echo $soal['soal_id']; ?>_3" name="rating_<?php echo $soal['soal_id']; ?>" value="3">
                                        <label class="btn btn-outline-secondary" for="rating_<?php echo $soal['soal_id']; ?>_3">3</label>

                                        <input type="radio" class="btn-check" id="rating_<?php echo $soal['soal_id']; ?>_4" name="rating_<?php echo $soal['soal_id']; ?>" value="4">
                                        <label class="btn btn-outline-secondary" for="rating_<?php echo $soal['soal_id']; ?>_4">4</label>

                                        <input type="radio" class="btn-check" id="rating_<?php echo $soal['soal_id']; ?>_5" name="rating_<?php echo $soal['soal_id']; ?>" value="5">
                                        <label class="btn btn-outline-secondary" for="rating_<?php echo $soal['soal_id']; ?>_5">5</label>
                                    </div>
                                </div>
                            <?php $no++; endforeach; 
                            ?>
                            <div class="d-flex justify-content-end">
                                <input type = "submit" href="?page=pesan-berhasil" class="btn btn-sm btn-primary" ></input>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>