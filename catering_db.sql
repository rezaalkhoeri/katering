-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for catering_db
CREATE DATABASE IF NOT EXISTS `catering_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `catering_db`;

-- Dumping structure for table catering_db.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `kd_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `pic` text DEFAULT NULL,
  PRIMARY KEY (`kd_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table catering_db.menu: ~2 rows (approximately)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`kd_menu`, `nama`, `keterangan`, `harga`, `pic`) VALUES
	(1, 'Nasi Padang - Ayam Bakar', 'Nasi Padang', 17000, 'https://awsimages.detik.net.id/community/media/visual/2022/01/13/rm-padang-rating-tinggi-1.jpeg?w=700&q=90'),
	(2, 'Nasi Padang - Rendang', 'Daging rendang enak', 20000, 'asset/menu-pic/Nasi_Padang_-_Rendang22222222-0808-1111.jpg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table catering_db.pembayaran
CREATE TABLE IF NOT EXISTS `pembayaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_pesanan` varchar(50) DEFAULT NULL,
  `bukti_pembayaran` text DEFAULT NULL,
  `checked` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table catering_db.pembayaran: ~3 rows (approximately)
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
INSERT INTO `pembayaran` (`id`, `no_pesanan`, `bukti_pembayaran`, `checked`) VALUES
	(1, 'bEScnHwtiWUQDuVYZFmpJvIro', 'asset/bukti-pembayaran/bEScnHwtiWUQDuVYZFmpJvIro2.jpg', 1),
	(2, 'MhepjCmzrfGJPiOstXBlaVRWF', 'asset/bukti-pembayaran/MhepjCmzrfGJPiOstXBlaVRWF.jpg', 1),
	(3, 'JEAHBtUYXZDwigSrykaVoKqvm', 'asset/bukti-pembayaran/JEAHBtUYXZDwigSrykaVoKqvm.jpg', 0);
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;

-- Dumping structure for table catering_db.penjualan
CREATE TABLE IF NOT EXISTS `penjualan` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `no_pesanan` varchar(50) DEFAULT NULL,
  `tgl_masukan` date DEFAULT NULL,
  `modal` int(11) DEFAULT NULL,
  `keuntungan` int(11) DEFAULT NULL,
  KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table catering_db.penjualan: ~2 rows (approximately)
/*!40000 ALTER TABLE `penjualan` DISABLE KEYS */;
INSERT INTO `penjualan` (`no`, `no_pesanan`, `tgl_masukan`, `modal`, `keuntungan`) VALUES
	(2, 'bEScnHwtiWUQDuVYZFmpJvIro', '2022-08-12', 15000, 2000),
	(3, 'MhepjCmzrfGJPiOstXBlaVRWF', '2022-08-19', 20000, 4000);
/*!40000 ALTER TABLE `penjualan` ENABLE KEYS */;

-- Dumping structure for table catering_db.tpesanan
CREATE TABLE IF NOT EXISTS `tpesanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_pesanan` varchar(50) DEFAULT NULL,
  `id_user` varchar(50) DEFAULT NULL,
  `kd_menu` int(11) DEFAULT NULL,
  `tgl_pesan` date DEFAULT NULL,
  `tgl_ambil` date DEFAULT NULL,
  `metode_pengambilan` varchar(50) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga_total` int(11) DEFAULT NULL,
  `status_pembayaran` int(11) DEFAULT 0,
  `status_pesanan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table catering_db.tpesanan: ~3 rows (approximately)
/*!40000 ALTER TABLE `tpesanan` DISABLE KEYS */;
INSERT INTO `tpesanan` (`id`, `no_pesanan`, `id_user`, `kd_menu`, `tgl_pesan`, `tgl_ambil`, `metode_pengambilan`, `qty`, `harga_total`, `status_pembayaran`, `status_pesanan`) VALUES
	(1, 'bEScnHwtiWUQDuVYZFmpJvIro', 'user123', 2, '2022-07-12', '2022-08-19', '1', 1, 20000, 1, 1),
	(2, 'MhepjCmzrfGJPiOstXBlaVRWF', 'user123', 2, '2022-07-12', '2022-08-14', '0', 1, 20000, 1, 1),
	(3, 'JEAHBtUYXZDwigSrykaVoKqvm', 'reza', 1, '2022-07-12', '2022-08-19', '1', 1, 17000, 0, NULL);
/*!40000 ALTER TABLE `tpesanan` ENABLE KEYS */;

-- Dumping structure for table catering_db.user
CREATE TABLE IF NOT EXISTS `user` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `level` varchar(50) DEFAULT 'user',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table catering_db.user: ~3 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`no`, `id_user`, `email`, `password`, `level`) VALUES
	(1, 'admin', 'admin@admin.com', 'admin', 'admin'),
	(2, 'user123', 'user@gmail.com', 'bb98b1d0b523d5e783f931550d7702b6', 'user'),
	(3, 'reza', 'reza@gmail.com', 'bb98b1d0b523d5e783f931550d7702b6', 'user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table catering_db.user_data
CREATE TABLE IF NOT EXISTS `user_data` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` varchar(50) DEFAULT NULL,
  `no_telp` varchar(50) DEFAULT NULL,
  `profile` text DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kd_pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table catering_db.user_data: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_data` DISABLE KEYS */;
INSERT INTO `user_data` (`no`, `id_user`, `no_telp`, `profile`, `nama`, `alamat`, `kd_pos`) VALUES
	(1, 'user123', '08979928', 'asset/profile-pic/user123.jpg', 'User Pertama', 'depok', 15238),
	(3, 'reza', '089602826377', 'asset/img/profile.png', 'Reza Aji Alkhoeri', 'Tegal', 15426);
/*!40000 ALTER TABLE `user_data` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
