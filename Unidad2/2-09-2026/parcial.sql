SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `veterinarios` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `veterinarios`;

-- --------------------------------------------------------
-- Estructura e inserción para la tabla: especie
-- --------------------------------------------------------
DROP TABLE IF EXISTS `especie`;
CREATE TABLE `especie` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` TEXT NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `especie` (`ID`, `NOMBRE`) VALUES
	(1, 'Perico'),
	(2, 'Perro'),
	(3, 'Gato'),
	(4, 'TORTUGAS');

-- --------------------------------------------------------
-- Estructura e inserción para la tabla: mascotas
-- --------------------------------------------------------
DROP TABLE IF EXISTS `mascotas`;
CREATE TABLE `mascotas` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` TEXT NOT NULL,
  `COLOR` TEXT NOT NULL,
  `ESPECIES` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ESPECIES` (`ESPECIES`),
  CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`ESPECIES`) REFERENCES `especie` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `mascotas` (`ID`, `NOMBRE`, `COLOR`, `ESPECIES`) VALUES
	(1, 'Garfield', 'Naranja', 3),
	(2, 'Oddie', 'Cafe', 2),
	(3, 'Rufino', 'Verde', 1),
	(5, 'Margarita', 'Verde', 4);

-- --------------------------------------------------------
-- Estructura e inserción para la tabla: dueno
-- --------------------------------------------------------
DROP TABLE IF EXISTS `dueno`;
CREATE TABLE `dueno` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` TEXT NOT NULL,
  `TELEFONO` VARCHAR(8) NOT NULL,
  `CORREO` TINYTEXT NOT NULL,
  `MASCOTA` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `MASCOTA` (`MASCOTA`),
  CONSTRAINT `dueno_ibfk_1` FOREIGN KEY (`MASCOTA`) REFERENCES `mascotas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `dueno` (`ID`, `NOMBRE`, `TELEFONO`, `CORREO`, `MASCOTA`) VALUES
	(1, 'Carlos Sanchez', '777777', 'CS.example@gmail.com', 3),
	(3, 'Maria Mendoza', '88888', 'EXAMPLE@EXMAPLE.COM', 1),
	(4, 'Alejandro Mako', '71680705', 'CS.MAKO@gmail.com', 5);

-- --------------------------------------------------------
-- Estructura e inserción para la tabla: citas
-- --------------------------------------------------------
DROP TABLE IF EXISTS `citas`;
CREATE TABLE `citas` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `ESPECIE` INT(11) DEFAULT NULL,
  `MASCOTAS` INT(11) DEFAULT NULL,
  `DUENO` INT(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ESPECIE` (`ESPECIE`),
  KEY `MASCOTAS` (`MASCOTAS`),
  KEY `DUENO` (`DUENO`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`ESPECIE`) REFERENCES `especie` (`ID`),
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`MASCOTAS`) REFERENCES `mascotas` (`ID`),
  CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`DUENO`) REFERENCES `dueno` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `citas` (`ID`, `ESPECIE`, `MASCOTAS`, `DUENO`) VALUES
	(1, 3, 1, 3),
	(2, 1, 3, 1),
	(3, 4, 5, 4);

SET FOREIGN_KEY_CHECKS = 1;