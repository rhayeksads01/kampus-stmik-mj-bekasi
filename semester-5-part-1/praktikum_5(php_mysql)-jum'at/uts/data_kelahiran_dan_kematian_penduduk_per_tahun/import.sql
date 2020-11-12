create database data_kelahiran_dan_kematian_penduduk_per_tahun;
use data_kelahiran_dan_kematian_penduduk_per_tahun;

-- tables
create table penduduk(
	id_penduduk int not null auto_increment,
	tahun year not null,
	jumlah_penduduk int not null,
	primary key (id_penduduk, tahun)
);
create table kelahiran(
	id_kelahiran int not null auto_increment,
	banyak_kelahiran int not null,
	deskripsi_kelahiran varchar(255),
	id_penduduk int not null,
	primary key (id_kelahiran),
	constraint fk_kelahiran_penduduk foreign key (id_penduduk) references penduduk (id_penduduk)
);
create table kematian(
	id_kematian int not null auto_increment,
	banyak_kematian int not null,
	deskripsi_kematian varchar(255),
	id_penduduk int not null,
	primary key (id_kematian),
	constraint fk_kematian_penduduk foreign key (id_penduduk) references penduduk (id_penduduk)
);

-- dummy data
insert into penduduk
values	(null, 2015, 1500),
				(null, 2016, 1700),
				(null, 2017, 1750);
insert into kelahiran
values	(null, 1600, null, 1),
				(null, 1800, null, 2),
				(null, 1850, null, 3);
insert into kematian
values	(null, 100, null, 1),
				(null, 100, null, 2),
				(null, 100, null, 3);

-- triggers
delimiter //
create trigger after_kelahiran_insert
after insert
on kelahiran for each row
begin
	update penduduk
	set jumlah_penduduk = jumlah_penduduk + new.banyak_kelahiran
	where id_penduduk = new.id_penduduk;
end //
delimiter //
create trigger after_kematian_insert
after insert
on kematian for each row
begin
	update penduduk
	set jumlah_penduduk = jumlah_penduduk - new.banyak_kematian
	where id_penduduk = new.id_penduduk;
end //
delimiter //
create trigger after_kelahiran_delete
after delete
on kelahiran for each row
begin
	update penduduk
	set jumlah_penduduk = jumlah_penduduk - old.banyak_kelahiran
	where id_penduduk = old.id_penduduk;
end //
delimiter //
create trigger after_kematian_delete
after delete
on kematian for each row
begin
	update penduduk
	set jumlah_penduduk = jumlah_penduduk + old.banyak_kematian
	where id_penduduk = old.id_penduduk;
end //
