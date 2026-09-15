-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.21.0.7344
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para veterinarios
CREATE DATABASE IF NOT EXISTS `veterinarios` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `veterinarios`;

-- Volcando estructura para tabla veterinarios.citas
CREATE TABLE IF NOT EXISTS `citas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ESPECIE` int(11) DEFAULT NULL,
  `MASCOTAS` int(11) DEFAULT NULL,
  `DUENO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ESPECIE` (`ESPECIE`),
  KEY `MASCOTAS` (`MASCOTAS`),
  KEY `DUENO` (`DUENO`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`ESPECIE`) REFERENCES `especie` (`ID`),
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`MASCOTAS`) REFERENCES `mascotas` (`ID`),
  CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`DUENO`) REFERENCES `dueno` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla veterinarios.citas: ~2 rows (aproximadamente)
DELETE FROM `citas`;
INSERT INTO `citas` (`ID`, `ESPECIE`, `MASCOTAS`, `DUENO`) VALUES
	(1, 3, 1, 3),
	(3, 4, 5, 4);

-- Volcando estructura para tabla veterinarios.dueno
CREATE TABLE IF NOT EXISTS `dueno` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` text NOT NULL,
  `TELEFONO` varchar(8) NOT NULL,
  `CORREO` tinytext NOT NULL,
  `MASCOTA` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `MASCOTA` (`MASCOTA`),
  CONSTRAINT `dueno_ibfk_1` FOREIGN KEY (`MASCOTA`) REFERENCES `mascotas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla veterinarios.dueno: ~3 rows (aproximadamente)
DELETE FROM `dueno`;
INSERT INTO `dueno` (`ID`, `NOMBRE`, `TELEFONO`, `CORREO`, `MASCOTA`) VALUES
	(1, 'Carlos Sanchez', '777777', 'Carlos.Sanchez@mail.utec.edu.sv', 3),
	(3, 'Maria Mendoza', '88888', 'EXAMPLE@EXMAPLE.COM', 1),
	(4, 'Alejandro Mako', '71680705', 'CS.MAKO@gmail.com', 5);

-- Volcando estructura para tabla veterinarios.especie
CREATE TABLE IF NOT EXISTS `especie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla veterinarios.especie: ~5 rows (aproximadamente)
DELETE FROM `especie`;
INSERT INTO `especie` (`ID`, `NOMBRE`) VALUES
	(1, 'Perico'),
	(2, 'Perro'),
	(3, 'Gato'),
	(4, 'TORTUGAS'),
	(7, 'PEJELAGARTO');

-- Volcando estructura para tabla veterinarios.log_citas_eliminadas
CREATE TABLE IF NOT EXISTS `log_citas_eliminadas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITAS_ID` int(11) DEFAULT NULL,
  `DUENO_ID` int(11) DEFAULT NULL,
  `FECHA_ELIMINACION` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla veterinarios.log_citas_eliminadas: ~1 rows (aproximadamente)
DELETE FROM `log_citas_eliminadas`;
INSERT INTO `log_citas_eliminadas` (`ID`, `CITAS_ID`, `DUENO_ID`, `FECHA_ELIMINACION`) VALUES
	(1, 2, 1, '2026-09-14 19:22:13');

-- Volcando estructura para tabla veterinarios.mascotas
CREATE TABLE IF NOT EXISTS `mascotas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` text NOT NULL,
  `COLOR` text NOT NULL,
  `ESPECIES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ESPECIES` (`ESPECIES`),
  CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`ESPECIES`) REFERENCES `especie` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla veterinarios.mascotas: ~4 rows (aproximadamente)
DELETE FROM `mascotas`;
INSERT INTO `mascotas` (`ID`, `NOMBRE`, `COLOR`, `ESPECIES`) VALUES
	(1, 'Garfield', 'Naranja', 3),
	(2, 'Oddie', 'Cafe', 2),
	(3, 'Rufino', 'Verde', 1),
	(5, 'Margarita', 'Verde', 4);

-- Volcando estructura para procedimiento veterinarios.pr_especie
DELIMITER //
CREATE PROCEDURE `pr_especie`(
	IN `Nombre` VARCHAR(50)
)
    COMMENT 'Definiciones de Nombres para especies'
BEGIN
INSERT INTO especie(NOMBRE) VALUES ('Nombre');
END//
DELIMITER ;

-- Volcando estructura para procedimiento veterinarios.PR_ESPECIE_DELETE
DELIMITER //
CREATE PROCEDURE `PR_ESPECIE_DELETE`(
IN ID_2 INT
)
BEGIN
DELETE FROM especie WHERE ID=ID_2;
END//
DELIMITER ;

-- Volcando estructura para procedimiento veterinarios.PR_ESPECIE_UPDATE
DELIMITER //
CREATE PROCEDURE `PR_ESPECIE_UPDATE`(
	IN `ID2` INT,
	IN `NOMBRE2` TEXT
)
BEGIN
UPDATE especie SET NOMBRE=NOMBRE2
WHERE ID =ID2;
END//
DELIMITER ;

-- Volcando estructura para procedimiento veterinarios.PR_ESPECIE2
DELIMITER //
CREATE PROCEDURE `PR_ESPECIE2`(
	IN `NOMBRE_2` TEXT
)
BEGIN
INSERT INTO especie(NOMBRE) VALUES (NOMBRE_2);
END//
DELIMITER ;

-- Volcando estructura para vista veterinarios.vista_citas
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vista_citas` (
	`NOMBRE DEL DUEÑO` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`CORREO DEL DUEÑO` TINYTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`TELEFONO DEL DUEÑO` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Nombre de la mascota` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`Nombre de la especie` TEXT NOT NULL COLLATE 'utf8mb4_general_ci'
);

-- Volcando estructura para vista veterinarios.vista_especies_dueno
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vista_especies_dueno` (
	`Nombre del dueño` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`Nombre de la especie` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`Nombre de la mascota` TEXT NOT NULL COLLATE 'utf8mb4_general_ci'
);

-- Volcando estructura para disparador veterinarios.BACKUP
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `BACKUP` AFTER DELETE ON `citas` FOR EACH ROW BEGIN
INSERT INTO log_citas_eliminadas(CITAS_ID,DUENO_ID,FECHA_ELIMINACION)
VALUES (OLD.ID,OLD.DUENO,NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador veterinarios.especie_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `especie_before_insert` BEFORE INSERT ON `especie` FOR EACH ROW BEGIN
SET NEW.NOMBRE=UPPER(NEW.NOMBRE);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador veterinarios.tg_dueno_bu_validar_correo
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tg_dueno_bu_validar_correo` BEFORE UPDATE ON `dueno` FOR EACH ROW BEGIN
IF NEW.CORREO NOT LIKE '%@%.%' THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT= 'Error: El formato del correo no es valido';
END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vista_citas`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_citas` AS SELECT dueno.NOMBRE AS "NOMBRE DEL DUEÑO",
dueno.CORREO AS "CORREO DEL DUEÑO", dueno.TELEFONO AS "TELEFONO DEL DUEÑO",
mascotas.NOMBRE AS "Nombre de la mascota", especie.NOMBRE AS "Nombre de la especie"
FROM dueno,mascotas,especie,citas
WHERE dueno.ID = citas.DUENO AND
citas.MASCOTAS =mascotas.ID AND
especie.ID = citas.ESPECIE 
;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vista_especies_dueno`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_especies_dueno` AS SELECT dueno.NOMBRE AS "Nombre del dueño", especie.NOMBRE AS "Nombre de la especie",
mascotas.NOMBRE AS "Nombre de la mascota" FROM dueno,especie,mascotas,citas
WHERE citas.DUENO=dueno.ID AND citas.ESPECIE= 4 AND citas.ESPECIE=especie.ID and citas.MASCOTAS=mascotas.ID 
;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
