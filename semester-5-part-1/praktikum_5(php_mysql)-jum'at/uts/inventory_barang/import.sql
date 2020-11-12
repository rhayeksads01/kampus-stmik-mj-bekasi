create database inventory_barang;
use inventory_barang;

-- tables
create table barang(
	id_barang int not null auto_increment,
	nama_barang varchar(45) not null,
	tanggal date not null,
	jumlah_barang int not null,
	primary key (id_barang)
);
create table barang_masuk(
	id_barang_masuk int not null auto_increment,
	banyak_barang_masuk int not null,
	deskripsi_barang_masuk varchar(255),
	id_barang int not null,
	primary key (id_barang_masuk),
	constraint fk_barang_masuk_barang foreign key (id_barang) references barang (id_barang)
);
create table barang_keluar(
	id_barang_keluar int not null auto_increment,
	banyak_barang_keluar int not null,
	deskripsi_barang_keluar varchar(255),
	id_barang int not null,
	primary key (id_barang_keluar),
	constraint fk_barang_keluar_barang foreign key (id_barang) references barang (id_barang)
);

-- dummy data
insert into barang
values	(null, 'Meja belajar', '2020-10-25', 50),
				(null, 'Kursi kantor', '2020-10-25', 10),
				(null, 'Kursi sekolah', '2020-10-25', 10);
insert into barang_masuk
values	(null, 110, null, 1),
				(null, 110, null, 2),
				(null, 110, null, 3);
insert into barang_keluar
values	(null, 60, null, 1),
				(null, 100, null, 2),
				(null, 100, null, 3);

-- triggers
delimiter //
create trigger after_barang_masuk_insert
after insert
on barang_masuk for each row
begin
	update barang
	set jumlah_barang = jumlah_barang + new.banyak_barang_masuk
	where id_barang = new.id_barang;
end //
delimiter //
create trigger after_barang_keluar_insert
after insert
on barang_keluar for each row
begin
	update barang
	set jumlah_barang = jumlah_barang + new.banyak_barang_keluar
	where id_barang = new.id_barang;
end //
delimiter //
create trigger after_barang_masuk_delete
after delete
on barang_masuk for each row
begin
	update barang
	set jumlah_barang = jumlah_barang - old.banyak_barang_masuk
	where id_barang = old.id_barang;
end //
delimiter //
create trigger after_barang_keluar_delete
after delete
on barang_keluar for each row
begin
	update barang
	set jumlah_barang = jumlah_barang + old.banyak_barang_keluar
	where id_barang = old.id_barang;
end //
