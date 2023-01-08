CREATE TABLE mahasiswa (
	nama_awal_mahasiswa VARCHAR(50),
    nama_akhir_mahasiswa VARCHAR(50),
    kelas VARCHAR(1),
    tanggal_lahir TIMESTAMP,
    instagram VARCHAR(50)
);

INSERT INTO mahasiswa (nama_awal_mahasiswa, nama_akhir_mahasiswa, kelas, tanggal_lahir, instagram) 
	VALUES 
	("AMANDA", "GUNAWAN", "A", '1997-11-11 13:23:44', "mandasq"),
    ("ANDI", "RUSANTO", "B", '1999-10-21 11:22:04', "andiboi89"),
    ("ARUMAN", "BUDIMAN", "C", '2000-01-31 11:03:22', "rumanzz"),
    ("ASHARI", "KRISNA", "A", '1999-09-22 03:23:43', "irasha22");
    
SELECT * FROM mahasiswa;

SELECT *, 
	CONCAT_WS(" ", nama_awal_mahasiswa, nama_akhir_mahasiswa) AS nama_lengkap_mahasiswa,
    CONCAT_WS("/", "www.instagram.com", instagram) AS url_instagram,
    SUBSTR(CONCAT_WS("/", "www.instagram.com", instagram), 19, 50) AS url_instagram,
    REPEAT(kelas, 10) AS replicate,
    LOWER(REVERSE(nama_awal_mahasiswa)) AS nama_awal_mahasiswa_reversed,
    TRIM(nama_akhir_mahasiswa) AS nama_akhir_cleaned,
    LPAD(nama_awal_mahasiswa, 20, kelas) AS lpad,
    RPAD(nama_awal_mahasiswa, 20, kelas) AS rpad,
    REPLACE(CONCAT_WS("/", "www.tiktok .com", instagram), "instagram", "tiktok") AS url_tiktok
FROM mahasiswa;

SELECT *, DATE(tanggal_lahir) AS tgl_lahir,
	TIMESTAMP(DATE(tanggal_lahir)) AS tanggal_lahir_2,
    MONTH(tanggal_lahir) AS bulan_lahir,
    YEAR(tanggal_lahir) AS tahun_lahir,
    DAY(tanggal_lahir) AS hari_lahir,
    CONCAT_WS('-', YEAR(tanggal_lahir), MONTH(tanggal_lahir), DAY(tanggal_lahir)) AS tanggal_lahir_concat
FROM mahasiswa;

SELECT DATEDIFF(Andi, Amanda) AS selisih_tanggal_lahir
FROM (SELECT 
	(SELECT tanggal_lahir FROM mahasiswa WHERE nama_awal_mahasiswa = "AMANDA") AS Amanda,
    (SELECT tanggal_lahir FROM mahasiswa WHERE nama_awal_mahasiswa = "ANDI") AS Andi) amanda_andi
    
