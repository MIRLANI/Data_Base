-- membuat tabel produk
create table pelanggan(
    id int auto_increment primary key,
    kode varchar(10) unique,
    nama varchar(45),
    jk char(1),
    tmp_lahir varchar(30),
    tgl_lahir date,
    email varchar(45),
    kartu_id int not null references kartu(id));




--Membuat Table Produk
CREATE TABLE produk (
  id INT(11) PRIMARY KEY,
  kode VARCHAR(10),
  nama VARCHAR(45),
  harga_beli DOUBLE,
  harga_jual DOUBLE,
  stok INT(11),
  min_stok INT(11),
  jenis_produk INT(11)
);



--Membuat Table vendor
CREATE TABLE vendor(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nomor VARCHAR(4) UNIQUE,
    nama VARCHAR(40),
    kota VARCHAR(30),
    kontak VARCHAR(30)
);


-- Membuat Table Pembelian
CREATE TABLE pembeli (
  id INT(11),
  tanggal VARCHAR(45),
  nomor VARCHAR(10),
  produk_id INT(11),
  jumlah INT(11),
  harga DOUBLE,
  vendor_id INT(11),
  FOREIGN KEY (produk_id) REFERENCES produk(id),
  FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);



-- Membuat Table Pesan items
CREATE TABLE pesanan_items (
  id INT(11),
  produk_id INT(11),
  pesanan_id INT(11),
  qty INT(11),
  harga DOUBLE,
  FOREIGN KEY (produk_id) REFERENCES produk(id)
 );



-- kolom alamat pada pelanggan dengan tipe data varchar (40)
ALTER TABLE pelanggan
ADD COLUMN alamat VARCHAR(40);


-- Ubah nama kolom "nama" menjadi "nama_pelanggan" pada tabel "pelanggan":
ALTER TABLE pelanggan
CHANGE COLUMN nama nama_pelanggan VARCHAR(45);


-- Ubah tipe data kolom "nama_pelanggan" menjadi VARCHAR(50):
ALTER TABLE pelanggan
MODIFY COLUMN nama_pelanggan VARCHAR(50);


