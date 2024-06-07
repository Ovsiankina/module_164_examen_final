/* Database faite manuellement pour entrainer le module 106*/

/* Creation de la base de donnees, preferablement dans phpmyadmin*/
CREATE DATABASE IF NOT EXISTS recherche_appart;
USE recherche_appart;

-- Creation de toutes les tables

drop table if exists T_user;
create table T_user (
  id_user int not null,
  username varchar(25) default null,
  budget int default null
);

drop table if exists T_user_appartment;
create table T_user_appartment (
  id_user_appartment int not null,
  fk_user int default null,
  fk_appartment int default null,
  date_found date default null
);

drop table if exists T_user_budget;
create table T_user_budget (
  id_user_budget int not null,
  fk_user int default null,
  fk_budget int default null
);

drop table if exists T_appartment;
create table T_appartment (
  id_appartment int not null,
  address varchar(255) default null,
  rent int default null,
  nb_rooms tinyint default null,
  aera_m2 tinyint default null,
  date_availability date default null
);

drop table if exists T_budget;
create table T_budget (
  id_budget int not null,
  rent int default null,
  new_supply int default null,
  transport int default null
);

drop table if exists T_appartment_address;
create table T_appartment_address (
  id_appartment_address int not null,
  fk_appartment int default null,
  fk_address int default null
);

drop table if exists T_appartment_landlord;
create table T_appartment_landlord (
  id_appartment_landlord int not null,
  fk_appartment int default null,
  fk_landlord int default null,
  date_appartment date default null 
);

drop table if exists T_appartment_image;
create table T_appartment_image (
  id_appartment_image int not null,
  fk_appartment int default null,
  fk_image int default null,
  date_image date default null
);

CREATE TABLE T_address (
  id_address int NOT NULL,
  city varchar(50) DEFAULT NULL,
  street_address varchar(255) DEFAULT NULL,
  zip varchar(20) DEFAULT NULL,
  street_number varchar(20) DEFAULT NULL
);

drop table if exists T_landlord;
create table T_landlord (
  id_landlord int not null,
  mail varchar(255) default null,
  telephone varchar(20) default null
);

drop table if exists T_image;
create table T_image (
  id_image int not null,
  image blob default null
);

drop table if exists T_landlord_address;
create table T_landlord_address (
  id_landlord_address int not null,
  fk_landlord int default null,
  fk_address int default null
);

drop table if exists T_landlord_group;
create table T_landlord_group (
  id_landlord_group int not null,
  fk_landlord int default null,
  fk_group int default null
);

drop table if exists T_landlord_image;
create table T_landlord_image (
  id_landlord_image int not null,
  fk_landlord int default null,
  fk_image int default null,
  date_image date default null
);

drop table if exists T_group;
create table T_group (
  id_group int not null,
  landlord_group varchar(50)
);

-- Ajout des cles primaire et etrangeres

ALTER TABLE `T_address`
  ADD PRIMARY KEY (`id_address`);

ALTER TABLE `T_appartment`
  ADD PRIMARY KEY (`id_appartment`);

ALTER TABLE `T_appartment_address`
  ADD PRIMARY KEY (`id_appartment_address`),
  ADD KEY `fk_appartment` (`fk_appartment`),
  ADD KEY `fk_address` (`fk_address`);

ALTER TABLE `T_appartment_image`
  ADD PRIMARY KEY (`id_appartment_image`),
  ADD KEY `fk_appartment` (`fk_appartment`),
  ADD KEY `fk_image` (`fk_image`);

ALTER TABLE `T_appartment_landlord`
  ADD PRIMARY KEY (`id_appartment_landlord`),
  ADD KEY `fk_appartment` (`fk_appartment`),
  ADD KEY `fk_landlord` (`fk_landlord`);

ALTER TABLE `T_budget`
  ADD PRIMARY KEY (`id_budget`);

ALTER TABLE `T_group`
  ADD PRIMARY KEY (`id_group`);

ALTER TABLE `T_image`
  ADD PRIMARY KEY (`id_image`);

ALTER TABLE `T_landlord`
  ADD PRIMARY KEY (`id_landlord`);

ALTER TABLE `T_landlord_address`
  ADD PRIMARY KEY (`id_landlord_address`),
  ADD KEY `fk_landlord` (`fk_landlord`),
  ADD KEY `fk_address` (`fk_address`);

ALTER TABLE `T_landlord_group`
  ADD PRIMARY KEY (`id_landlord_group`),
  ADD KEY `fk_landlord` (`fk_landlord`),
  ADD KEY `fk_group` (`fk_group`);

ALTER TABLE `T_landlord_image`
  ADD PRIMARY KEY (`id_landlord_image`),
  ADD KEY `fk_landlord` (`fk_landlord`),
  ADD KEY `fk_image` (`fk_image`);

ALTER TABLE `T_user`
  ADD PRIMARY KEY (`id_user`);

ALTER TABLE `T_user_appartment`
  ADD PRIMARY KEY (`id_user_appartment`),
  ADD KEY `fk_user` (`fk_user`),
  ADD KEY `fk_appartment` (`fk_appartment`);

ALTER TABLE `T_user_budget`
  ADD PRIMARY KEY (`id_user_budget`),
  ADD KEY `fk_user` (`fk_user`),
  ADD KEY `fk_budget` (`fk_budget`);

-- Ajout des contraintes

ALTER TABLE `T_appartment_address`
  ADD CONSTRAINT `fk_appartment_address_to_appartment` FOREIGN KEY (`fk_appartment`) REFERENCES `T_appartment` (`id_appartment`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_appartment_address_to_address` FOREIGN KEY (`fk_address`) REFERENCES `T_address` (`id_address`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `T_appartment_image`
  ADD CONSTRAINT `fk_appartment_image_to_appartment` FOREIGN KEY (`fk_appartment`) REFERENCES `T_appartment` (`id_appartment`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_appartment_image_to_image` FOREIGN KEY (`fk_image`) REFERENCES `T_image` (`id_image`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `T_appartment_landlord`
  ADD CONSTRAINT `fk_appartment_landlord_to_appartment` FOREIGN KEY (`fk_appartment`) REFERENCES `T_appartment` (`id_appartment`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_appartment_landlord_to_landlord` FOREIGN KEY (`fk_landlord`) REFERENCES `T_landlord` (`id_landlord`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `T_landlord_address`
  ADD CONSTRAINT `fk_landlord_address_to_landlord` FOREIGN KEY (`fk_landlord`) REFERENCES `T_landlord` (`id_landlord`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_landlord_address_to_address` FOREIGN KEY (`fk_address`) REFERENCES `T_address` (`id_address`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `T_landlord_group`
  ADD CONSTRAINT `fk_landlord_group_to_landlord` FOREIGN KEY (`fk_landlord`) REFERENCES `T_landlord` (`id_landlord`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_landlord_group_to_group` FOREIGN KEY (`fk_group`) REFERENCES `T_group` (`id_group`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `T_landlord_image`
  ADD CONSTRAINT `fk_landlord_image_to_landlord` FOREIGN KEY (`fk_landlord`) REFERENCES `T_landlord` (`id_landlord`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_landlord_image_to_image` FOREIGN KEY (`fk_image`) REFERENCES `T_image` (`id_image`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `T_user_appartment`
  ADD CONSTRAINT `fk_user_appartment_to_user` FOREIGN KEY (`fk_user`) REFERENCES `T_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_user_appartment_to_appartment` FOREIGN KEY (`fk_appartment`) REFERENCES `T_appartment` (`id_appartment`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `T_user_budget`
  ADD CONSTRAINT `fk_user_budget_to_user` FOREIGN KEY (`fk_user`) REFERENCES `T_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_user_budget_to_budget` FOREIGN KEY (`fk_budget`) REFERENCES `T_budget` (`id_budget`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Insertion de donnees fictives pour les tests

INSERT INTO T_user (id_user, username, budget) VALUES 
(1, 'User1', 1200),
(2, 'User2', 1500),
(3, 'User3', 1800);

INSERT INTO T_appartment (id_appartment, address, rent, nb_rooms, aera_m2, date_availability) VALUES 
(1, '123 Main St', 800, 3, 70, '2024-02-01'),
(2, '456 Oak St', 950, 4, 80, '2024-02-15'),
(3, '789 Pine St', 700, 2, 60, '2024-03-01');

INSERT INTO T_budget (id_budget, rent, new_supply, transport) VALUES 
(1, 800, 100, 50),
(2, 950, 150, 60),
(3, 700, 120, 55);

INSERT INTO T_address (id_address, city, street_address, zip, street_number) VALUES 
(1, 'New York', '5th Avenue', '10001', '1'),
(2, 'Los Angeles', 'Sunset Boulevard', '90026', '101'),
(3, 'Chicago', 'Michigan Avenue', '60602', '500');

INSERT INTO T_landlord (id_landlord, mail, telephone) VALUES 
(1, 'landlord1@example.com', '123-456-7890'),
(2, 'landlord2@example.com', '098-765-4321'),
(3, 'landlord3@example.com', '456-123-7890');

INSERT INTO T_image (id_image) VALUES 
(1),
(2),
(3);

INSERT INTO T_group (id_group, landlord_group) VALUES 
(1, 'Group A'),
(2, 'Group B'),
(3, 'Group C');

INSERT INTO T_user_appartment (id_user_appartment, fk_user, fk_appartment, date_found) VALUES 
(1, 1, 1, '2024-01-10'),
(2, 2, 2, '2024-01-15'),
(3, 3, 3, '2024-01-20');

INSERT INTO T_user_budget (id_user_budget, fk_user, fk_budget) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT INTO T_appartment_address (id_appartment_address, fk_appartment, fk_address) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT INTO T_appartment_landlord (id_appartment_landlord, fk_appartment, fk_landlord, date_appartment) VALUES 
(1, 1, 1, '2024-01-01'),
(2, 2, 2, '2024-01-05'),
(3, 3, 3, '2024-01-10');

INSERT INTO T_appartment_image (id_appartment_image, fk_appartment, fk_image, date_image) VALUES 
(1, 1, 1, '2024-01-11'),
(2, 2, 2, '2024-01-16'),
(3, 3, 3, '2024-01-21');

INSERT INTO T_landlord_group (id_landlord_group, fk_landlord, fk_group) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT INTO T_landlord_image (id_landlord_image, fk_landlord, fk_image, date_image) VALUES 
(1, 1, 1, '2024-01-12'),
(2, 2, 2, '2024-01-17'),
(3, 3, 3, '2024-01-22');
