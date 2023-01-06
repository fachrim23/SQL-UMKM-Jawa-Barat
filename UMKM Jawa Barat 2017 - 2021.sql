CREATE DATABASE umkm;

-- 1. Check tabel umkm_jabar
SELECT * FROM umkm_jabar;

-- 2. Data umkm di kota bandung
SELECT * FROM umkm_jabar WHERE nama_kabupaten_kota = "KOTA BANDUNG"; 

-- 3. Data umkm dari tahun 2019 dan disusun berdasarkan kategori_usaha
SELECT * FROM umkm_jabar WHERE tahun >= 2019 ORDER BY kategori_usaha;
-- row dibatasi sampai 10
SELECT * FROM umkm_jabar WHERE tahun >= 2019 ORDER BY kategori_usaha, tahun LIMIT 10;

-- 4. ada kategori usaha apa saja yang terdapat di dataset ?
SELECT DISTINCT kategori_usaha FROM umkm_jabar; 
	-- menggunakan klausul DISTINCT digunakan untuk menghapus baris-baris yang duplikat

-- 5. menunjukkan seluruh data untuk kategori_usaha FASHION dan MAKANAN
SELECT * FROM umkm_jabar WHERE kategori_usaha IN ("FASHION", "MAKANAN");
	-- atau
SELECT * FROM umkm_jabar WHERE kategori_usaha = "FASHION" OR kategori_usaha = "MAKANAN";

-- 6. menunjukkan seluruh data dengan kategori_usaha FASHION di kabupaten karawang
SELECT * FROM umkm_jabar WHERE kategori_usaha = "FASHION" AND nama_kabupaten_kota = "KABUPATEN KARAWANG";

-- 7. menunjukkan seluruh data selain kategori_usaha kuliner, makanan, dan minuman
SELECT * FROM umkm_jabar WHERE kategori_usaha NOT IN ("KULINER", "MAKANAN", "MINUMAN");

-- 8. dari tahun 2017 - 2020, bagaimana tren jumlah umkm di kabupaten tasikmalaya untuk kategori_usaha Batik ?
SELECT nama_kabupaten_kota, kategori_usaha, jumlah_umkm, satuan, tahun FROM umkm_jabar 
	WHERE tahun BETWEEN 2017 AND 2020 
    AND nama_kabupaten_kota = "KABUPATEN TASIKMALAYA"
    AND kategori_usaha = "BATIK";

-- 9. diantara kota bandung, kabupaten bandung, dan kabupaten bandung barat. Dimanakah umkm kuliner terpusat pada tahun 2021 ?
SELECT * FROM umkm_jabar 
WHERE nama_kabupaten_kota LIKE "%BANDUNG%"
AND kategori_usaha = "KULINER" AND tahun = 2021;
	-- menggunakan klausul LIKE dimaksudkan karena pada nama kabupaten kota terdapat pola yang ketiga namanya mengandung
    -- teks BANDUNG dan penggunaan % dimaksudkan untuk mengisi kata sebelum dan sesudah BANDUNG

-- 10. kabupaten/kota mana saja yang memiliki angka 7 pada digit ke 3 kode_kabupaten_kota tersebut ?
SELECT DISTINCT kode_kabupaten_kota, nama_kabupaten_kota FROM umkm_jabar WHERE kode_kabupaten_kota LIKE "___7%";
	-- menggunakan "_ (Underscore)" tiga kali dimaksudkan untuk mengambil 3 digit dari angka awal
