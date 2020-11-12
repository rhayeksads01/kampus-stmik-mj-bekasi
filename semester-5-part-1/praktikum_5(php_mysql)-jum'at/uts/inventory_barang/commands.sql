-- copy dan paste code ini untuk menambah data
insert into barang values (null, 'Laptop', '2020-10-25', 0);
insert into barang_masuk values (null, 100, null, 4);
insert into barang_keluar values (null, 60, null, 4);
select * from barang;
select * from barang_masuk;
select * from barang_keluar;

-- copy dan paste code ini untuk mangedit data barang masuk dan keluar berdasarkan id key nya
update barang_masuk
set deskripsi_barang_masuk = 'Sumbangan Hamba Allah'
where id_barang_masuk = 4;
update barang_keluar
set deskripsi_barang_keluar = 'Diberikan untuk Yayasan Panti Asuhan IT'
where id_barang_keluar = 4;
select * from barang_masuk;
select * from barang_keluar;

-- copy dan paste code ini untuk menghapus data barang masuk dan keluar berdasarkan id key nya
delete from barang_masuk where id_barang_masuk = 1;
delete from barang_keluar where id_barang_keluar = 1;
select * from barang_masuk;
select * from barang_keluar;

-- copy dan paste code ini untuk menampilkan data dengan kolom tertentu
select
  barang.tanggal as 'Tanggal',
  barang.nama_barang as 'Nama barang',
  barang_masuk.banyak_barang_masuk as 'Banyak barang masuk',
  barang_keluar.banyak_barang_keluar as 'Banyak barang keluar',
  barang.jumlah_barang as 'Jumlah barang'
from (( barang
  inner join barang_masuk on barang.id_barang = barang_masuk.id_barang)
  inner join barang_keluar on barang.id_barang = barang_keluar.id_barang);