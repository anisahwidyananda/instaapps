-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jun 2021 pada 21.50
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `instaapp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `idkomen` int(11) NOT NULL,
  `idpost` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `deskripsi` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `postingan`
--

CREATE TABLE `postingan` (
  `idpost` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  `suka` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `postingan`
--

INSERT INTO `postingan` (`idpost`, `id_user`, `gambar`, `text`, `suka`) VALUES
(8, 6, 'images (4).jpg', 'pemandangan yang indah', 2),
(13, 10, '26940.jpg', 'sleep not found:v', 1),
(14, 12, '3852315.jpg', 'Halo halo semua!\r\n\r\nPandemi udah jalan setahun lebih, mintas sedih melihat masih banyak tmn2 yg mengalami Long Covid dan belum sembuh 100% berbulan-bulan lamanya.\r\n\r\nUntuk tmn2 yg sudah mendapatkan pe', 2),
(15, 10, '4884785.jpg', 'introduce for web developing guys...', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `teman`
--

CREATE TABLE `teman` (
  `id` int(11) DEFAULT NULL,
  `id_teman` int(11) DEFAULT NULL,
  `status` enum('mengikuti','belum') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `teman`
--

INSERT INTO `teman` (`id`, `id_teman`, `status`) VALUES
(4, 7, 'mengikuti'),
(7, 4, 'mengikuti'),
(7, 7, 'mengikuti'),
(7, 7, 'mengikuti'),
(8, 4, 'mengikuti'),
(8, 6, 'mengikuti'),
(9, 6, 'mengikuti'),
(10, 7, 'mengikuti'),
(10, 4, 'mengikuti'),
(12, 4, 'mengikuti');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(64) DEFAULT NULL,
  `tgl` varchar(15) DEFAULT NULL,
  `foto` varchar(64) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `pwd` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `tgl`, `foto`, `username`, `pwd`) VALUES
(4, 'yuliana', '2021-04-04', 'default.jpg', 'yuli', 'dde70fc51aa3b23750412dcd3abff36a2a483f63d20fa4b92ab44a45ac555b4b'),
(6, 'sufi', '2000-09-12', 'default.jpg', 'sufi', '496ea25eccbe28cb7642b75edfcb94711d2248e56a1d4770cc694e084a185812'),
(7, 'deny', '2021-04-21', 'default.jpg', 'deny', '14e3a65c1c4fba75888f9d6337689561d2c0a6a1d674fa36eb676b6c387ea9fc'),
(8, 'ana', '2021-04-09', 'default.jpg', 'anamghf', 'e82827b00b2ca8620beb37f879778c082b292a52270390cff35b6fe3157f4e8b'),
(9, 'anisah', '2021-06-08', 'default.jpg', 'anisahw', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'),
(10, 'ferry', '2021-06-16', 'default.jpg', 'ferrydz', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'),
(11, 'sufi', '2000-09-12', 'default.jpg', 'sufi', '496ea25eccbe28cb7642b75edfcb94711d2248e56a1d4770cc694e084a185812'),
(12, 'linda', '2021-06-16', 'default.jpg', 'lindaafd', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`idkomen`),
  ADD KEY `idpost` (`idpost`);

--
-- Indeks untuk tabel `postingan`
--
ALTER TABLE `postingan`
  ADD PRIMARY KEY (`idpost`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `teman`
--
ALTER TABLE `teman`
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `idkomen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `postingan`
--
ALTER TABLE `postingan`
  MODIFY `idpost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`idpost`) REFERENCES `postingan` (`idpost`);

--
-- Ketidakleluasaan untuk tabel `postingan`
--
ALTER TABLE `postingan`
  ADD CONSTRAINT `postingan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `teman`
--
ALTER TABLE `teman`
  ADD CONSTRAINT `teman_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
