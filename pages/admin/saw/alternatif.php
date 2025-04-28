<?php 
include "controller/saw.php";
?>

<div class="wrapper">
    <?php include('./components/sidebar.php');?>
    <div class="main my-3 p-4 bg-body rounded shadow-sm">
        <main class="content px-4 py-5">
            <div class="container-fluid">
                <div class="mb-3">
                    <h5 class="fw-bold fs-4 my-3">Alternatif</h5><br>
                    <div class="card-header">
                        <h5 class="card-title">Tabel Alternatif</h5><br>
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                            Data-data mengenai alternatif berupa kategori yang akan dievaluasi direpresentasikan dalam tabel berikut:
                        </p>
                        <br>    
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <table class="table table-striped">
                                <thead>
                                    <tr class="highlight">
                                        <th scope="col">No</th>
                                        <th scope="col">Alternatif</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                        $alternatif = new SAW();
                                        $result = $alternatif->getData();
                                        foreach ($result as $row) {
                                            echo "<tr>
                                                    <td>{$row['kategori_id']}</td>
                                                    <td>{$row['kategori_nama']}</td>
                                                </tr>\n";
                                        }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
