DROP TABLE IF EXISTS weapons_materials;

DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS materials;

DROP TABLE IF EXISTS weapons_types;


#Creamos la tabla MATERIALS
CREATE TABLE materials (
	id_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    material VARCHAR(16),
    color CHAR(6),
    cost FLOAT
);


#Creamos las tablas de WEAPONS_TYPES
CREATE TABLE weapons_types (
	id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(24) NOT NULL,
    description TEXT,
    icon VARCHAR(16)
);


#Creamos la tabla WEAPONS
CREATE TABLE weapons (
	id_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	weapon varchar(16) NOT NULL,
	grip INT,
	durability INT,
	distance FLOAT,
	quality INT,
	physic_attack FLOAT,
	magic_attack FLOAT,
	description TEXT,
	level INT,
	level_min INT,
	id_weapon_type INT UNSIGNED,
	FOREIGN KEY (id_weapon_type) REFERENCES weapons_types(id_weapon_type)
);


#Creamos la tabla de WEAPONS_MATERIALS
CREATE TABLE weapons_materials (
	id_weapon_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    	id_weapon INT UNSIGNED,
    	id_material INT UNSIGNED,
	FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon),
	FOREIGN KEY (id_material) REFERENCES materials(id_material)
);