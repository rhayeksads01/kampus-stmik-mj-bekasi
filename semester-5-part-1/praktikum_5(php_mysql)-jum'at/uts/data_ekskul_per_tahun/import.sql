create database data_ekskul_per_tahun;
use data_ekskul_per_tahun;

-- tables
create table ekskul(
	id_ekskul int not null auto_increment,
	tahun year not null,
	nama_ekskul varchar(45) not null,
	jumlah_peserta_ekskul int not null,
	primary key (id_ekskul, nama_ekskul)
);
create table peserta_masuk(
	id_peserta_masuk int not null auto_increment,
	banyak_peserta_masuk int not null,
	deskripsi varchar(255),
	id_ekskul int not null,
	primary key (id_peserta_masuk),
	constraint fk_peserta_masuk_ekskul1 foreign key (id_ekskul) references ekskul (id_ekskul)
);
create table peserta_keluar(
	id_peserta_keluar int not null auto_increment,
	banyak_peserta_keluar int not null,
	deskripsi varchar(255),
	id_ekskul int not null,
	primary key (id_peserta_keluar),
	constraint fk_peserta_keluar_ekskul1 foreign key (id_ekskul) references ekskul (id_ekskul)
);

-- dummy data
insert into ekskul
values	(1, 2015, 'Karate', 70),
				(2, 2015, 'Sepak Bola', 60),
				(3, 2015, 'Voli', 40);
insert into	peserta_masuk
values	(1, 70, '', 1),
				(2, 60, '', 2),
				(3, 40, '', 3);
insert into peserta_keluar
values	(1, 0, '', 1),
				(2, 0, '', 2),
				(3, 0, '', 3);

-- triggers
delimiter //
create trigger after_peserta_masuk_insert
after insert
on peserta_masuk for each row
begin
	update ekskul
	set jumlah_peserta_ekskul = jumlah_peserta_ekskul + new.banyak_peserta_masuk
	where id_ekskul = new.id_ekskul;
end //
delimiter //
create trigger after_peserta_keluar_insert
after insert
on peserta_keluar for each row
begin
	update ekskul
	set jumlah_peserta_ekskul = jumlah_peserta_ekskul - new.banyak_peserta_keluar
	where id_ekskul = new.id_ekskul;
end //
delimiter //
create trigger after_peserta_masuk_delete
after delete
on peserta_masuk for each row
begin
	update ekskul
	set jumlah_peserta_ekskul = jumlah_peserta_ekskul - old.banyak_peserta_masuk
	where id_ekskul = old.id_ekskul;
end //
delimiter //
create trigger after_peserta_keluar_delete
after delete
on peserta_keluar for each row
begin
	update ekskul
	set jumlah_peserta_ekskul = jumlah_peserta_ekskul + old.banyak_peserta_keluar
	where id_ekskul = old.id_ekskul;
end //