-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema global_super_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema global_super_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `global_super_store` DEFAULT CHARACTER SET utf8 ;
USE `global_super_store` ;

-- -----------------------------------------------------
-- Table `global_super_store`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`customers` (
  `customerID` INT NOT NULL,
  `fullName` VARCHAR(255) NOT NULL,
  `contactNumber` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`products` (
  `productID` INT NOT NULL,
  `productName` VARCHAR(255) NOT NULL,
  `stock` INT NOT NULL,
  `price` DECIMAL(7,2) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `sub_category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`productID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`deliveryAddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`deliveryAddress` (
  `addressID` INT NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `postalCode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`addressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`shipping` (
  `shipID` INT NOT NULL,
  `shipDate` DATE NOT NULL,
  `shipMode` VARCHAR(45) NOT NULL,
  `addressID` INT NOT NULL,
  `shipCoste` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`shipID`),
  INDEX `addressID_idx` (`addressID` ASC) VISIBLE,
  CONSTRAINT `addressID`
    FOREIGN KEY (`addressID`)
    REFERENCES `global_super_store`.`deliveryAddress` (`addressID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`orders` (
  `orderID` INT NOT NULL,
  `productID` INT NOT NULL,
  `customerID` INT NOT NULL,
  `deliveryID` INT NOT NULL,
  `quantity` INT NOT NULL,
  `totalCost` DECIMAL(7,2) NOT NULL,
  `orderPriority` VARCHAR(45) NOT NULL,
  `discount` DECIMAL(7,2) NOT NULL,
  `shipID` INT NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `customerID_idx` (`customerID` ASC) VISIBLE,
  INDEX `shipID_idx` (`shipID` ASC) VISIBLE,
  INDEX `productID_idx` (`productID` ASC) VISIBLE,
  CONSTRAINT `productID`
    FOREIGN KEY (`productID`)
    REFERENCES `global_super_store`.`products` (`productID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customerID`
    FOREIGN KEY (`customerID`)
    REFERENCES `global_super_store`.`customers` (`customerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `shipID`
    FOREIGN KEY (`shipID`)
    REFERENCES `global_super_store`.`shipping` (`shipID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
