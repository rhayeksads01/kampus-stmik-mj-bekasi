-- copy dan paste code ini untuk menambah data
insert into penduduk values (null, 2018, 0);
insert into kelahiran values (null, 500, null, 4);
insert into kematian values (null, 60, null, 4);

-- copy dan paste code ini untuk mangedit data kelahiran dan kematian berdasarkan id key nya
update kelahiran
set deskripsi_kelahiran = 'Angka kelahiran ditahun ini cukup baik'
where id_kelahiran = 3;
update kematian
set deskripsi_kematian = 'Angka kematian ditahun ini cukup rendah'
where id_kematian = 3;

-- copy dan paste code ini untuk menghapus data kelahiran dan kematian berdasarkan id key nya
delete from kelahiran where id_kelahiran = 1;
delete from kematian where id_kematian = 1;

-- copy dan paste code ini untuk menampilkan data dengan kolom tertentu
select
  penduduk.tahun as 'Tahun',
  kelahiran.banyak_kelahiran as 'Banyak angka kelahiran',
  kematian.banyak_kematian as 'Banyak angka kematian',
  penduduk.jumlah_penduduk as 'Jumlah penduduk'
from (( penduduk
  inner join kelahiran on penduduk.id_penduduk = kelahiran.id_penduduk)
  inner join kematian on penduduk.id_penduduk = kematian.id_penduduk);