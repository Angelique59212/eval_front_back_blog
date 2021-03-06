-- MySQL Script generated by MySQL Workbench
-- Sun Mar  6 17:17:35 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema eval_blog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema eval_blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eval_blog` DEFAULT CHARACTER SET utf8 ;
USE `eval_blog` ;

-- -----------------------------------------------------
-- Table `eval_blog`.`mdf58_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eval_blog`.`mdf58_role` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eval_blog`.`mdf58_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eval_blog`.`mdf58_user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastname` VARCHAR(150) NOT NULL,
  `firstname` VARCHAR(150) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `user_role_fk` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `user_role_idx` (`user_role_fk` ASC),
  CONSTRAINT `user_role`
    FOREIGN KEY (`user_role_fk`)
    REFERENCES `eval_blog`.`mdf58_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eval_blog`.`mdf58_article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eval_blog`.`mdf58_article` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `content` TEXT NULL,
  `user_fk` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_fk_idx` (`user_fk` ASC),
  CONSTRAINT `user_fk`
    FOREIGN KEY (`user_fk`)
    REFERENCES `eval_blog`.`mdf58_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eval_blog`.`mdf58_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eval_blog`.`mdf58_comment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `user_fk` INT UNSIGNED NOT NULL,
  `article_fk` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_fk_idx` (`user_fk` ASC),
  CONSTRAINT `fk_comments_article`
    FOREIGN KEY (`article_fk`)
    REFERENCES `eval_blog`.`mdf58_article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_user`
    FOREIGN KEY (`user_fk`)
    REFERENCES `eval_blog`.`mdf58_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
