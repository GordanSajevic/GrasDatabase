.header on
pragma foreign_keys = on;

CREATE TABLE Vozila(
	tip varchar(9) not null,
	id integer primary key autoincrement
);

CREATE TABLE Vozaci(
	ime varchar(20) not null,
	prezime varchar (20) not null,
	godina smallint not null,
	godina_zaposlenja smallint default 2015,
	id integer primary key autoincrement	
);

CREATE TABLE Linije(
	pocetna_tacka varchar(20) default "Vijecnica",
	krajnja_tacka varchar(20) default "Hrasnica",
	vrijeme_pocetka varchar(5) default "07.00",
	vrijeme_trajanja smallint default 60,
	id integer primary key autoincrement
);

CREATE TABLE Smjene(
	id_vozaca integer, 
	id_vozila integer,
	id_linije integer,
	broj integer default 1,
	id integer primary key autoincrement,
	foreign key (id_vozaca) references Vozaci on update cascade on delete cascade,
	foreign key (id_vozila) references Vozila on update cascade on delete cascade,	
	foreign key (id_linije) references Linije on update cascade on delete cascade
);