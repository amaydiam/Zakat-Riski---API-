/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.1.25-MariaDB : Database - zakat_rizki
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zakat_rizki` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `zakat_rizki`;

/*Table structure for table `amil_zakat` */

DROP TABLE IF EXISTS `amil_zakat`;

CREATE TABLE `amil_zakat` (
  `id_amil_zakat` int(10) NOT NULL AUTO_INCREMENT,
  `id_user` int(10) DEFAULT NULL,
  `id_badan_amil_zakat` int(10) DEFAULT NULL,
  `status_amil_zakat` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif',
  PRIMARY KEY (`id_amil_zakat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `amil_zakat` */

insert  into `amil_zakat`(`id_amil_zakat`,`id_user`,`id_badan_amil_zakat`,`status_amil_zakat`) values (1,1,1,'Aktif'),(2,7,2,'Aktif'),(3,9,3,'Aktif'),(4,10,4,'Aktif');

/*Table structure for table `badan_amil_zakat` */

DROP TABLE IF EXISTS `badan_amil_zakat`;

CREATE TABLE `badan_amil_zakat` (
  `id_badan_amil_zakat` int(10) NOT NULL AUTO_INCREMENT,
  `nama_badan_amil_zakat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_badan_amil_zakat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `badan_amil_zakat` */

insert  into `badan_amil_zakat`(`id_badan_amil_zakat`,`nama_badan_amil_zakat`) values (1,'BAZNAS'),(2,'DOMPET DUAFA'),(3,'RUMAH ZAKAT'),(4,'RUMAH YATIM');

/*Table structure for table `calon_mustahiq` */

DROP TABLE IF EXISTS `calon_mustahiq`;

CREATE TABLE `calon_mustahiq` (
  `id_calon_mustahiq` int(10) NOT NULL AUTO_INCREMENT,
  `nama_calon_mustahiq` varchar(100) DEFAULT NULL,
  `alamat_calon_mustahiq` text,
  `latitude_calon_mustahiq` varchar(20) DEFAULT '0',
  `longitude_calon_mustahiq` varchar(20) DEFAULT '0',
  `no_identitas_calon_mustahiq` varchar(200) DEFAULT NULL,
  `no_telp_calon_mustahiq` varchar(100) DEFAULT NULL,
  `id_user_perekomendasi` int(10) DEFAULT NULL,
  `alasan_perekomendasi_calon_mustahiq` text,
  `photo_1` text,
  `photo_2` text,
  `photo_3` text,
  `caption_photo_1` text,
  `caption_photo_2` text,
  `caption_photo_3` text,
  `status_calon_mustahiq` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif',
  PRIMARY KEY (`id_calon_mustahiq`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

/*Data for the table `calon_mustahiq` */

insert  into `calon_mustahiq`(`id_calon_mustahiq`,`nama_calon_mustahiq`,`alamat_calon_mustahiq`,`latitude_calon_mustahiq`,`longitude_calon_mustahiq`,`no_identitas_calon_mustahiq`,`no_telp_calon_mustahiq`,`id_user_perekomendasi`,`alasan_perekomendasi_calon_mustahiq`,`photo_1`,`photo_2`,`photo_3`,`caption_photo_1`,`caption_photo_2`,`caption_photo_3`,`status_calon_mustahiq`) values (1,'Amay','Jl. Nangcka landak','0','0','19760','19798',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(2,'siska','palembang','0','0','7667','9768',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(4,'bintang','jagakarsa','0','0','7976767','979',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(5,'doni','jakarta barat','0','0','797676','979',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(6,'uki','ghh','0','0','99','666',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(7,'Devi Lestian','jakarta','0','0','291930023','2147483647',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(8,'intan','bekasi','0','0','8794646','9464359',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(9,'andi','bandung','0','0','43','43',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(10,'andi','bandung','0','0','43','43',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(11,'bagus','bogor','0','0','563465','5645',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(13,'arli','jakarta','0','0','2147483647','877862917',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(15,'lala','lala','0','0','8569','85456',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(18,'arli','jakarta','0','0','2147483647','877862917',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(19,'firman','depok timur','0','0','3100796434','08778423694',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(21,'gia','jakarta','0','0','56680855','885900',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(22,'atika','Cawang Timur RT 011/ RW 004 No. 37 Jakarta Timur','0','0','31883283','0898273882',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(23,'ila','bintaro tangerang selatan Rt 009/ rw 007 No 34','-6.329738','106.743754','3100028377','0877628392',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(24,'mazaya','lubang buaya RT 006 / RT 05 NO. 34','-6.328992','106.749033','310002838','087736483',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(25,'yulia','jl.kebagusan raya joglo jakarta barat','-6.334441','106.751576','328392972','08773643299',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(26,'jamal','batu tulis RT003/RW 003 No. 56 jakarta timur','-6.336851','106.753239','312829928','0816283920',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Tidak Aktif'),(27,'ida','Kampung pesing kec.pesing RT 006/RW 011 jakarta barat','-6.337864','106.749280','310000728378','08576532992',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Tidak Aktif'),(28,'anto','Jl.Bangka Timur III  RT 010/ RW 003 Kel mampang kec.mampang prapatan Jakarta selatan','-6.336339','106.749130','31200003797','08987273829',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Tidak Aktif'),(29,'gia','jl. pesanggrahan rT003/ Rt 004 jakarta timur','-6.339735','106.744195','3738290','0817283845',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(30,'hjj','njj',NULL,'0.0','9996','999',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(31,'uki','Jl. Rs Fatmawati No, Pamulang Tim., Pamulang, Kota Tangerang Selatan, Banten 15417, Indonesia','-6.344739','106.74202','9666','999',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(32,NULL,NULL,'0','0',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(33,'hjud','Jl. R.E. Martadinata No.21, Cipayung, Ciputat, Kota Tangerang Selatan, Banten 15411, Indonesia','-6.340737499999996','106.74944921874996','86859595999999','56569595',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aktif'),(34,'bznxjx','Jl. R.E. Martadinata No.43, Pamulang Tim., Pamulang, Kota Tangerang Selatan, Banten 15417, Indonesia','-6.344925499999999','106.74961979999999','8383888','686868',2,'xjxj','/source/upload/image/photo_calon_mustahiq/1499757085.jpg','/source/upload/image/photo_calon_mustahiq/1499757085.jpg','/source/upload/image/photo_calon_mustahiq/1499757085.jpg',NULL,NULL,NULL,'Aktif'),(35,'cvjjh','Jl. R.E. Martadinata No.4, Pamulang Tim., Pamulang, Kota Tangerang Selatan, Banten 15417, Indonesia','-6.344587499999996','106.74908203125003','5656655','86868',2,'xnxkxkd','/source/upload/image/photo_calon_mustahiq/1499757424.jpg','/source/upload/image/photo_calon_mustahiq/1499757424.jpg','/source/upload/image/photo_calon_mustahiq/1499757424.jpg',NULL,NULL,NULL,'Aktif'),(36,'hdjdddjdj','Jl. R.E. Martadinata No.43, Pamulang Tim., Pamulang, Kota Tangerang Selatan, Banten 15417, Indonesia','-6.344925499999999','106.74961979999999','898656899','868655',2,'xjdkkdf','/source/upload/image/photo_calon_mustahiq/photo_1_1499764217.jpg','/source/upload/image/photo_calon_mustahiq/photo_2_1499764217.jpg','/source/upload/image/photo_calon_mustahiq/photo_2_1499764217.jpg','hsjs','zhjz','nznz','Aktif'),(37,'aa','Jl. R.E. Martadinata No.18, Pamulang Tim., Pamulang, Kota Tangerang Selatan, Banten 15417, Indonesia','-6.346707500000001','106.75000390624999','646465','76565',6,'xhdjd','/source/upload/image/photo_calon_mustahiq/photo_1_1499954623.jpg','/source/upload/image/photo_calon_mustahiq/photo_2_1499954623.jpg','/source/upload/image/photo_calon_mustahiq/photo_3_1499954623.jpg','bxnxjx','zbjs','xhjx','Aktif');

/*Table structure for table `donasi` */

DROP TABLE IF EXISTS `donasi`;

CREATE TABLE `donasi` (
  `id_donasi` int(10) NOT NULL AUTO_INCREMENT,
  `id_muzaki` int(10) DEFAULT NULL,
  `id_mustahiq` int(10) DEFAULT NULL,
  `jumlah_donasi` int(10) DEFAULT NULL,
  `keterangan` text,
  `waktu_donasi` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_donasi`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `donasi` */

insert  into `donasi`(`id_donasi`,`id_muzaki`,`id_mustahiq`,`jumlah_donasi`,`keterangan`,`waktu_donasi`) values (1,2,1,544,'/source/upload/image/foto_bukti_pembayaran/1482108101.jpg','2016-12-30 13:25:45'),(2,3,1,99664,'/source/upload/image/foto_bukti_pembayaran/1482795932.jpg','2016-12-30 13:25:45'),(3,4,1,97,'/source/upload/image/foto_bukti_pembayaran/1482799992.jpg','2016-12-30 13:25:45'),(4,5,1,5664,'','2016-12-30 13:25:45'),(5,6,1,99,'/source/upload/image/foto_bukti_pembayaran/1482800291.jpg','2016-12-30 13:25:45'),(6,7,1,99,'/source/upload/image/foto_bukti_pembayaran/1482800405.jpg','2016-12-30 13:25:45'),(7,8,1,999,'/source/upload/image/foto_bukti_pembayaran/1482800664.jpg','2016-12-30 13:25:45'),(8,9,1,99,'/source/upload/image/foto_bukti_pembayaran/1482801512.jpg','2016-12-30 13:25:45'),(9,10,2,79,'/source/upload/image/foto_bukti_pembayaran/1483083278.jpg','2016-12-30 14:34:38'),(10,11,3,94499,'/source/upload/image/foto_bukti_pembayaran/1483084240.jpg','2016-12-30 14:50:40'),(11,14,6,888,'/source/upload/image/foto_bukti_pembayaran/1486219437.jpg','2017-02-04 21:43:57'),(12,15,5,9996,'/source/upload/image/foto_bukti_pembayaran/1486219620.jpg','2017-02-04 21:47:00'),(13,16,7,580000,'/source/upload/image/foto_bukti_pembayaran/1486428923.jpg','2017-02-07 07:55:23'),(14,17,10,58000,'/source/upload/image/foto_bukti_pembayaran/1488368550.jpg','2017-03-01 18:42:30'),(15,18,11,400000,'/source/upload/image/foto_bukti_pembayaran/1488418716.jpg','2017-03-02 08:38:36'),(16,19,13,300000,'/source/upload/image/foto_bukti_pembayaran/1488418969.jpg','2017-03-02 08:42:49'),(17,20,13,48880,'/source/upload/image/foto_bukti_pembayaran/1488449348.jpg','2017-03-02 17:09:08'),(18,21,10,300000,'/source/upload/image/foto_bukti_pembayaran/1488501239.jpg','2017-03-03 07:33:59'),(19,22,14,300000,'/source/upload/image/foto_bukti_pembayaran/1488504074.jpg','2017-03-03 08:21:14'),(20,23,17,300000,'/source/upload/image/foto_bukti_pembayaran/1490801524.jpg','2017-03-29 22:32:04'),(21,24,22,300000,'/source/upload/image/foto_bukti_pembayaran/1490924231.jpg','2017-03-31 08:37:12'),(22,25,18,999,'','2017-07-11 07:42:57'),(23,26,15,99888,'/source/upload/image/foto_bukti_pembayaran/1499734054.jpg','2017-07-11 07:47:34'),(24,27,18,9999,'/source/upload/image/foto_bukti_pembayaran/1499954696.jpg','2017-07-13 21:04:56'),(25,28,15,99,'/source/upload/image/foto_bukti_pembayaran/1502787488.jpg','2017-08-15 15:58:08'),(26,29,17,9129123,'/source/upload/image/foto_bukti_pembayaran/1502787780.jpg','2017-08-15 16:03:00'),(27,30,15,999,'/source/upload/image/foto_bukti_pembayaran/1502788164.jpg','2017-08-15 16:09:24'),(28,31,15,666,'/source/upload/image/foto_bukti_pembayaran/1502789243.jpg','2017-08-15 16:27:23');

/*Table structure for table `mustahiq` */

DROP TABLE IF EXISTS `mustahiq`;

CREATE TABLE `mustahiq` (
  `id_mustahiq` int(10) NOT NULL AUTO_INCREMENT,
  `id_calon_mustahiq` int(10) DEFAULT NULL,
  `id_amil_zakat` int(10) DEFAULT NULL,
  `status_mustahiq` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif',
  PRIMARY KEY (`id_mustahiq`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `mustahiq` */

insert  into `mustahiq`(`id_mustahiq`,`id_calon_mustahiq`,`id_amil_zakat`,`status_mustahiq`) values (2,2,2,'Aktif'),(4,6,2,'Aktif'),(5,5,2,'Aktif'),(6,4,2,'Aktif'),(7,7,2,'Aktif'),(8,8,2,'Aktif'),(9,9,2,'Aktif'),(10,11,2,'Aktif'),(11,13,2,'Aktif'),(12,1,2,'Aktif'),(13,10,2,'Aktif'),(14,21,2,'Aktif'),(15,23,2,'Aktif'),(16,20,2,'Aktif'),(17,24,2,'Aktif'),(18,25,2,'Aktif'),(19,22,2,'Aktif'),(20,19,2,'Aktif'),(21,18,2,'Aktif'),(22,15,2,'Aktif'),(23,29,2,'Aktif'),(24,37,1,'Aktif'),(25,36,1,'Aktif'),(26,35,1,'Aktif'),(27,34,1,'Aktif');

/*Table structure for table `muzaki` */

DROP TABLE IF EXISTS `muzaki`;

CREATE TABLE `muzaki` (
  `id_muzaki` int(10) NOT NULL AUTO_INCREMENT,
  `nama_muzaki` varchar(100) DEFAULT NULL,
  `alamat_muzaki` text,
  `no_identitas_muzaki` varchar(100) DEFAULT NULL,
  `no_telp_muzaki` varchar(20) DEFAULT NULL,
  `status_muzaki` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif',
  `id_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_muzaki`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `muzaki` */

insert  into `muzaki`(`id_muzaki`,`nama_muzaki`,`alamat_muzaki`,`no_identitas_muzaki`,`no_telp_muzaki`,`status_muzaki`,`id_user`) values (16,'yuli','graha','645487','875464','Aktif',NULL),(17,'devi','bintaro','31198648007','081364958466','Aktif',NULL),(18,'lintang','jalan kebon nanas 1 Rt 002/Rw 011 kelurahan kebon nanas jakarta timur','38400927349','0811837429','Aktif',NULL),(19,'Hamba Allah','perum kota baru purwakarta kota purwakarta jawa barat','31000927429','087778927392','Aktif',NULL),(20,'fgh','vcc','588','855','Aktif',NULL),(21,'mega','pamulang timur','31002739','0812364829','Aktif',NULL),(22,'hamba allah','jakarta','3100926382','081263849','Aktif',NULL),(23,'hamba allah','bintaro','31238492','087892402832','Aktif',NULL),(24,'DEVI','jakarta timur','310028368','082383479','Aktif',NULL),(25,'Amay Diam','xsvs','dvd','cv','Aktif',NULL),(26,'zjskd','dhdjd','95655','59595','Aktif',NULL),(27,'bzjdjd','xjfkfkf','565259090','565655','Aktif',NULL),(28,'jzks','sjsks','6744','49565','Aktif',NULL),(29,'jk','jk','123','123','Aktif',NULL),(30,'jdud','djdkd','6865','5655','Aktif',NULL),(31,'amay','ok','663','66','Aktif',NULL);

/*Table structure for table `rating_calon_mustahiq` */

DROP TABLE IF EXISTS `rating_calon_mustahiq`;

CREATE TABLE `rating_calon_mustahiq` (
  `id_rating_calon_mustahiq` int(10) NOT NULL AUTO_INCREMENT,
  `id_calon_mustahiq` int(10) DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  `rating` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_rating_calon_mustahiq`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `rating_calon_mustahiq` */

insert  into `rating_calon_mustahiq`(`id_rating_calon_mustahiq`,`id_calon_mustahiq`,`id_user`,`rating`) values (9,37,1,5),(10,36,1,4),(11,25,NULL,5),(12,23,NULL,3),(13,33,1,4);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id_user` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `no_identitas` varchar(30) DEFAULT NULL,
  `tipe_user` enum('1','2') DEFAULT '2',
  `status` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id_user`,`username`,`password`,`nama`,`alamat`,`no_telp`,`no_identitas`,`tipe_user`,`status`) values (1,'admin1','123','Rizki',NULL,NULL,NULL,'1','Aktif'),(2,'amay','123','Amay Diam','xsvs','cv','dvd','2','Aktif'),(3,'dika','123','Dika Pratama','dvdv','vds','dvdv','2','Aktif'),(5,'jamal','123','amay','djdkdkd','656555','56555','2','Aktif'),(6,'ayam','123','bzjdjd','xjfkfkf','565655','565259090','2','Aktif'),(7,'admin2','123','Amay',NULL,NULL,NULL,'1','Aktif'),(9,'admin3','123','Dika',NULL,NULL,NULL,'1','Aktif'),(10,'admin4','123','Dika',NULL,NULL,NULL,'1','Aktif');

/*Table structure for table `validasi_mustahiq` */

DROP TABLE IF EXISTS `validasi_mustahiq`;

CREATE TABLE `validasi_mustahiq` (
  `id_validasi_mustahiq` int(10) NOT NULL AUTO_INCREMENT,
  `id_mustahiq` int(10) DEFAULT NULL,
  `id_amil_zakat` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_validasi_mustahiq`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `validasi_mustahiq` */

insert  into `validasi_mustahiq`(`id_validasi_mustahiq`,`id_mustahiq`,`id_amil_zakat`) values (1,2,1),(2,2,2),(3,23,2),(4,22,2),(5,23,1),(6,NULL,1),(7,NULL,1),(8,NULL,1),(9,NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
