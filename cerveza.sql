create database cerveza;
use cerveza;

CREATE TABLE IF NOT EXISTS cerveza (
  `id` INT NOT NULL Primary Key,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `stock` INT NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
`categoria` int, 
foreign key(categoria) references categoria(id));

insert into cerveza values ('214098', 'Cristal lata', 2000, 'Cristal' , 50, 'cristal_lata.jpg', 1);
insert into cerveza values ('214099', 'Becker lata', 2000, 'Becker' , 50 , 'becker_lata.jpg', 1);
insert into cerveza values ('214000', 'Royal lata', 3000, 'Royal', 50, 'royal_guard.jpg',1);
insert into cerveza values ('214001', 'Escudo lata', 2000,'Escudo', 50, 'escudo.jpg', 1);
insert into cerveza values ('214002', 'Lemon Stones', 3000,'Lemon Stones', 50, 'lemon_stones.jpg',1);
insert into cerveza values ('214003', 'Morenita', 2000,'Morenita', 50, 'morenita.jpg',1);
insert into cerveza values ('214004', 'Cristal botella', 2000,'Cristal', 50, 'cristal.jpg',1);
insert into cerveza values ('214005', 'Becker botella', 2000,'Becker', 50, 'becker_botella.jpg',1);
insert into cerveza values ('214006', 'Royal botella', 3500,'Royal', 50, 'royal_botella.jpg',1);
insert into cerveza values ('214007', 'Escudo botella', 2500,'Escudo', 50, 'escudo_botella.jpg',1);
insert into cerveza values ('214011', 'Heineken lata', 2500,'Heineken', 50, 'heineken.jpg',2);
insert into cerveza values ('214012', 'Sol lata', 3000,'Sol', 50, 'sol_lata.jpg',2);
insert into cerveza values ('214013', 'Heineken botella', 3000,'Heineken', 50, 'heineken_botella.jpg',2);
insert into cerveza values ('214014', 'Sol botella', 3500,'Sol', 50, 'sol.jpg',2);
insert into cerveza values ('214015', 'Coors lata', 3500,'Coors', 50, 'coors_original.jpg',2);
insert into cerveza values ('214016', 'Coors botella', 4000,'Coors', 50, 'coors_botella.jpg',2);
insert into cerveza values ('214017', 'Stella Artois lata', 3500,'Stella Artois', 50, 'stella_lata.jpg',2);
insert into cerveza values ('214018', 'Stella Artois botella', 4000,'Stella Artois', 50, 'stella_botella.jpg',2);
insert into cerveza values ('214019', 'Blue Moon', 5000,'Blue Moon', 50, 'blue_moon.jpg',2);
insert into cerveza values ('214020', 'Corona botella', 4000,'Corona', 50, 'corona_botella.jpg',2);
insert into cerveza values ('214021', 'Corona lata', 3500,'Corona', 50, 'corona_lata.jpg',2);
insert into cerveza values ('214030', 'Austral Calafate', 5500,'Austral', 50, 'austral_calafate.jpg',3);
insert into cerveza values ('214031', 'Kunstmann Bock', 5000,'Kunstmann', 50, 'kunstmann_bock.jpg',3);
insert into cerveza values ('214032', 'Austral Torres del Paine', 5500,'Austral', 50, 'austral_torres_del_paine.jpg',3);
insert into cerveza values ('214033', 'Kunstmann Arandano', 5000,'Kunstmann', 50, 'kunstmann_arandano.jpg',3);
insert into cerveza values ('214040', 'Jarro Austral 500CC', 2500,'Austral', 50, 'jarro_austral.jpg',4);
insert into cerveza values ('214041', 'Balde Corona Hielera', 10000,'Corona', 50, 'balde.jpg',4);
insert into cerveza values ('214042', 'Cooler Corona Vintage', 15000,'Corona', 50, 'cooler.jpg',4);
insert into cerveza values ('214044', 'Copa Stella Artois Edicion Peru', 12000,'Stella Artois', 50, 'copa_stella.jpg',4);
insert into cerveza values ('214045', 'Vaso Green Glass Corona', 8000,'Corona', 50, 'vaso_corona.jpg',4);
select * from cerveza;

create table categoria(
id int primary key, 
descripcion varchar(45) not null); 

insert into categoria values(1, "Nacionales");
insert into categoria values(2, "Internacionales");
insert into categoria values(3, "Artesanales");
insert into categoria values(4, "Accesorios");
select * from categoria;

CREATE TABLE IF NOT EXISTS usuario (
  `email` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(45) NOT NULL,
  `perfil_usuario` INT NOT NULL,
  PRIMARY KEY (`email`),
    FOREIGN KEY (`perfil_usuario`)
    REFERENCES `cerveza`.`perfil_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);   
    
    CREATE TABLE IF NOT EXISTS perfil_usuario (
  `id` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
    
insert into perfil_usuario (id, descripcion) values(1, "Administrador");
insert into perfil_usuario (id, descripcion) values(2, "Cliente");
insert into perfil_usuario (id, descripcion) values(3, "Otro");
select * from perfil_usuario;

insert into usuario values("blara81@gmail.com","Benjamin Lara", "123456", 1);
insert into usuario values("nicolas.lara27@gmail.com","Nicolas Lara", "2692", 1);
insert into usuario values("paulina.lara30@gmail.com","Paulina Lara", "0589", 1);
insert into usuario values("lukas.encina23@gmail.com","Lukas Encina", "2197", 1);
insert into usuario values("roxana.montalvan22@gmail.com","Roxana Montalvan", "2798", 1);
insert into usuario values("joselito.vaca13@hotmail.com","Joselito Vaca", "876543", 2);
insert into usuario values("pollo.santaferia@gmail.com","Pollo Gonzalez", "2006", 2);
insert into usuario values("jose.lopez1@gmail.com","Jose Lopez", "1324", 2);
insert into usuario values("pablo.saldana13@gmail.com","Pablo Saldaña", "2133", 2);
insert into usuario values("matias.corcolan23@gmail.com","Matias Corcolan", "1297", 2);
insert into usuario values("joel.perez@gmail.com","Joel Perez", "1011", 2);
insert into usuario values("Ellie.munoz14@gmail.com","Ellie Muñoz", "2155", 2);
insert into usuario values("pancho.meza21@gmail.com","Francisco Meza", "2110", 2);
insert into usuario values("matias.venegas14@gmail.com","Matias Venegas", "2137", 2);
insert into usuario values("rodrigo.gutierrez24@gmail.com","Rodrigo Gutierrez", "1567", 2);
select * from usuario;

