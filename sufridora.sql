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



#Creamos las tablas de WEAPONS_TYPES
CREATE TABLE weapons_types (
	id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(24) NOT NULL,
    description TEXT,
    icon VARCHAR(16)
);


INSERT INTO weapons_types (type, description, icon)
	VALUE ("Melee", "Cuerpo a cuerpo", "melee.png"),
    	  ("Rango", "Distancia", "rango.png"),
	  ("Magico", "Magia potagia", "magico.png"),
	  ("Divino", "Divino rei", "divino.png");



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