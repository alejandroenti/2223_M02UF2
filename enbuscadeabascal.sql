DROP TABLE IF EXISTS weapons_materials;
DROP TABLE IF EXISTS armours_materials;

DROP TABLE IF EXISTS characters_weapons;
DROP TABLE IF EXISTS characters_items;

DROP TABLE IF EXISTS stats;

DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS armours;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS materials;

DROP TABLE IF EXISTS weapons_types;
DROP TABLE IF EXISTS armours_types;
DROP TABLE IF EXISTS items_types;

DROP TABLE IF EXISTS characters;


#Creamos la tabla CHARACTERS
CREATE TABLE characters (
	id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(32),
	age INT,
	race VARCHAR(16),
	gender CHAR(1),
	class VARCHAR(16),
	height FLOAT,
	weight FLOAT,
	origin CHAR(3),
	description TEXT	
);


INSERT INTO characters (name, age, race, gender, class, 
			weight, height, origin, description)
	VALUE ("Payoh", 64, "Cambiapieles", 'L', "Dictador",
		1.75, 80, 'RUM', "Payoh es... un cambiapieles rumano de genero fluido"),
		("Yuca", 27, "Sirenido", 'F', "Cryptolai",
		 0.7, 40, 'PUR', "Yuca es... un sirenido hembra de Puerto Rico"),
		("Yulen", 70, "Nomuerto", 'D', "Minero",
		 0.8, 25, 'NDE', "Yulen es... un minero no muerto de los Paises Bajos"),
		("Josema", 3000, "Deidad", 'T', "Procastinador",
		 3.14, 0, 'PER', "Josema es... una deidad de Peru");



#Creamos la tabla STATS
CREATE TABLE stats(
	id_charcater_stat INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	hp FLOAT,
	hp_max FLOAT,
	xp FLOAT,
	xp_max INT,
	level INT,
	physic_attack FLOAT,
	physic_defense FLOAT,
	magic_attack FLOAT,
	magic_defense FLOAT,
	critical_rate FLOAT,
	mp FLOAT,
	mana INT,
	intel INT,
	stamina INT,
	stealth INT,
	luck INT,
	faith INT,
	velocity INT,
	dextreity INT,
	strenght INT,
	vigor INT,
	tenacity INT,
	charisma INT,
	agility INT,
	balance INT,
	id_character INT UNSIGNED,
	FOREIGN KEY (id_character) REFERENCES characters(id_character)
);


INSERT INTO stats (hp, hp_max, xp, xp_max, level, physic_attack, physic_defense,
		magic_attack, magic_defense, critical_rate, mp, mana, intel, stamina,
		stealth, luck, faith, velocity, dextreity, strenght, vigor, 
		tenacity, charisma, agility, balance, id_character)
	VALUE (950, 950, 820, 1000, 2, 320, 180,
		120, 60, 30, 300, 60, 38, 150,
		50, 60, 45, 30, 12, 10, 76,
		30, 50, 80, 65, 1),
		(0, 0, 500, 525, 1, 34, 120,
		500, 120, 38, 700, 600, 700, 80,
		30, 18, 28, 49, 16, 59, 98,
		78, 84, 35, 45, 3),
		(100, 1000, 999, 999, 69, 540, 390,
		999, 999, 450, 1000, 890, 999, 700,
		49, 28, 48, 18, 90, 68, 78,
		18, 27, 90, 84, 4),
		(200, 200, 150, 175, 2, 145, 100,
		250, 200, 190, 750, 600, 400, 280,
		17, 89, 28, 18, 29, 56, 34,
		90, 84, 23, 1, 2);

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
	VALUE ("Tesoro", "$_$", "tesoro.png"),
		("Producto de baño", "No Otaku", "baño.png"),
		("Putada", "Algo que jode", "putada.png"),
		("Accesorio", "Complementos que embellecen", "accesorio.png"),
		("Comida", "Alimento rico", "comida.png"),
	        ("Pocion", "Te cura o te mata o lo que sea", "pocion.png");


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


INSERT INTO weapons (weapon, grip, durability, distance,
			   quality, physic_attack, magic_attack, description,
			   level, level_min, id_weapon_type)
	VALUE ("Brazo de bebe", 1, 100, 0.5,
		60, 10, 0, "Brazo de bebe mutilado",
		4, 2, 1),
	      ("Pantalon de pana mojado", 2, 200, 1,
		150, 45, 5, "Pantalon de Santi",
		7, 3, 1);


#Creamos la tabla ARMOURS e introducimos sus valores
CREATE TABLE armours (
	id_armour INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	armour VARCHAR(24),
	description TEXT,
	class VARCHAR(16),
	rarity INT,
	weight FLOAT,
	level INT,
	level_min INT,
	cost FLOAT,
	durability INT,
	physic_attack FLOAT,
	physic_defense FLOAT,
	magic_attack FLOAT,
	magic_defense FLOAT,
	notoriety INT,
	id_armour_type INT UNSIGNED,
	FOREIGN KEY (id_armour_type) REFERENCES armours_types(id_armour_type)
);


INSERT INTO armours (armour, description, class, rarity, weight,
		     level, level_min, cost, durability, physic_attack,
		     physic_defense, magic_attack, magic_defense, notoriety, id_armour_type)
	VALUE ("Fachaleco", "Chaleco muy espanol", "Dictador", 750, 15.2,
		17, 14, 999, -1, 60,
		450, 10, 270, 750, 1),
		("Fachaleco", "Chaleco muy espanol", "Dictador", 750, 15.2,
		17, 14, 999, 20, 60,
		450, 10, 270, 750, 1),
	("Vestimenta Divina", "Vestido caido del cielo", "Procastinador", 999, 450,
		99, 90, 999, -1, 80,
		950, 400, 790, 900, 2),
	("Carne", "Chuletones", "Nicromante", 10, 2.5,
		3, 1, 25, 7, 20,
		50, 0, 10, 180, 2),
	("Armadura basica", "Armadura basica para noobs", "Nicromante", 5, 7.4,
		1, 1, 10, 10, 15,
		45, 10, 27, 350, 2),
	("Cabeza de reno", "Reno de Papa Noel no se ha portado bien", "Criptolai", 390, 10.6,
		8, 5, 320, 20, 35,
		280, 0, 200, 600, 3);


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
    	id_item_type INT UNSIGNED,
	FOREIGN KEY (id_item_type) REFERENCES items_types(id_item_type)
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
	      (4, 2),
              (2, 2),
              (4, 1);


# Creamos la tabla CHARACTERS_ITEMS e introducimos sus valores
CREATE TABLE characters_items (
	id_charcater_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_character INT UNSIGNED,
	id_item INT UNSIGNED,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	FOREIGN KEY (id_item) REFERENCES items(id_item)
);


INSERT INTO characters_items (id_character, id_item)
	VALUE (4, 4),
		(3, 3),
		(1, 3),
		(1, 2),
		(2, 1),
		(3, 6),
		(2, 8),
		(1, 9),
		(2, 5),
		(4, 7),
		(2, 7),
		(1, 8),
		(2, 6),
		(1, 3);


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


INSERT INTO weapons_materials (id_weapon, id_material)
	VALUE (1, 3),
    	  (1, 11),
	  (2, 4),
	  (2, 12);



#Creamos la tabla de ARMOURS_MATERIALS
CREATE TABLE armours_materials (
	id_armour_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    	id_armour INT UNSIGNED,
    	id_material INT UNSIGNED,
	FOREIGN KEY (id_armour) REFERENCES armours(id_armour),
	FOREIGN KEY (id_material) REFERENCES materials(id_material)
);

INSERT INTO armours_materials (id_armour, id_material)
	VALUE (1, 7),
		(1, 8),
		(2, 9),
		(2, 10),
		(3, 5),
		(4, 4),
		(5, 3),
		(5, 11);