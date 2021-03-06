-- -----------------------------------------------------
-- Schema SurveySez
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SurveySez` DEFAULT CHARACTER SET utf8 ;
USE `SurveySez` ;

-- -----------------------------------------------------
-- Table `SurveySez`.`sp17_surveys`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SurveySez`.`sp17_surveys` ;

CREATE TABLE IF NOT EXISTS `SurveySez`.`sp17_surveys` (
  `SurveyID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `AdminID` INT UNSIGNED NULL DEFAULT 0,
  `Title` VARCHAR(255) NULL,
  `Description` TEXT NULL,
  `DateAdded` DATETIME NULL,
  `LastUpdated` TIMESTAMP NULL DEFAULT 0,
  PRIMARY KEY (`SurveyID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SurveySez`.`sp17_questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SurveySez`.`sp17_questions` ;

CREATE TABLE IF NOT EXISTS `SurveySez`.`sp17_questions` (
  `QuestionID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `SurveyID` INT UNSIGNED NULL DEFAULT 0,
  `Question` TEXT NULL,
  `Description` TEXT NULL,
  `DateAdded` DATETIME NULL,
  `LastUpdated` TIMESTAMP NULL DEFAULT 0,
  PRIMARY KEY (`QuestionID`),
  CONSTRAINT `QuestionID`
    FOREIGN KEY ()
    REFERENCES `SurveySez`.`sp17_questions` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SurveyID`
    FOREIGN KEY ()
    REFERENCES `SurveySez`.`sp17_surveys` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SurveySez`.`sp17_answers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SurveySez`.`sp17_answers` ;

CREATE TABLE IF NOT EXISTS `SurveySez`.`sp17_answers` (
  `AnswerID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `QuestionID` INT UNSIGNED NULL DEFAULT 0,
  `SurveyID` INT UNSIGNED NULL DEFAULT 0,
  `Answer` TEXT NULL,
  `Description` TEXT NULL,
  `DateGiven` DATETIME NULL,
  `LastUpdated` TIMESTAMP NULL,
  PRIMARY KEY (`AnswerID`),
  CONSTRAINT `QuestionID`
    FOREIGN KEY ()
    REFERENCES `SurveySez`.`sp17_questions` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SurveyID`
    FOREIGN KEY ()
    REFERENCES `SurveySez`.`sp17_surveys` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SurveySez`.`sp17_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SurveySez`.`sp17_users` ;

CREATE TABLE IF NOT EXISTS `SurveySez`.`sp17_users` (
  `UserID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `SurveyID` INT UNSIGNED NULL DEFAULT 0,
  `AnswerID` INT UNSIGNED NULL DEFAULT 0,
  `InteractionDate` DATETIME NULL,
  `LastUpdated` TIMESTAMP NULL DEFAULT 0,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `SurveyID`
    FOREIGN KEY ()
    REFERENCES `SurveySez`.`sp17_surveys` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AnswerID`
    FOREIGN KEY ()
    REFERENCES `SurveySez`.`sp17_answers` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SurveySez`.`sp17_comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SurveySez`.`sp17_comments` ;

CREATE TABLE IF NOT EXISTS `SurveySez`.`sp17_comments` (
  `CommentID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `UserID` INT UNSIGNED NULL DEFAULT 0,
  `SurveyID` INT UNSIGNED NULL DEFAULT 0,
  `AnswerID` INT UNSIGNED NULL DEFAULT 0,
  `CommentEntered` TEXT NULL,
  `CommentDate` DATETIME NULL,
  `LastUptated` TIMESTAMP NULL DEFAULT 0,
  PRIMARY KEY (`CommentID`),
  CONSTRAINT `SurveyID`
    FOREIGN KEY ()
    REFERENCES `SurveySez`.`sp17_surveys` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AnswerID`
    FOREIGN KEY ()
    REFERENCES `SurveySez`.`sp17_answers` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SurveySez`.`sp17_topics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SurveySez`.`sp17_topics` ;

CREATE TABLE IF NOT EXISTS `SurveySez`.`sp17_topics` (
  `TopicID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `SurveyID` INT UNSIGNED NULL DEFAULT 0,
  `QuestionID` INT UNSIGNED NULL DEFAULT 0,
  `DiscussionTopic` TEXT NULL,
  `CommentDate` DATETIME NULL,
  `LastUpdated` TIMESTAMP NULL,
  PRIMARY KEY (`TopicID`),
  CONSTRAINT `SurveyID`
    FOREIGN KEY ()
    REFERENCES `SurveySez`.`sp17_surveys` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `QuestionID`
    FOREIGN KEY ()
    REFERENCES `SurveySez`.`sp17_questions` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
