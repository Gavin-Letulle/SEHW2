CREATE DATABASE  IF NOT EXISTS `cooking` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cooking`;
-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: cooking
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `ingredient_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(45) NOT NULL,
  `highlight_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ingredient_id`),
  UNIQUE KEY `ingredient_id_UNIQUE` (`ingredient_id`),
  UNIQUE KEY `ingredient_name_UNIQUE` (`ingredient_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Chicken','Chicken is the world’s most popular meat, with over 50 billion chickens raised for food every year!'),(2,'Flour','Flour is one of the world\'s oldest ingredients, with evidence of its use dating back over 6,000 years!'),(3,'Olive oil','Olive oil was so valuable in ancient Mediterranean cultures that it was even used as currency, earning the nickname \"liquid gold\"!'),(4,'Butter','Butter might have been discovered by accident when milk was naturally churned in animal skins, making it one of the world\'s oldest and most cherished spreads!'),(5,'Garlic','Garlic has been cherished for its bold flavor and healing properties for thousands of years, with ancient cultures even believing it could ward off evil spirits!'),(6,'Chicken stock','Chicken stock, simmered from bones and vegetables, has been a culinary secret for centuries, infusing dishes with deep, savory flavor!'),(7,'Heavy cream','Heavy cream\'s high fat content not only makes it rich and delicious but also helps it whip into a stable, fluffy topping for desserts!'),(8,'Parmesan','Parmesan, or Parmigiano-Reggiano, is aged for at least 12 months, developing a rich, nutty flavor and those signature crunchy protein crystals!'),(9,'Chili flakes','Chili flakes made their way to Europe through the Columbian Exchange, instantly adding a fiery twist to many traditional dishes!'),(10,'Oregano','The name \"oregano\" comes from Greek words meaning \"joy of the mountain,\" reflecting its cherished role in Mediterranean cuisine and ancient herbal remedies!'),(11,'Thyme','In ancient Egypt, thyme was used in embalming, while medieval Europeans believed it boosted courage in battle!'),(12,'Sun-dried tomatoes','Sun-dried tomatoes are created by drying ripe tomatoes to concentrate their naturally sweet and tangy flavor, making them a gourmet secret in many Italian dishes!'),(13,'Basil','Basil\'s name comes from the Greek word for \"royal,\" which is why it\'s often called the \"King of Herbs\"!'),(14,'Beef','Beef offers a culinary adventure with every cut—from juicy steaks to rich stews, its versatility is celebrated in kitchens around the world!'),(15,'Beef stock','Beef stock has been simmered for centuries, transforming bones and vegetables into a rich, savory base that’s the secret behind many classic dishes!'),(16,'Tofu','Tofu, also known as bean curd, has been a versatile protein staple in Asian cuisine for over 2,000 years, celebrated for its ability to absorb any flavor!'),(17,'Vegetable stock','Vegetable stock transforms a mix of veggies and herbs into a flavorful, aromatic broth—proving that simple, plant-based ingredients can create culinary magic!'),(18,'Quinoa','Quinoa, a nutrient-packed \"super grain,\" was a staple in ancient Andean diets and is celebrated for its impressive protein content!'),(19,'Vegetable broth','Vegetable broth has been a culinary gem across cultures, extracting robust flavors from a medley of veggies to create a nourishing base for countless recipes!');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredients`
--

DROP TABLE IF EXISTS `recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipe_id` int unsigned NOT NULL,
  `ingredient_id` int unsigned NOT NULL,
  `quantity` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recipe_id` (`recipe_id`),
  KEY `fk_ingredient_id` (`ingredient_id`),
  CONSTRAINT `fk_ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredients`
--

LOCK TABLES `recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `recipe_ingredients` DISABLE KEYS */;
INSERT INTO `recipe_ingredients` VALUES (1,1,1,'3 large chicken breasts boneless and skinless, sliced lengthwise into thin cutlets'),(2,1,2,'6 Tablespoons'),(3,1,3,'2 Tablespoons'),(4,1,4,'2 Tbsp (unsalted)'),(5,1,5,'3 Cloves (minced)'),(6,1,6,'1 Cup'),(7,1,7,'1 Cup'),(8,1,8,'1/2 Cup (grated)'),(9,1,9,'1 Tsp'),(10,1,10,'1/4 Tsp'),(11,1,11,'1/4 Tsp'),(12,1,12,'1/3 Cup'),(13,1,13,'1 Tsp of fresh leaves'),(14,2,14,'1 lb (sirloin, thinly sliced)'),(15,2,2,'4 Tbsp'),(16,2,3,'2 Tbsp'),(17,2,4,'2 Tbsp (unsalted)'),(18,2,5,'3 cloves (minced)'),(19,2,15,'1 cup'),(20,2,7,'1 Cup'),(21,2,8,'1/2 Cup (grated)'),(22,2,9,'1 Tsp'),(23,2,10,'1/4 Tsp (dried)'),(24,2,11,'1/4 Tsp'),(25,2,12,'1/3 Cup (chopped)'),(26,2,13,'1 Tbsp (chopped for garnish)'),(27,3,16,'14 oz (pressed and sliced)'),(28,3,2,'3 Tbsp'),(29,3,3,'2 Tbsp'),(30,3,5,'3 Cloves (minced)'),(31,3,17,'1 Cup'),(32,3,7,'1 Cup'),(33,3,8,'1/2 Cup (grated)'),(34,3,12,'1/3 Cup (chopped)'),(35,3,13,'1 Tbsp (chopped for garnish)'),(36,4,18,'1 Cup (rinsed)'),(37,4,19,'2 cups (or water)'),(38,4,3,'1 Tbsp'),(39,4,5,'2 Cloves (minced)'),(40,4,7,'1 Cup'),(41,4,8,'1/2 Cup (grated)'),(42,4,12,'1/3 Cup (chopped)'),(43,4,13,'1 Tbsp (chopped for garnish)'),(44,5,14,'2'),(45,5,13,'garnish '),(46,5,4,'more buda'),(47,6,16,'one million'),(48,6,9,'2- yummers'),(49,6,11,'dont even know what this is'),(50,6,12,'these are great - 0');
/*!40000 ALTER TABLE `recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `recipe_id` int unsigned NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(45) NOT NULL,
  `protein_type` varchar(45) NOT NULL,
  `instructions` mediumtext NOT NULL,
  `cooking_time` varchar(45) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`recipe_id`),
  UNIQUE KEY `recipe_name_UNIQUE` (`recipe_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Marry Me Chicken','Chicken','Prep: Season chicken with salt and pepper; dredge in seasoned flour.\nBrown: Sauté chicken in olive oil and butter until golden; set aside.\nSauce: Sauté garlic, deglaze pan with chicken stock, then add heavy cream, parmesan, chili flakes, oregano, and thyme.\nSimmer: Add sundried tomatoes and return chicken to the pan; simmer until the sauce thickens.\nFinish: Garnish with fresh basil and serve over pasta or rice.','15 Minutes','https://littlesunnykitchen.com/wp-content/uploads/Marry-Me-Chicken-22.jpg'),(2,'Marry Me Beef','Beef','Season beef with salt and pepper; dredge in flour.\nIn a skillet, heat olive oil and butter over medium heat. Sear beef for 3–4 minutes per side until golden; remove and set aside.\nSauté garlic for 1 minute; deglaze the pan with beef stock, scraping up any browned bits.\nStir in heavy cream, parmesan, chili flakes, oregano, and thyme. Simmer for 2 minutes.\nAdd sundried tomatoes and return beef to the pan; simmer 2–3 minutes until the sauce thickens.\nGarnish with fresh basil and serve.','15 minutes','https://www.365daysofcrockpot.com/wp-content/uploads/2023/03/instant-pot-recipe-marry-me-beef-pot-roast-scaled.jpg'),(3,'Marry Me Tofu','Tofu','Prep: Season tofu with salt and pepper; lightly dredge in flour.\nFry: Heat olive oil in a skillet over medium heat. Fry tofu for about 3–4 minutes per side until golden. Remove tofu and set aside.\nSauce: In the same skillet, sauté garlic for 1 minute, then add vegetable stock and heavy cream. Stir in parmesan and sundried tomatoes; simmer for 2 minutes.\nFinish: Return tofu to the pan, warm through for another 2–3 minutes. Garnish with fresh basil and serve.','15 Minutes','https://hips.hearstapps.com/hmg-prod/images/marry-me-tofu-third-6786dcb11f190.jpg'),(4,'Creamy Marry Me Grain Bowl','Grains','Cook Quinoa: Simmer quinoa in 2 cups broth (or water) per package instructions (about 15 minutes).\nMake Sauce: Meanwhile, heat olive oil in a skillet over medium heat. Sauté garlic for 1 minute, then add heavy cream and parmesan. Stir in sundried tomatoes and season with salt and pepper; simmer for 2–3 minutes until slightly thickened.\nAssemble: Toss the cooked quinoa with the creamy sauce, garnish with fresh basil, and serve warm.','20 Minutes','https://sarahwragge.com/cdn/shop/articles/image-asset-1_1.jpg?v=1670202209'),(5,'Beef Test','Beef','cook da bef','20 Minutes','https://preview.redd.it/x6hv04ajs9w61.png?auto=webp&s=2c129effca7a476b17cefc16c1317d4b84a699fd'),(6,'Tofu Test','Tofu','Tofu tastes horrible tbh','1 second','https://i0.wp.com/www.hungryknife.com/wp-content/uploads/2023/04/TNSstickerPhoto-HK.jpg?fit=2000%2C2000&ssl=1');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-23 12:57:54
