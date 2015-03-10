SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Loci`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Loci` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Loci` (
  `Region_name` VARCHAR(50) NOT NULL ,
  `Chr_no` TINYINT NOT NULL ,
  `Start` BIGINT NOT NULL ,
  `Stop` BIGINT NOT NULL ,
  `Disease_name` VARCHAR(45) NULL ,
  PRIMARY KEY (`Region_name`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ZmB73_annotation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ZmB73_annotation` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`ZmB73_annotation` (
  `Gene_id` VARCHAR(45) NOT NULL ,
  `Annotation` VARCHAR(45) NOT NULL ,
  `Start` BIGINT NOT NULL ,
  `Stop` BIGINT NOT NULL ,
  PRIMARY KEY (`Gene_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transformation_candidates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Transformation_candidates` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Transformation_candidates` (
  `Gene_id` VARCHAR(45) NOT NULL ,
  `Start` BIGINT NOT NULL ,
  `Stop` BIGINT NOT NULL ,
  `Transformation_notes` LONGTEXT NULL ,
  PRIMARY KEY (`Gene_id`) ,
  CONSTRAINT `Gene_id`
    FOREIGN KEY (`Gene_id` )
    REFERENCES `mydb`.`ZmB73_annotation` (`Gene_id` )
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Primers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Primers` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Primers` (
  `Primer_name` VARCHAR(100) NOT NULL ,
  `Primer_seq` VARCHAR(100) NOT NULL ,
  `Tm_Celsius` TINYINT ZEROFILL NULL ,
  `Primer_start` BIGINT NOT NULL ,
  `Primer_length` BIGINT NOT NULL ,
  `Status` VARCHAR(45) NULL ,
  PRIMARY KEY (`Primer_name`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Forward_primer_name_UNIQUE` ON `mydb`.`Primers` (`Primer_name` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Amplicons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Amplicons` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Amplicons` (
  `Region_name` VARCHAR(50) NULL COMMENT 'Region_name' ,
  `Amplicon_name` VARCHAR(100) NOT NULL COMMENT 'Amplicon_name: \nChr_no_Start_len_F+Chr_no_Start_len_R' ,
  `Forward_primer_name` VARCHAR(100) NOT NULL ,
  `Reverse_primer_name` VARCHAR(100) NOT NULL ,
  `Expected_amplicon_size` MEDIUMINT NULL ,
  `FA_amplicon_size` DECIMAL(2) NULL ,
  PRIMARY KEY (`Amplicon_name`) ,
  CONSTRAINT `FK1_Region_name`
    FOREIGN KEY (`Region_name` )
    REFERENCES `mydb`.`Loci` (`Region_name` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Forward_primer_name`
    FOREIGN KEY (`Forward_primer_name` )
    REFERENCES `mydb`.`Primers` (`Primer_name` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Reverse_primer_name`
    FOREIGN KEY (`Reverse_primer_name` )
    REFERENCES `mydb`.`Primers` (`Primer_name` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Forward_primer_UNIQUE` ON `mydb`.`Amplicons` (`Forward_primer_name` ASC) ;

CREATE UNIQUE INDEX `Reverse_primer_UNIQUE` ON `mydb`.`Amplicons` (`Reverse_primer_name` ASC) ;

CREATE INDEX `Region_name_idx` ON `mydb`.`Amplicons` (`Region_name` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`Fragment_analyzer_report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Fragment_analyzer_report` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Fragment_analyzer_report` (
  `Amplicon_name` VARCHAR(100) NOT NULL COMMENT 'Amplicon_name: \nChr_no_Start_len_F+Chr_no_Start_len_R' ,
  `FA_image` MEDIUMBLOB NULL ,
  `FA_mean1` DECIMAL(2) ZEROFILL NULL ,
  `FA_mean2` DECIMAL(2) ZEROFILL NULL ,
  `FA_mean3` DECIMAL(2) ZEROFILL NULL ,
  `FA_notes` LONGTEXT NULL ,
  PRIMARY KEY (`Amplicon_name`) ,
  CONSTRAINT `Amplicon_name_1`
    FOREIGN KEY (`Amplicon_name` )
    REFERENCES `mydb`.`Amplicons` (`Amplicon_name` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GBrowse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`GBrowse` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`GBrowse` (
  `Region_name` VARCHAR(50) NOT NULL ,
  `GBrowse_image` MEDIUMBLOB NULL ,
  PRIMARY KEY (`Region_name`) ,
  CONSTRAINT `FK3_Region_name`
    FOREIGN KEY (`Region_name` )
    REFERENCES `mydb`.`Loci` (`Region_name` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`Loci`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Loci` (`Region_name`, `Chr_no`, `Start`, `Stop`, `Disease_name`) VALUES ('qSLB_2_36928000_13001', 2, 36928000, 36941000, 'SLB');
INSERT INTO `mydb`.`Loci` (`Region_name`, `Chr_no`, `Start`, `Stop`, `Disease_name`) VALUES ('qSLB_3_33490000_24001', 3, 33490000, 33514000, 'SLB');
INSERT INTO `mydb`.`Loci` (`Region_name`, `Chr_no`, `Start`, `Stop`, `Disease_name`) VALUES ('qSLB_3_219833000_72001', 3, 219833000, 219905000, 'SLB');
INSERT INTO `mydb`.`Loci` (`Region_name`, `Chr_no`, `Start`, `Stop`, `Disease_name`) VALUES ('qSLB_6_7000000_135001', 6, 7000000, 7135000, 'SLB');
INSERT INTO `mydb`.`Loci` (`Region_name`, `Chr_no`, `Start`, `Stop`, `Disease_name`) VALUES ('qSLB_9_16200311_302962', 9, 16200311, 16503272, 'SLB');
INSERT INTO `mydb`.`Loci` (`Region_name`, `Chr_no`, `Start`, `Stop`, `Disease_name`) VALUES ('qMDR_7_128353590_51043', 7, 128353590, 128404632, 'MDR');
INSERT INTO `mydb`.`Loci` (`Region_name`, `Chr_no`, `Start`, `Stop`, `Disease_name`) VALUES ('qNLB_1_25377803_22184', 1, 25377803, 25399986, 'NLB');
INSERT INTO `mydb`.`Loci` (`Region_name`, `Chr_no`, `Start`, `Stop`, `Disease_name`) VALUES ('qNLB_1_187245104_197947', 1, 187245104, 187443050, 'NLB');

COMMIT;
