-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour recipes
CREATE DATABASE IF NOT EXISTS `recipes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipes`;

-- Listage de la structure de table recipes. category
CREATE TABLE IF NOT EXISTS `category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recipes.category : ~3 rows (environ)
INSERT INTO `category` (`id_category`, `category_name`) VALUES
	(1, 'Entrée'),
	(2, 'Plat'),
	(3, 'Dessert');

-- Listage de la structure de table recipes. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(100) NOT NULL DEFAULT '0',
  `unity` varchar(100) NOT NULL DEFAULT '0',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recipes.ingredient : ~50 rows (environ)
INSERT INTO `ingredient` (`id_ingredient`, `ingredient_name`, `unity`, `price`) VALUES
	(1, 'Boeuf', 'g', 10.000000),
	(2, 'Oeuf', 'u', 0.500000),
	(3, 'Champignon', 'g', 0.300000),
	(5, 'Carotte', 'u', 0.300000),
	(6, 'Pomme de terre', 'g', 0.200000),
	(7, 'Tomate', 'u', 0.300000),
	(8, 'Oignon', 'u', 0.200000),
	(9, 'Haricot', 'g', 1.000000),
	(10, 'Choux', 'g', 0.700000),
	(11, 'Saucisse', 'g', 4.000000),
	(12, 'Porc', 'g', 5.000000),
	(13, 'Farine', 'g', 0.100000),
	(14, 'Sucre', 'g', 0.400000),
	(15, 'Chocolat', 'g', 0.700000),
	(16, 'Framboise', 'g', 0.500000),
	(17, 'Salade', 'u', 0.900000),
	(18, 'Poulet', 'g', 3.000000),
	(19, 'Mozzarella', 'g', 0.500000),
	(20, 'Emmental râpé', 'g', 0.300000),
	(21, 'Pâtes', 'g', 0.200000),
	(22, 'Thon', 'g', 0.800000),
	(23, 'Sardine', 'u', 0.100000),
	(24, 'Saumon', 'g', 2.000000),
	(25, 'Crevette', 'g', 0.600000),
	(26, 'Olive', 'g', 0.400000),
	(27, 'Aubergine', 'u', 1.000000),
	(28, 'Noix', 'g', 0.600000),
	(29, 'Huile', 'l', 0.300000),
	(30, 'Fraise', 'g', 1.000000),
	(31, 'Poireau', 'u', 0.600000),
	(32, 'Lait', 'l', 0.400000),
	(33, 'Levure chimique', 'g', 0.100000),
	(34, 'Patate douce', 'g', 1.000000),
	(35, 'Cheddar', 'g', 0.600000),
	(36, 'Sel', 'g', 0.100000),
	(37, 'Galette de riz', 'u', 0.200000),
	(38, 'Beurre', 'g', 0.500000),
	(39, 'Poivron', 'u', 0.300000),
	(40, 'Piment', 'g', 0.200000),
	(41, 'Cornichon', 'g', 0.400000),
	(42, 'Vin rouge', 'l', 2.000000),
	(44, 'Concombre', 'u', 1.000000),
	(45, 'Anchois', 'u', 0.200000),
	(46, 'Vanille', 'u', 3.000000),
	(47, 'Riz', 'g', 0.100000),
	(48, 'Creme', 'g', 1.000000),
	(49, 'Boudoir', 'g', 0.300000),
	(50, 'Cacao', 'g', 2.000000),
	(51, 'Café', 'g', 3.000000),
	(52, 'Poivre', 'cac', 2.500000);

-- Listage de la structure de table recipes. recipe
CREATE TABLE IF NOT EXISTS `recipe` (
  `id_recipe` int NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(200) NOT NULL,
  `preparation_time` int NOT NULL DEFAULT (0),
  `instructions` text,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id_recipe`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `FK_recipe_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recipes.recipe : ~13 rows (environ)
INSERT INTO `recipe` (`id_recipe`, `recipe_name`, `preparation_time`, `instructions`, `id_category`) VALUES
	(1, 'Soupe de champignon', 40, '\r\n\r\n    Nettoyez et coupez les champignons en lamelles.\r\n\r\n    Faites chauffer l’huile et le beurre dans une casserole, puis faites revenir l’oignon et l’ail jusqu’à ce qu’ils soient translucides.\r\n\r\n    Ajoutez les champignons et faites-les sauter 8 minutes jusqu’à légère coloration.\r\n\r\n    Versez le bouillon, couvrez et laissez mijoter 15 minutes.\r\n\r\n    Mixez la préparation jusqu’à obtenir une texture lisse et homogène.\r\n\r\n    Incorporez la crème, rectifiez l’assaisonnement avec du sel et du poivre.\r\n\r\n    Servez chaud, décoré de croûtons et de ciboulette ciselée.\r\n', 1),
	(3, 'quiquiche saumon poireau', 50, '\r\n    Préchauffez le four à 200°C. \r\n    Rincez, séchez et émincez les poireaux. Dans une poêle, faites fondre le beurre, ajoutez les poireaux émincés et faites-les étuver pendant 25 minutes.\r\n    Pendant ce temps, déroulez la pâte brisée dans un moule à tarte et piquez le fond avec une fourchette. Enfournez la pâte à blanc pendant 10 minutes. \r\n    Découpez les tranches de saumon fumé en lamelles. Dans un saladier, battez les oeufs, ajoutez la crème fraîche, l\'emmental et le poivre.\r\n    Recouvrez le fond de tarte précuit de poireaux, ajoutez les lamelles de saumon et versez la préparation aux oeufs.\r\n    Enfournez pendant 30 minutes puis servez la quiche aux poireaux et saumon fumé aussitôt avec une salade verte.\r\n', 2),
	(4, 'Salade niçoise', 20, 'Lavez et coupez les tomates en tranches, le concombre en rondelles et épluchez les œufs durs avant de les couper en quartiers.\r\nDisposez la laitue dans le fond de vos assiettes. Ajoutez par-dessus les tomates, les concombres, les œufs durs et le thon émietté.\r\nDisposez les olives noires et les filets d\'anchois sur le dessus de la salade.\r\nDans un petit bol, mélangez l\'huile d\'olive, le vinaigre, le sel et le poivre. Arrosez la salade avec cette vinaigrette et décorez avec quelques feuilles de basilic frais.\r\nServez la salade niçoise classique immédiatement, accompagnée de pain si vous le souhaitez.', 1),
	(5, 'Spaghetti bolognaise', 30, '    Faites cuire les spaghetti dans de l\'eau bouillante salée en fonction du temps indiqué sur le paquet. \r\n    Epluchez les oignons et l\'ail puis émincez-les. Coupez les tomates pelées en petits morceaux et lavez, épluchez et coupez la carotte en dés.\r\n    Dans une poêle, faites revenir un filet d\'huile d\'olive avec l\'ail et les oignons pendant 2-3 minutes. Ajoutez les dés de carotte et laissez-les cuire pendant plusieurs minutes.\r\n    Ajoutez la viande hachée et remuez jusqu\'à ce que la viande soit cuite. Salez, poivrez. Mettez les morceaux de tomates pelées, les branches de thym et laissez mijoter à feu doux pendant 10 minutes. \r\n    Versez la sauce tomate et laissez encore mijoter pendant 10 minutes. Si besoin ajoutez un peu d\'eau.\r\n    Dans une assiette, mettez les pâtes puis la sauce et parsemez vos spaghetti bolognaise de fromage râpé. Servez aussitôt.\r\n', 2),
	(6, 'Boeuf bourguignon', 200, 'La veille, portez le vin à ébullition dans une cocotte. Faites flamber l’alcool et laissez refroidir complètement. Ajoutez ensuite la viande coupée en gros cubes, les carottes coupées en rondelles pas trop fines ainsi que l’oignon émincé. Réservez le tout au frais pendant toute une nuit.\r\nLe lendemain, égouttez la préparation, puis réservez le vin. Épluchez et émincez les gousses d’ail.\r\nDans une cocotte, faites revenir les lardons pendant 2 minutes. Ajoutez les morceaux de viande, l’ail émincé ainsi que les légumes marinés. Faites revenir le tout sur feu moyen pendant 5 minutes en remuant de temps en temps.\r\nSaupoudrez le contenu de la cocotte de farine, mélangez, puis mouillez avec le vin. Ajoutez environ ½ litre d’eau, le cube de bouillon de bœuf, le bouquet garni. Portez le tout à ébullition.\r\nLaissez ensuite mijoter à couvert et à feu doux pendant environ 2 heures en remuant régulièrement. Passé ce délai, incorporez les pommes de terre pelées et coupées en gros morceaux ainsi que les champignons. Salez et poivrez à votre convenance, puis poursuivez la cuisson pendant 1 heure supplémentaire. Servez aussitôt le bœuf bourguignon aux carottes et pommes de terre.', 2),
	(7, 'Riz au lait', 40, 'Rincez le riz rond à l’eau froide pour retirer l’excédent d’amidon.\r\n\r\nFaites chauffer une casserole d’eau et plongez-y le riz 2 minutes, puis égouttez-le.\r\n\r\nDans une grande casserole, versez le lait avec la gousse de vanille fendue et grattez les graines.\r\n\r\nPortez le lait à ébullition puis ajoutez le riz et une pincée de sel.\r\n\r\nLaissez cuire à feu doux en remuant régulièrement pendant environ 30 minutes.\r\n\r\nAjoutez le sucre en fin de cuisson et mélangez bien.\r\n\r\nRetirez du feu, ôtez la gousse de vanille et laissez tiédir.\r\n\r\nServez tiède ou froid, avec une touche de cannelle ou zeste de citron si désiré', 3),
	(8, 'Tarte fraise ', 20, 'Faites précuire la pâte sablée selon les instructions de l’emballage, puis laissez-la refroidir.\r\nDans une casserole, faites chauffer le lait avec l’extrait de vanille.\r\nDans un bol, mélangez le jaune d\'œuf, le sucre et la maïzena.\r\nVersez le lait chaud progressivement sur le mélange tout en fouettant, puis remettez le tout dans la casserole.\r\nFaites épaissir à feu doux sans cesser de remuer jusqu’à obtenir une crème lisse.\r\nÉtalez la crème sur le fond de tarte refroidi.\r\nLavez, équeutez et coupez les fraises en deux, puis disposez-les harmonieusement sur la crème.\r\nFaites tiédir la tarte aux fraises express avec de la confiture et badigeonnez-en les fraises pour les faire briller.', 3),
	(9, 'tiramisu', 50, 'Préparez le café et laissez-le refroidir dans un plat creux. \r\nBattez les jaunes d\'œufs avec le sucre jusqu\'à obtenir un mélange mousseux. Ajoutez le mascarpone et mélangez délicatement avec une spatule jusqu\'à obtenir une crème lisse et onctueuse. Vous pouvez également incorporer les blancs montés en neige à cette préparation.\r\nTrempez les biscuits un par un dans le café pour les imbiber légèrement, puis disposez-les dans un plat à gratin pour couvrir le fond.\r\nVersez la moitié de la crème mascarpone sur les biscuits et réfrigérez pendant 45 minutes pour que la crème prenne.\r\nRépétez l\'opération pour former une deuxième couche de biscuits et terminez en recouvrant avec le reste de la crème.\r\nLaissez reposer au réfrigérateur pendant au moins 6 heures.\r\nAu moment de servir le tiramisu traditionnel à l\'italienne, saupoudrez généreusement de cacao amer sur toute sa surface.', 3),
	(10, 'Pasteis', 50, 'Dans une casserole, mélangez le sucre, la farine, la vanille avec le lait et ajoutez une pincée de sel.\r\nFaites cuire en remuant jusqu\'à ce que la crème épaississe et se détache de la spatule.\r\nRetirez du feu, laissez refroidir quelques minutes, puis incorporez les jaunes d\'œufs en mélangeant bien.\r\nVersez la crème dans des petits moules préalablement garnis de pâte feuilletée.\r\nMettez au four préchauffé à 300 °C jusqu\'à ce que les tartes soient dorées.\r\nSortez du four et saupoudrez de cannelle.\r\nDégustez ces délicieuses tartes portugaises, à savourer à chaque moment de la journée.', 3),
	(11, 'Pâtes à la carbonara', 5, 'Faites revenir les lardons dans une poêle bien chaude sans matière grasse jusquà ce quils soient bien cuits, et réservez.\r\nFaites cuire les spaghetti dans une grande casserole deau bouillante salée en suivant les instructions sur lemballage.\r\nPendant ce temps, dans un saladier, fouettez les oeufs avec le sel et le poivre, et ajoutez le parmesan râpé.\r\nLorsque les pâtes sont cuites, égouttez-les et mélangez avec la préparation aux oeufs. Ajoutez les lardons et servez les spaghetti carbonara aussitôt avec un peu de parmesan râpé par-dessus.', 2),
	(12, 'test', 5, 'jtd', 2),
	(13, 'Vent muet', 0, 'laisser', 1),
	(14, 'Boeuf bourguignon alt', 0, NULL, 2);

-- Listage de la structure de table recipes. recipe_ingredients
CREATE TABLE IF NOT EXISTS `recipe_ingredients` (
  `quantity` int DEFAULT NULL,
  `id_ingredient` int NOT NULL,
  `id_recipe` int NOT NULL,
  KEY `id_recipe` (`id_recipe`),
  KEY `id_ingredient` (`id_ingredient`),
  CONSTRAINT `FK_recipe_ingredients_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`),
  CONSTRAINT `FK_recipe_ingredients_recipe` FOREIGN KEY (`id_recipe`) REFERENCES `recipe` (`id_recipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recipes.recipe_ingredients : ~75 rows (environ)
INSERT INTO `recipe_ingredients` (`quantity`, `id_ingredient`, `id_recipe`) VALUES
	(30, 38, 1),
	(1, 8, 1),
	(500, 3, 1),
	(0, 29, 1),
	(5, 36, 1),
	(0, 32, 1),
	(3, 31, 3),
	(80, 20, 3),
	(0, 32, 3),
	(4, 2, 3),
	(400, 24, 3),
	(3, 7, 5),
	(2, 8, 5),
	(400, 1, 5),
	(0, 29, 5),
	(2, 8, 5),
	(400, 21, 5),
	(2, 5, 5),
	(100, 20, 5),
	(2000, 1, 6),
	(3, 42, 6),
	(6, 5, 6),
	(600, 6, 6),
	(200, 3, 6),
	(200, 12, 6),
	(1, 8, 6),
	(200, 13, 6),
	(10, 36, 6),
	(2, 7, 4),
	(1, 44, 4),
	(4, 2, 4),
	(200, 22, 4),
	(150, 26, 4),
	(8, 45, 4),
	(1, 17, 4),
	(0, 29, 4),
	(0, 36, 4),
	(1, 32, 7),
	(100, 47, 7),
	(80, 14, 7),
	(1, 46, 7),
	(0, 36, 7),
	(100, 21, 8),
	(300, 30, 8),
	(40, 14, 8),
	(0, 32, 8),
	(1, 2, 8),
	(1, 46, 8),
	(500, 49, 9),
	(500, 48, 9),
	(150, 36, 9),
	(50, 50, 9),
	(20, 51, 9),
	(4, 2, 9),
	(100, 21, 10),
	(500, 14, 10),
	(125, 13, 10),
	(1, 32, 10),
	(11, 2, 10),
	(1, 46, 10),
	(0, 36, 10),
	(350, 21, 11),
	(4, 2, 11),
	(200, 12, 11),
	(4, 45, 12),
	(1, 2, 1),
	(200, 3, 14),
	(200, 12, 14),
	(200, 13, 14),
	(10, 36, 14),
	(1, 8, 14),
	(2000, 1, 14),
	(3, 42, 14),
	(6, 5, 14),
	(600, 6, 14);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
