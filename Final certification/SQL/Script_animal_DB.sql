-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema animal_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema animal_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `animal_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `animal_database` ;

-- -----------------------------------------------------
-- Table `animal_database`.`dogs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animal_database`.`dogs` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `commands` VARCHAR(45) NULL DEFAULT NULL,
  `datebirth` DATE NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animal_database`.`cats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animal_database`.`cats` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `commands` VARCHAR(45) NULL DEFAULT NULL,
  `datebirth` DATE NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animal_database`.`hamsters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animal_database`.`hamsters` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `commands` VARCHAR(45) NULL DEFAULT NULL,
  `datebirth` DATE NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animal_database`.`pet_animals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animal_database`.`pet_animals` (
  `id` INT NOT NULL,
  `dog_id` INT NOT NULL,
  `cat_id` INT NOT NULL,
  `hamster_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pet_animals_dog1_idx` (`dog_id` ASC) VISIBLE,
  INDEX `fk_pet_animals_cat1_idx` (`cat_id` ASC) VISIBLE,
  INDEX `fk_pet_animals_hamster1_idx` (`hamster_id` ASC) VISIBLE,
  CONSTRAINT `fk_pet_animals_dog1`
    FOREIGN KEY (`dog_id`)
    REFERENCES `animal_database`.`dogs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_animals_cat1`
    FOREIGN KEY (`cat_id`)
    REFERENCES `animal_database`.`cats` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_animals_hamster1`
    FOREIGN KEY (`hamster_id`)
    REFERENCES `animal_database`.`hamsters` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animal_database`.`horses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animal_database`.`horses` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `commands` VARCHAR(45) NULL DEFAULT NULL,
  `datebirth` DATE NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animal_database`.`camels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animal_database`.`camels` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `commands` VARCHAR(45) NULL DEFAULT NULL,
  `datebirth` DATE NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animal_database`.`donkeys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animal_database`.`donkeys` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `commands` VARCHAR(45) NULL DEFAULT NULL,
  `datebirth` DATE NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animal_database`.`pack_animals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animal_database`.`pack_animals` (
  `id` INT NOT NULL,
  `horse_id` INT NOT NULL,
  `camel_id` INT NOT NULL,
  `domkey_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pack_animals_horse1_idx` (`horse_id` ASC) VISIBLE,
  INDEX `fk_pack_animals_camel1_idx` (`camel_id` ASC) VISIBLE,
  INDEX `fk_pack_animals_domkey1_idx` (`domkey_id` ASC) VISIBLE,
  CONSTRAINT `fk_pack_animals_horse1`
    FOREIGN KEY (`horse_id`)
    REFERENCES `animal_database`.`horses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pack_animals_camel1`
    FOREIGN KEY (`camel_id`)
    REFERENCES `animal_database`.`camels` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pack_animals_domkey1`
    FOREIGN KEY (`domkey_id`)
    REFERENCES `animal_database`.`donkeys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animal_database`.`animals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animal_database`.`animals` (
  `id` INT NOT NULL,
  `pet_animals_id` INT NOT NULL,
  `pack_animals_id` INT NOT NULL,
  PRIMARY KEY (`id`, `pet_animals_id`, `pack_animals_id`),
  INDEX `fk_animals_pet_animals1_idx` (`pet_animals_id` ASC) VISIBLE,
  INDEX `fk_animals_pack_animals1_idx` (`pack_animals_id` ASC) VISIBLE,
  CONSTRAINT `fk_animals_pet_animals1`
    FOREIGN KEY (`pet_animals_id`)
    REFERENCES `animal_database`.`pet_animals` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_animals_pack_animals1`
    FOREIGN KEY (`pack_animals_id`)
    REFERENCES `animal_database`.`pack_animals` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
