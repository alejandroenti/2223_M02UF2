# Sentencias de la Actividad 4 de la UF2 de Bases de Datos (M02)

# Mostramos todos los personajes con sus armas

SELECT characters.id_character, characters.name, weapons.weapon
FROM characters
	LEFT JOIN characters_weapons
    	ON characters.id_character = characters_weapons.id_character
        LEFT JOIN weapons
        	ON characters_weapons.id_weapon = weapons.id_weapon;

# Mostramos todos los persoanjes con sus armas y sus tipos

SELECT characters.id_character, characters.name, weapons.weapon, weapons_types.type
FROM characters
	LEFT JOIN characters_weapons
    	ON characters.id_character = characters_weapons.id_character
        LEFT JOIN weapons
        	ON characters_weapons.id_weapon = weapons.id_weapon
        	LEFT JOIN weapons_types
            	ON weapons.id_weapon_type = weapons_types.id_weapon_type;

# Mostramos todos los persoanjes con sus armas y sus materiales

SELECT characters.id_character, characters.name, weapons.weapon, materials.material
FROM characters
	LEFT JOIN characters_weapons
    	ON characters.id_character = characters_weapons.id_character
        LEFT JOIN weapons
        	ON characters_weapons.id_weapon = weapons.id_weapon
            LEFT JOIN weapons_materials
            	ON  characters_weapons.id_weapon = weapons_materials.id_weapon
                LEFT JOIN materials
            	ON  weapons_materials.id_material = materials.id_material;

# Mostramos solo los personajes que tienen armas y dichas armas

SELECT characters.id_character, characters.name, weapons.weapon
FROM characters
	RIGHT JOIN characters_weapons
    	ON characters.id_character = characters_weapons.id_character
        LEFT JOIN weapons
        	ON characters_weapons.id_weapon = weapons.id_weapon;