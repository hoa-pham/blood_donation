-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema blood_donation
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blood_donation
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blood_donation` DEFAULT CHARACTER SET latin1 ;
USE `blood_donation` ;

-- -----------------------------------------------------
-- Table `blood_donation`.`lab_tech`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blood_donation`.`lab_tech` (
  `name` VARCHAR(30) NOT NULL,
  `contact_no` VARCHAR(15) NOT NULL,
  `id` INT(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `blood_donation`.`hospital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blood_donation`.`hospital` (
  `name` VARCHAR(320) NOT NULL,
  `contact_no` VARCHAR(15) NOT NULL,
  `address` VARCHAR(320) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `blood_donation`.`nurse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blood_donation`.`nurse` (
  `name` VARCHAR(30) NULL DEFAULT NULL,
  `id` INT(15) NOT NULL,
  `contact_no` VARCHAR(15) NOT NULL,
  `fk_hospital_name` VARCHAR(320) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_nurse_1_idx` (`fk_hospital_name` ASC),
  CONSTRAINT `fk_nurse_1`
    FOREIGN KEY (`fk_hospital_name`)
    REFERENCES `blood_donation`.`hospital` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `blood_donation`.`doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blood_donation`.`doctor` (
  `name` VARCHAR(30) NOT NULL,
  `contact_no` VARCHAR(15) NOT NULL,
  `id` INT(15) NOT NULL,
  `fk_hospital_name` VARCHAR(320) NOT NULL,
  `specialist` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `contact_no_UNIQUE` (`contact_no` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_doctor_1_idx` (`fk_hospital_name` ASC),
  CONSTRAINT `fk_doctor_1`
    FOREIGN KEY (`fk_hospital_name`)
    REFERENCES `blood_donation`.`hospital` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `blood_donation`.`donor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blood_donation`.`donor` (
  `name` VARCHAR(30) NOT NULL,
  `email` VARCHAR(320) NOT NULL,
  `contact_no` VARCHAR(15) NOT NULL,
  `blood_type` VARCHAR(2) NOT NULL,
  `fk_nu_id` INT(15) NOT NULL,
  `fk_dr` INT(15) NOT NULL,
  `allegies` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`email`),
  INDEX `fk_donor_1_idx` (`fk_dr` ASC),
  INDEX `fk_donor_2_idx` (`fk_nu_id` ASC),
  CONSTRAINT `fk_donor_1`
    FOREIGN KEY (`fk_dr`)
    REFERENCES `blood_donation`.`doctor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_donor_2`
    FOREIGN KEY (`fk_nu_id`)
    REFERENCES `blood_donation`.`nurse` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `blood_donation`.`blood`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blood_donation`.`blood` (
  `blood_type` VARCHAR(10) NOT NULL,
  `id` INT(15) NOT NULL AUTO_INCREMENT,
  `blood_status` VARCHAR(5) NOT NULL,
  `fk_nurse_id` INT(15) NOT NULL,
  `fk_lab_tech_id` INT(15) NOT NULL,
  `fk_donor_email` VARCHAR(320) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_nurse_id_idx` (`fk_nurse_id` ASC),
  INDEX `fk_lab_tech_id_idx` (`fk_lab_tech_id` ASC),
  INDEX `fk_blood_1_idx` (`fk_donor_email` ASC),
  CONSTRAINT `fk_lab_tech_id`
    FOREIGN KEY (`fk_lab_tech_id`)
    REFERENCES `blood_donation`.`lab_tech` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nurse_id`
    FOREIGN KEY (`fk_nurse_id`)
    REFERENCES `blood_donation`.`nurse` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_blood_1`
    FOREIGN KEY (`fk_donor_email`)
    REFERENCES `blood_donation`.`donor` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
