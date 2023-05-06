
use percobaan;

-- Tambahkan kolom status_pembayaran pada tabel pembayaran
ALTER TABLE pembayaran
ADD COLUMN status_pembayaran varchar(10) DEFAULT 'Belum Lunas';

-- Buat trigger untuk mengubah status_pembayaran menjadi 'Lunas' jika pesanan sudah dibayar
DELIMITER $$
CREATE TRIGGER update_status_pembayaran
AFTER INSERT ON pembayaran
FOR EACH ROW
BEGIN
    DECLARE total_pembayaran double;
    DECLARE total_pesanan double;
    
    -- Mengambil jumlah total pembayaran
    SELECT SUM(jumlah) INTO total_pembayaran
    FROM pembayaran
    WHERE pesanan_id = NEW.pesanan_id;
    
    -- Mengambil jumlah total pesanan
    SELECT jumlah INTO total_pesanan
    FROM pesanan
    WHERE id = NEW.pesanan_id;
    
    -- Memeriksa apakah pesanan sudah dibayar lunas
    IF total_pembayaran >= total_pesanan THEN
        UPDATE pembayaran
        SET status_pembayaran = 'Lunas'
        WHERE pesanan_id = NEW.pesanan_id;
    END IF;
END$$
DELIMITER ;
