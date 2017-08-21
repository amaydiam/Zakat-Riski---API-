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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `calon_mustahiq` */

insert  into `calon_mustahiq`(`id_calon_mustahiq`,`nama_calon_mustahiq`,`alamat_calon_mustahiq`,`latitude_calon_mustahiq`,`longitude_calon_mustahiq`,`no_identitas_calon_mustahiq`,`no_telp_calon_mustahiq`,`id_user_perekomendasi`,`alasan_perekomendasi_calon_mustahiq`,`photo_1`,`photo_2`,`photo_3`,`caption_photo_1`,`caption_photo_2`,`caption_photo_3`,`status_calon_mustahiq`) values (1,'Maya','Jl. Kakak Tua Blok B3 No.27, Pamulang Tim., Pamulang, Kota Tangerang Selatan, Banten 15417, Indonesia','-6.3417975000000055','106.74754296874997','123','123',12,'ada deh','/source/upload/image/photo_calon_mustahiq/photo_1_1503287829.jpg','/source/upload/image/photo_calon_mustahiq/photo_2_1503287829.jpg','/source/upload/image/photo_calon_mustahiq/photo_3_1503287829.jpg','zbbz','zbxb','xbbxnx','Aktif');

/*Table structure for table `donasi` */

DROP TABLE IF EXISTS `donasi`;

CREATE TABLE `donasi` (
  `id_donasi` int(10) NOT NULL AUTO_INCREMENT,
  `id_muzaki` int(10) DEFAULT NULL,
  `id_mustahiq` int(10) DEFAULT NULL,
  `jumlah_donasi` int(10) DEFAULT NULL,
  `id_amil_zakat` int(10) DEFAULT NULL,
  `keterangan` text,
  `waktu_donasi` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_donasi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `donasi` */

insert  into `donasi`(`id_donasi`,`id_muzaki`,`id_mustahiq`,`jumlah_donasi`,`id_amil_zakat`,`keterangan`,`waktu_donasi`) values (1,1,3,1,1,'/source/upload/image/foto_bukti_pembayaran/1503288624.jpg','2017-08-21 11:10:24'),(2,2,3,1,1,'/source/upload/image/foto_bukti_pembayaran/1503289266.jpg','2017-08-21 11:21:06'),(3,3,3,200000,1,'/source/upload/image/foto_bukti_pembayaran/1503289404.jpg','2017-08-21 11:23:24');

/*Table structure for table `mustahiq` */

DROP TABLE IF EXISTS `mustahiq`;

CREATE TABLE `mustahiq` (
  `id_mustahiq` int(10) NOT NULL AUTO_INCREMENT,
  `id_calon_mustahiq` int(10) DEFAULT NULL,
  `id_amil_zakat` int(10) DEFAULT NULL,
  `status_mustahiq` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif',
  PRIMARY KEY (`id_mustahiq`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `mustahiq` */

insert  into `mustahiq`(`id_mustahiq`,`id_calon_mustahiq`,`id_amil_zakat`,`status_mustahiq`) values (3,1,1,'Aktif');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `muzaki` */

insert  into `muzaki`(`id_muzaki`,`nama_muzaki`,`alamat_muzaki`,`no_identitas_muzaki`,`no_telp_muzaki`,`status_muzaki`,`id_user`) values (1,'Amay','Pamulang','123','123','Aktif',NULL),(2,'Amay','Pamulang','123','123','Aktif',NULL),(3,'Amay','Pamulang','123','123','Aktif',NULL);

/*Table structure for table `rating_calon_mustahiq` */

DROP TABLE IF EXISTS `rating_calon_mustahiq`;

CREATE TABLE `rating_calon_mustahiq` (
  `id_rating_calon_mustahiq` int(10) NOT NULL AUTO_INCREMENT,
  `id_calon_mustahiq` int(10) DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  `rating` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_rating_calon_mustahiq`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `rating_calon_mustahiq` */

insert  into `rating_calon_mustahiq`(`id_rating_calon_mustahiq`,`id_calon_mustahiq`,`id_user`,`rating`) values (1,1,12,5),(2,1,12,5),(3,1,12,5);

/*Table structure for table `rekomendasi_calon_mustahiq` */

DROP TABLE IF EXISTS `rekomendasi_calon_mustahiq`;

CREATE TABLE `rekomendasi_calon_mustahiq` (
  `id_rekomendasi_calon_mustahiq` int(10) NOT NULL AUTO_INCREMENT,
  `id_calon_mustahiq` int(10) DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_rekomendasi_calon_mustahiq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `rekomendasi_calon_mustahiq` */

insert  into `rekomendasi_calon_mustahiq`(`id_rekomendasi_calon_mustahiq`,`id_calon_mustahiq`,`id_user`) values (1,NULL,12);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id_user`,`username`,`password`,`nama`,`alamat`,`no_telp`,`no_identitas`,`tipe_user`,`status`) values (1,'admin1','123','Rizki',NULL,NULL,NULL,'1','Aktif'),(2,'admin2','123','Amay',NULL,NULL,NULL,'1','Aktif'),(3,'admin3','123','Dika',NULL,NULL,NULL,'1','Aktif'),(4,'admin4','123','Dika',NULL,NULL,NULL,'1','Aktif'),(12,'amay','123','Amay','Pamulang','123','123','2','Aktif');

/*Table structure for table `validasi_mustahiq` */

DROP TABLE IF EXISTS `validasi_mustahiq`;

CREATE TABLE `validasi_mustahiq` (
  `id_validasi_mustahiq` int(10) NOT NULL AUTO_INCREMENT,
  `id_mustahiq` int(10) DEFAULT NULL,
  `id_amil_zakat` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_validasi_mustahiq`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `validasi_mustahiq` */

insert  into `validasi_mustahiq`(`id_validasi_mustahiq`,`id_mustahiq`,`id_amil_zakat`) values (4,3,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
