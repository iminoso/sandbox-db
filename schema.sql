CREATE DATABASE IF NOT EXISTS sandbox;
USE sandbox;

DROP TABLE IF EXISTS transaction;
DROP TABLE IF EXISTS invoice;
DROP TABLE IF EXISTS client;

CREATE TABLE `client` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `limit` int NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `invoice` (
    `id` int NOT NULL AUTO_INCREMENT,
    `client` int NOT NULL,
    `date` datetime NOT NULL,
    `paid` bool NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `transaction` (
    `id` int NOT NULL AUTO_INCREMENT,
    `amount` int NOT NULL,
    `date` datetime NOT NULL,
    `client` int NOT NULL,
    `invoice` int,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`client`) REFERENCES client(id),
    FOREIGN KEY (`invoice`) REFERENCES invoice(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
