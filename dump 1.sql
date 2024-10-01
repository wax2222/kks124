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
-- Table `mydb`.`director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`director` (
  `iddir` INT NOT NULL,
  `dir name` VARCHAR(25) NOT NULL,
  `podr` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`iddir`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`groop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`groop` (
  `gr` CHAR(10) NOT NULL,
  `code` CHAR(8) NOT NULL,
  `napr` MEDIUMTEXT NULL,
  `prof` MEDIUMTEXT NULL,
  PRIMARY KEY (`gr`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student` (
  `stud .int` INT NOT NULL,
  `studentname` VARCHAR(25) NOT NULL,
  `director_iddir` INT NOT NULL,
  `groop_gr` CHAR(10) NOT NULL,
  PRIMARY KEY (`stud .int`),
  INDEX `fk_student_director_idx` (`director_iddir` ASC) VISIBLE,
  INDEX `fk_student_groop1_idx` (`groop_gr` ASC) VISIBLE,
  CONSTRAINT `fk_student_director`
    FOREIGN KEY (`director_iddir`)
    REFERENCES `mydb`.`director` (`iddir`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_groop1`
    FOREIGN KEY (`groop_gr`)
    REFERENCES `mydb`.`groop` (`gr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`post` (
  `postname` VARCHAR(21) NOT NULL,
  PRIMARY KEY (`postname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`emp ploye`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`emp ploye` (
  `emp` INT NOT NULL,
  `empnam` VARCHAR(25) NULL,
  `director_iddir` INT NOT NULL,
  `post_postname` VARCHAR(21) NOT NULL,
  PRIMARY KEY (`emp`),
  INDEX `fk_emp ploye_director1_idx` (`director_iddir` ASC) VISIBLE,
  INDEX `fk_emp ploye_post1_idx` (`post_postname` ASC) VISIBLE,
  CONSTRAINT `fk_emp ploye_director1`
    FOREIGN KEY (`director_iddir`)
    REFERENCES `mydb`.`director` (`iddir`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emp ploye_post1`
    FOREIGN KEY (`post_postname`)
    REFERENCES `mydb`.`post` (`postname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`subject` (
  `subj` INT NOT NULL,
  `subjname` VARCHAR(45) NOT NULL,
  `subjectinfo` VARCHAR(45) NOT NULL,
  `subjtinfo` MEDIUMTEXT NULL,
  PRIMARY KEY (`subj`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`lessontape`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lessontape` (
  `lessonname` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`lessonname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`studentmars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`studentmars` (
  `student_stud .int` INT NOT NULL,
  `emp ploye_emp` INT NOT NULL,
  `subject_subj` INT NOT NULL,
  `date` DATE NOT NULL,
  `marks` VARCHAR(45) NULL,
  PRIMARY KEY (`student_stud .int`, `emp ploye_emp`, `subject_subj`, `date`),
  INDEX `fk_student_has_emp ploye_emp ploye1_idx` (`emp ploye_emp` ASC) VISIBLE,
  INDEX `fk_student_has_emp ploye_student1_idx` (`student_stud .int` ASC) VISIBLE,
  INDEX `fk_student_has_emp ploye_subject1_idx` (`subject_subj` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_emp ploye_student1`
    FOREIGN KEY (`student_stud .int`)
    REFERENCES `mydb`.`student` (`stud .int`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_emp ploye_emp ploye1`
    FOREIGN KEY (`emp ploye_emp`)
    REFERENCES `mydb`.`emp ploye` (`emp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_emp ploye_subject1`
    FOREIGN KEY (`subject_subj`)
    REFERENCES `mydb`.`subject` (`subj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`subject_has_emp ploye`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`subject_has_emp ploye` (
  `subject_subj` INT NOT NULL,
  `emp ploye_emp` INT NOT NULL,
  PRIMARY KEY (`subject_subj`, `emp ploye_emp`),
  INDEX `fk_subject_has_emp ploye_emp ploye1_idx` (`emp ploye_emp` ASC) VISIBLE,
  INDEX `fk_subject_has_emp ploye_subject1_idx` (`subject_subj` ASC) VISIBLE,
  CONSTRAINT `fk_subject_has_emp ploye_subject1`
    FOREIGN KEY (`subject_subj`)
    REFERENCES `mydb`.`subject` (`subj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_has_emp ploye_emp ploye1`
    FOREIGN KEY (`emp ploye_emp`)
    REFERENCES `mydb`.`emp ploye` (`emp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`lessons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lessons` (
  `week` INT NOT NULL,
  `groop_gr` CHAR(10) NOT NULL,
  `subject_subj` INT NOT NULL,
  `lessontape_lessonname` VARCHAR(12) NOT NULL,
  `day` VARCHAR(3) NOT NULL,
  `rom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`week`, `groop_gr`, `subject_subj`, `lessontape_lessonname`, `day`),
  INDEX `fk_groop_has_subject_subject1_idx` (`subject_subj` ASC) VISIBLE,
  INDEX `fk_groop_has_subject_groop1_idx` (`groop_gr` ASC) VISIBLE,
  INDEX `fk_groop_has_subject_lessontape1_idx` (`lessontape_lessonname` ASC) VISIBLE,
  CONSTRAINT `fk_groop_has_subject_groop1`
    FOREIGN KEY (`groop_gr`)
    REFERENCES `mydb`.`groop` (`gr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_groop_has_subject_subject1`
    FOREIGN KEY (`subject_subj`)
    REFERENCES `mydb`.`subject` (`subj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_groop_has_subject_lessontape1`
    FOREIGN KEY (`lessontape_lessonname`)
    REFERENCES `mydb`.`lessontape` (`lessonname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
