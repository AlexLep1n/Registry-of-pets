/*
Заполнить низкоуровневые таблицы именами(животных), командами
которые они выполняют и датами рождения
*/

USE animal_database;
INSERT INTO camels(id, `name`, commands, datebirth, `type`) VALUES
	(1, 'camel1', 'roam', '2023-05-26', 'pack_animals'),
	(2, 'camel2', 'roam', '2021-05-26', 'pack_animals'),
	(3, 'camel3', 'roam', '2016-05-26', 'pack_animals');

INSERT INTO horses(id, `name`, commands, datebirth, `type`) VALUES	
	(1, 'horse1', 'galoop', '2023-05-26', 'pack_animals'),
	(2, 'horse2', 'galoop', '2021-05-26', 'pack_animals'),
	(3, 'horse3', 'galoop', '2016-05-26', 'pack_animals');

INSERT INTO donkeys(id, `name`, commands, datebirth, `type`) VALUES
	(1, 'donkey1', 'roar', '2023-05-26', 'pack_animals'),
	(2, 'donkey2', 'roar', '2021-05-26', 'pack_animals'),
	(3, 'donkey3', 'roar', '2016-05-26', 'pack_animals');

INSERT INTO dogs(id, `name`, commands, datebirth, `type`) VALUES
	(1, 'dog1', 'sit', '2023-05-26', 'pet_animals'),
	(2, 'dog2', 'sit', '2021-05-26', 'pet_animals'),
	(3, 'dog3', 'sit', '2016-05-26', 'pet_animals');

INSERT INTO cats(id, `name`, commands, datebirth, `type`) VALUES
	(1, 'cat1', 'eat', '2023-05-26', 'pet_animals'),
	(2, 'cat2', 'eat', '2021-05-26', 'pet_animals'),
	(3, 'cat3', 'eat', '2016-05-26', 'pet_animals');

INSERT INTO hamsters(id, `name`, commands, datebirth, `type`) VALUES
	(1, 'hamster1', 'sleep', '2023-05-26', 'pet_animals'),
	(2, 'hamster2', 'sleep', '2021-05-26', 'pet_animals'),
	(3, 'hamster3', 'sleep', '2016-05-26', 'pet_animals');
        
INSERT INTO pack_animals(id, horse_id, camel_id, domkey_id) VALUES 
	(1, 1, 1, 1),
	(2, 2, 2, 2),
	(3, 3, 3, 3);

INSERT INTO pet_animals(id, dog_id, cat_id, hamster_id) VALUES
	(1, 1, 1, 1),
	(2, 2, 2, 2),
	(3, 3, 3, 3);

/*
Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой
питомник на зимовку.
*/
ALTER TABLE pack_animals DROP FOREIGN KEY fk_pack_animals_camel1;
ALTER TABLE pack_animals DROP COLUMN camel_id;

-- Объединить таблицы лошади, и ослы в одну таблицу.
SELECT * FROM horses JOIN donkeys ON horses.id = donkeys.id;

/*
Создать новую таблицу “молодые животные” в которую попадут все
животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
до месяца подсчитать возраст животных в новой таблице
*/

DROP TABLE IF EXISTS young_animals;
CREATE TABLE young_animals (id INT AUTO_INCREMENT PRIMARY KEY, `name` VARCHAR(50), `type` VARCHAR(50), age_months INT);
INSERT INTO young_animals (`name`, `type`, age_months)  
SELECT * FROM (
  (SELECT `name`, `type`, (datediff(curdate(), datebirth)/30) AS age FROM camels as camels where datediff(curdate(), datebirth) > 365 AND datediff(curdate(), datebirth) < 1095)
  UNION 
  (SELECT `name`, `type`, (datediff(curdate(), datebirth)/30) AS age FROM horses as horses where datediff(curdate(), datebirth) > 365 AND datediff(curdate(), datebirth) < 1095)
  UNION 
  (SELECT `name`, `type`, (datediff(curdate(), datebirth)/30) AS age FROM donkeys as donkeys where datediff(curdate(), datebirth) > 365 AND datediff(curdate(), datebirth) < 1095) 
  UNION 
  (SELECT `name`, `type`, (datediff(curdate(), datebirth)/30) AS age FROM cats as cats where datediff(curdate(), datebirth) > 365 AND datediff(curdate(), datebirth) < 1095) 
  UNION 
  (SELECT `name`, `type`, (datediff(curdate(), datebirth)/30) AS age FROM dogs as dogs where datediff(curdate(), datebirth) > 365 AND datediff(curdate(), datebirth) < 1095) 
  UNION 
  (SELECT `name`, `type`, (datediff(curdate(), datebirth)/30) AS age FROM hamsters AS hamsters where datediff(curdate(), datebirth) > 365 AND datediff(curdate(), datebirth) < 1095)
) AS y_a;

/*
Объединить все таблицы в одну, при этом сохраняя поля, указывающие на
прошлую принадлежность к старым таблицам
*/

DROP TABLE IF EXISTS new_animal;
CREATE TABLE new_animal(id INT AUTO_INCREMENT PRIMARY KEY, `name` VARCHAR(50), `type` VARCHAR(50), commands VARCHAR(50), datebirth DATE);
INSERT INTO new_animal(`name`, `type`, commands, datebirth)
SELECT * FROM (
SELECT `name`, `type`, commands, datebirth FROM camels AS camels 
UNION 
SELECT `name`, `type`, commands, datebirth FROM horses AS horses
UNION 
SELECT `name`, `type`, commands, datebirth FROM donkeys AS donkeys
UNION 
SELECT `name`, `type`, commands, datebirth FROM cats AS cats
UNION 
SELECT `name`, `type`, commands, datebirth FROM dogs AS dogs
UNION 
SELECT `name`, `type`, commands, datebirth FROM hamsters AS hamsters) AS n_a;