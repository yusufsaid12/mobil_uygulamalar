drop table if exists 'kullanici';
CREATE TABLE "kullanici" (
	"id" numeric(10) NOT NULL,
	"kullanici_adi"	varchar(50) NOT NULL,
	"sifre"	varchar(50) NOT NULL,
	"adi" varchar(50),
	"soyadi" varchar(50),
	"email"	varchar(100) NOT NULL,
	"ekleyen_kullanici_id"	numeric(10),
	"ekleme_tarihi"	datetime,
	"guncelleyen_kullanici_id"	numeric(10),
	"guncelleme_tarihi"	datetime,
	"version"	numeric(10) NOT NULL,
	CONSTRAINT "kul_pk" PRIMARY KEY("id"),
	CONSTRAINT "kul_kul_ekleyen_fk" FOREIGN KEY("ekleyen_kullanici_id") REFERENCES "kullanici"("id"),
	CONSTRAINT "kul_kul_guncelleyen_fk" FOREIGN KEY("guncelleyen_kullanici_id") REFERENCES "kullanici"("id"),
	CONSTRAINT "kul_kullanici_adi_uk" UNIQUE("kullanici_adi")
	CONSTRAINT kul_email_uk UNIQUE (email)
);

INSERT INTO kullanici (id, kullanici_adi, sifre, adi, soyadi, email, ekleyen_kullanici_id, guncelleyen_kullanici_id,version)
VALUES(1, 'Müdür', 'yonca123', 'Halil', 'Erdal', 'erdal.halil_gmail.com', null, null, 0);

drop table if exists ders;
CREATE TABLE "ders" (
	"id" numeric(10) NOT NULL,
	"ad" varchar(50),
	"ekleyen_kullanici_id"	NUMERIC(10) NOT NULL,
	"ekleme_tarihi"	datetime,
	"guncelleyen_kullanici_id"	NUMERIC(10),
	"guncelleme_tarihi"	datetime,
	"version"	NUMERIC(10) NOT NULL,
	CONSTRAINT "ders_id" PRIMARY KEY("id"),
	CONSTRAINT "ders_kul_guncelleyen_fk" FOREIGN KEY("guncelleyen_kullanici_id") REFERENCES "kullanici"("id"),
	CONSTRAINT "ders_kul_ekleyen_fk" FOREIGN KEY("ekleyen_kullanici_id") REFERENCES "kullanici"("id")
);

INSERT INTO ders (id, ad, ekleyen_kullanici_id, guncelleyen_kullanici_id,version)
VALUES (1, 'tarih', 1, null, 0);


drop table if exists sinif;	
CREATE TABLE "sinif" (
	"id" numeric(10) NOT NULL,
	"sinif_no"	numeric(3) NOT NULL,
	"ekleyen_kullanici_id"	numeric(10),
	"ekleme_tarihi"	datetime,
	"guncelleyen_kullanici_id"	numeric(10),
	"guncelleme_tarihi"	datetime,
	"version"	numeric(10) NOT NULL,
	CONSTRAINT "snf_pk" PRIMARY KEY("id"),
	CONSTRAINT "snf_kul_ekleyen_fk" FOREIGN KEY("ekleyen_kullanici_id") REFERENCES "kullanici"("id"),
	CONSTRAINT "snf_kul_guncelleyen_fk" FOREIGN KEY("guncelleyen_kullanici_id") REFERENCES "kullanici"("id"),
	CONSTRAINT "sinif_no_uk" UNIQUE("sinif_no")
);

INSERT INTO sinif(id, sinif_no, ekleyen_kullanici_id, guncelleyen_kullanici_id, version)
VALUES (1, 12, 1, null, 0);

drop table if exists sube;
CREATE TABLE "sube" (
	"id" numeric(10) NOT NULL,
	"sinif_id"	numeric(10),
	"adi"	varchar(50),
	"ekleyen_kullanici_id"	numeric(10),
	"ekleme_tarihi"	datetime,
	"guncelleyen_kullanici_id"	numeric(10),
	"guncelleme_tarihi"	datetime,
	"version"	numeric(10),
	CONSTRAINT "sb_pk" PRIMARY KEY("id"),
	CONSTRAINT "sb_kul_ekleyen_fk" FOREIGN KEY("ekleyen_kullanici_id") REFERENCES "kullanici"("id"),
	CONSTRAINT "sb_kul_guncelleyen_fk" FOREIGN KEY("guncelleyen_kullanici_id") REFERENCES "kullanici"("id"),
	CONSTRAINT "sb_snf_sinif_fk" FOREIGN KEY("sinif_id") REFERENCES "sinif"("id"),
	CONSTRAINT "sb_sinif_adi_uk" UNIQUE("sinif_id","adi"),
	CONSTRAINT snf_bol_id FOREIGN KEY (id) REFERENCES bolum("id")
);

INSERT INTO sube(id, sinif_id, adi, ekleyen_kullanici_id, guncelleyen_kullanici_id, version)
VALUES(1, 1, 'B', 1, null, 0);

drop table if exists bolum;
create table bolum(
	id numeric(10) not null,
	bolum_adi varchar(50),
	guncelleyen_kullanici_id numeric(10),
	guncelleme_tarihi datetime,
	ekleyen_kullanici_id numeric(10),
	ekleme_tarihi datetime,
	"version"	numeric(10) NOT NULL,
	CONSTRAINT "bol_id_fk" FOREIGN KEY ("id") REFERENCES sube(id),
	CONSTRAINT "bol_kul_ekleyen_fk" FOREIGN KEY("ekleyen_kullanici_id") REFERENCES "kullanici"("id"),
	CONSTRAINT "bol_kul_guncelleyen_fk" FOREIGN KEY("guncelleyen_kullanici_id") REFERENCES "kullanici"("id")
	CONSTRAINT "bol_sube_id_fk" FOREIGN KEY ("id") REFERENCES sube("id")
);

INSERT INTO bolum (id, bolum_adi, ekleyen_kullanici_id, guncelleyen_kullanici_id, version)
VALUES (1, 'Bilişim', 1, null, 0);

drop table if exists alan;
create table alan(
	id numeric(10) not null,
	bolum_id numeric(10),
	alan_adi varchar(50),
	guncelleyen_kullanici_id numeric(10),
	guncelleme_tarihi datetime,
	ekleyen_kullanici_id numeric(10),
	ekleme_tarihi datetime,
	"version"	numeric(10) NOT NULL,
	CONSTRAINT "alan_id_fk" FOREIGN KEY ("id") REFERENCES ogrenci(id),
	CONSTRAINT "alan_kul_ekleyen_fk" FOREIGN KEY("ekleyen_kullanici_id") REFERENCES "kullanici"("id"),
	CONSTRAINT "alan_kul_guncelleyen_fk" FOREIGN KEY("guncelleyen_kullanici_id") REFERENCES "kullanici"("id")
	CONSTRAINT "alan_sube_fk" FOREIGN KEY ("id") REFERENCES sube(id)
);

INSERT INTO alan(id, bolum_id, alan_adi, ekleyen_kullanici_id, guncelleyen_kullanici_id, version)
VALUES (1, 1, 'Veri Tabanı', 1, null, 0);

SELECT * FROM bolum

drop table if exists ders_programi;
create table ders_programi(
	id numeric(10) not null,
	sube_id numeric(10) not null,
	ders_1_id numeric(10),
	ders_1_kullanici_id numeric(10),
	ders_2_id numeric(10),
	ders_2_kullanici_id numeric(10),
	ders_3_id numeric(10),
	ders_3_kullanici_id numeric(10),
	ders_4_id numeric(10),
	ders_4_kullanici_id numeric(10),
	ders_5_id numeric(10),
	ders_5_kullanici_id numeric(10),
	ders_6_id numeric(10),
	ders_6_kullanici_id numeric(10),
	ders_7_id numeric(10),
	ders_7_kullanici_id numeric(10),
	ders_8_id numeric(10),
	ders_8_kullanici_id numeric(10),
	ders_9_id numeric(10),
	ders_9_kullanici_id numeric(10),
	ders_10_id numeric(10),
	ders_10_kullanici_id numeric(10),
	guncelleyen_kullanici_id numeric(10),
	guncelleme_tarihi datetime not null,
	ekleyen_kullanici_id numeric(10),
	ekleme_tarihi datetime not null,
	"version"	numeric(10) NOT NULL, 
	CONSTRAINT "der_prog_kul_ekleyen_fk" FOREIGN KEY("ekleyen_kullanici_id") REFERENCES "kullanici"("id"),
	CONSTRAINT "der_prog_kul_guncelleyen_fk" FOREIGN KEY("guncelleyen_kullanici_id") REFERENCES "kullanici"("id"),
	CONSTRAINT "der_prog_id_fk" FOREIGN KEY("id") REFERENCES "ders"("id"),
	CONSTRAINT der_prog_kul_ad_1 FOREIGN KEY (ders_1_kullanici_id) REFERENCES "kullanici" (id),
	CONSTRAINT der_prog_kul_ad_2 FOREIGN KEY (ders_2_kullanici_id) REFERENCES "kullanici" (id),
	CONSTRAINT der_prog_kul_ad_3 FOREIGN KEY (ders_3_kullanici_id) REFERENCES "kullanici" (id),
	CONSTRAINT der_prog_kul_ad_4 FOREIGN KEY (ders_4_kullanici_id) REFERENCES "kullanici" (id),
	CONSTRAINT der_prog_kul_ad_5 FOREIGN KEY (ders_5_kullanici_id) REFERENCES "kullanici" (id),
	CONSTRAINT der_prog_kul_ad_6 FOREIGN KEY (ders_6_kullanici_id) REFERENCES "kullanici" (id),
	CONSTRAINT der_prog_kul_ad_7 FOREIGN KEY (ders_7_kullanici_id) REFERENCES "kullanici" (id),
	CONSTRAINT der_prog_kul_ad_8 FOREIGN KEY (ders_8_kullanici_id) REFERENCES "kullanici" (id),
	CONSTRAINT der_prog_kul_ad_9 FOREIGN KEY (ders_9_kullanici_id) REFERENCES "kullanici" (id)
);

INSERT INTO ders_programi (id, sube_id, ders_1_id, ders_2_id, ders_3_id, ders_4_id, ders_5_id, ders_6_id, ders_7_id, ders_8_id, ders_9_id, ders_10_id, ekleyen_kullanici_id, guncelleyen_kullanici_id)
VALUES (1, Tarih, Tarih, Tarih, Tarih, Tarih, Tarih, Tarih, Tarih, Tarih, Tarih, Müdür, Müdür)

drop table if exists ogrenci;
create table ogrenci(
	id numeric(10) not null,
	adi varchar(50),
	soyadi varchar(50),
	alan_id numeric(10),
	sube_id numeric(10),
	ekleyen_kullanici_id numeric(10),
	ekleme_tarihi datetime,
	guncelleyen_kullanici_id numeric(10),
	guncelleme_tarihi datetime,
	"version"	numeric(10) NOT NULL,
	CONSTRAINT "ogr_pk" PRIMARY KEY("id"),
	CONSTRAINT "ogr_kul_ekleyen_fk" FOREIGN KEY("ekleyen_kullanici_id") REFERENCES "kullanici"("id"),
	CONSTRAINT "ogr_kul_guncelleyen_fk" FOREIGN KEY("guncelleyen_kullanici_id") REFERENCES "kullanici"("id"),
	CONSTRAINT ogr_alan_id_fk FOREIGN KEY (id) REFERENCES alan("id"),
	CONSTRAINT ogr_sube__id_fk FOREIGN KEY (id) REFERENCES sube(id)
);

INSERT INTO ogrenci (id, adi, soyadi, alan_id, sube_id, ekleyen_kullanici_id, guncelleyen_kullanici_id) 
VALUES (Yusuf Said, Demirci, 1, Müdür, Müdür)

drop table if exists yoklama;
CREATE TABLE yoklama(
	id NUMERIC(10) not null,
	tarih date,
	ders_konu varchar(500),
	ogr_id NUMERIC(10),
	var_yok numeric(1),
	ekleme_tarihi datetime,
	ekleyen_kullanici_id NUMERIC(10),
	guncelleme_tarihi datetime,
	guncelleyen_kullanici_id NUMERIC(10),
	CONSTRAINT yok_ogr_fk FOREIGN KEY (id) REFERENCES ogrenci(id),
	CONSTRAINT "yok_kul_ekleyen_fk" FOREIGN KEY("ekleyen_kullanici_id") REFERENCES "kullanici"("id"),
	CONSTRAINT "yok_kul_guncelleyen_fk" FOREIGN KEY("guncelleyen_kullanici_id") REFERENCES "kullanici"("id")
);



