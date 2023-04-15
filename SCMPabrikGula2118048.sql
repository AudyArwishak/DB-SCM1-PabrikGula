-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2023 at 10:03 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pabrikgula`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` varchar(10) NOT NULL,
  `nama_admin` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `kata_sandi` varchar(20) NOT NULL,
  `level_akses` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_gudang`
--

CREATE TABLE `tb_gudang` (
  `id_gudang` varchar(10) NOT NULL,
  `nama_gudang` varchar(20) NOT NULL,
  `alamat_gudang` varchar(50) NOT NULL,
  `id_gula` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_gula`
--

CREATE TABLE `tb_gula` (
  `id_gula` varchar(10) NOT NULL,
  `nama_gula` varchar(20) NOT NULL,
  `stok_gula` varchar(15) NOT NULL,
  `harga_gula` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jadwalpengiriman`
--

CREATE TABLE `tb_jadwalpengiriman` (
  `id_jadwal` varchar(10) NOT NULL,
  `id_pengiriman` varchar(10) NOT NULL,
  `id_outlet` varchar(10) NOT NULL,
  `tanggal_pengiriman` date NOT NULL,
  `id_gudang` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_outlet`
--

CREATE TABLE `tb_outlet` (
  `id_outlet` varchar(10) NOT NULL,
  `nama_outlet` varchar(20) NOT NULL,
  `alamat_outlet` varchar(50) NOT NULL,
  `notelp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `id_pegawai` varchar(10) NOT NULL,
  `nama_pegawai` varchar(20) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `id_gudang` varchar(10) NOT NULL,
  `id_pengiriman` varchar(10) NOT NULL,
  `id_jadwal` varchar(10) NOT NULL,
  `id_truk` varchar(10) NOT NULL,
  `id_admin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengiriman`
--

CREATE TABLE `tb_pengiriman` (
  `id_pengiriman` varchar(10) NOT NULL,
  `total_berat` varchar(15) NOT NULL,
  `id_truk` varchar(10) NOT NULL,
  `id_supir` varchar(10) NOT NULL,
  `id_gula` varchar(10) NOT NULL,
  `id_outlet` varchar(10) NOT NULL,
  `jumlah/kg` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rute`
--

CREATE TABLE `tb_rute` (
  `id_rute` varchar(10) NOT NULL,
  `id_pengiriman` varchar(10) NOT NULL,
  `id_gudang` varchar(10) NOT NULL,
  `id_outlet` varchar(10) NOT NULL,
  `jarak_rute` varchar(15) NOT NULL,
  `nama_rute` varchar(30) NOT NULL,
  `ket_rute` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_supir`
--

CREATE TABLE `tb_supir` (
  `id_supir` varchar(10) NOT NULL,
  `nama_supir` varchar(20) NOT NULL,
  `alamat_supir` varchar(50) NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `id_truk` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_truk`
--

CREATE TABLE `tb_truk` (
  `id_truk` varchar(10) NOT NULL,
  `nama_truk` varchar(20) NOT NULL,
  `kapasitas_truk` varchar(15) NOT NULL,
  `plat_nomor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_gudang`
--
ALTER TABLE `tb_gudang`
  ADD PRIMARY KEY (`id_gudang`),
  ADD KEY `id_gula` (`id_gula`);

--
-- Indexes for table `tb_gula`
--
ALTER TABLE `tb_gula`
  ADD PRIMARY KEY (`id_gula`);

--
-- Indexes for table `tb_jadwalpengiriman`
--
ALTER TABLE `tb_jadwalpengiriman`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_pengiriman` (`id_pengiriman`),
  ADD KEY `id_outlet` (`id_outlet`),
  ADD KEY `id_gudang` (`id_gudang`);

--
-- Indexes for table `tb_outlet`
--
ALTER TABLE `tb_outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_gudang` (`id_gudang`),
  ADD KEY `id_pengiriman` (`id_pengiriman`),
  ADD KEY `id_jadwal` (`id_jadwal`),
  ADD KEY `id_truk` (`id_truk`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  ADD PRIMARY KEY (`id_pengiriman`),
  ADD KEY `id_truk` (`id_truk`),
  ADD KEY `id_supir` (`id_supir`),
  ADD KEY `id_gula` (`id_gula`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- Indexes for table `tb_rute`
--
ALTER TABLE `tb_rute`
  ADD PRIMARY KEY (`id_rute`),
  ADD KEY `id_pengiriman` (`id_pengiriman`),
  ADD KEY `id_outlet_tujuan` (`id_outlet`),
  ADD KEY `id_gudang_asal` (`id_gudang`);

--
-- Indexes for table `tb_supir`
--
ALTER TABLE `tb_supir`
  ADD PRIMARY KEY (`id_supir`),
  ADD KEY `id_truk` (`id_truk`);

--
-- Indexes for table `tb_truk`
--
ALTER TABLE `tb_truk`
  ADD PRIMARY KEY (`id_truk`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_gudang`
--
ALTER TABLE `tb_gudang`
  ADD CONSTRAINT `tb_gudang_ibfk_1` FOREIGN KEY (`id_gula`) REFERENCES `tb_gula` (`id_gula`);

--
-- Constraints for table `tb_jadwalpengiriman`
--
ALTER TABLE `tb_jadwalpengiriman`
  ADD CONSTRAINT `tb_jadwalpengiriman_ibfk_1` FOREIGN KEY (`id_pengiriman`) REFERENCES `tb_pengiriman` (`id_pengiriman`),
  ADD CONSTRAINT `tb_jadwalpengiriman_ibfk_2` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id_outlet`),
  ADD CONSTRAINT `tb_jadwalpengiriman_ibfk_3` FOREIGN KEY (`id_gudang`) REFERENCES `tb_gudang` (`id_gudang`);

--
-- Constraints for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD CONSTRAINT `tb_pegawai_ibfk_1` FOREIGN KEY (`id_gudang`) REFERENCES `tb_gudang` (`id_gudang`),
  ADD CONSTRAINT `tb_pegawai_ibfk_2` FOREIGN KEY (`id_pengiriman`) REFERENCES `tb_pengiriman` (`id_pengiriman`),
  ADD CONSTRAINT `tb_pegawai_ibfk_3` FOREIGN KEY (`id_jadwal`) REFERENCES `tb_jadwalpengiriman` (`id_jadwal`),
  ADD CONSTRAINT `tb_pegawai_ibfk_4` FOREIGN KEY (`id_truk`) REFERENCES `tb_truk` (`id_truk`),
  ADD CONSTRAINT `tb_pegawai_ibfk_5` FOREIGN KEY (`id_admin`) REFERENCES `tb_admin` (`id_admin`);

--
-- Constraints for table `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  ADD CONSTRAINT `tb_pengiriman_ibfk_1` FOREIGN KEY (`id_truk`) REFERENCES `tb_truk` (`id_truk`),
  ADD CONSTRAINT `tb_pengiriman_ibfk_2` FOREIGN KEY (`id_supir`) REFERENCES `tb_supir` (`id_supir`),
  ADD CONSTRAINT `tb_pengiriman_ibfk_3` FOREIGN KEY (`id_gula`) REFERENCES `tb_gula` (`id_gula`),
  ADD CONSTRAINT `tb_pengiriman_ibfk_4` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id_outlet`);

--
-- Constraints for table `tb_rute`
--
ALTER TABLE `tb_rute`
  ADD CONSTRAINT `tb_rute_ibfk_1` FOREIGN KEY (`id_pengiriman`) REFERENCES `tb_pengiriman` (`id_pengiriman`),
  ADD CONSTRAINT `tb_rute_ibfk_2` FOREIGN KEY (`id_gudang`) REFERENCES `tb_gudang` (`id_gudang`),
  ADD CONSTRAINT `tb_rute_ibfk_3` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id_outlet`);

--
-- Constraints for table `tb_supir`
--
ALTER TABLE `tb_supir`
  ADD CONSTRAINT `tb_supir_ibfk_1` FOREIGN KEY (`id_truk`) REFERENCES `tb_truk` (`id_truk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
