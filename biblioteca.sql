-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`poeti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`poeti` (
  `idpoet` INT NOT NULL AUTO_INCREMENT,
  `Nume` VARCHAR(45) NULL DEFAULT NULL,
  `Prenume` VARCHAR(45) NULL DEFAULT NULL,
  `Nationalitate` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idpoet`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`carti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`carti` (
  `idcarte` INT NOT NULL AUTO_INCREMENT,
  `NumeCarte` VARCHAR(45) NULL DEFAULT NULL,
  `EdituraCarte` VARCHAR(45) NULL DEFAULT NULL,
  `ISBN` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcarte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`volumpoezii`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`volumpoezii` (
  `idvolumpoezii` INT NOT NULL AUTO_INCREMENT,
  `idpoet` INT NULL,
  `idcarte` INT NULL,
  `NumeVolum` VARCHAR(45) NULL DEFAULT NULL,
  `DataLansare` VARCHAR(45) NULL DEFAULT NULL,
  `Tema` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idvolumpoezii`),
  INDEX `fk_link1` (`idcarte` ASC),
  INDEX `fk_link2` (`idpoet` ASC),

-- Adaugare chei straine scriind in interiorul tabelului:
  CONSTRAINT `fk_volumepoezii_carti`
    FOREIGN KEY (`idcarte`)
    REFERENCES `biblioteca`.`carti` (`idcarte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_volumepoezii_poeti1`
    FOREIGN KEY (`idpoet`)
    REFERENCES `biblioteca`.`poeti` (`idpoet`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
