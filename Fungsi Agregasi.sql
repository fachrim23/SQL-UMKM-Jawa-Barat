SELECT * FROM umkm_jabar;

-- 1. Berapa jumlah baris dari tabel umkm_jabar ?
SELECT COUNT(*) AS jumlah_baris FROM umkm_jabar;

-- 2. Berapa jumlah umkm di Kabupaten Bekasi pada tahun 2017 ?
SELECT SUM(jumlah_umkm) AS jumlah_umkm_Kab_Bekasi_2017 FROM umkm_jabar 
	WHERE nama_kabupaten_kota = "KABUPATEN BEKASI"
    AND tahun = 2017;

-- 3. Bagaimana tren jumlah umkm di Kabupaten Karawang dari tahun 2017 - 2021 ?
SELECT SUM(jumlah_umkm) AS jumlah_umkm_kab_karawang, tahun FROM umkm_jabar 
	WHERE nama_kabupaten_kota = "KABUPATEN KARAWANG"
    AND tahun BETWEEN 2017 AND 2021
    GROUP BY tahun;
-- 4. Berapa jumlah rata-rata umkm setiap kategori usaha per kabupaten/kota di jawa barat pada tahun 2021 ? 
SELECT tahun, kategori_usaha, AVG(jumlah_umkm) AS rerata_jumlah_umkm FROM umkm_jabar
	WHERE tahun = 2021 GROUP BY kategori_usaha ORDER BY kategori_usaha;

-- 5, Nilai minimum dan maksimum dari kolom jumlah_umkm ?
SELECT MIN(jumlah_umkm) AS jumlah_minimum_umkm, MAX(jumlah_umkm) AS jumlah_maksimum_umkm FROM umkm_jabar;

-- 6. Kabupaten/kota apa yang memiliki jumlah UMKM kurang dari 100.000 pada tahun 2020 ? 
SELECT nama_kabupaten_kota, SUM(jumlah_umkm) AS jumlah_umkm_2020 FROM umkm_jabar
	WHERE tahun = 2020 GROUP BY nama_kabupaten_kota HAVING jumlah_umkm_2020 < 100000;