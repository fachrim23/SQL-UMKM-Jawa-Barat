DROP TABLE mahasiswa;
CREATE TABLE mahasiswa (
	nama_mahasiswa VARCHAR(50),
	kelas VARCHAR(1),
    nilai INT,
    gender VARCHAR(1)
);

INSERT INTO mahasiswa(nama_mahasiswa, kelas, nilai, gender) VALUES
	("AMANDA", "A", 65, "W"),
    ("ANDI", "B", 40, "P"),
    ("ARUMAN", "C", 80, "W"),
    ("ASHARI", "A", 90, "P"),
    ("DIANA", "B", 75, "W"),
    ("GILANG", "C", 85, "P"),
    ("NADIA", "A", 60, "W"),
    ("NISA", "B", 70, "W"),
    ("REZA", "C", 95, "P");

SELECT * FROM mahasiswa;
SELECT * FROM wali_kelas;

CREATE TABLE wali_kelas (
	nama_wali_kelas VARCHAR(50),
    kelas VARCHAR(1)
);

INSERT INTO wali_kelas(nama_wali_kelas, kelas) VALUES
	("SUTARNO", "A"),
    ("JONATHAN", "B"),
	("VANIA", "C"),
    ("RAISA", "D");

-- Inner join, akan menghapus kolom yang tidak punya pasangan
SELECT nama_wali_kelas, wali_kelas.kelas, nama_mahasiswa FROM wali_kelas
	INNER JOIN mahasiswa ON wali_kelas.kelas = mahasiswa.kelas;
    
-- Left join, wali kelas yang tidak mempunyai mahasiswa akan bernilai NULL
SELECT nama_wali_kelas, wali_kelas.kelas, nama_mahasiswa FROM wali_kelas
	LEFT JOIN mahasiswa ON wali_kelas.kelas = mahasiswa.kelas;
    
-- Right join, mahasiswa yang tidak mempunyai wali kelas akan bernilai NULL
SELECT nama_wali_kelas, mahasiswa.kelas, nama_mahasiswa FROM wali_kelas
	RIGHT JOIN mahasiswa ON wali_kelas.kelas = mahasiswa.kelas;

-- Full outer (UNION)
SELECT nama_wali_kelas, wali_kelas.kelas, nama_mahasiswa FROM wali_kelas
	LEFT JOIN mahasiswa ON wali_kelas.kelas = mahasiswa.kelas
UNION
SELECT nama_wali_kelas, mahasiswa.kelas, nama_mahasiswa FROM wali_kelas
	RIGHT JOIN mahasiswa ON wali_kelas.kelas = mahasiswa.kelas;
    
-- Cross join, semua tabel wali kelas digabungkan dengan tabel mahasiswa
SELECT 
nama_wali_kelas, 
wali_kelas.kelas,
mahasiswa.kelas AS kelas_mahasiswa,
nama_mahasiswa 
	FROM wali_kelas
	CROSS JOIN mahasiswa ORDER BY kelas ASC;
    
-- Mahasiswa yang nilai rata-rata diatas 70 ?
SELECT nama_mahasiswa FROM mahasiswa
	WHERE nilai > (SELECT AVG(nilai) FROM mahasiswa);
 
 -- Sapakah mahasiswa Pak Jonathan yang mendapat nilai diatas 70 ?
-- menggunakan nested query atau sub query
SELECT nama_mahasiswa FROM mahasiswa
	WHERE kelas = (SELECT kelas FROM wali_kelas WHERE nama_wali_kelas = "JONATHAN")
    AND nilai > 70;
-- menggunakan Inner Join
SELECT nama_mahasiswa FROM mahasiswa
	INNER JOIN wali_kelas on mahasiswa.kelas = wali_kelas.kelas
    WHERE nama_wali_kelas = "JONATHAN"
    AND nilai > 70;