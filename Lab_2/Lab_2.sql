-- MySQL Script generated by MySQL Workbench
-- Sun Mar 22 15:02:53 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `telephone_number` VARCHAR(12) NULL,
  `email` VARCHAR(40) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE`  (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mark`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mark` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`), 
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`model` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `mark_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC), 
  INDEX `fk_model_mark_idx` (`mark_id` ASC) ,
  CONSTRAINT `fk_model_mark`
    FOREIGN KEY (`mark_id`)
    REFERENCES `mydb`.`mark` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`auto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`auto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `volume_engine` FLOAT NOT NULL,
  `volume_power` INT NOT NULL,
  `transmission` VARCHAR(45) NOT NULL,
  `type_id` INT NOT NULL,
  `model_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_auto_type1_idx` (`type_id` ASC),
  INDEX `fk_auto_model1_idx` (`model_id` ASC),
  CONSTRAINT `fk_auto_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `mydb`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_auto_model1`
    FOREIGN KEY (`model_id`)
    REFERENCES `mydb`.`model` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`advertisement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`advertisement` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `price` INT NULL,
  `mileage` INT NULL,
  `color` VARCHAR(15) NULL,
  `condition` VARCHAR(20) NULL,
  `pubdate` DATETIME NOT NULL,
  `address` VARCHAR(200) NULL,
  `year_auto` INT NULL,
  `text` VARCHAR(400) NULL,
  `auto_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_advertisement_auto1_idx` (`auto_id` ASC),
  INDEX `fk_advertisement_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_advertisement_auto1`
    FOREIGN KEY (`auto_id`)
    REFERENCES `mydb`.`auto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_advertisement_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(200) NOT NULL,
  `advertisement_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_comment_advertisement1_idx` (`advertisement_id` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_comment_advertisement1`
    FOREIGN KEY (`advertisement_id`)
    REFERENCES `mydb`.`advertisement` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`advertisement_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`advertisement_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `advertisement_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_advertisement_user_user1_idx` (`user_id` ASC),
  INDEX `fk_advertisement_user_advertisement1_idx` (`advertisement_id` ASC),
  CONSTRAINT `fk_advertisement_user_advertisement1`
    FOREIGN KEY (`advertisement_id`)
    REFERENCES `mydb`.`advertisement` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_advertisement_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
