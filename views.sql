
CREATE VIEW VozaciVozila as
	select Vozaci.ime as ime, Vozaci.prezime as prezime,
	Vozaci.id as id, Vozila.tip as vozilo from Vozaci
	inner join Smjene on Vozaci.id = Smjene.id_vozaca
	inner join Vozila on Smjene.id_vozila = Vozila.id
;

CREATE VIEW TramvajskeLinije as
	select Linije.pocetna_tacka as pocetak,
	Linije.krajnja_tacka as kraj from Linije
	inner join Smjene on Linije.id = Smjene.id_linije where Smjene.id_vozila > 7
;

CREATE VIEW TrolejbuskeLinije as
	select Linije.pocetna_tacka as pocetak,
	Linije.krajnja_tacka as kraj from Linije
	inner join Smjene on Linije.id = Smjene.id_linije 
	where Smjene.id_vozila > 4 AND Smjene.id_vozila < 8
;

CREATE VIEW AutobuskeLinije as
	select Linije.pocetna_tacka as pocetak,
	Linije.krajnja_tacka as kraj from Linije
	inner join Smjene on Linije.id = Smjene.id_linije where Smjene.id_vozila < 5
;

CREATE VIEW AutobuskeTrolejbuskeStanice as
	select Linije.pocetna_tacka as stanica from Linije
	inner join Smjene on Linije.id = Smjene.id_linije
	where Smjene.id_vozila < 8
;

CREATE VIEW AutobuskeTramvajskeStanice as
	select Linije.pocetna_tacka as stanica from Linije
	inner join Smjene on Linije.id = Smjene.id_linije
	where Smjene.id_vozila < 5 OR Smjene.id_vozila > 7
;

CREATE VIEW StanicaIlidza as
	select * from Linije
	inner join Smjene on Linije.id = Smjene.id_linije
	where Linije.pocetna_tacka = "Ilidza"
	ORDER BY Linije.vrijeme_trajanja
;

CREATE VIEW LinijaOtokaDobrinja as
	select * from Vozaci
	inner join Smjene on Vozaci.id = Smjene.id_vozaca
	inner join Linije on Linije.id = Smjene.id_linije
	where Linije.pocetna_tacka = "Otoka" AND Linije.krajnja_tacka = "Dobrinja"
;

CREATE VIEW Tramvaj2 as
	select * from Vozaci
	inner join Smjene on Vozaci.id = Smjene.id_vozaca
	inner join Vozila on Vozila.id = Smjene.id_vozila
	where Vozila.id = 9
;


CREATE VIEW VozacLinije1I11 as
	select * from Vozaci
	inner join Smjene on Vozaci.id = Smjene.id_vozaca
	inner join Linije on Linije.id = Smjene.id_linije
	where Linije.id = 1 AND Linije.id = 11
;

CREATE VIEW PrvaSmjena as
	select distinct(prezime) from Vozaci
	inner join Smjene on Vozaci.id = Smjene.id_vozaca
	where Smjene.broj = 1
;

CREATE VIEW PrvaSmjenaAutobusi as
	select distinct(prezime) from Vozaci
	inner join Smjene on Vozaci.id = Smjene.id_vozaca
	inner join Vozila on Vozila.id = Smjene.id_vozila
	where Smjene.broj = 1 AND Vozila.id < 5
;

CREATE VIEW Vozac5PolazneStanice as
	select distinct(Linije.pocetna_tacka) from Linije
	inner join Smjene on Linije.id = Smjene.id_linije
	inner join Vozaci on Vozaci.id = Smjene.id_vozaca
	where Vozaci.id = 5
;