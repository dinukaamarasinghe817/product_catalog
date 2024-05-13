-- AUTO-GENERATED FILE.

-- This file is an auto-generated file by Ballerina persistence layer for model.
-- Please verify the generated scripts and execute them against the target DB server.

DROP TABLE IF EXISTS `Product`;
DROP TABLE IF EXISTS `Category`;
DROP TABLE IF EXISTS `Seller`;

CREATE TABLE `Seller` (
	`id` INT NOT NULL,
	`name` VARCHAR(191) NOT NULL,
	`email` VARCHAR(191) NOT NULL,
	`contactNumber` VARCHAR(191) NOT NULL,
	`address` VARCHAR(191) NOT NULL,
	`logoUrl` VARCHAR(191) NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE `Category` (
	`id` INT NOT NULL,
	`name` VARCHAR(191) NOT NULL,
	`description` VARCHAR(191) NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE `Product` (
	`id` INT NOT NULL,
	`name` VARCHAR(191) NOT NULL,
	`description` VARCHAR(191) NOT NULL,
	`price` DOUBLE NOT NULL,
	`availability` ENUM('IN_STOCK', 'OUT_OF_STOCK') NOT NULL,
	`quantity` INT NOT NULL,
	`rating` DOUBLE NOT NULL,
	`totalSale` INT NOT NULL,
	`releaseDate` DATE NOT NULL,
	`lastUpdated` TIME NOT NULL,
	`categoryId` INT NOT NULL,
	FOREIGN KEY(`categoryId`) REFERENCES `Category`(`id`),
	`sellerId` INT NOT NULL,
	FOREIGN KEY(`sellerId`) REFERENCES `Seller`(`id`),
	PRIMARY KEY(`id`)
);


