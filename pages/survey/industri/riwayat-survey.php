<?php
include "config/database.php";
include "controller/crud.php";
?>

<section class="bg-primary-2">
    <div class="container-fluid py-4">
        <h1 class="text-heading-xl font-lato fw-bolder">SURVEY</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="index.php">Beranda</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="?page=survey">Survey</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Riwayat Survey</li>
            </ol>
        </nav>
    </div>
</section>
<div class="container-fluid my-4">
    <section class="card">
        <div class="card-body p-5">
            <div class="d-flex flex-column gap-5">
                <div class="d-flex flex-column align-items-center gap-3">
                    <h1 class="text-heading-lg font-poppins my-0">Riwayat Survey</h1>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">Judul Survey</th>
                                <th scope="col">Tanggal Kirim</th>
                                <th scope="col">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                            $no = 1;
                            $crud = new crud();
                            $result = $crud->showSurveyHistory();
                            while ($row = $result->fetch_assoc()) {                                echo '<tr>';
                                echo '<th scope="row">' . $no . '</th>';
                                echo '<td>' . $row['kategori_survey'] . '</td>';
                                echo '<td>' . $row['tanggal'] . '</td>';
                                echo '<td>';
                                echo '<button class="btn btn-sm ' . ($row['aksi'] == 'Terisi' ? 'btn-success' : 'btn-danger') . '">' . $row['aksi'] . '</button>';
                                echo '</td>';
                                echo '</tr>';
                                $no++;
                            }
                        ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</div>