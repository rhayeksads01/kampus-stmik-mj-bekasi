-- jawaban nomer 1
create database databasecoba;
create table datamatapelajaran(
  kode_mapel int not null primary key,
  nama_mapel varchar(255),
  guru varchar(255)
);
insert into datamatapelajaran
values (1, 'Matematika', 'Aditya Nugroho'),
  (2, 'Fisika', 'Andri Arivian Asari'),
  (3, 'Kimia', 'Abdulgofo');
-- jawaban nomer 2
update datamatapelajaran
set guru = 'Rizki Trianto Rakhim'
where kode_mapel = 3;
-- jawaban nomer 3
create database databasecobalagi;
create table datakaryawan(
  kode_kar int not null primary key,
  nama_kar varchar(255),
  gaji int,
  kode_cab char(1)
);
insert into datakaryawan
values (11, 'Andi', 1500, 'A'),
  (12, 'Budi', 2500, 'B'),
  (13, 'Cici', 1500, 'A'),
  (14, 'Didi', 3000, 'C'),
  (15, 'Fifi', 5000, 'B');
-- jawaban nomer 4
update datakaryawan
set gaji = 2900
where kode_kar = 11;
-- jawaban nomer 5
delete from datakaryawan
where kode_kar = 15;