<?php 
include "config/database.php";

$db = new Database();
$conn = $db->conn;

// Mendapatkan data dari view average dan normalisasi
$query_average = "SELECT * FROM average";
$query_normalisasi = "SELECT * FROM normalisasi";

$result_average = $conn->query($query_average);
$result_normalisasi = $conn->query($query_normalisasi);

$average_data = [];
$normalisasi_data = [];

// Memasukkan data ke array untuk average
if ($result_average) {
    while ($row = $result_average->fetch_assoc()) {
        $average_data[] = $row;
    }
}

// Memasukkan data ke array untuk normalisasi
if ($result_normalisasi) {
    while ($row = $result_normalisasi->fetch_assoc()) {
        $normalisasi_data[] = $row;
    }
}

?>

<div class="wrapper">
    <?php include('./components/sidebar.php'); ?>
    <div class="main my-3 p-4 bg-body rounded shadow-sm">
        <main class="content px-4 py-5">
            <div class="container-fluid">
                <div class="mb-3">
                    <h5 class="fw-bold fs-4 my-3">Matriks</h5><br>
                    <div class="card-header">
                        <h5 class="card-title">Matriks Keputusan (X)</h5><br>
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                        Matriks keputusan yang merepresentasikan hubungan antara <b>4 alternatif (kategori)</b> dengan <b>5 kriteria</b> yang digunakan dalam analisis 
                        kepuasaan setiap stakeholder di Politeknik Negeri Malang
                        </p>
                        <br>    
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th rowspan='2'>Alternatif / Kriteria</th>
                                    </tr>
                                    <tr>
                                        <th>C1</th>
                                        <th>C2</th>
                                        <th>C3</th>
                                        <th>C4</th>
                                        <th>C5</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($average_data as $data): ?>
                                    <tr>
                                        <td><?php echo $data['Alternatif_Kategori']; ?></td>
                                        <td><?php echo $data['K1_Tangibles']; ?></td>
                                        <td><?php echo $data['K2_Relaiability']; ?></td>
                                        <td><?php echo $data['K3_Responsiveness']; ?></td>
                                        <td><?php echo $data['K4_Assurance']; ?></td>
                                        <td><?php echo $data['K5_Empathy']; ?></td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br>
                    <hr>
                    <br>
                    <div class="card-header">
                        <h5 class="card-title">Matriks Ternormalisasi (R)</h5><br>
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                        Melakukan perhitungan normalisasi untuk mendapatkan matriks nilai ternormalisasi (R), dengan ketentuan: 
                        <br>
                        Untuk normalisasi nilai, jika faktor/attribute kriteria bertipe <b>cost</b> maka digunakan rumusan: Rij = ( min{Xij} / Xij)
                        <br>
                        Sedangkan jika faktor/attribute kriteria bertipe <b>benefit</b> maka digunakan rumusan: Rij = ( Xij/max{Xij} )
                        </p> 
                        <br>
                    </div>
                    <div class="row">
                        <div class="col-10">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th rowspan='2'>Alternatif / Kriteria</th>
                                    </tr>
                                    <tr>
                                        <th>C1</th>
                                        <th>C2</th>
                                        <th>C3</th>
                                        <th>C4</th>
                                        <th>C5</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($normalisasi_data as $data): ?>
                                    <tr>
                                        <td><?php echo $data['Kriteria']; ?></td>
                                        <td><?php echo $data['Tangibles']; ?></td>
                                        <td><?php echo $data['Reliability']; ?></td>
                                        <td><?php echo $data['Responsiveness']; ?></td>
                                        <td><?php echo $data['Assurance']; ?></td>
                                        <td><?php echo $data['Empathy']; ?></td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
