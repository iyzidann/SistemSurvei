-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2024 at 03:13 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `survei`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `average`
-- (See below for the actual view)
--
CREATE TABLE `average` (
`Alternatif_Kategori` varchar(19)
,`K1_Tangibles` double
,`K2_Relaiability` double
,`K3_Responsiveness` double
,`K4_Assurance` double
,`K5_Empathy` double
);

-- --------------------------------------------------------

--
-- Table structure for table `bobot`
--

CREATE TABLE `bobot` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `kriteria` varchar(50) NOT NULL,
  `bobot` float NOT NULL,
  `atribut` set('benefit','cost') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bobot`
--

INSERT INTO `bobot` (`id`, `kriteria`, `bobot`, `atribut`) VALUES
(1, 'Tangibles', 0.2, 'benefit'),
(2, 'Realiability', 0.2, 'benefit'),
(3, 'Responsiveness', 0.2, 'benefit'),
(4, 'Assurance', 0.2, 'benefit'),
(5, 'Empathy', 0.2, 'benefit');

-- --------------------------------------------------------

--
-- Stand-in structure for view `maxaverage`
-- (See below for the actual view)
--
CREATE TABLE `maxaverage` (
`Kriteria` varchar(3)
,`Tangibles` double
,`Reliability` double
,`Responsiveness` double
,`Assurance` double
,`Empathy` double
);

-- --------------------------------------------------------

--
-- Table structure for table `m_kategori`
--

CREATE TABLE `m_kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `m_kategori`
--

INSERT INTO `m_kategori` (`kategori_id`, `kategori_nama`) VALUES
(1, 'Kualitas Pendidikan'),
(2, 'Fasilitas'),
(3, 'Pelayanan'),
(4, 'Lulusan');

-- --------------------------------------------------------

--
-- Table structure for table `m_survey`
--

CREATE TABLE `m_survey` (
  `survey_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `soal_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `survey_tanggal` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_survey_soal`
--

CREATE TABLE `m_survey_soal` (
  `soal_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `soal_jenis` enum('alumni','dosen','industri','mahasiswa','ortu','tendik') NOT NULL,
  `no_urut` int(11) NOT NULL,
  `soal_nama` varchar(500) NOT NULL,
  `kriteria` set('Tangibles','Reliability','Responsiveness','Assurance','Empathy') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `m_survey_soal`
--

INSERT INTO `m_survey_soal` (`soal_id`, `kategori_id`, `soal_jenis`, `no_urut`, `soal_nama`, `kriteria`) VALUES
(1, 2, 'ortu', 1, 'Bagaimana Anda menilai kenyamanan ruang kelas dan lingkungan belajar di Politeknik Negeri Malang?', 'Tangibles'),
(2, 2, 'ortu', 2, 'Menilai kurikulum dan sistem pembelajaran di POLINEMA', 'Reliability'),
(3, 2, 'ortu', 3, 'Menilai penjaminan keamanan dan keselamatan mahasiswa di POLINEMA', 'Assurance'),
(4, 2, 'ortu', 4, 'Seberapa puas Anda dengan fasilitas perpustakaan dan sumber daya akademik lainnya di POLINEMA', 'Tangibles'),
(5, 2, 'ortu', 5, 'Bagaimana Anda menilai fasilitas kantin dan asrama yang disediakan oleh Politeknik Negeri Malang?', 'Empathy'),
(6, 2, 'ortu', 6, 'Bagaimana Anda menilai fasilitas teknologi informasi (komputer, internet, dll.) yang disediakan oleh Politeknik Negeri Malang?', 'Assurance'),
(7, 3, 'ortu', 1, 'Evaluasi keramahan pegawai POLINEMA terhadap pengunjung', 'Empathy'),
(8, 3, 'ortu', 2, 'Menilai kemudahan dalam administrasi keuangan di POLINEMA', 'Reliability'),
(9, 3, 'ortu', 3, 'Evaluasi penjelasan dari pihak POLINEMA kepada orangtua/wali mahasiswa', 'Assurance'),
(10, 3, 'ortu', 4, 'Menilai komunikasi POLINEMA dengan orangtua/wali mahasiswa', 'Responsiveness'),
(11, 3, 'ortu', 5, 'Penilaian informasi tentang hasil pembelajaran di POLINEMA', 'Reliability'),
(12, 3, 'ortu', 6, 'Evaluasi respons dan kecepatan menangani keluhan dari orangtua/wali mahasiswa', 'Responsiveness'),
(13, 4, 'ortu', 1, 'Evaluasi suasana kehidupan kampus POLINEMA', 'Empathy'),
(14, 4, 'ortu', 2, 'Evaluasi kesesuaian biaya pendidikan dengan kualitas belajar', 'Reliability'),
(15, 4, 'ortu', 3, 'Menilai ketersediaan informasi tentang peluang pekerjaan bagi lulusan POLINEMA', 'Assurance'),
(16, 4, 'ortu', 4, 'Bagaimana Anda menilai kontribusi Politeknik Negeri Malang dalam membentuk sikap profesional dan etika kerja anak Anda?', 'Assurance'),
(17, 4, 'ortu', 5, 'Seberapa puas Anda dengan perkembangan keterampilan teknis anak Anda selama belajar di Politeknik Negeri Malang?', 'Reliability'),
(18, 4, 'ortu', 6, 'Seberapa baik anak Anda memanfaatkan pengetahuan dan keterampilan yang didapat selama di Politeknik Negeri Malang dalam kehidupan sehari-hari?', 'Tangibles'),
(19, 2, 'industri', 1, 'Kerjasama antara Polinema dengan Instansi kami telah kami implementasikan dengan kegiatan yang sesuai dengan MoU yang telah kami sepakati bersama.', 'Tangibles'),
(20, 2, 'industri', 2, 'Seberapa baik kondisi dan pemeliharaan fasilitas bengkel yang disediakan oleh POLINEMA untuk kegiatan pelatihan atau kerja praktik bagi karyawan perusahaan Anda?', 'Tangibles'),
(21, 2, 'industri', 3, 'Bagaimana Anda menilai kualitas dan ketersediaan peralatan praktikum yang ada di POLINEMA untuk mendukung kegiatan industri dan pelatihan karyawan perusahaan Anda?', 'Tangibles'),
(22, 2, 'industri', 4, 'Seberapa baik POLINEMA dalam menyediakan fasilitas akomodasi yang layak bagi tamu atau mitra kerja dari perusahaan Anda yang berkunjung ke kampus?', 'Empathy'),
(23, 2, 'industri', 5, 'Bagaimana Anda menilai SDM yang disediakan oleh POLINEMA dalam kolaborasi dengan perusahaan Anda?', 'Tangibles'),
(24, 2, 'industri', 6, 'Bagaimana Anda menilai akses dan kualitas ruang konferensi atau ruang rapat yang tersedia di POLINEMA untuk mendukung pertemuan bisnis dan kegiatan kerjasama dengan perusahaan Anda?', 'Tangibles'),
(25, 3, 'industri', 1, 'Staff kerjasama Polinema merespon pada kebutuhan kami dengan tepat dan profesional.', 'Responsiveness'),
(26, 3, 'industri', 2, 'Proses pembuatan naskah kerjasama cepat.', 'Reliability'),
(27, 3, 'industri', 3, 'Polinema memberikan pendampingan/bantuan terhadap instansi kami saat dibutuhkan.', 'Empathy'),
(28, 3, 'industri', 4, 'Kerjasama/kegiatan ini sesuai dengan harapan kami.', 'Assurance'),
(29, 3, 'industri', 5, 'Pelaporan akhir dari hasil kegiatan kerjasama telah dibuat dan dikomunikasikan dengan kami.', 'Assurance'),
(30, 3, 'industri', 6, 'Kami akan kembali ke Polinema di masa mendatang untuk kerjasama/acara lain.', 'Responsiveness'),
(31, 4, 'industri', 1, 'Berdasarkan jaringan kerjasama mohon Bapak/Ibu berkenan menyebutkan hal-hal yang dibutuhkan institusi Bapak/Ibu dalam kaitannya dengan keberlanjutan dimasa yang akan datang.', 'Assurance'),
(32, 4, 'industri', 2, 'Kami mendapatkan hal yang berguna dari kerjasama antara institusi kami dan Polinema.', 'Reliability'),
(33, 4, 'industri', 3, 'Bagaimana Anda menilai kesiapan lulusan POLINEMA dalam memasuki dunia kerja di industri Anda?', 'Assurance'),
(34, 4, 'industri', 4, 'Bagaimana Anda menilai etika kerja dan profesionalisme lulusan POLINEMA di perusahaan Anda?', 'Assurance'),
(35, 4, 'industri', 5, 'Seberapa puas Anda dengan keterampilan teknis yang dimiliki oleh lulusan POLINEMA yang bekerja di perusahaan Anda?', 'Reliability'),
(36, 4, 'industri', 6, 'Bagaimana Anda menilai kemampuan lulusan Politeknik Negeri Malang dalam beradaptasi dan berinovasi sesuai kebutuhan industri Anda?', 'Assurance'),
(37, 1, 'mahasiswa', 1, 'Bahan ajar suplemen (Handout, modul, dll) yang diberikan kepada mahasiswa untuk melengkapi materi perkuliahan', 'Reliability'),
(38, 1, 'mahasiswa', 2, 'Dosen mengembalikan hasil ujian/tugas dengan nilai yang objektif', 'Assurance'),
(39, 1, 'mahasiswa', 3, 'Dosen datang tepat waktu', 'Responsiveness'),
(40, 1, 'mahasiswa', 4, 'Dosen memadai sesuai dengan bidang keahliannya', 'Assurance'),
(41, 1, 'mahasiswa', 5, 'Rencana Pembelajaran Semester (RPS) yang dibuat oleh dosen', 'Reliability'),
(42, 1, 'mahasiswa', 6, 'Kemampuan dosen dalam membimbing PKL, LA atau Skripsi', 'Assurance'),
(43, 1, 'mahasiswa', 7, 'Waktu dipergunakan secara efektif oleh dosen dalam proses pengajaran', 'Reliability'),
(44, 1, 'mahasiswa', 8, 'Dosen bersedia membantu mahasiswa yang mengalami kesulitan bidang akademik/mata kuliah', 'Empathy'),
(45, 1, 'mahasiswa', 9, 'Dosen bersikap terbuka, kooperatif dengan mahasiswa', 'Empathy'),
(46, 1, 'mahasiswa', 10, 'POLINEMA berusaha memahami minat dan bakat mahasiswa dan berusaha untuk mengembangkannya', 'Empathy'),
(47, 1, 'mahasiswa', 11, 'Kejelasan materi perkuliahan diberikan dosen', 'Reliability'),
(48, 1, 'mahasiswa', 12, 'Waktu yang disediakan untuk diskusi dan tanya jawab', 'Responsiveness'),
(49, 2, 'mahasiswa', 1, 'Ruang kuliah tertata dengan bersih dan rapih', 'Tangibles'),
(50, 2, 'mahasiswa', 2, 'Ruang kuliah sejuk dan nyaman', 'Tangibles'),
(51, 2, 'mahasiswa', 3, 'Sarana pembelajaran yang tersedia di ruangan kuliah', 'Tangibles'),
(52, 2, 'mahasiswa', 4, 'POLINEMA memiliki perpustakaan yang lengkap', 'Reliability'),
(53, 2, 'mahasiswa', 5, 'Laboratorium/Bengkel/Studio POLINEMA relevan dengan kebutuhan keilmuan bagi mahasiswa', 'Reliability'),
(54, 2, 'mahasiswa', 6, 'Ketersediaan buku referensi yang ada di perpustakaan POLINEMA', 'Reliability'),
(55, 2, 'mahasiswa', 7, 'Ketersediaan fasilitas kamar kecil yang cukup dan bersih', 'Tangibles'),
(56, 2, 'mahasiswa', 8, 'Ketersediaan fasilitas parkir yang cukup dan aman', 'Tangibles'),
(57, 2, 'mahasiswa', 9, 'Ketersediaan fasilitas Poliklinik yang disediakan POLINEMA', 'Reliability'),
(58, 2, 'mahasiswa', 10, 'Fasilitas ibadah yang dapat dipergunakan oleh mahasiswa POLINEMA', 'Tangibles'),
(59, 2, 'mahasiswa', 11, 'POLINEMA menyediakan dosen bimbingan konseling bagi mahasiswa', 'Assurance'),
(60, 2, 'mahasiswa', 12, 'POLINEMA menyediakan beasiswa bagi mahasiswa yang tidak mampu', 'Assurance'),
(61, 3, 'mahasiswa', 1, 'POLINEMA memberikan bantuan pengobatan bagi mahasiswa yang sakit', 'Empathy'),
(62, 3, 'mahasiswa', 2, 'POLINEMA memberikan bantuan asuransi bagi mahasiswa yang mendapatkan musibah kecelakaan', 'Empathy'),
(63, 3, 'mahasiswa', 3, 'Permasalahan/keluhan mahasiswa ditangani oleh POLINEMA melalui dosen PA (Pembimbing Akademik)', 'Empathy'),
(64, 3, 'mahasiswa', 4, 'Sanksi bagi mahasiswa yang melanggar peraturan yang telah ditetapkan POLINEMA berlaku untuk semua mahasiswa tanpa terkecuali', 'Assurance'),
(65, 3, 'mahasiswa', 5, 'Adanya sosialisasi terkait besarnya UKT', 'Assurance'),
(66, 3, 'mahasiswa', 6, 'Adanya sosialisasi terkait perkembangan dan penerimaan beasiswa bidikmisi', 'Assurance'),
(67, 3, 'mahasiswa', 7, 'POLINEMA memonitor terhadap kemajuan mahasiswa melalui dosen pembimbing akademik atau dosen bimbingan konseling', 'Assurance'),
(68, 3, 'mahasiswa', 8, 'Kemampuan staf akademik untuk melayani administrasi kemahasiswaan', 'Responsiveness'),
(69, 3, 'mahasiswa', 9, 'Kualitas staf akademik untuk memenuhi kepentingan mahasiswa', 'Assurance'),
(70, 3, 'mahasiswa', 10, 'POLINEMA membantu mahasiswa apabila menghadapi masalah akademik', 'Empathy'),
(71, 3, 'mahasiswa', 11, 'Direktur POLINEMA beserta jajarannya menyediakan waktu bagi orang tua mahasiswa untuk berkonsultasi', 'Empathy'),
(72, 3, 'mahasiswa', 12, 'Staf administrasi akademik santun dalam memberikan pelayanan', 'Empathy'),
(73, 2, 'dosen', 1, 'Ruang kuliah tertata dengan bersih dan rapih', 'Tangibles'),
(74, 2, 'dosen', 2, 'Ruang kuliah dan dosen sejuk juga nyaman', 'Tangibles'),
(75, 2, 'dosen', 3, 'Sarana pembelajaran yang tersedia di ruangan kuliah', 'Tangibles'),
(76, 2, 'dosen', 4, 'POLINEMA memiliki perpustakaan yang lengkap', 'Reliability'),
(77, 2, 'dosen', 5, 'Ketersediaan buku referensi yang ada di perpustakaan POLINEMA', 'Reliability'),
(78, 2, 'dosen', 6, 'Ketersediaan fasilitas kamar kecil yang cukup dan bersih', 'Tangibles'),
(79, 2, 'dosen', 7, 'Ketersediaan fasilitas parkir yang cukup dan aman', 'Tangibles'),
(80, 2, 'dosen', 8, 'Ketersediaan fasilitas Poliklinik yang disediakan POLINEMA', 'Reliability'),
(81, 2, 'dosen', 9, 'Fasilitas ibadah yang dapat dipergunakan oleh dosen POLINEMA', 'Tangibles'),
(82, 3, 'dosen', 1, 'Pengelola sumber daya manusia mempunyai ketrampilan dalam menggunakan sumber daya alat yang tersedia', 'Tangibles'),
(83, 3, 'dosen', 2, 'Pengelola sumber daya manusia dibekali pengetahuan dalam menjalankan pelayanan yang diberikan', 'Reliability'),
(84, 3, 'dosen', 3, 'Pengelola sumber daya manusia ramah dalam memberikan pelayanan sesuai dengan kebutuhan', 'Empathy'),
(85, 3, 'dosen', 4, 'Pengelola sumber daya manusia dapat dipercaya dalam menjaga data pelanggan', 'Assurance'),
(86, 3, 'dosen', 5, 'Pengelola sumber daya manusia mudah ditemui', 'Tangibles'),
(87, 3, 'dosen', 6, 'Pengelola sumber daya manusia memberikan informasi yang cepat dan akurat', 'Responsiveness'),
(88, 3, 'dosen', 7, 'Pengelola sumber daya manusia tanggap mendengarkan saran dan keluhan pelanggan', 'Responsiveness'),
(89, 3, 'dosen', 8, 'Pengelola sumber daya manusia jujur dan bertanggung jawab terhadap pelayanan yang diberikan', 'Assurance'),
(90, 3, 'dosen', 9, 'Pengelola sumber daya manusia menggunakan bahasa yang mudah dipahami dan sopan dalam memberikan pelayanan sesuai dengan kebutuhan', 'Empathy'),
(91, 2, 'tendik', 1, 'Ruang tendik tertata dengan bersih dan rapih', 'Tangibles'),
(92, 2, 'tendik', 2, 'Ruang tendik sejuk juga nyaman', 'Tangibles'),
(93, 2, 'tendik', 3, 'Sarana dan prasarana di POLINEMA sangat mendukung pelaksanaan aktivitas pembelajaran dan perkantoran', 'Tangibles'),
(94, 2, 'tendik', 4, 'POLINEMA memiliki perpustakaan yang lengkap', 'Reliability'),
(95, 2, 'tendik', 5, 'Ketersediaan buku referensi yang ada di perpustakaan POLINEMA', 'Reliability'),
(96, 2, 'tendik', 6, 'Ketersediaan fasilitas kamar kecil yang cukup dan bersih', 'Tangibles'),
(97, 2, 'tendik', 7, 'Ketersediaan fasilitas parkir yang cukup dan aman', 'Tangibles'),
(98, 2, 'tendik', 8, 'Ketersediaan fasilitas Poliklinik yang disediakan POLINEMA', 'Reliability'),
(99, 2, 'tendik', 9, 'Fasilitas ibadah yang dapat dipergunakan oleh dosen/tendik POLINEMA', 'Tangibles'),
(100, 3, 'tendik', 1, 'Pengelola sumber daya manusia mempunyai ketrampilan dalam menggunakan sumber daya alat yang tersedia', 'Tangibles'),
(101, 3, 'tendik', 2, 'Pengelola sumber daya manusia dibekali pengetahuan dalam menjalankan pelayanan yang diberikan', 'Reliability'),
(102, 3, 'tendik', 3, 'Pengelola sumber daya manusia ramah dalam memberikan pelayanan sesuai dengan kebutuhan', 'Empathy'),
(103, 3, 'tendik', 4, 'Pengelola sumber daya manusia dapat dipercaya dalam menjaga data pelanggan', 'Assurance'),
(104, 3, 'tendik', 5, 'Pengelola sumber daya manusia mudah ditemui', 'Tangibles'),
(105, 3, 'tendik', 6, 'Pengelola sumber daya manusia memberikan informasi yang cepat dan akurat', 'Responsiveness'),
(106, 3, 'tendik', 7, 'Pengelola sumber daya manusia tanggap mendengarkan saran dan keluhan pelanggan', 'Responsiveness'),
(107, 3, 'tendik', 8, 'Pengelola sumber daya manusia jujur dan bertanggung jawab terhadap pelayanan yang diberikan', 'Assurance'),
(108, 3, 'tendik', 9, 'Pengelola sumber daya manusia menggunakan bahasa yang mudah dipahami dan sopan dalam memberikan pelayanan sesuai dengan kebutuhan', 'Empathy'),
(109, 1, 'alumni', 1, 'Seberapa jelas dan membantu penjelasan dari dosen selama perkuliahan di Polinema?', 'Assurance'),
(110, 1, 'alumni', 2, 'Bagaimana pengalaman Anda dalam mendapatkan bimbingan dari dosen terkait tugas akhir atau praktek lapangan?', 'Assurance'),
(111, 1, 'alumni', 3, 'Apakah fasilitas kesehatan di Polinema memadai untuk mendukung kesejahteraan mahasiswa selama Anda kuliah di sini?', 'Tangibles'),
(112, 1, 'alumni', 4, 'Seberapa baik akses Anda terhadap buku referensi di perpustakaan Polinema dalam mendukung pembelajaran Anda?', 'Tangibles'),
(113, 1, 'alumni', 5, 'Apakah buku pegangan akademik di Polinema membantu Anda memahami materi perkuliahan dengan lebih baik?', 'Tangibles'),
(114, 1, 'alumni', 6, 'Seberapa jelas buku pedoman akademik membantu Anda mempersiapkan diri untuk tugas akhir atau kerja lapangan?', 'Tangibles'),
(115, 2, 'alumni', 1, 'Bagaimana pendapat Anda tentang transparansi sosialisasi biaya pendidikan mahasiswa di POLINEMA?', 'Tangibles'),
(116, 2, 'alumni', 2, 'Apakah fasilitas laboratorium atau studio di POLINEMA mendukung kebutuhan akademik Anda?', 'Tangibles'),
(117, 2, 'alumni', 3, 'Seberapa penting menurut Anda kehadiran dosen tepat waktu dalam mengajar?', 'Tangibles'),
(118, 2, 'alumni', 4, 'Bagaimana pendapat Anda tentang kompetensi dosen dalam menyampaikan materi perkuliahan?', 'Assurance'),
(119, 2, 'alumni', 5, 'Apakah Anda merasa POLINEMA memperhatikan dan merespon baik terhadap permasalahan yang dihadapi mahasiswa?', 'Assurance'),
(120, 2, 'alumni', 6, 'Seberapa penting menurut Anda kebersihan dan kerapihan ruang kelas dalam mendukung proses belajar mengajar?', 'Tangibles'),
(121, 3, 'alumni', 1, 'Apakah Anda merasa terbantu dengan adanya waktu konsultasi bersama direktur Polinema dalam mengevaluasi kemajuan akademik Anda?', 'Assurance'),
(122, 3, 'alumni', 2, 'Bagaimana pengalaman Anda dalam menerima penilaian objektif dari dosen terhadap hasil karya akademik Anda?', 'Reliability'),
(123, 3, 'alumni', 3, 'Apakah Anda puas dengan layanan yang diberikan oleh staf akademik POLINEMA selama studi Anda di sini?', 'Assurance'),
(124, 3, 'alumni', 4, 'Seberapa responsif Polinema dalam membantu menyelesaikan masalah akademik mahasiswa?', 'Responsiveness'),
(125, 3, 'alumni', 5, 'Seberapa penting menurut Anda adanya jaminan kesehatan yang diberikan oleh POLINEMA kepada mahasiswa?', 'Assurance'),
(126, 3, 'alumni', 6, 'Seberapa informatif menurut Anda website POLINEMA dalam menyediakan informasi terkait layanan akademik dan non-akademik?', 'Tangibles'),
(127, 4, 'alumni', 1, 'Bagaimana pengalaman Anda dengan sikap berpikiran terbuka dan kooperatif dari dosen di POLINEMA?', 'Assurance'),
(128, 4, 'alumni', 2, 'Seberapa berguna menurut Anda program sertifikasi uji kompetensi profesional yang ditawarkan oleh POLINEMA?', 'Tangibles'),
(129, 4, 'alumni', 3, 'Bagaimana pengalaman Anda dengan respons POLINEMA terhadap keluhan atau masukan dari mahasiswa?', 'Responsiveness'),
(130, 4, 'alumni', 4, 'Seberapa efektif Polinema dalam membantu Anda memperoleh kesempatan kerja setelah lulus?', 'Assurance'),
(131, 4, 'alumni', 5, 'Apakah Anda merasa bantuan dari pembimbing di Polinema membantu Anda mengatasi tantangan akademik atau personal selama studi?', 'Assurance'),
(132, 4, 'alumni', 6, 'Seberapa baik fasilitas belajar mengajar di dalam kelas membantu Anda dalam memahami materi perkuliahan untuk menghadapi tantangan di dunia kerja?', 'Tangibles');

-- --------------------------------------------------------

--
-- Table structure for table `m_user`
--

CREATE TABLE `m_user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('alumni','dosen','industri','mahasiswa','orangtua','tendik','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `m_user`
--

INSERT INTO `m_user` (`user_id`, `username`, `password`, `role`) VALUES
(1, 'admin', '123', 'admin'),
(23, 'mahasiswa1', '123', 'mahasiswa'),
(35, 'mahasiswa2', '123', 'mahasiswa'),
(36, 'mahasiswa3', '123', 'mahasiswa'),
(37, 'mahasiswa4', '123', 'mahasiswa'),
(38, 'mahasiswa5', '123', 'mahasiswa'),
(39, 'mahasiswa6', '123', 'mahasiswa'),
(40, 'ortu1', '123', 'orangtua'),
(41, 'ortu2', '123', 'orangtua'),
(42, 'ortu3', '123', 'orangtua'),
(43, 'ortu4', '123', 'orangtua'),
(44, 'ortu5', '123', 'orangtua'),
(45, 'ortu6', '123', 'orangtua'),
(46, 'industri1', '123', 'industri'),
(47, 'industri2', '123', 'industri'),
(48, 'industri3', '123', 'industri'),
(49, 'industri4', '123', 'industri'),
(50, 'industri5', '123', 'industri'),
(51, 'industri6', '123', 'industri'),
(52, 'dosen1', '123', 'dosen'),
(53, 'dosen2', '123', 'dosen'),
(54, 'dosen3', '123', 'dosen'),
(55, 'dosen4', '123', 'dosen'),
(56, 'dosen5', '123', 'dosen'),
(57, 'dosen6', '123', 'dosen'),
(58, 'tendik1', '123', 'tendik'),
(59, 'tendik2', '123', 'tendik'),
(60, 'tendik3', '123', 'tendik'),
(61, 'tendik4', '123', 'tendik'),
(62, 'tendik5', '123', 'tendik'),
(63, 'tendik6', '123', 'tendik'),
(64, 'alumni1', '123', 'alumni'),
(65, 'alumni2', '123', 'alumni'),
(66, 'alumni3', '123', 'alumni'),
(67, 'alumni4', '123', 'alumni'),
(68, 'alumni5', '123', 'alumni'),
(69, 'alumni6', '123', 'alumni');

-- --------------------------------------------------------

--
-- Stand-in structure for view `normalisasi`
-- (See below for the actual view)
--
CREATE TABLE `normalisasi` (
`Kriteria` varchar(19)
,`Tangibles` double
,`Reliability` double
,`Responsiveness` double
,`Assurance` double
,`Empathy` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `normalisasi_x_bobot`
-- (See below for the actual view)
--
CREATE TABLE `normalisasi_x_bobot` (
`Kriteria` varchar(19)
,`Tangibles` double
,`Reliability` double
,`Responsiveness` double
,`Assurance` double
,`Empathy` double
,`total` double
);

-- --------------------------------------------------------

--
-- Table structure for table `t_jawaban_alumni`
--

CREATE TABLE `t_jawaban_alumni` (
  `jawaban_alumni_id` int(11) NOT NULL,
  `responden_alumni_id` int(11) NOT NULL,
  `soal_id` int(11) NOT NULL,
  `jawaban` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_jawaban_alumni`
--

INSERT INTO `t_jawaban_alumni` (`jawaban_alumni_id`, `responden_alumni_id`, `soal_id`, `jawaban`) VALUES
(1, 1, 109, '5'),
(2, 1, 110, '4'),
(3, 1, 111, '3'),
(4, 1, 112, '4'),
(5, 1, 113, '4'),
(6, 1, 114, '4'),
(7, 1, 115, '4'),
(8, 1, 116, '4'),
(9, 1, 117, '3'),
(10, 1, 118, '4'),
(11, 1, 119, '4'),
(12, 1, 120, '3'),
(13, 1, 121, '5'),
(14, 1, 122, '4'),
(15, 1, 123, '4'),
(16, 1, 124, '4'),
(17, 1, 125, '5'),
(18, 1, 126, '4'),
(19, 1, 127, '3'),
(20, 1, 128, '4'),
(21, 1, 129, '4'),
(22, 1, 130, '4'),
(23, 1, 131, '3'),
(24, 1, 132, '4'),
(25, 2, 109, '4'),
(26, 2, 110, '5'),
(27, 2, 111, '4'),
(28, 2, 112, '3'),
(29, 2, 113, '4'),
(30, 2, 114, '4'),
(31, 2, 115, '4'),
(32, 2, 116, '3'),
(33, 2, 117, '5'),
(34, 2, 118, '4'),
(35, 2, 119, '4'),
(36, 2, 120, '2'),
(37, 2, 121, '4'),
(38, 2, 122, '4'),
(39, 2, 123, '5'),
(40, 2, 124, '3'),
(41, 2, 125, '4'),
(42, 2, 126, '5'),
(43, 2, 127, '4'),
(44, 2, 128, '4'),
(45, 2, 129, '3'),
(46, 2, 130, '4'),
(47, 2, 131, '5'),
(48, 2, 132, '4'),
(49, 3, 109, '4'),
(50, 3, 110, '4'),
(51, 3, 111, '4'),
(52, 3, 112, '5'),
(53, 3, 113, '3'),
(54, 3, 114, '4'),
(55, 3, 115, '5'),
(56, 3, 116, '4'),
(57, 3, 117, '4'),
(58, 3, 118, '3'),
(59, 3, 119, '4'),
(60, 3, 120, '4'),
(61, 3, 121, '3'),
(62, 3, 122, '5'),
(63, 3, 123, '4'),
(64, 3, 124, '4'),
(65, 3, 125, '4'),
(66, 3, 126, '3'),
(67, 3, 127, '4'),
(68, 3, 128, '5'),
(69, 3, 129, '4'),
(70, 3, 130, '3'),
(71, 3, 131, '4'),
(72, 3, 132, '5'),
(73, 4, 109, '5'),
(74, 4, 110, '5'),
(75, 4, 111, '4'),
(76, 4, 112, '4'),
(77, 4, 113, '5'),
(78, 4, 114, '4'),
(79, 4, 115, '4'),
(80, 4, 116, '5'),
(81, 4, 117, '4'),
(82, 4, 118, '4'),
(83, 4, 119, '4'),
(84, 4, 120, '2'),
(85, 4, 121, '4'),
(86, 4, 122, '4'),
(87, 4, 123, '5'),
(88, 4, 124, '4'),
(89, 4, 125, '3'),
(90, 4, 126, '5'),
(91, 4, 127, '4'),
(92, 4, 128, '4'),
(93, 4, 129, '5'),
(94, 4, 130, '4'),
(95, 4, 131, '4'),
(96, 4, 132, '4'),
(97, 5, 109, '4'),
(98, 5, 110, '4'),
(99, 5, 111, '4'),
(100, 5, 112, '4'),
(101, 5, 113, '4'),
(102, 5, 114, '5'),
(103, 5, 115, '4'),
(104, 5, 116, '4'),
(105, 5, 117, '3'),
(106, 5, 118, '5'),
(107, 5, 119, '4'),
(108, 5, 120, '3'),
(109, 5, 121, '5'),
(110, 5, 122, '4'),
(111, 5, 123, '4'),
(112, 5, 124, '3'),
(113, 5, 125, '4'),
(114, 5, 126, '4'),
(115, 5, 127, '5'),
(116, 5, 128, '4'),
(117, 5, 129, '4'),
(118, 5, 130, '4'),
(119, 5, 131, '3'),
(120, 5, 132, '4'),
(121, 6, 109, '4'),
(122, 6, 110, '4'),
(123, 6, 111, '5'),
(124, 6, 112, '4'),
(125, 6, 113, '4'),
(126, 6, 114, '4'),
(127, 6, 115, '4'),
(128, 6, 116, '5'),
(129, 6, 117, '4'),
(130, 6, 118, '4'),
(131, 6, 119, '3'),
(132, 6, 120, '5'),
(133, 6, 121, '4'),
(134, 6, 122, '4'),
(135, 6, 123, '4'),
(136, 6, 124, '4'),
(137, 6, 125, '4'),
(138, 6, 126, '5'),
(139, 6, 127, '4'),
(140, 6, 128, '4'),
(141, 6, 129, '4'),
(142, 6, 130, '4'),
(143, 6, 131, '5'),
(144, 6, 132, '4');

-- --------------------------------------------------------

--
-- Table structure for table `t_jawaban_dosen`
--

CREATE TABLE `t_jawaban_dosen` (
  `jawaban_dosen_id` int(11) NOT NULL,
  `responden_dosen_id` int(11) NOT NULL,
  `soal_id` int(11) NOT NULL,
  `jawaban` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_jawaban_dosen`
--

INSERT INTO `t_jawaban_dosen` (`jawaban_dosen_id`, `responden_dosen_id`, `soal_id`, `jawaban`) VALUES
(1, 1, 73, '3'),
(2, 1, 74, '4'),
(3, 1, 75, '5'),
(4, 1, 76, '2'),
(5, 1, 77, '3'),
(6, 1, 78, '4'),
(7, 1, 79, '3'),
(8, 1, 80, '3'),
(9, 1, 81, '2'),
(10, 1, 82, '5'),
(11, 1, 83, '4'),
(12, 1, 84, '3'),
(13, 1, 85, '5'),
(14, 1, 86, '3'),
(15, 1, 87, '2'),
(16, 1, 88, '5'),
(17, 1, 89, '4'),
(18, 1, 90, '3'),
(19, 2, 73, '5'),
(20, 2, 74, '3'),
(21, 2, 75, '3'),
(22, 2, 76, '5'),
(23, 2, 77, '4'),
(24, 2, 78, '4'),
(25, 2, 79, '3'),
(26, 2, 80, '4'),
(27, 2, 81, '2'),
(28, 2, 82, '3'),
(29, 2, 83, '4'),
(30, 2, 84, '3'),
(31, 2, 85, '3'),
(32, 2, 86, '4'),
(33, 2, 87, '2'),
(34, 2, 88, '4'),
(35, 2, 89, '4'),
(36, 2, 90, '3'),
(37, 3, 73, '3'),
(38, 3, 74, '4'),
(39, 3, 75, '3'),
(40, 3, 76, '5'),
(41, 3, 77, '5'),
(42, 3, 78, '3'),
(43, 3, 79, '3'),
(44, 3, 80, '4'),
(45, 3, 81, '2'),
(46, 3, 82, '4'),
(47, 3, 83, '4'),
(48, 3, 84, '4'),
(49, 3, 85, '3'),
(50, 3, 86, '5'),
(51, 3, 87, '3'),
(52, 3, 88, '3'),
(53, 3, 89, '4'),
(54, 3, 90, '4'),
(55, 4, 73, '5'),
(56, 4, 74, '4'),
(57, 4, 75, '4'),
(58, 4, 76, '3'),
(59, 4, 77, '3'),
(60, 4, 78, '5'),
(61, 4, 79, '5'),
(62, 4, 80, '4'),
(63, 4, 81, '4'),
(64, 4, 82, '3'),
(65, 4, 83, '3'),
(66, 4, 84, '3'),
(67, 4, 85, '3'),
(68, 4, 86, '5'),
(69, 4, 87, '3'),
(70, 4, 88, '4'),
(71, 4, 89, '3'),
(72, 4, 90, '5'),
(73, 5, 73, '5'),
(74, 5, 74, '3'),
(75, 5, 75, '2'),
(76, 5, 76, '4'),
(77, 5, 77, '5'),
(78, 5, 78, '4'),
(79, 5, 79, '4'),
(80, 5, 80, '2'),
(81, 5, 81, '5'),
(82, 5, 82, '3'),
(83, 5, 83, '2'),
(84, 5, 84, '4'),
(85, 5, 85, '2'),
(86, 5, 86, '3'),
(87, 5, 87, '3'),
(88, 5, 88, '5'),
(89, 5, 89, '4'),
(90, 5, 90, '3'),
(91, 6, 73, '4'),
(92, 6, 74, '3'),
(93, 6, 75, '1'),
(94, 6, 76, '3'),
(95, 6, 77, '4'),
(96, 6, 78, '2'),
(97, 6, 79, '2'),
(98, 6, 80, '2'),
(99, 6, 81, '4'),
(100, 6, 82, '2'),
(101, 6, 83, '5'),
(102, 6, 84, '2'),
(103, 6, 85, '5'),
(104, 6, 86, '5'),
(105, 6, 87, '3'),
(106, 6, 88, '4'),
(107, 6, 89, '5'),
(108, 6, 90, '4');

-- --------------------------------------------------------

--
-- Table structure for table `t_jawaban_industri`
--

CREATE TABLE `t_jawaban_industri` (
  `jawaban_industri_id` int(11) NOT NULL,
  `responden_industri_id` int(11) NOT NULL,
  `soal_id` int(11) NOT NULL,
  `jawaban` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_jawaban_industri`
--

INSERT INTO `t_jawaban_industri` (`jawaban_industri_id`, `responden_industri_id`, `soal_id`, `jawaban`) VALUES
(1, 1, 19, '4'),
(2, 1, 20, '2'),
(3, 1, 21, '5'),
(4, 1, 22, '2'),
(5, 1, 23, '3'),
(6, 1, 24, '4'),
(7, 1, 25, '4'),
(8, 1, 26, '3'),
(9, 1, 27, '3'),
(10, 1, 28, '3'),
(11, 1, 29, '3'),
(12, 1, 30, '4'),
(13, 1, 31, '3'),
(14, 1, 32, '3'),
(15, 1, 33, '2'),
(16, 1, 34, '5'),
(17, 1, 35, '2'),
(18, 1, 36, '2'),
(19, 2, 19, '3'),
(20, 2, 20, '3'),
(21, 2, 21, '3'),
(22, 2, 22, '5'),
(23, 2, 23, '4'),
(24, 2, 24, '4'),
(25, 2, 25, '4'),
(26, 2, 26, '4'),
(27, 2, 27, '3'),
(28, 2, 28, '4'),
(29, 2, 29, '3'),
(30, 2, 30, '3'),
(31, 2, 31, '4'),
(32, 2, 32, '4'),
(33, 2, 33, '3'),
(34, 2, 34, '4'),
(35, 2, 35, '4'),
(36, 2, 36, '3'),
(37, 3, 19, '4'),
(38, 3, 20, '4'),
(39, 3, 21, '3'),
(40, 3, 22, '5'),
(41, 3, 23, '5'),
(42, 3, 24, '3'),
(43, 3, 25, '3'),
(44, 3, 26, '3'),
(45, 3, 27, '4'),
(46, 3, 28, '3'),
(47, 3, 29, '4'),
(48, 3, 30, '4'),
(49, 3, 31, '3'),
(50, 3, 32, '3'),
(51, 3, 33, '1'),
(52, 3, 34, '3'),
(53, 3, 35, '2'),
(54, 3, 36, '3'),
(55, 4, 19, '3'),
(56, 4, 20, '2'),
(57, 4, 21, '2'),
(58, 4, 22, '2'),
(59, 4, 23, '3'),
(60, 4, 24, '5'),
(61, 4, 25, '3'),
(62, 4, 26, '3'),
(63, 4, 27, '4'),
(64, 4, 28, '3'),
(65, 4, 29, '4'),
(66, 4, 30, '4'),
(67, 4, 31, '4'),
(68, 4, 32, '4'),
(69, 4, 33, '3'),
(70, 4, 34, '4'),
(71, 4, 35, '2'),
(72, 4, 36, '2'),
(73, 5, 19, '4'),
(74, 5, 20, '3'),
(75, 5, 21, '2'),
(76, 5, 22, '4'),
(77, 5, 23, '5'),
(78, 5, 24, '2'),
(79, 5, 25, '4'),
(80, 5, 26, '4'),
(81, 5, 27, '3'),
(82, 5, 28, '4'),
(83, 5, 29, '3'),
(84, 5, 30, '3'),
(85, 5, 31, '3'),
(86, 5, 32, '3'),
(87, 5, 33, '3'),
(88, 5, 34, '5'),
(89, 5, 35, '2'),
(90, 5, 36, '3'),
(91, 6, 19, '3'),
(92, 6, 20, '1'),
(93, 6, 21, '3'),
(94, 6, 22, '3'),
(95, 6, 23, '4'),
(96, 6, 24, '3'),
(97, 6, 25, '3'),
(98, 6, 26, '3'),
(99, 6, 27, '3'),
(100, 6, 28, '3'),
(101, 6, 29, '3'),
(102, 6, 30, '4'),
(103, 6, 31, '4'),
(104, 6, 32, '4'),
(105, 6, 33, '3'),
(106, 6, 34, '4'),
(107, 6, 35, '5'),
(108, 6, 36, '2');

-- --------------------------------------------------------

--
-- Table structure for table `t_jawaban_mahasiswa`
--

CREATE TABLE `t_jawaban_mahasiswa` (
  `jawaban_mahasiswa_id` int(11) NOT NULL,
  `responden_mahasiswa_id` int(11) NOT NULL,
  `soal_id` int(11) NOT NULL,
  `jawaban` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_jawaban_mahasiswa`
--

INSERT INTO `t_jawaban_mahasiswa` (`jawaban_mahasiswa_id`, `responden_mahasiswa_id`, `soal_id`, `jawaban`) VALUES
(1, 1, 37, '2'),
(2, 1, 38, '3'),
(3, 1, 39, '4'),
(4, 1, 40, '3'),
(5, 1, 41, '4'),
(6, 1, 42, '3'),
(7, 1, 43, '3'),
(8, 1, 44, '3'),
(9, 1, 45, '4'),
(10, 1, 46, '4'),
(11, 1, 47, '5'),
(12, 1, 48, '4'),
(13, 1, 49, '2'),
(14, 1, 50, '3'),
(15, 1, 51, '5'),
(16, 1, 52, '2'),
(17, 1, 53, '4'),
(18, 1, 54, '1'),
(19, 1, 55, '1'),
(20, 1, 56, '3'),
(21, 1, 57, '4'),
(22, 1, 58, '5'),
(23, 1, 59, '5'),
(24, 1, 60, '4'),
(25, 1, 61, '3'),
(26, 1, 62, '3'),
(27, 1, 63, '3'),
(28, 1, 64, '3'),
(29, 1, 65, '5'),
(30, 1, 66, '3'),
(31, 1, 67, '4'),
(32, 1, 68, '5'),
(33, 1, 69, '4'),
(34, 1, 70, '5'),
(35, 1, 71, '3'),
(36, 1, 72, '4'),
(37, 4, 37, '4'),
(38, 4, 38, '5'),
(39, 4, 39, '3'),
(40, 4, 40, '3'),
(41, 4, 41, '1'),
(42, 4, 42, '3'),
(43, 4, 43, '4'),
(44, 4, 44, '3'),
(45, 4, 45, '1'),
(46, 4, 46, '5'),
(47, 4, 47, '4'),
(48, 4, 48, '1'),
(49, 4, 49, '2'),
(50, 4, 50, '3'),
(51, 4, 51, '2'),
(52, 4, 52, '3'),
(53, 4, 53, '5'),
(54, 4, 54, '5'),
(55, 4, 55, '2'),
(56, 4, 56, '3'),
(57, 4, 57, '3'),
(58, 4, 58, '3'),
(59, 4, 59, '3'),
(60, 4, 60, '1'),
(61, 4, 61, '5'),
(62, 4, 62, '1'),
(63, 4, 63, '2'),
(64, 4, 64, '3'),
(65, 4, 65, '4'),
(66, 4, 66, '3'),
(67, 4, 67, '4'),
(68, 4, 68, '3'),
(69, 4, 69, '5'),
(70, 4, 70, '4'),
(71, 4, 71, '4'),
(72, 4, 72, '5'),
(73, 5, 37, '2'),
(74, 5, 38, '2'),
(75, 5, 39, '3'),
(76, 5, 40, '5'),
(77, 5, 41, '4'),
(78, 5, 42, '1'),
(79, 5, 43, '4'),
(80, 5, 44, '4'),
(81, 5, 45, '3'),
(82, 5, 46, '1'),
(83, 5, 47, '3'),
(84, 5, 48, '5'),
(85, 5, 49, '2'),
(86, 5, 50, '2'),
(87, 5, 51, '1'),
(88, 5, 52, '4'),
(89, 5, 53, '4'),
(90, 5, 54, '5'),
(91, 5, 55, '1'),
(92, 5, 56, '4'),
(93, 5, 57, '4'),
(94, 5, 58, '3'),
(95, 5, 59, '4'),
(96, 5, 60, '2'),
(97, 5, 61, '3'),
(98, 5, 62, '2'),
(99, 5, 63, '4'),
(100, 5, 64, '1'),
(101, 5, 65, '2'),
(102, 5, 66, '1'),
(103, 5, 67, '4'),
(104, 5, 68, '4'),
(105, 5, 69, '1'),
(106, 5, 70, '1'),
(107, 5, 71, '5'),
(108, 5, 72, '4'),
(109, 6, 37, '2'),
(110, 6, 38, '1'),
(111, 6, 39, '3'),
(112, 6, 40, '3'),
(113, 6, 41, '3'),
(114, 6, 42, '3'),
(115, 6, 43, '1'),
(116, 6, 44, '5'),
(117, 6, 45, '5'),
(118, 6, 46, '1'),
(119, 6, 47, '1'),
(120, 6, 48, '3'),
(121, 6, 49, '1'),
(122, 6, 50, '5'),
(123, 6, 51, '1'),
(124, 6, 52, '2'),
(125, 6, 53, '5'),
(126, 6, 54, '4'),
(127, 6, 55, '1'),
(128, 6, 56, '4'),
(129, 6, 57, '4'),
(130, 6, 58, '3'),
(131, 6, 59, '5'),
(132, 6, 60, '4'),
(133, 6, 61, '3'),
(134, 6, 62, '2'),
(135, 6, 63, '2'),
(136, 6, 64, '5'),
(137, 6, 65, '3'),
(138, 6, 66, '5'),
(139, 6, 67, '3'),
(140, 6, 68, '4'),
(141, 6, 69, '5'),
(142, 6, 70, '1'),
(143, 6, 71, '5'),
(144, 6, 72, '2'),
(145, 7, 37, '3'),
(146, 7, 38, '3'),
(147, 7, 39, '3'),
(148, 7, 40, '1'),
(149, 7, 41, '5'),
(150, 7, 42, '1'),
(151, 7, 43, '3'),
(152, 7, 44, '3'),
(153, 7, 45, '4'),
(154, 7, 46, '1'),
(155, 7, 47, '5'),
(156, 7, 48, '5'),
(157, 7, 49, '3'),
(158, 7, 50, '5'),
(159, 7, 51, '5'),
(160, 7, 52, '5'),
(161, 7, 53, '4'),
(162, 7, 54, '1'),
(163, 7, 55, '2'),
(164, 7, 56, '2'),
(165, 7, 57, '3'),
(166, 7, 58, '1'),
(167, 7, 59, '4'),
(168, 7, 60, '1'),
(169, 7, 61, '4'),
(170, 7, 62, '4'),
(171, 7, 63, '2'),
(172, 7, 64, '4'),
(173, 7, 65, '5'),
(174, 7, 66, '3'),
(175, 7, 67, '3'),
(176, 7, 68, '5'),
(177, 7, 69, '3'),
(178, 7, 70, '5'),
(179, 7, 71, '5'),
(180, 7, 72, '3'),
(181, 8, 37, '3'),
(182, 8, 38, '3'),
(183, 8, 39, '4'),
(184, 8, 40, '5'),
(185, 8, 41, '2'),
(186, 8, 42, '4'),
(187, 8, 43, '3'),
(188, 8, 44, '1'),
(189, 8, 45, '1'),
(190, 8, 46, '1'),
(191, 8, 47, '2'),
(192, 8, 48, '2'),
(193, 8, 49, '4'),
(194, 8, 50, '2'),
(195, 8, 51, '5'),
(196, 8, 52, '2'),
(197, 8, 53, '5'),
(198, 8, 54, '3'),
(199, 8, 55, '1'),
(200, 8, 56, '5'),
(201, 8, 57, '3'),
(202, 8, 58, '4'),
(203, 8, 59, '2'),
(204, 8, 60, '4'),
(205, 8, 61, '4'),
(206, 8, 62, '3'),
(207, 8, 63, '5'),
(208, 8, 64, '2'),
(209, 8, 65, '2'),
(210, 8, 66, '3'),
(211, 8, 67, '3'),
(212, 8, 68, '2'),
(213, 8, 69, '1'),
(214, 8, 70, '4'),
(215, 8, 71, '3'),
(216, 8, 72, '2');

-- --------------------------------------------------------

--
-- Table structure for table `t_jawaban_ortu`
--

CREATE TABLE `t_jawaban_ortu` (
  `jawaban_ortu_id` int(11) NOT NULL,
  `responden_ortu_id` int(11) NOT NULL,
  `soal_id` int(11) NOT NULL,
  `jawaban` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_jawaban_ortu`
--

INSERT INTO `t_jawaban_ortu` (`jawaban_ortu_id`, `responden_ortu_id`, `soal_id`, `jawaban`) VALUES
(1, 4, 1, '3'),
(2, 4, 2, '2'),
(3, 4, 3, '5'),
(4, 4, 4, '2'),
(5, 4, 5, '3'),
(6, 4, 6, '4'),
(7, 4, 7, '3'),
(8, 4, 8, '3'),
(9, 4, 9, '2'),
(10, 4, 10, '4'),
(11, 4, 11, '4'),
(12, 4, 12, '3'),
(13, 4, 13, '5'),
(14, 4, 14, '3'),
(15, 4, 15, '2'),
(16, 4, 16, '5'),
(17, 4, 17, '2'),
(18, 4, 18, '2'),
(19, 5, 1, '5'),
(20, 5, 2, '3'),
(21, 5, 3, '3'),
(22, 5, 4, '5'),
(23, 5, 5, '4'),
(24, 5, 6, '4'),
(25, 5, 7, '3'),
(26, 5, 8, '1'),
(27, 5, 9, '2'),
(28, 5, 10, '3'),
(29, 5, 11, '1'),
(30, 5, 12, '3'),
(31, 5, 13, '1'),
(32, 5, 14, '4'),
(33, 5, 15, '3'),
(34, 5, 16, '4'),
(35, 5, 17, '4'),
(36, 5, 18, '3'),
(37, 6, 1, '3'),
(38, 6, 2, '4'),
(39, 6, 3, '3'),
(40, 6, 4, '5'),
(41, 6, 5, '5'),
(42, 6, 6, '3'),
(43, 6, 7, '3'),
(44, 6, 8, '4'),
(45, 6, 9, '2'),
(46, 6, 10, '4'),
(47, 6, 11, '4'),
(48, 6, 12, '4'),
(49, 6, 13, '3'),
(50, 6, 14, '5'),
(51, 6, 15, '1'),
(52, 6, 16, '3'),
(53, 6, 17, '2'),
(54, 6, 18, '3'),
(55, 7, 1, '5'),
(56, 7, 2, '2'),
(57, 7, 3, '2'),
(58, 7, 4, '2'),
(59, 7, 5, '3'),
(60, 7, 6, '5'),
(61, 7, 7, '5'),
(62, 7, 8, '4'),
(63, 7, 9, '4'),
(64, 7, 10, '3'),
(65, 7, 11, '3'),
(66, 7, 12, '3'),
(67, 7, 13, '3'),
(68, 7, 14, '5'),
(69, 7, 15, '3'),
(70, 7, 16, '4'),
(71, 7, 17, '3'),
(72, 7, 18, '2'),
(73, 8, 1, '5'),
(74, 8, 2, '3'),
(75, 8, 3, '2'),
(76, 8, 4, '4'),
(77, 8, 5, '5'),
(78, 8, 6, '4'),
(79, 8, 7, '4'),
(80, 8, 8, '2'),
(81, 8, 9, '5'),
(82, 8, 10, '1'),
(83, 8, 11, '2'),
(84, 8, 12, '4'),
(85, 8, 13, '2'),
(86, 8, 14, '3'),
(87, 8, 15, '3'),
(88, 8, 16, '5'),
(89, 8, 17, '2'),
(90, 8, 18, '3'),
(91, 9, 1, '4'),
(92, 9, 2, '3'),
(93, 9, 3, '1'),
(94, 9, 4, '3'),
(95, 9, 5, '4'),
(96, 9, 6, '4'),
(97, 9, 7, '2'),
(98, 9, 8, '2'),
(99, 9, 9, '4'),
(100, 9, 10, '2'),
(101, 9, 11, '5'),
(102, 9, 12, '3'),
(103, 9, 13, '5'),
(104, 9, 14, '5'),
(105, 9, 15, '3'),
(106, 9, 16, '4'),
(107, 9, 17, '5'),
(108, 9, 18, '2');

-- --------------------------------------------------------

--
-- Table structure for table `t_jawaban_tendik`
--

CREATE TABLE `t_jawaban_tendik` (
  `jawaban_tendik_id` int(11) NOT NULL,
  `responden_tendik_id` int(11) NOT NULL,
  `soal_id` int(11) NOT NULL,
  `jawaban` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_jawaban_tendik`
--

INSERT INTO `t_jawaban_tendik` (`jawaban_tendik_id`, `responden_tendik_id`, `soal_id`, `jawaban`) VALUES
(1, 1, 91, '3'),
(2, 1, 92, '2'),
(3, 1, 93, '5'),
(4, 1, 94, '2'),
(5, 1, 95, '3'),
(6, 1, 96, '4'),
(7, 1, 97, '3'),
(8, 1, 98, '3'),
(9, 1, 99, '2'),
(10, 1, 100, '1'),
(11, 1, 101, '4'),
(12, 1, 102, '3'),
(13, 1, 103, '5'),
(14, 1, 104, '3'),
(15, 1, 105, '2'),
(16, 1, 106, '5'),
(17, 1, 107, '2'),
(18, 1, 108, '2'),
(19, 2, 91, '5'),
(20, 2, 92, '3'),
(21, 2, 93, '3'),
(22, 2, 94, '5'),
(23, 2, 95, '4'),
(24, 2, 96, '4'),
(25, 2, 97, '3'),
(26, 2, 98, '1'),
(27, 2, 99, '2'),
(28, 2, 100, '3'),
(29, 2, 101, '1'),
(30, 2, 102, '3'),
(31, 2, 103, '1'),
(32, 2, 104, '4'),
(33, 2, 105, '3'),
(34, 2, 106, '4'),
(35, 2, 107, '4'),
(36, 2, 108, '3'),
(37, 3, 91, '3'),
(38, 3, 92, '4'),
(39, 3, 93, '3'),
(40, 3, 94, '5'),
(41, 3, 95, '5'),
(42, 3, 96, '3'),
(43, 3, 97, '3'),
(44, 3, 98, '4'),
(45, 3, 99, '2'),
(46, 3, 100, '4'),
(47, 3, 101, '4'),
(48, 3, 102, '4'),
(49, 3, 103, '3'),
(50, 3, 104, '5'),
(51, 3, 105, '1'),
(52, 3, 106, '1'),
(53, 3, 107, '2'),
(54, 3, 108, '3'),
(55, 4, 91, '5'),
(56, 4, 92, '2'),
(57, 4, 93, '2'),
(58, 4, 94, '2'),
(59, 4, 95, '3'),
(60, 4, 96, '5'),
(61, 4, 97, '5'),
(62, 4, 98, '4'),
(63, 4, 99, '4'),
(64, 4, 100, '3'),
(65, 4, 101, '3'),
(66, 4, 102, '3'),
(67, 4, 103, '1'),
(68, 4, 104, '5'),
(69, 4, 105, '3'),
(70, 4, 106, '4'),
(71, 4, 107, '3'),
(72, 4, 108, '2'),
(73, 5, 91, '5'),
(74, 5, 92, '3'),
(75, 5, 93, '2'),
(76, 5, 94, '4'),
(77, 5, 95, '5'),
(78, 5, 96, '1'),
(79, 5, 97, '4'),
(80, 5, 98, '2'),
(81, 5, 99, '5'),
(82, 5, 100, '1'),
(83, 5, 101, '2'),
(84, 5, 102, '4'),
(85, 5, 103, '2'),
(86, 5, 104, '3'),
(87, 5, 105, '3'),
(88, 5, 106, '5'),
(89, 5, 107, '2'),
(90, 5, 108, '3'),
(91, 6, 91, '4'),
(92, 6, 92, '1'),
(93, 6, 93, '1'),
(94, 6, 94, '3'),
(95, 6, 95, '4'),
(96, 6, 96, '1'),
(97, 6, 97, '2'),
(98, 6, 98, '2'),
(99, 6, 99, '4'),
(100, 6, 100, '2'),
(101, 6, 101, '5'),
(102, 6, 102, '1'),
(103, 6, 103, '5'),
(104, 6, 104, '5'),
(105, 6, 105, '3'),
(106, 6, 106, '4'),
(107, 6, 107, '5'),
(108, 6, 108, '2');

-- --------------------------------------------------------

--
-- Table structure for table `t_responden_alumni`
--

CREATE TABLE `t_responden_alumni` (
  `responden_alumni_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `responden_nim` varchar(20) NOT NULL,
  `responden_nama` varchar(50) NOT NULL,
  `responden_prodi` varchar(100) NOT NULL,
  `responden_email` varchar(100) NOT NULL,
  `responden_hp` varchar(20) NOT NULL,
  `tahun_lulus` year(4) NOT NULL,
  `responden_tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_responden_alumni`
--

INSERT INTO `t_responden_alumni` (`responden_alumni_id`, `user_id`, `responden_nim`, `responden_nama`, `responden_prodi`, `responden_email`, `responden_hp`, `tahun_lulus`, `responden_tanggal`) VALUES
(1, 64, '2241000001', 'alumni 1', 'prodi alumni 1', 'alumni1@gmail.com', '0812345', '2024', '2024-06-21 18:54:59'),
(2, 65, '2241000002', 'alumni 2', 'prodi alumni 2', 'alumni2@gmail.com', '0812345', '2024', '2024-06-21 18:54:59'),
(3, 66, '2241000003', 'alumni 3', 'prodi alumni 3', 'alumni3@gmail.com', '0812345', '2024', '2024-06-21 18:54:59'),
(4, 67, '2241000004', 'alumni 4', 'prodi alumni 4', 'alumni4@gmail.com', '0812345', '2024', '2024-06-21 18:54:59'),
(5, 68, '2241000005', 'alumni 5', 'prodi alumni 5', 'alumni5@gmail.com', '0812345', '2024', '2024-06-21 18:54:59'),
(6, 69, '2241000006', 'alumni 6', 'prodi alumni 6', 'alumni6@gmail.com', '0812345', '2024', '2024-06-21 18:54:59');

-- --------------------------------------------------------

--
-- Table structure for table `t_responden_dosen`
--

CREATE TABLE `t_responden_dosen` (
  `responden_dosen_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `responden_nip` varchar(20) NOT NULL,
  `responden_nama` varchar(50) NOT NULL,
  `responden_unit` varchar(50) NOT NULL,
  `responden_tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_responden_dosen`
--

INSERT INTO `t_responden_dosen` (`responden_dosen_id`, `user_id`, `responden_nip`, `responden_nama`, `responden_unit`, `responden_tanggal`) VALUES
(1, 52, '12345', 'dosen 1', 'unit dosen 1', '2024-06-21 18:58:44'),
(2, 53, '12345', 'dosen 2', 'unit dosen 2', '2024-06-21 18:58:44'),
(3, 54, '12345', 'dosen 3', 'unit dosen 3', '2024-06-21 18:58:44'),
(4, 55, '12345', 'dosen 4', 'unit dosen 4', '2024-06-21 18:58:44'),
(5, 56, '12345', 'dosen 5', 'unit dosen 5', '2024-06-21 18:58:44'),
(6, 57, '12345', 'dosen 6', 'unit dosen 6', '2024-06-21 18:58:44');

-- --------------------------------------------------------

--
-- Table structure for table `t_responden_industri`
--

CREATE TABLE `t_responden_industri` (
  `responden_industri_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `responden_nama` varchar(50) NOT NULL,
  `responden_jabatan` varchar(50) NOT NULL,
  `responden_perusahaan` varchar(50) NOT NULL,
  `responden_email` varchar(100) NOT NULL,
  `responden_hp` varchar(20) NOT NULL,
  `responden_kota` varchar(50) NOT NULL,
  `responden_tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_responden_industri`
--

INSERT INTO `t_responden_industri` (`responden_industri_id`, `user_id`, `responden_nama`, `responden_jabatan`, `responden_perusahaan`, `responden_email`, `responden_hp`, `responden_kota`, `responden_tanggal`) VALUES
(1, 46, 'industri 1', 'jabatan 1', 'perusahaan 1', 'industri1@gmail.com', '0812345', 'kota 1', '2024-06-21 19:00:57'),
(2, 47, 'industri 2', 'jabatan 2', 'perusahaan 2', 'industri2@gmail.com', '0812345', 'kota 2', '2024-06-21 19:00:57'),
(3, 48, 'industri 3', 'jabatan 3', 'perusahaan 3', 'industri3@gmail.com', '0812345', 'kota 3', '2024-06-21 19:00:57'),
(4, 49, 'industri 4', 'jabatan 4', 'perusahaan 4', 'industri4@gmail.com', '0812345', 'kota 4', '2024-06-21 19:00:57'),
(5, 50, 'industri 5', 'jabatan 5', 'perusahaan 5', 'industri5@gmail.com', '0812345', 'kota 5', '2024-06-21 19:00:57'),
(6, 51, 'industri 6', 'jabatan 6', 'perusahaan 6', 'industri6@gmail.com', '0812345', 'kota 6', '2024-06-21 19:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `t_responden_mahasiswa`
--

CREATE TABLE `t_responden_mahasiswa` (
  `responden_mahasiswa_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `responden_nim` varchar(20) NOT NULL,
  `responden_nama` varchar(50) NOT NULL,
  `responden_prodi` varchar(100) NOT NULL,
  `responden_email` varchar(100) NOT NULL,
  `responden_hp` varchar(20) NOT NULL,
  `tahun_masuk` varchar(4) NOT NULL,
  `responden_tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_responden_mahasiswa`
--

INSERT INTO `t_responden_mahasiswa` (`responden_mahasiswa_id`, `user_id`, `responden_nim`, `responden_nama`, `responden_prodi`, `responden_email`, `responden_hp`, `tahun_masuk`, `responden_tanggal`) VALUES
(1, 23, '2241760128', 'Muhammad Iyazuz Zidan ', 'D4 SISTEM INFORMASI BISNIS', 'iyazuzzidan@gmail.com', '085954546609', '2022', '2024-06-05 20:03:16'),
(4, 35, '2241760026', 'Siti Faiqoh', 'D4 SISTEM INFORMASI BISNIS', 'mhs@gmail.com', '08123', '2022', '2024-06-21 23:36:16'),
(5, 36, '224100003', 'Afifah Ida', 'D4 SISTEM INFORMASI BISNIS', 'mhs@gmail.com', '0812345', '2022', '2024-06-21 18:49:33'),
(6, 37, '224100004', 'mahasiswa 4', 'prodi mahasiswa 4 ', 'mhs4@gmail.com', '0812345', '2022', '2024-06-21 18:49:33'),
(7, 38, '224100005', 'mahasiswa 5', 'prodi mahasiswa 4 ', 'mhs4@gmail.com', '0812345', '2022', '2024-06-21 18:49:33'),
(8, 39, '224100006', 'mahasiswa 6', 'prodi mahasiswa 4 ', 'mhs4@gmail.com', '0812345', '2022', '2024-06-21 18:49:33');

-- --------------------------------------------------------

--
-- Table structure for table `t_responden_ortu`
--

CREATE TABLE `t_responden_ortu` (
  `responden_ortu_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `responden_nama` varchar(50) NOT NULL,
  `responden_jk` enum('L','P') NOT NULL,
  `responden_umur` tinyint(4) NOT NULL,
  `responden_hp` varchar(20) NOT NULL,
  `responden_pendidikan` varchar(30) NOT NULL,
  `responden_pekerjaan` varchar(50) NOT NULL,
  `responden_penghasilan` varchar(20) NOT NULL,
  `mahasiswa_nim` varchar(20) NOT NULL,
  `mahasiswa_nama` varchar(50) NOT NULL,
  `mahasiswa_prodi` varchar(100) NOT NULL,
  `responden_tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_responden_ortu`
--

INSERT INTO `t_responden_ortu` (`responden_ortu_id`, `user_id`, `responden_nama`, `responden_jk`, `responden_umur`, `responden_hp`, `responden_pendidikan`, `responden_pekerjaan`, `responden_penghasilan`, `mahasiswa_nim`, `mahasiswa_nama`, `mahasiswa_prodi`, `responden_tanggal`) VALUES
(4, 40, 'ortu 1', 'L', 41, '0812345', 'pendidikan ortu 1', 'pekerjaan ortu 1', '4000000', '22410001', 'mhs ortu 1', 'prodi mhs ortu 1', '2024-06-21 19:17:17'),
(5, 41, 'ortu 2', 'L', 42, '0812345', 'pendidikan ortu 2', 'pekerjaan ortu 2', '1000000', '22410002', 'mhs ortu 2', 'prodi mhs ortu 2', '2024-06-21 19:17:17'),
(6, 42, 'ortu 3', 'L', 43, '0812345', 'pendidikan ortu 3', 'pekerjaan ortu 3', '4000000', '22410003', 'mhs ortu 3', 'prodi mhs ortu 3', '2024-06-21 19:17:17'),
(7, 43, 'ortu 4', 'L', 44, '0812345', 'pendidikan ortu 4', 'pekerjaan ortu 4', '4000000', '22410004', 'mhs ortu 4', 'prodi mhs ortu 4', '2024-06-21 19:17:17'),
(8, 44, 'ortu 5', 'L', 45, '0812345', 'pendidikan ortu 5', 'pekerjaan ortu 5', '4000000', '22410005', 'mhs ortu 5', 'prodi mhs ortu 5', '2024-06-21 19:17:17'),
(9, 45, 'ortu 6', 'L', 46, '0812345', 'pendidikan ortu 6', 'pekerjaan ortu 6', '4000000', '22410006', 'mhs ortu 6', 'prodi mhs ortu 6', '2024-06-21 19:17:17');

-- --------------------------------------------------------

--
-- Table structure for table `t_responden_tendik`
--

CREATE TABLE `t_responden_tendik` (
  `responden_tendik_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `responden_nopeg` varchar(20) NOT NULL,
  `responden_nama` varchar(50) NOT NULL,
  `responden_unit` varchar(50) NOT NULL,
  `responden_tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_responden_tendik`
--

INSERT INTO `t_responden_tendik` (`responden_tendik_id`, `user_id`, `responden_nopeg`, `responden_nama`, `responden_unit`, `responden_tanggal`) VALUES
(1, 58, '1234', 'tendik 1', 'unit tendik 1', '2024-06-21 19:04:14'),
(2, 59, '1234', 'tendik 2', 'unit tendik 2', '2024-06-21 19:04:14'),
(3, 60, '1234', 'tendik 3', 'unit tendik 3', '2024-06-21 19:04:14'),
(4, 61, '1234', 'tendik 4', 'unit tendik 4', '2024-06-21 19:04:14'),
(5, 62, '1234', 'tendik 5', 'unit tendik 5', '2024-06-21 19:04:14'),
(6, 63, '1234', 'tendik 6', 'unit tendik 6', '2024-06-21 19:04:14');

-- --------------------------------------------------------

--
-- Structure for view `average`
--
DROP TABLE IF EXISTS `average`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `average`  AS SELECT 'Kualitas Pendidikan' AS `Alternatif_Kategori`, avg(ifnull(`ja`.`jawaban`,0)) AS `K1_Tangibles`, avg(ifnull(`jd`.`jawaban`,0)) AS `K2_Relaiability`, avg(ifnull(`ji`.`jawaban`,0)) AS `K3_Responsiveness`, avg(ifnull(`jo`.`jawaban`,0)) AS `K4_Assurance`, avg(ifnull(`jm`.`jawaban`,0)) AS `K5_Empathy` FROM ((((((select `m_survey_soal`.`soal_id` AS `soal_id` from `m_survey_soal` where `m_survey_soal`.`kriteria` = 'Tangibles') `s1` left join `t_jawaban_alumni` `ja` on(`s1`.`soal_id` = `ja`.`soal_id`)) left join `t_jawaban_dosen` `jd` on(`s1`.`soal_id` = `jd`.`soal_id`)) left join `t_jawaban_industri` `ji` on(`s1`.`soal_id` = `ji`.`soal_id`)) left join `t_jawaban_ortu` `jo` on(`s1`.`soal_id` = `jo`.`soal_id`)) left join `t_jawaban_mahasiswa` `jm` on(`s1`.`soal_id` = `jm`.`soal_id`))union all select 'Fasilitas' AS `Alternatif_Kategori`,avg(ifnull(`ja`.`jawaban`,0)) AS `K1_Tangibles`,avg(ifnull(`jd`.`jawaban`,0)) AS `K2_Relaiability`,avg(ifnull(`ji`.`jawaban`,0)) AS `K3_Responsiveness`,avg(ifnull(`jo`.`jawaban`,0)) AS `K4_Assurance`,avg(ifnull(`jm`.`jawaban`,0)) AS `K5_Empathy` from ((((((select `m_survey_soal`.`soal_id` AS `soal_id` from `m_survey_soal` where `m_survey_soal`.`kriteria` = 'Reliability') `s2` left join `t_jawaban_alumni` `ja` on(`s2`.`soal_id` = `ja`.`soal_id`)) left join `t_jawaban_dosen` `jd` on(`s2`.`soal_id` = `jd`.`soal_id`)) left join `t_jawaban_industri` `ji` on(`s2`.`soal_id` = `ji`.`soal_id`)) left join `t_jawaban_ortu` `jo` on(`s2`.`soal_id` = `jo`.`soal_id`)) left join `t_jawaban_mahasiswa` `jm` on(`s2`.`soal_id` = `jm`.`soal_id`)) union all select 'Pelayanan' AS `Alternatif_Kategori`,avg(ifnull(`ja`.`jawaban`,0)) AS `K1_Tangibles`,avg(ifnull(`jd`.`jawaban`,0)) AS `K2_Relaiability`,avg(ifnull(`ji`.`jawaban`,0)) AS `K3_Responsiveness`,avg(ifnull(`jo`.`jawaban`,0)) AS `K4_Assurance`,avg(ifnull(`jm`.`jawaban`,0)) AS `K5_Empathy` from ((((((select `m_survey_soal`.`soal_id` AS `soal_id` from `m_survey_soal` where `m_survey_soal`.`kriteria` = 'Responsiveness') `s3` left join `t_jawaban_alumni` `ja` on(`s3`.`soal_id` = `ja`.`soal_id`)) left join `t_jawaban_dosen` `jd` on(`s3`.`soal_id` = `jd`.`soal_id`)) left join `t_jawaban_industri` `ji` on(`s3`.`soal_id` = `ji`.`soal_id`)) left join `t_jawaban_ortu` `jo` on(`s3`.`soal_id` = `jo`.`soal_id`)) left join `t_jawaban_mahasiswa` `jm` on(`s3`.`soal_id` = `jm`.`soal_id`)) union all select 'Lulusan' AS `Alternatif_Kategori`,avg(ifnull(`ja`.`jawaban`,0)) AS `K1_Tangibles`,avg(ifnull(`jd`.`jawaban`,0)) AS `K2_Relaiability`,avg(ifnull(`ji`.`jawaban`,0)) AS `K3_Responsiveness`,avg(ifnull(`jo`.`jawaban`,0)) AS `K4_Assurance`,avg(ifnull(`jm`.`jawaban`,0)) AS `K5_Empathy` from ((((((select `m_survey_soal`.`soal_id` AS `soal_id` from `m_survey_soal` where `m_survey_soal`.`kriteria` = 'Assurance') `s4` left join `t_jawaban_alumni` `ja` on(`s4`.`soal_id` = `ja`.`soal_id`)) left join `t_jawaban_dosen` `jd` on(`s4`.`soal_id` = `jd`.`soal_id`)) left join `t_jawaban_industri` `ji` on(`s4`.`soal_id` = `ji`.`soal_id`)) left join `t_jawaban_ortu` `jo` on(`s4`.`soal_id` = `jo`.`soal_id`)) left join `t_jawaban_mahasiswa` `jm` on(`s4`.`soal_id` = `jm`.`soal_id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `maxaverage`
--
DROP TABLE IF EXISTS `maxaverage`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `maxaverage`  AS SELECT 'MAX' AS `Kriteria`, max(`average`.`K1_Tangibles`) AS `Tangibles`, max(`average`.`K2_Relaiability`) AS `Reliability`, max(`average`.`K3_Responsiveness`) AS `Responsiveness`, max(`average`.`K4_Assurance`) AS `Assurance`, max(`average`.`K5_Empathy`) AS `Empathy` FROM `average` ;

-- --------------------------------------------------------

--
-- Structure for view `normalisasi`
--
DROP TABLE IF EXISTS `normalisasi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `normalisasi`  AS SELECT `avg`.`Alternatif_Kategori` AS `Kriteria`, `avg`.`K1_Tangibles`/ `max_avg`.`Tangibles` AS `Tangibles`, `avg`.`K2_Relaiability`/ `max_avg`.`Reliability` AS `Reliability`, `avg`.`K3_Responsiveness`/ `max_avg`.`Responsiveness` AS `Responsiveness`, `avg`.`K4_Assurance`/ `max_avg`.`Assurance` AS `Assurance`, `avg`.`K5_Empathy`/ `max_avg`.`Empathy` AS `Empathy` FROM (`average` `avg` join `maxaverage` `max_avg`) ;

-- --------------------------------------------------------

--
-- Structure for view `normalisasi_x_bobot`
--
DROP TABLE IF EXISTS `normalisasi_x_bobot`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `normalisasi_x_bobot`  AS SELECT `n`.`Kriteria` AS `Kriteria`, `n`.`Tangibles`* 0.2 AS `Tangibles`, `n`.`Reliability`* 0.2 AS `Reliability`, `n`.`Responsiveness`* 0.2 AS `Responsiveness`, `n`.`Assurance`* 0.2 AS `Assurance`, `n`.`Empathy`* 0.2 AS `Empathy`, `n`.`Tangibles`* 0.2 + `n`.`Reliability` * 0.2 + `n`.`Responsiveness` * 0.2 + `n`.`Assurance` * 0.2 + `n`.`Empathy` * 0.2 AS `total` FROM `normalisasi` AS `n` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bobot`
--
ALTER TABLE `bobot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_kategori`
--
ALTER TABLE `m_kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `m_survey`
--
ALTER TABLE `m_survey`
  ADD PRIMARY KEY (`survey_id`),
  ADD KEY `user_id` (`user_id`,`soal_id`,`kategori_id`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `soal_id` (`soal_id`);

--
-- Indexes for table `m_survey_soal`
--
ALTER TABLE `m_survey_soal`
  ADD PRIMARY KEY (`soal_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `t_jawaban_alumni`
--
ALTER TABLE `t_jawaban_alumni`
  ADD PRIMARY KEY (`jawaban_alumni_id`),
  ADD KEY `responden_alumni_id` (`responden_alumni_id`,`soal_id`),
  ADD KEY `soal_id` (`soal_id`);

--
-- Indexes for table `t_jawaban_dosen`
--
ALTER TABLE `t_jawaban_dosen`
  ADD PRIMARY KEY (`jawaban_dosen_id`),
  ADD KEY `responden_dosen_id` (`responden_dosen_id`,`soal_id`),
  ADD KEY `soal_id` (`soal_id`);

--
-- Indexes for table `t_jawaban_industri`
--
ALTER TABLE `t_jawaban_industri`
  ADD PRIMARY KEY (`jawaban_industri_id`),
  ADD KEY `responden_industri_id` (`responden_industri_id`,`soal_id`),
  ADD KEY `soal_id` (`soal_id`);

--
-- Indexes for table `t_jawaban_mahasiswa`
--
ALTER TABLE `t_jawaban_mahasiswa`
  ADD PRIMARY KEY (`jawaban_mahasiswa_id`),
  ADD KEY `responden_mahasiswa_id` (`responden_mahasiswa_id`,`soal_id`),
  ADD KEY `soal_id` (`soal_id`);

--
-- Indexes for table `t_jawaban_ortu`
--
ALTER TABLE `t_jawaban_ortu`
  ADD PRIMARY KEY (`jawaban_ortu_id`),
  ADD KEY `responden_ortu_id` (`responden_ortu_id`,`soal_id`),
  ADD KEY `soal_id` (`soal_id`);

--
-- Indexes for table `t_jawaban_tendik`
--
ALTER TABLE `t_jawaban_tendik`
  ADD PRIMARY KEY (`jawaban_tendik_id`),
  ADD KEY `responden_tendik_id` (`responden_tendik_id`,`soal_id`),
  ADD KEY `soal_id` (`soal_id`);

--
-- Indexes for table `t_responden_alumni`
--
ALTER TABLE `t_responden_alumni`
  ADD PRIMARY KEY (`responden_alumni_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `t_responden_dosen`
--
ALTER TABLE `t_responden_dosen`
  ADD PRIMARY KEY (`responden_dosen_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `t_responden_industri`
--
ALTER TABLE `t_responden_industri`
  ADD PRIMARY KEY (`responden_industri_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `t_responden_mahasiswa`
--
ALTER TABLE `t_responden_mahasiswa`
  ADD PRIMARY KEY (`responden_mahasiswa_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `t_responden_ortu`
--
ALTER TABLE `t_responden_ortu`
  ADD PRIMARY KEY (`responden_ortu_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `t_responden_tendik`
--
ALTER TABLE `t_responden_tendik`
  ADD PRIMARY KEY (`responden_tendik_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bobot`
--
ALTER TABLE `bobot`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `m_survey`
--
ALTER TABLE `m_survey`
  MODIFY `survey_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `m_survey_soal`
--
ALTER TABLE `m_survey_soal`
  MODIFY `soal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `m_user`
--
ALTER TABLE `m_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `t_jawaban_alumni`
--
ALTER TABLE `t_jawaban_alumni`
  MODIFY `jawaban_alumni_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `t_jawaban_dosen`
--
ALTER TABLE `t_jawaban_dosen`
  MODIFY `jawaban_dosen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `t_jawaban_industri`
--
ALTER TABLE `t_jawaban_industri`
  MODIFY `jawaban_industri_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `t_jawaban_mahasiswa`
--
ALTER TABLE `t_jawaban_mahasiswa`
  MODIFY `jawaban_mahasiswa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `t_jawaban_ortu`
--
ALTER TABLE `t_jawaban_ortu`
  MODIFY `jawaban_ortu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `t_jawaban_tendik`
--
ALTER TABLE `t_jawaban_tendik`
  MODIFY `jawaban_tendik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `t_responden_alumni`
--
ALTER TABLE `t_responden_alumni`
  MODIFY `responden_alumni_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_responden_dosen`
--
ALTER TABLE `t_responden_dosen`
  MODIFY `responden_dosen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_responden_industri`
--
ALTER TABLE `t_responden_industri`
  MODIFY `responden_industri_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_responden_mahasiswa`
--
ALTER TABLE `t_responden_mahasiswa`
  MODIFY `responden_mahasiswa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_responden_ortu`
--
ALTER TABLE `t_responden_ortu`
  MODIFY `responden_ortu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_responden_tendik`
--
ALTER TABLE `t_responden_tendik`
  MODIFY `responden_tendik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `m_survey`
--
ALTER TABLE `m_survey`
  ADD CONSTRAINT `m_survey_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`),
  ADD CONSTRAINT `m_survey_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `m_kategori` (`kategori_id`),
  ADD CONSTRAINT `m_survey_ibfk_3` FOREIGN KEY (`soal_id`) REFERENCES `m_survey_soal` (`soal_id`);

--
-- Constraints for table `m_survey_soal`
--
ALTER TABLE `m_survey_soal`
  ADD CONSTRAINT `m_survey_soal_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `m_kategori` (`kategori_id`);

--
-- Constraints for table `t_jawaban_alumni`
--
ALTER TABLE `t_jawaban_alumni`
  ADD CONSTRAINT `t_jawaban_alumni_ibfk_1` FOREIGN KEY (`responden_alumni_id`) REFERENCES `t_responden_alumni` (`responden_alumni_id`),
  ADD CONSTRAINT `t_jawaban_alumni_ibfk_2` FOREIGN KEY (`soal_id`) REFERENCES `m_survey_soal` (`soal_id`);

--
-- Constraints for table `t_jawaban_dosen`
--
ALTER TABLE `t_jawaban_dosen`
  ADD CONSTRAINT `t_jawaban_dosen_ibfk_1` FOREIGN KEY (`responden_dosen_id`) REFERENCES `t_responden_dosen` (`responden_dosen_id`),
  ADD CONSTRAINT `t_jawaban_dosen_ibfk_2` FOREIGN KEY (`soal_id`) REFERENCES `m_survey_soal` (`soal_id`);

--
-- Constraints for table `t_jawaban_industri`
--
ALTER TABLE `t_jawaban_industri`
  ADD CONSTRAINT `t_jawaban_industri_ibfk_1` FOREIGN KEY (`responden_industri_id`) REFERENCES `t_responden_industri` (`responden_industri_id`),
  ADD CONSTRAINT `t_jawaban_industri_ibfk_2` FOREIGN KEY (`soal_id`) REFERENCES `m_survey_soal` (`soal_id`);

--
-- Constraints for table `t_jawaban_mahasiswa`
--
ALTER TABLE `t_jawaban_mahasiswa`
  ADD CONSTRAINT `t_jawaban_mahasiswa_ibfk_1` FOREIGN KEY (`responden_mahasiswa_id`) REFERENCES `t_responden_mahasiswa` (`responden_mahasiswa_id`),
  ADD CONSTRAINT `t_jawaban_mahasiswa_ibfk_2` FOREIGN KEY (`soal_id`) REFERENCES `m_survey_soal` (`soal_id`);

--
-- Constraints for table `t_jawaban_ortu`
--
ALTER TABLE `t_jawaban_ortu`
  ADD CONSTRAINT `t_jawaban_ortu_ibfk_1` FOREIGN KEY (`responden_ortu_id`) REFERENCES `t_responden_ortu` (`responden_ortu_id`),
  ADD CONSTRAINT `t_jawaban_ortu_ibfk_2` FOREIGN KEY (`soal_id`) REFERENCES `m_survey_soal` (`soal_id`);

--
-- Constraints for table `t_jawaban_tendik`
--
ALTER TABLE `t_jawaban_tendik`
  ADD CONSTRAINT `t_jawaban_tendik_ibfk_1` FOREIGN KEY (`responden_tendik_id`) REFERENCES `t_responden_tendik` (`responden_tendik_id`),
  ADD CONSTRAINT `t_jawaban_tendik_ibfk_2` FOREIGN KEY (`soal_id`) REFERENCES `m_survey_soal` (`soal_id`);

--
-- Constraints for table `t_responden_alumni`
--
ALTER TABLE `t_responden_alumni`
  ADD CONSTRAINT `t_responden_alumni_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);

--
-- Constraints for table `t_responden_dosen`
--
ALTER TABLE `t_responden_dosen`
  ADD CONSTRAINT `t_responden_dosen_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);

--
-- Constraints for table `t_responden_industri`
--
ALTER TABLE `t_responden_industri`
  ADD CONSTRAINT `t_responden_industri_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);

--
-- Constraints for table `t_responden_mahasiswa`
--
ALTER TABLE `t_responden_mahasiswa`
  ADD CONSTRAINT `t_responden_mahasiswa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);

--
-- Constraints for table `t_responden_ortu`
--
ALTER TABLE `t_responden_ortu`
  ADD CONSTRAINT `t_responden_ortu_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);

--
-- Constraints for table `t_responden_tendik`
--
ALTER TABLE `t_responden_tendik`
  ADD CONSTRAINT `t_responden_tendik_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
