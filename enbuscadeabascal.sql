﻿DROP TABLE IF EXISTS weapons_materials;
DROP TABLE IF EXISTS armours_materials;

DROP TABLE IF EXISTS characters_weapons;

DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS armours;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS materials;

DROP TABLE IF EXISTS weapons_types;
DROP TABLE IF EXISTS armours_types;
DROP TABLE IF EXISTS items_types;


#Creamos la tabla CHARACTERS_WEAPONS e introducimos sus valores
CREATE TABLE characters_weapons (
	id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_character INT UNSIGNED,
	id_weapon INT UNSIGNED,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon)
);


INSERT INTO characters_weapons (id_character, id_weapon)
	VALUE (1, 1),
	      (4, 3),
              (2, 2),
              (4, 1),
              (2, 5);



#Creamos las tablas de WEAPONS_TYPES e introducimos sus valores
CREATE TABLE weapons_types (
	id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    	type VARCHAR(24) NOT NULL,
    	description TEXT,
    	icon VARCHAR(16)
);


INSERT INTO weapons_types (type, description, icon)
	VALUE ("Melee", "Cuerpo a cuerpo", "melee.png"),
    	  ("Rango", "Distancia", "rango.png");



#Creamos las tablas de ARMOURS_TYPE e introducimos sus valores
CREATE TABLE armours_types (
	id_armour_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    	type VARCHAR(24) NOT NULL,
    	description TEXT,
    	icon VARCHAR(16)
);


INSERT INTO armours_types (type, description, icon)
	VALUE ("Peto", "Pal peshito", "peto.png"),
    	  ("Traje", "Pal cuerpesito", "traje.png"),
          ("Casco", "Pala cabesa", "casco.png");



#Creamos las tablas de ITEMS_TYPES e introducimos sus valores
CREATE TABLE items_types (
	id_item_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    	type VARCHAR(24) NOT NULL,
    	description TEXT,
    	icon VARCHAR(16)
);

INSERT INTO items_types (type, description, icon)
	VALUE ("Comida", "Alimento rico", "comida.png"),
          ("Pocion", "Te cura o te mata o lo que sea", "pocion.png"),
          ("Tesoro", "$_$", "tesoro.png");



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


#Creamos la tabla ITEMS e introducimos sus valores
CREATE TABLE items (
	id_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    	item VARCHAR(24),
    	weigth FLOAT,
    	height FLOAT,
    	width FLOAT,
    	description TEXT,
    	key_item BOOLEAN,
    	consumable BOOLEAN,
    	fusionable BOOLEAN,
    	disassemble BOOLEAN,
    	cost FLOAT,
    	rarity INT,
    	usages INT,
    	durability INT,
    	id_item_type INT,
	FOREIGN KEY (id_item_type) REFERENCES items_types(id_item_type),
);


INSERT INTO items (item, key_item, consumable, cost, id_item_type) 
	VALUE ("Perla negra", false, false, 3600, 1),
    	  ("Jabon de la abuela", true, true, 50, 2),
          ("Cola de furro", false, true, 9999, 4),
          ("Examen reprobado", true, false, 0, 3),
          ("Sombrero de nigromante", true, true, 320, 4),
          ("Espada trifasica", false, true, 650, 1),
          ("Alcahofa", true, false, 10, 2),
          ("Grebas de Harry", true, true, 35, 3),
          ("Orejas de gato", false, true, 25, 4),
          ("Queso", false, true, 50, 5),
          ("Carne podrida", true, false, 1, 5),
          ("Fragmento escarlata", true, true, 500, 6);



#Creamos la tabla MATERIALS e introducimos sus valores
CREATE TABLE materials (
	id_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    	material VARCHAR(16),
    	color CHAR(6),
    	cost FLOAT
);


INSERT INTO materials (material, color, cost) 
    VALUE ("Obsidiana", "000000", 40), 
          ("Madera", "ddeeaa", 10),
          ("Carne", "ffff00", 5),
          ("Pana", "ffdddd", 50),
          ("Goma Sagrada", "000000", 1000),
          ("Piedra", "cccccc", 1),
          ("Cuero", "ddddaa", 20),
          ("Bandera España", "ESPAÑA", 2030),
          ("Plumas de angel", "ffffff", 10000),
          ("Materia oscura", "000000", 10000),
          ("Hueso", "dddddd", 10),
          ("Agua", "0000ff", 1),
          ("Lava", "ff0000", 500);
     

     
#Creamos la tabla de WEAPONS_MATERIALS
CREATE TABLE weapons_materials (
	id_weapon_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    	id_weapon INT UNSIGNED,
    	id_material INT UNSIGNED,
	FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon),
	FOREIGN KEY (id_material) REFERENCES materials(id_material)
);



#Creamos la tabla de ARMOURS_MATERIALS
CREATE TABLE armours_materials (
	id_armour_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    	id_armour INT UNSIGNED,
    	id_material INT UNSIGNED,
	FOREIGN KEY (id_armour) REFERENCES armours(id_armour),
	FOREIGN KEY (id_material) REFERENCES materials(id_material)
);
