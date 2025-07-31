-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2025 at 05:47 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crud`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'admin@perpus.com', 'admin1234');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `availability` varchar(50) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `subject`, `location`, `availability`, `timestamp`) VALUES
(2, 'Pemrograman Web', 'Technology', 'RK535', 'dipinjam', '2025-07-21 16:56:14'),
(3, 'Dasar-dasar Javascript', 'Technology', 'RK535', 'tersedia', '2025-07-21 16:56:14'),
(10, 'Dasar-dasar Psikologi', 'psikologi', 'RK546', 'tersedia', '2025-07-21 16:56:14'),
(13, 'javascript', 'Teknik Informatika', 'RK345', 'tersedia', '2025-07-21 19:13:12'),
(15, 'Psikologi umum : sebuah pandangan apresiatif', 'Filsafat & Psikologi', '150-153.94', 'tersedia', '2025-07-22 11:36:52'),
(16, ' Experience psychology', 'Filsafat & Psikologi', '150-153.94', 'tersedia', '2025-07-22 11:40:02'),
(17, 'Psychological testing and assessment', 'Filsafat & Psikologi', '150-153.94', 'tersedia', '2025-07-22 11:42:35'),
(18, 'Handbook of psychological assessment', 'Filsafat & Psikologi', '150-153.94', 'tersedia', '2025-07-22 11:43:59'),
(19, 'Handbook of psychological assessment', 'Filsafat & Psikologi', '150-153.94', 'tersedia', '2025-07-22 11:46:35'),
(20, 'Psychology of personality', 'Filsafat & Psikologi', '154-155.24', 'tersedia', '2025-07-22 11:48:22'),
(21, 'Personality', 'Filsafat & Psikologi', '154-155.24', 'tersedia', '2025-07-22 11:49:44'),
(22, 'Theories of personality', 'Filsafat & Psikologi', '154-155.24', 'tersedia', '2025-07-22 11:53:33'),
(23, 'Teori kepribadian edisi 10', 'Filsafat & Psikologi', '154-155.24', 'tersedia', '2025-07-22 11:55:02'),
(24, 'Master book of personal branding', 'Filsafat & Psikologi', '154-155.24', 'tersedia', '2025-07-22 11:56:49'),
(25, 'Buddhisme untuk para ibu: sebuah pendekatan yang tenang untuk menyayangi diri anda sendiri dan anak-anak anda', 'Agama', '200-297.27', 'tersedia', '2025-07-22 11:58:15'),
(26, 'Berislam seindah Islam', 'Agama', '200-297.27', 'tersedia', '2025-07-22 11:59:28'),
(27, 'CENDIKIAWAN MUSLIM', 'Agama', '200-297.27', 'tersedia', '2025-07-22 12:02:06'),
(28, 'PENGANTAR MANAJEMEN SYARIAH', 'Agama', '200-297.27', 'tersedia', '2025-07-22 12:02:42'),
(29, 'Sejarah peradaban islam', 'Agama', '200-297.27', 'tersedia', '2025-07-22 12:03:16'),
(30, 'Kepurbakalaan Islam Nusantara', 'Agama', '200-297.27', 'tersedia', '2025-07-22 12:03:51'),
(31, 'Keindahan Al-Qur\'an dan fleksibilitas fikih', 'Agama', '200-297.27', 'dipinjam', '2025-07-22 12:04:39'),
(32, 'God, man, and nature', 'Agama', '200-297.27', 'tersedia', '2025-07-22 12:05:37'),
(33, 'Islam untuk disiplin ilmu teknologi', 'Agama', '200-297.27', 'tersedia', '2025-07-22 12:06:59'),
(34, 'Studi kelayakan bisnis syariah', 'Agama', '297.272-297.431', 'tersedia', '2025-07-23 14:00:28'),
(35, 'Islamic finance and circular economy', 'Agama', '297.272-297.431', 'dipinjam', '2025-07-23 14:01:43'),
(36, 'Islamic law', 'Agama', '297.272-297.431', 'tersedia', '2025-07-23 14:02:26'),
(37, 'Economics: pengantar mikro dan makro edisi 5', 'Ilmu sosial', '300-302', 'tersedia', '2025-07-23 14:04:22'),
(38, 'The Total survey error approach', 'Ilmu sosial', '300-302', 'tersedia', '2025-07-23 14:05:49'),
(39, 'Pengantar ilmu antropologi', 'Ilmu sosial', '300-302', 'tersedia', '2025-07-23 14:07:46'),
(40, 'Antropologi anak usia dini', 'Ilmu sosial', '300-302', 'tersedia', '2025-07-23 14:08:34'),
(41, 'Sociology in modules', 'Ilmu sosial', '300-302', 'tersedia', '2025-07-23 14:09:06'),
(42, 'Sosiologi suatu pengantar', 'Ilmu sosial', '300-302', 'tersedia', '2025-07-23 14:10:05'),
(43, 'Psikologi sosial terapan', 'Ilmu sosial', '300-302', 'tersedia', '2025-07-23 14:11:20'),
(44, 'Dasar-dasar sosiologi', 'Ilmu sosial', '300-302', 'tersedia', '2025-07-23 14:16:46'),
(45, 'Social Psychology', 'Ilmu sosial', '300-302', 'tersedia', '2025-07-23 14:17:47'),
(46, 'Psikologi Lintas Budaya', 'Ilmu sosial', '300-302', 'dipinjam', '2025-07-23 14:18:09'),
(47, 'psikologi Sosial', 'Ilmu sosial', '300-302', 'tersedia', '2025-07-23 14:18:36'),
(48, 'Komunikasi Massa', 'Ilmu sosial', '302.01-302.2', 'tersedia', '2025-07-23 14:21:55'),
(49, 'Buku ajar komunikasi kesehatan', 'Ilmu sosial', '302.01-302.2', 'tersedia', '2025-07-23 14:26:35'),
(50, ' Komunikasi bisnis silang budaya', 'Ilmu sosial', '302.01-302.2', 'tersedia', '2025-07-23 14:27:25'),
(51, 'Sosiologi komunikasi', 'Ilmu sosial', '302.01-302.2', 'tersedia', '2025-07-23 14:28:07'),
(52, 'Perencanaan dan strategi komunikasi', 'Ilmu sosial', '302.01-302.2', 'tersedia', '2025-07-23 14:29:06'),
(53, 'pengantar ilmu komunikasi', 'Ilmu sosial', '300-302', 'tersedia', '2025-07-23 14:29:31'),
(54, 'ilmu komunikasi 1', 'Ilmu sosial', '302.01-302.2', 'tersedia', '2025-07-23 14:29:56'),
(55, 'Perilaku organisasi', 'Ilmu sosial', '302.01-302.2', 'tersedia', '2025-07-23 14:30:10'),
(56, 'filsafat ilmu komunikasi', 'Ilmu sosial', '302.01-302.2', 'tersedia', '2025-07-23 14:31:12'),
(57, 'Pengantar Ilmu Komunikasi', 'Ilmu sosial', '302.01-302.2', 'tersedia', '2025-07-23 14:31:50'),
(58, 'Mikrobiologi farmasi', 'Ilmu Terapan', '616.001-616.998', 'tersedia', '2025-07-23 14:37:27'),
(59, 'Gawat darurat medis praktis : tim bantuan medis Hippocrates Emergency Team (HET) FK UNAND Padang', 'Ilmu Terapan', '616.001-616.998', 'tersedia', '2025-07-23 14:38:25'),
(60, 'Patologi kehamilan: memahami berbagai penyakit & komplikasi kehamilan', 'Ilmu Terapan', '616.001-616.998', 'tersedia', '2025-07-23 14:39:37'),
(61, ' Tatalaksana holistik penyakit kardiovaskular', 'Ilmu Terapan', '616.001-616.998', 'tersedia', '2025-07-23 14:40:31'),
(62, 'Mengatasi hipertensi', 'Ilmu Terapan', '616.001-616.998', 'tersedia', '2025-07-23 14:40:59'),
(63, 'Respirologi', 'Ilmu Terapan', '616.001-616.998', 'tersedia', '2025-07-23 14:41:39'),
(64, 'Preventive medicine of Covid-19', 'Ilmu Terapan', '616.001-616.998', 'tersedia', '2025-07-23 14:43:21'),
(65, 'Say goodbye to heart disease', 'Ilmu Terapan', '616.001-616.998', 'tersedia', '2025-07-23 14:44:07'),
(66, 'Clinical guide for management of overweight and obese children and adults', 'Ilmu Terapan', '616.001-616.998', 'tersedia', '2025-07-23 14:44:53'),
(67, 'Hidup Sehat Pasca Diabetes', 'Ilmu Terapan', '616.001-616.998', 'tersedia', '2025-07-23 14:45:53'),
(68, 'Diabetes bisa sembuh', 'Ilmu Terapan', '616.001-616.998', 'tersedia', '2025-07-23 14:46:40'),
(69, 'segala sesuatu yang harus anda ketahui tentang diabetes', 'Ilmu Terapan', '616.001-616.998', 'tersedia', '2025-07-23 14:47:28'),
(70, 'Pengantar Ilmu Kebidanan', 'Ilmu Terapan', '617-620', 'tersedia', '2025-07-23 14:48:39'),
(71, 'Biology a global approach', 'Sains', '550-599.98', 'tersedia', '2025-07-23 16:35:02'),
(72, 'Biologi dasar', 'Sains', '550-599.98', 'tersedia', '2025-07-23 16:35:50'),
(73, 'Dasar-dasar biokimia', 'Sains', '550-599.98', 'tersedia', '2025-07-23 16:37:13'),
(74, 'Biokimia dasar', 'Sains', '550-599.98', 'tersedia', '2025-07-23 16:37:44'),
(75, 'Pengelolaan lingkungan hidup', 'Sains', '550-599.98', 'tersedia', '2025-07-23 16:39:24'),
(76, 'Introductory Mathematical Analysis, Ed.14', 'Sains', '514-519.4', 'tersedia', '2025-07-23 16:40:56'),
(77, 'Statistika terapan', 'Sains', '514-519.4', 'tersedia', '2025-07-23 16:42:08'),
(78, 'Basic Business Statistics', 'Sains', '519.5', 'tersedia', '2025-07-23 16:43:47'),
(79, 'Statistika untuk analisis data penelitian', 'Sains', '519.5', 'tersedia', '2025-07-23 16:45:29'),
(80, 'Statistik : konsep dasar, aplikasi & pengembangannya', 'Sains', '519.5', 'tersedia', '2025-07-23 16:46:43'),
(81, 'Statika Struktur', 'Sains', '519.5', 'tersedia', '2025-07-23 16:47:29'),
(82, 'Statistic For Management', 'Sains', '519.5', 'tersedia', '2025-07-23 16:48:24'),
(83, 'Statistik untuk bisnis dan ekonomi', 'Sains', '519.5', 'tersedia', '2025-07-23 16:49:09'),
(84, 'Panduan praktis olah data menggunakan SPSS', 'Sains', '519.5', 'tersedia', '2025-07-23 16:50:00'),
(85, 'Analisis statistik penelitian kesehatan (prosedur pemilihan uji hipotesis penelitian kesehatan)', 'Sains', '519.5', 'tersedia', '2025-07-23 16:51:07'),
(86, 'Longman preparation course for the Toefl iBT test', 'Bahasa', '400-499.221', 'tersedia', '2025-07-23 16:52:40'),
(87, 'Practice exercises for the Toefl with MP3 CD', 'Bahasa', '400-499.221', 'tersedia', '2025-07-23 16:53:48'),
(88, 'Jalan harus terang', 'Sejarah, Geografi, Biografi', '900-999', 'tersedia', '2025-07-23 16:56:02'),
(89, 'Bung Tomo: hidup dan mati pengobar semangat tempur 10 november', 'Sejarah, Geografi, Biografi', '900-999', 'tersedia', '2025-07-23 16:56:43'),
(90, 'Tay Juhana : pelopor industri kelapa', 'Sejarah, Geografi, Biografi', '900-999', 'tersedia', '2025-07-23 16:57:17');

-- --------------------------------------------------------

--
-- Table structure for table `intents`
--

CREATE TABLE `intents` (
  `id` int(11) NOT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `patterns` text DEFAULT NULL,
  `responses` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `intents`
--

INSERT INTO `intents` (`id`, `tag`, `patterns`, `responses`, `timestamp`) VALUES
(2, 'goodbye', '[\"sampai jumpa\", \"dadah\", \"bye\", \"selamat tinggal\"]', '[\"Sampai jumpa kembali!\", \"Semoga harimu menyenangkan!\", \"Dadah!\"]', '2025-06-05 07:08:16'),
(3, 'thanks', '[\"terima kasih\", \"makasih\", \"thanks\", \"thank you\"]', '[\"Sama-sama!\", \"Dengan senang hati 😊\", \"Kembali kasih!\"]', '2025-06-05 07:08:16'),
(9, 'membership', '[\"Bagaimana cara mendaftar menjadi anggota?\", \"Apa syarat menjadi anggota perpustakaan?\", \"Saya ingin menjadi anggota perpustakaan\",   \"bagaimana cara akses repository?\",\r\n  \"cara daftar member digilib\",\r\n  \"apa itu digilib esa unggul?\",\r\n  \"repository kampus itu apa?\",\r\n  \"saya mau baca skripsi mahasiswa lain\",\r\n  \"repository skripsi bisa diakses di mana?\",\r\n  \"gimana cara buka digilib?\",\r\n  \"saya belum punya akun digilib, gimana?\",\r\n  \"repository kampus esa unggul\"]', '[\r\n  \"Repository digital dapat diakses di https://digilib.esaunggul.ac.id. Isinya mencakup skripsi, tesis, laporan magang, jurnal, dan lainnya.\\n\\nUntuk mendaftar sebagai member:\\n1. Kunjungi situs tersebut dan klik *Member Register* (pojok kiri atas).\\n2. Isi data:\\n- Email: boleh email pribadi atau email kampus\\n- Institusi: Universitas Esa Unggul\\n- Password: bebas\\n- Security Code: sesuai gambar abu-abu\\n3. Klik *Send*. Jika berhasil, muncul tulisan *Success*.\\n4. Tunggu 1x24 jam untuk aktivasi.\\natau hubungi WhatsApp: 085810194544 untuk di approve member nya.\"\r\n]\r\n', '2025-06-05 07:08:16'),
(16, 'jam_operasional_perpustakaan', '[\n  \"jam berapa perpustakaan buka?\",\n  \"apa jam operasional perpustakaan?\",\n  \"kapan perpustakaan buka?\",\n  \"perpustakaan buka hari apa saja?\",\n  \"jam berapa perpustakaan esa unggul buka?\"\n]', '[\n  \"Jam operasional Perpustakaan Universitas Esa Unggul Tangerang adalah Senin s.d Sabtu, pukul 09.00–17.00 WIB. Mohon membawa KTM saat masuk.\"\n]', '2025-06-28 06:42:42'),
(17, '\"pengumuman_ktm\"', '[\r\n  \"apakah wajib membawa KTM ke perpustakaan?\",\r\n  \"mulai kapan wajib bawa KTM ke perpus?\",\r\n  \"apa pengumuman terbaru untuk masuk perpustakaan?\",\r\n  \"haruskah membawa KTM saat ke perpustakaan?\",\r\n  \"adakah aturan baru untuk akses perpustakaan?\"\r\n]', '[\r\n  \"Mulai 1 Mei 2024, masuk perpustakaan wajib membawa KTM. Harap diperhatikan oleh seluruh mahasiswa.\"\r\n]', '2025-06-28 06:43:21'),
(18, '\"perpanjangan_peminjaman\"', '[\n  \"bagaimana cara perpanjang peminjaman buku?\",\n  \"apakah bisa perpanjang peminjaman buku?\",\n  \"perpanjang buku gimana ya?\",\n  \"bolehkan perpanjangan buku via whatsapp?\",\n  \"apa format untuk perpanjang buku?\"\n]', '[\n  \"Perpanjang peminjaman buku secara online via WhatsApp 085810194544. Format:\\n\\nNama: \\nNIM: \\nJudul Buku: \\nKode Barcode: (B00....) \\nLokasi Pinjam: Perpustakaan Kampus Tangerang\\n\\nKonfirmasi dilakukan H-1 sebelum tenggat. Maksimal perpanjangan adalah 2 kali.\"\n]\n', '2025-06-28 06:44:50'),
(19, 'ketersediaan_buku', '[\n  \"bagaimana cara mengecek ketersediaan buku?\",\n  \"dimana saya bisa cek ketersediaan buku?\",\n  \"cara cek ketersediaan buku melalui elib\",\n  \"apa link untuk cek ketersediaan buku?\",\n  \"bagaimana cara login untuk cek ketersediaan buku?\",\n  \"saya ingin cek ketersediaan buku di elib.esaunggul.ac.id\",\n  \"apa username dan password untuk login ke elib?\",\n  \"bagaimana cara login di elib dengan NIM?\",\n  \"saya mau nyari buku\",\n  \"gimana cara nyari buku di elib?\",\n  \"mau cari buku di perpustakaan\",\n  \"cari buku lewat elib bisa gak?\",\n  \"cara menemukan buku yang saya butuhkan\",\n  \"nyari referensi buku di mana?\",\n  \"dimana saya bisa menemukan buku di perpustakaan?\",\n  \"elib bisa buat cari buku gak?\"\n]\n', '[\r\n  \"Ketersediaan buku dapat diakses melalui tautan <a href=\'https://elib.esaunggul.ac.id\' target=\'_blank\'>elib.esaunggul.ac.id</a> kemudian login dengan username: NIM dan password: NIM\"\r\n]\r\n', '2025-07-03 04:24:11'),
(20, '\"peminjaman_ruang\"', '[\r\n  \"bagaimana cara meminjam ruang teater?\",\r\n  \"cara pinjam ruang diskusi di perpustakaan?\",\r\n  \"aturan peminjaman ruang teater\",\r\n  \"dimana bisa lihat aturan peminjaman ruang diskusi?\",\r\n  \"link peminjaman ruang teater dan diskusi?\",\r\n  \"mau booking ruang teater gimana?\",\r\n  \"pinjam ruang diskusi kampus gimana caranya?\"\r\n]', '[\r\n  \"Untuk aturan peminjaman Ruang Teater dan Ruang Diskusi dapat diakses melalui tautan <a href=\'https://docs.google.com/spreadsheets/d/1Ucej3uSbbCnVXuYP-LGVTTLT1p3Yhd0s2k3rGV4dQK4/edit?gid=0#gid=0\' target=\'_blank\'>https://docs.google.com/spreadsheets/d/1Ucej3uSbbCnVXuYP-LGVTTLT1p3Yhd0s2k3rGV4dQK4/edit?gid=0#gid=0</a>.\"\r\n]\r\n', '2025-07-03 04:31:15'),
(21, '\"jadwal_peminjaman_ruang\"', '[\n  \"jadwal peminjaman ruang diskusi\",\n  \"jadwal peminjaman ruang theater\",\n  \"jadwal peminjaman ruang diskusi 1 dan 2\",\n  \"mau lihat jadwal peminjaman ruang diskusi dan theater\",\n  \"di mana saya bisa lihat jadwal peminjaman ruang?\",\n  \"kapan ruang diskusi atau teater bisa dipakai?\"\n]', '[\n  \"Jadwal peminjaman ruang diskusi 1, diskusi 2, dan theater dapat dilihat di link berikut:\\nbit.ly/library-reservation\"\n]\n', '2025-07-03 04:36:24'),
(22, 'unggah_tugas_akhir', '[\"bagaimana cara unggah tugas akhir?\",\"link upload tugas akhir esa unggul\",\"form unggah tugas akhir di mana?\",\"cara submit TA ke perpustakaan?\",\"bitly unggah ue tugas akhir?\",\"unggah tugas akhir \"]', '[\"Silakan unggah file tugas akhir melalui tautan <a href=\'https://bit.ly/unggahueu\' target=\'_blank\'>bit.ly/unggahueu</a>. Pastikan mengikuti petunjuk pengunggahan yang tertera di formulir.\"]', '2025-07-03 04:49:00'),
(23, 'sumbangan_buku', '[\"bagaimana cara menyumbang buku?\",\"form sumbangan buku perpustakaan?\",\"link sumbangan buku esa unggul\",\"bitly sumbanganbukunew apa?\",\"saya ingin donasi buku ke perpustakaan\",\"cara donasi buku kampus tangerang\"]', '[\"Untuk menyumbangkan buku, isi formulir pada tautan <a href=\'https://bit.ly/sumbanganbukunew\' target=\'_blank\'>bit.ly/sumbanganbukunew</a>. Terima kasih atas partisipasinya!\"]', '2025-07-03 04:49:35'),
(24, 'bebas_pustaka', '[\"form bebas pustaka di mana?\",\"bagaimana mengurus surat bebas pustaka?\",\"link bebas pustaka esa unggul\",\"bitly bebas pustaka ue?\",\"saya butuh surat bebas pustaka\",\"cara minta bebas pustaka perpustakaan\"]', '[\"Formulir permohonan surat bebas pustaka dapat diisi melalui tautan <a href=\'https://bit.ly/bebaspustakanew\' target=\'_blank\'> https://bit.ly/bebaspustakanew</a>. Lengkapi data yang diminta untuk memproses permohonan Anda.\"]\n', '2025-07-03 04:52:42'),
(25, '\"peraturan_peminjaman_buku\"', '[\r\n  \"apa saja aturan peminjaman buku?\",\r\n\"cara meminjam buku bagaimana?\",\r\n  \"aturan pengembalian buku di perpustakaan\",\r\n  \"berapa lama waktu peminjaman buku?\",\r\n  \"berapa maksimal buku yang boleh dipinjam?\",\r\n  \"bagaimana jika buku telat dikembalikan?\",\r\n  \"berapa denda keterlambatan pengembalian buku?\",\r\n  \"jika buku hilang harus bagaimana?\",\r\n  \"apa saja syarat meminjam buku?\",\r\n  \"bisa pinjam buku berapa hari?\",\r\n  \"boleh pinjam berapa buku?\"\r\n]\r\n', '[\r\n  \"Berikut adalah peraturan peminjaman dan pengembalian buku:\\n\\n1. Wajib menggunakan KTM saat meminjam.\\n2. Maksimal peminjaman adalah 2 buku.\\n3. Durasi peminjaman adalah 7 hari dan dapat diperpanjang sebanyak 2 kali.\\n4. Keterlambatan pengembalian akan dikenakan denda Rp1.000/hari.\\n5. Jika buku hilang, wajib diganti dengan buku yang sama sesuai judul yang dipinjam.\"\r\n]\r\n', '2025-07-03 06:18:00'),
(26, 'tata_tertib_pengunjung', '[\n\"apa saja peraturan perpustakaan?\",\n  \"apa saja tata tertib di perpustakaan?\",\n  \"aturan di dalam perpustakaan apa aja?\",\n  \"boleh bawa tas ke dalam perpustakaan?\",\n  \"peraturan tentang makanan dan minuman di perpustakaan\",\n  \"gimana kalau ada barang yang hilang di perpustakaan?\",\n  \"apa harus tenang saat di perpustakaan?\",\n  \"apakah harus mengembalikan buku setelah baca?\",\n  \"peraturan pengunjung perpustakaan esa unggul\",\n  \"apakah boleh ngobrol keras di perpustakaan?\",\n  \"apa yang harus dilakukan sebelum meninggalkan perpustakaan?\",\n  \"perpustakaan punya aturan apa aja untuk pengunjung?\"\n]\n', '[\r\n  \"Berikut tata tertib pengunjung perpustakaan:\\n1. Tas wajib disimpan di loker, gunakan totebag yang disediakan.\\n2. Tidak diperkenankan membawa makanan, minuman diletakkan di tempat yang tersedia.\\n3. Jaga kebersihan dan keindahan ruang.\\n4. Gunakan suara pelan, jaga ketenangan.\\n5. Buku yang selesai dibaca, diletakkan di atas meja petugas.\\n6. Rapikan kursi sebelum meninggalkan ruangan.\\n7. Kehilangan barang bukan tanggung jawab petugas.\\n8. Patuhi semua aturan demi kenyamanan bersama.\"\r\n]\r\n', '2025-07-04 09:34:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `intents`
--
ALTER TABLE `intents`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `intents`
--
ALTER TABLE `intents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
