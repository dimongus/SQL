DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS `cats`;
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);
-- -------------------------------------
-- 1.Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
SELECT shopname, `name` AS cat_name 
FROM shops s INNER JOIN cats c ON c.shops_id = s.id;
-- -------------------------------------
-- 2.Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
SELECT shopname
FROM shops s
INNER JOIN cats c ON c.shops_id = s.id
WHERE c.`name` = 'Murzik';

-- 2-й способ
SELECT shopname
FROM shops s
WHERE EXISTS (SELECT * FROM cats c where c.shops_id = s.id AND c.`name` = 'Murzik')
-- -------------------------------------
-- 3.Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”
;WITH src as (
SELECT DISTINCT
	s.id
FROM shops s
INNER JOIN cats c ON c.shops_id = s.id
WHERE c.`name` IN ('Murzik','Zuza')
)
SELECT shopname 
FROM shops
WHERE id NOT IN (SELECT id FROM src);