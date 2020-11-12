-- copy dan paste code ini untuk menambah data
insert into ekskul values (null, 2016, 'Tenis Meja', 0);
insert into peserta_masuk values (null, 50, '', 2);
insert into peserta_keluar values (null, 60, '', 2);

-- copy dan paste code ini untuk mangedit data ekskul berdasarkan id_ekskul tertentu
update ekskul
set nama_ekskul = 'Pencak Silat'
where id_ekskul = 1;

-- copy dan paste code ini untuk menghapus data peserta masuk
delete from peserta_masuk where id_ekskul = 3;

-- copy dan paste code ini untuk menghapus data peserta keluar
delete from peserta_keluar where id_ekskul = 3;

-- copy dan paste code ini untuk menampilkan data dengan kolom tertentu
select ekskul.tahun, ekskul.nama_ekskul, peserta_masuk.banyak_peserta_masuk, peserta_keluar.banyak_peserta_keluar, ekskul.jumlah_peserta_ekskul
from (( ekskul
  inner join peserta_masuk on ekskul.id_ekskul = peserta_masuk.id_ekskul)
  inner join peserta_keluar on ekskul.id_ekskul = peserta_keluar.id_ekskul);