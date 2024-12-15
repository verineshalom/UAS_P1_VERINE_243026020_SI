-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Des 2024 pada 05.40
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `musik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `id_album` varchar(30) NOT NULL,
  `id_artist` varchar(30) NOT NULL,
  `id_genre` varchar(30) NOT NULL,
  `judul_album` varchar(225) NOT NULL,
  `tahun` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`id_album`, `id_artist`, `id_genre`, `judul_album`, `tahun`) VALUES
('2211', '1011', '1', 'Sour', '2021'),
('2212', '1012', '1', 'Lover', '2019'),
('2213', '1013', '2', 'Lilac', '2021'),
('2214', '1014', '1', 'Joyride', '2024'),
('2215', '1015', '3', 'Nicole', '2021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `artist`
--

CREATE TABLE `artist` (
  `id_artist` varchar(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `negara` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `artist`
--

INSERT INTO `artist` (`id_artist`, `nama`, `negara`) VALUES
('1011', 'Olivia Rodrigo', 'Amerika'),
('1012', 'Taylor Swift', 'Amerika'),
('1013', 'IU', 'Korea'),
('1014', 'Astrid S', 'Norwegia'),
('1015', 'Niki', 'Amerika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `genre`
--

CREATE TABLE `genre` (
  `id_genre` varchar(30) NOT NULL,
  `genre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `genre`
--

INSERT INTO `genre` (`id_genre`, `genre`) VALUES
('1', 'dangdut'),
('2', 'K-pop'),
('3', 'Indie');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lagu`
--

CREATE TABLE `lagu` (
  `id_lagu` varchar(30) NOT NULL,
  `id_album` varchar(30) NOT NULL,
  `id_artist` varchar(30) NOT NULL,
  `judul_lagu` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lagu`
--

INSERT INTO `lagu` (`id_lagu`, `id_album`, `id_artist`, `judul_lagu`) VALUES
('2111', '2211', '1011', 'Happier'),
('2112', '2212', '1012', 'Lover'),
('2113', '2213', '1013', 'Lilac'),
('2114', '2214', '1014', 'Joyride'),
('2115', '2215', '1015', 'High School In Jakarta');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`),
  ADD KEY `id_tahun` (`tahun`),
  ADD KEY `id_artist` (`id_artist`),
  ADD KEY `id_genre` (`id_genre`);

--
-- Indeks untuk tabel `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id_artist`),
  ADD KEY `id_negara` (`negara`);

--
-- Indeks untuk tabel `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id_genre`);

--
-- Indeks untuk tabel `lagu`
--
ALTER TABLE `lagu`
  ADD PRIMARY KEY (`id_lagu`),
  ADD KEY `id_album` (`id_album`),
  ADD KEY `id_artist` (`id_artist`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_artist`) REFERENCES `artist` (`id_artist`),
  ADD CONSTRAINT `album_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`);

--
-- Ketidakleluasaan untuk tabel `lagu`
--
ALTER TABLE `lagu`
  ADD CONSTRAINT `lagu_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`),
  ADD CONSTRAINT `lagu_ibfk_2` FOREIGN KEY (`id_artist`) REFERENCES `artist` (`id_artist`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
