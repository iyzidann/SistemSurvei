<?php 
include "controller/saw.php";
?>

<div class="wrapper">
    <?php include('./components/sidebar.php');?>
    <div class="main my-3 p-4 bg-body rounded shadow-sm">
        <main class="content px-4 py-5">
            <div class="container-fluid">
                <div class="mb-3">
                    <h5 class="fw-bold fs-4 my-3">Bobot Kriteria</h5><br>
                    <div class="card-header">
                        <h5 class="card-title">Tabel Bobot Kriteria</h5><br>
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                            Pengambil keputusan memberi bobot preferensi dari setiap kriteria dengan masing-masing jenisnya (keuntungan/benefit atau biaya/cost):
                        </p>
                        <br>    
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <table class="table table-striped">
                                <thead>
                                    <tr class="highlight">
                                        <th scope="col">No</th>
                                        <th scope="col">Simbol</th>
                                        <th scope="col">Kriteria</th>
                                        <th scope="col">Bobot</th>
                                        <th scope="col">Atribut</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                        $alternatif = new SAW();
                                        $result = $alternatif->getBobotData();
                                        $index = 1;
                                        foreach ($result as $row) {
                                            echo "<tr>
                                                    <th scope=\"row\">{$index}</th>
                                                    <td>C{$index}</td>
                                                    <td>{$row['kriteria']}</td>
                                                    <td>{$row['bobot']}</td>
                                                    <td>{$row['atribut']}</td>
                                                </tr>\n";
                                            $index++;
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
