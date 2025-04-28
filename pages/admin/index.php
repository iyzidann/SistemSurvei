<?php 
    include "config/database.php";

    $db = new Database();
    $conn = $db->conn; 

    $sql = "SELECT COUNT(*) AS total_users FROM m_user";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Output data of each row
        while($row = $result->fetch_assoc()) {
            $total_users = $row["total_users"];
        }
    } else {
        $total_users = 0;
    }

    // Mendapatkan data dari view average dan normalisasi
    $query_preferences = "SELECT * FROM normalisasi_x_bobot";

    $result_preferences = $conn->query($query_preferences);

    $preferences_data = [];

    // Memasukkan data ke array untuk average
    if ($result_preferences) {
        while ($row = $result_preferences->fetch_assoc()) {
            $preferences_data[] = $row;
        }
    }
    $conn->close();
?>

<div class="wrapper">
    <?php include('./components/sidebar.php');?>
    <div class="main my-3 p-4 bg-body rounded shadow-sm">
        <main class="content px-4 py-5">
            <div class="container-fluid">
                <div class="mb-3">
                    <h5 class="fw-bold fs-4 mb-3">Beranda</h5>
                    <div class="row">
                        <div class="col-12 col-md-4">
                            <div class="card border-0">
                                <div class="card-body py-4">
                                    <h7 class="mb-2 fw-bold">LAPORAN HARI INI</h7>
                                    <br><br>
                                    <p class="mb-2">User Terdaftar : <?php echo $total_users; ?></p>
                                </div>
                            </div>
                        </div>
                        <!-- Repeat similar structure for other cards -->
                    </div>
                    <hr>
                    <br>
                    <h5 class="fw-bold fs-4 my-3">Nilai Preferensi (P)</h5><br>
                    <div class="card-header">
                        <h5 class="card-title">Tabel Nilai Preferensi (P)</h5><br>
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                            Nilai preferensi (P) merupakan penjumlahan dari perkalian matriks ternormalisasi R dengan vektor bobot W.
                        </p>
                        <br>    
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <table class="table table-striped">
                                <thead>
                                    <tr class="highlight">
                                        <th scope="col">Alternatif</th>
                                        <th scope="col">Hasil</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($preferences_data as $data): ?>
                                    <tr>
                                        <td><?php echo $data['Kriteria']; ?></td>
                                        <td><?php echo $data['total']; ?></td>
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
