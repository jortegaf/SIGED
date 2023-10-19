/*
 Navicat Premium Data Transfer

 Source Server         : Conexion
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : sistema_tramite

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 10/06/2022 22:07:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `area_cod` int NOT NULL AUTO_INCREMENT COMMENT 'Codigo auto-incrementado del movimiento del area',
  `area_nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'nombre del area',
  `area_fecha_registro` timestamp(0) NOT NULL DEFAULT current_timestamp(0) COMMENT 'fecha del registro del movimiento',
  `area_estado` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'ACTIVO' COMMENT 'estado del area',
  PRIMARY KEY (`area_cod`) USING BTREE,
  UNIQUE INDEX `unico`(`area_nombre`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci COMMENT = 'Entidad Area' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, 'MESA DE PARTES', '2021-09-24 02:26:04', 'ACTIVO');
INSERT INTO `area` VALUES (2, 'RECURSOS HUMANOS', '2021-10-01 23:35:56', 'ACTIVO');
INSERT INTO `area` VALUES (3, 'CONTABILIDAD', '2021-10-01 23:36:52', 'INACTIVO');

-- ----------------------------
-- Table structure for documento
-- ----------------------------
DROP TABLE IF EXISTS `documento`;
CREATE TABLE `documento`  (
  `documento_id` char(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `doc_dniremitente` char(8) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `doc_nombreremitente` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `doc_apepatremitente` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `doc_apematremitente` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `doc_celularremitente` char(9) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `doc_emailremitente` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `doc_direccionremitente` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `doc_representacion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `doc_ruc` char(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `doc_empresa` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipodocumento_id` int NOT NULL,
  `doc_nrodocumento` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `doc_folio` int NOT NULL,
  `doc_asunto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `doc_archivo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `doc_fecharegistro` datetime(0) NULL DEFAULT current_timestamp(0),
  `area_id` int NULL DEFAULT 1,
  `doc_estatus` enum('PENDIENTE','RECHAZADO','FINALIZADO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `area_origen` int NOT NULL DEFAULT 0,
  `area_destino` int NULL DEFAULT NULL,
  PRIMARY KEY (`documento_id`) USING BTREE,
  INDEX `tipodocumento_id`(`tipodocumento_id`) USING BTREE,
  INDEX `area_id`(`area_id`) USING BTREE,
  INDEX `area_origen`(`area_origen`) USING BTREE,
  INDEX `area_destino`(`area_destino`) USING BTREE,
  CONSTRAINT `documento_ibfk_1` FOREIGN KEY (`tipodocumento_id`) REFERENCES `tipo_documento` (`tipodocumento_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `documento_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_cod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `documento_ibfk_3` FOREIGN KEY (`area_origen`) REFERENCES `area` (`area_cod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `documento_ibfk_4` FOREIGN KEY (`area_destino`) REFERENCES `area` (`area_cod`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of documento
-- ----------------------------
INSERT INTO `documento` VALUES ('D0000001', '76216924', 'LOGUY ENRIQUE', 'TORRES', 'TORRES', '1231', 'LERT.07.04.95@GMAIL.COM', 'JR ICA 820', 'A NOMBRE PROPIO', '', '', 2, '124', 213, '4124', 'controller/tramite/documentos/ARCH8620221646.PNG', '2022-06-08 01:19:28', 1, 'FINALIZADO', 1, 1);
INSERT INTO `documento` VALUES ('D0000002', '213', '12313', '12321', '213', '12312', '123', '123', 'A NOMBRE PROPIO', '', '', 3, '1231', 123, 'ASDAS', 'controller/tramite/documentos/ARCH106202222667.PDF', '2022-06-10 22:03:47', 1, 'FINALIZADO', 2, 2);

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado`  (
  `empleado_id` int NOT NULL AUTO_INCREMENT,
  `emple_nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `emple_apepat` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `emple_apemat` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `emple_feccreacion` date NULL DEFAULT NULL,
  `emple_fechanacimiento` date NULL DEFAULT NULL,
  `emple_nrodocumento` char(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `emple_movil` char(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `emple_email` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `emple_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emple_direccion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `emple_telefono` char(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `empl_fotoperfil` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`empleado_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES (1, 'luiyi', 'rodriguez', 'torres', '2021-09-24', '2021-09-24', '76216924', '912610973', 'lert@gmail.com', 'ACTIVO', 'CHIMBOTE JR ICA', NULL, NULL);
INSERT INTO `empleado` VALUES (20, 'ASDSADASDA', 'XCXZC', 'ASDAS', '2021-10-12', '1995-04-07', '14124214', '24124124', 'ASDSADAS@GMAIL.COM', 'ACTIVO', 'ASDASASDASD', NULL, NULL);

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa`  (
  `empresa_id` int NOT NULL AUTO_INCREMENT,
  `emp_razon` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_email` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_cod` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_telefono` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_direccion` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`empresa_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of empresa
-- ----------------------------
INSERT INTO `empresa` VALUES (1, 'CODE PE', 'CODE@GMAIL.CCOM', '', '3437645', '', 'logo.JPG');

-- ----------------------------
-- Table structure for movimiento
-- ----------------------------
DROP TABLE IF EXISTS `movimiento`;
CREATE TABLE `movimiento`  (
  `movimiento_id` int NOT NULL AUTO_INCREMENT,
  `documento_id` char(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `area_origen_id` int NULL DEFAULT NULL,
  `areadestino_id` int NOT NULL,
  `mov_fecharegistro` datetime(0) NULL DEFAULT current_timestamp(0),
  `mov_descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `mov_estatus` enum('PENDIENTE','CONFORME','INCOFORME','ACEPTADO','DERIVADO','FINALIZADO','RECHAZADO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `usuario_id` int NULL DEFAULT NULL,
  `mov_archivo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `mov_descripcion_original` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`movimiento_id`) USING BTREE,
  INDEX `area_origen_id`(`area_origen_id`) USING BTREE,
  INDEX `areadestino_id`(`areadestino_id`) USING BTREE,
  INDEX `usuario_id`(`usuario_id`) USING BTREE,
  INDEX `documento_id`(`documento_id`) USING BTREE,
  CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`area_origen_id`) REFERENCES `area` (`area_cod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `movimiento_ibfk_2` FOREIGN KEY (`areadestino_id`) REFERENCES `area` (`area_cod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `movimiento_ibfk_3` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `movimiento_ibfk_4` FOREIGN KEY (`documento_id`) REFERENCES `documento` (`documento_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of movimiento
-- ----------------------------
INSERT INTO `movimiento` VALUES (1, 'D0000001', 1, 1, '2022-06-08 01:19:28', '4124', 'FINALIZADO', 33, 'controller/tramite/documentos/ARCH8620221646.PNG', NULL);
INSERT INTO `movimiento` VALUES (2, 'D0000001', 1, 1, '2022-06-08 01:20:01', '', 'FINALIZADO', 34, 'controller/tramite_area/documentos/ARCH8620221295.XLSX', NULL);
INSERT INTO `movimiento` VALUES (3, 'D0000002', 1, 2, '2022-06-10 22:03:47', 'ASDAS', 'FINALIZADO', 34, 'controller/tramite/documentos/ARCH106202222667.PDF', NULL);
INSERT INTO `movimiento` VALUES (4, 'D0000002', 2, 2, '2022-06-10 22:04:19', 'ASDA', 'FINALIZADO', 35, '', NULL);

-- ----------------------------
-- Table structure for tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento`  (
  `tipodocumento_id` int NOT NULL AUTO_INCREMENT COMMENT 'Codigo auto-incrementado del tipo documento',
  `tipodo_descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcion del  tipo documento',
  `tipodo_estado` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'estado del tipo de documento',
  `tipodo_fregistro` datetime(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`tipodocumento_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci COMMENT = 'Entidad Documento' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tipo_documento
-- ----------------------------
INSERT INTO `tipo_documento` VALUES (1, 'asdasd', 'ACTIVO', '2021-10-05 02:08:08');
INSERT INTO `tipo_documento` VALUES (2, 'CARTA', 'ACTIVO', '2021-10-08 00:49:46');
INSERT INTO `tipo_documento` VALUES (3, 'PAPELEO', 'ACTIVO', '2021-10-08 00:50:20');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `usu_id` int NOT NULL AUTO_INCREMENT,
  `usu_usuario` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT '',
  `usu_contra` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `usu_feccreacion` date NULL DEFAULT NULL,
  `usu_fecupdate` date NULL DEFAULT NULL,
  `empleado_id` int NULL DEFAULT NULL,
  `usu_observacion` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `usu_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `area_id` int NULL DEFAULT NULL,
  `usu_rol` enum('Secretario (a)','Administrador') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `empresa_id` int NULL DEFAULT 1,
  PRIMARY KEY (`usu_id`) USING BTREE,
  INDEX `empleado_id`(`empleado_id`) USING BTREE,
  INDEX `area_id`(`area_id`) USING BTREE,
  INDEX `empresa_id`(`empresa_id`) USING BTREE,
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_cod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (33, 'luiyi', '$2y$12$kkd8mirw3.lcKhjgxuQpVutuD/IH8gS.zwxQ3ZGHiu4sw1BlxmkWW', '2021-09-24', NULL, 20, NULL, 'ACTIVO', 2, 'Administrador', 1);
INSERT INTO `usuario` VALUES (34, 'CODEPE', '$2y$12$kkd8mirw3.lcKhjgxuQpVutuD/IH8gS.zwxQ3ZGHiu4sw1BlxmkWW', '2021-10-19', NULL, 1, NULL, 'ACTIVO', 1, 'Secretario (a)', 1);
INSERT INTO `usuario` VALUES (35, 'PRUEBA', '$2y$12$kkd8mirw3.lcKhjgxuQpVutuD/IH8gS.zwxQ3ZGHiu4sw1BlxmkWW', '2022-04-29', NULL, 20, NULL, 'ACTIVO', 2, 'Secretario (a)', 1);

-- ----------------------------
-- Procedure structure for SP_CARGAR_SEGUIMIENTO_TRAMITE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_CARGAR_SEGUIMIENTO_TRAMITE`;
delimiter ;;
CREATE PROCEDURE `SP_CARGAR_SEGUIMIENTO_TRAMITE`(IN NUMERO VARCHAR(12),IN DNI VARCHAR(12))
SELECT
	documento.documento_id, 
	documento.doc_dniremitente, 
	CONCAT_WS(' ',documento.doc_nombreremitente,documento.doc_apepatremitente,documento.doc_apematremitente),
	documento.doc_fecharegistro
FROM
	documento
	WHERE documento.documento_id=NUMERO and documento.doc_dniremitente=DNI
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_CARGAR_SEGUIMIENTO_TRAMITE_DETALLE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_CARGAR_SEGUIMIENTO_TRAMITE_DETALLE`;
delimiter ;;
CREATE PROCEDURE `SP_CARGAR_SEGUIMIENTO_TRAMITE_DETALLE`(IN NUMERO VARCHAR(12))
SELECT
	movimiento.movimiento_id, 
	movimiento.documento_id, 
	area.area_nombre, 
	movimiento.mov_fecharegistro, 
	movimiento.mov_descripcion, 
	movimiento.mov_estatus
FROM
	movimiento
	INNER JOIN
	area
	ON 
		movimiento.areadestino_id = area.area_cod
		where movimiento.documento_id=NUMERO
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_CARGAR_SELECT_AREA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_CARGAR_SELECT_AREA`;
delimiter ;;
CREATE PROCEDURE `SP_CARGAR_SELECT_AREA`()
SELECT
	area.area_cod, 
	area.area_nombre
FROM
	area
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_CARGAR_SELECT_EMPLEADO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_CARGAR_SELECT_EMPLEADO`;
delimiter ;;
CREATE PROCEDURE `SP_CARGAR_SELECT_EMPLEADO`()
SELECT
	empleado.empleado_id, 
	CONCAT_WS(' ',empleado.emple_nombre,empleado.emple_apepat,empleado.emple_apemat)
FROM
	empleado
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_CARGAR_SELECT_TIPO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_CARGAR_SELECT_TIPO`;
delimiter ;;
CREATE PROCEDURE `SP_CARGAR_SELECT_TIPO`()
SELECT
	tipo_documento.tipodocumento_id, 
	tipo_documento.tipodo_descripcion
FROM
	tipo_documento
	where tipo_documento.tipodo_estado='ACTIVO'
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_AREA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_AREA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_AREA`()
SELECT
	area.area_cod, 
	area.area_nombre, 
	area.area_fecha_registro, 
	area.area_estado
FROM
	area
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_EMPLEADO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_EMPLEADO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_EMPLEADO`()
SELECT
	empleado.empleado_id, 
	empleado.emple_nombre, 
	empleado.emple_apepat, 
	empleado.emple_apemat, 
	empleado.emple_fechanacimiento, 
	empleado.emple_nrodocumento, 
	empleado.emple_movil, 
	empleado.emple_email, 
	empleado.emple_estatus, 
	empleado.emple_direccion, 
	empleado.empl_fotoperfil,
	CONCAT_WS(' ',	empleado.emple_nombre,empleado.emple_apemat,empleado.emple_apemat) as em
FROM
	empleado
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_TIPO_DOCUMENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_TIPO_DOCUMENTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_TIPO_DOCUMENTO`()
SELECT
	tipo_documento.tipodocumento_id, 
	tipo_documento.tipodo_descripcion, 
	tipo_documento.tipodo_estado,
	tipo_documento.tipodo_fregistro
FROM
	tipo_documento
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_TRAMITE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_TRAMITE`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_TRAMITE`()
SELECT
	documento.documento_id, 
	documento.doc_dniremitente, 
	CONCAT_WS(' ',documento.doc_nombreremitente,documento.doc_apepatremitente,documento.doc_apematremitente) AS REMITENTE, 
	documento.tipodocumento_id, 
	tipo_documento.tipodo_descripcion, 
	documento.doc_estatus, 
	origen.area_nombre AS origen, 
	destino.area_nombre AS destino, 
	documento.doc_nrodocumento, 
	documento.doc_nombreremitente, 
	documento.doc_apepatremitente, 
	documento.doc_apematremitente, 
	documento.doc_celularremitente, 
	documento.doc_emailremitente, 
	documento.doc_direccionremitente, 
	documento.doc_representacion, 
	documento.doc_ruc, 
	documento.doc_empresa, 
	documento.doc_folio, 
	documento.doc_asunto, 
	documento.doc_fecharegistro, 
	documento.area_origen, 
	documento.area_destino
FROM
	documento
	INNER JOIN
	tipo_documento
	ON 
		documento.tipodocumento_id = tipo_documento.tipodocumento_id
	INNER JOIN
	area AS origen
	ON 
		documento.area_origen = origen.area_cod
	INNER JOIN
	area AS destino
	ON 
		documento.area_destino = destino.area_cod
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_TRAMITE_AREA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_TRAMITE_AREA`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_TRAMITE_AREA`(IN IDUSUARIO INT)
BEGIN
DECLARE IDAREA INT;
SET @IDAREA:=(select area_id from usuario where usu_id=IDUSUARIO);
SELECT
	documento.documento_id, 
	documento.doc_dniremitente, 
	CONCAT_WS(' ',documento.doc_nombreremitente,documento.doc_apepatremitente,documento.doc_apematremitente) AS REMITENTE, 
	documento.tipodocumento_id, 
	tipo_documento.tipodo_descripcion, 
	documento.doc_estatus, 
	origen.area_nombre AS origen, 
	destino.area_nombre AS destino, 
	documento.doc_nrodocumento, 
	documento.doc_nombreremitente, 
	documento.doc_apepatremitente, 
	documento.doc_apematremitente, 
	documento.doc_celularremitente, 
	documento.doc_emailremitente, 
	documento.doc_direccionremitente, 
	documento.doc_representacion, 
	documento.doc_ruc, 
	documento.doc_empresa, 
	documento.doc_folio, 
	documento.doc_asunto, 
	documento.doc_fecharegistro, 
	documento.area_origen, 
	documento.area_destino
FROM
	documento
	INNER JOIN
	tipo_documento
	ON 
		documento.tipodocumento_id = tipo_documento.tipodocumento_id
	INNER JOIN
	area AS origen
	ON 
		documento.area_origen = origen.area_cod
	INNER JOIN
	area AS destino
	ON 
		documento.area_destino = destino.area_cod
	where 	documento.area_destino=@IDAREA;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_TRAMITE_SEGUIMIENTO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_TRAMITE_SEGUIMIENTO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_TRAMITE_SEGUIMIENTO`(IN ID CHAR(11))
SELECT
	movimiento.movimiento_id, 
	movimiento.documento_id, 
	movimiento.area_origen_id, 
	area.area_nombre, 
	movimiento.mov_fecharegistro, 
	movimiento.mov_descripcion, 
	movimiento.mov_archivo
FROM
	movimiento
	INNER JOIN
	area
	ON 
		movimiento.area_origen_id = area.area_cod
		where 	movimiento.documento_id=ID
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_LISTAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_LISTAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_LISTAR_USUARIO`()
SELECT
	usuario.usu_id, 
	usuario.usu_usuario, 
	usuario.empleado_id, 
	usuario.usu_observacion, 
	usuario.usu_estatus, 
	usuario.area_id, 
	usuario.usu_rol, 
	usuario.empresa_id, 
	area.area_nombre, 
	CONCAT_WS(' ',empleado.emple_nombre,empleado.emple_apepat,empleado.emple_apemat) as nempleaddo
FROM
	usuario
	INNER JOIN
	area
	ON 
		usuario.area_id = area.area_cod
	INNER JOIN
	empleado
	ON 
		usuario.empleado_id = empleado.empleado_id
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_AREA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_AREA`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_AREA`(IN ID INT,IN NAREA VARCHAR(255),IN ESTATUS VARCHAR(20))
BEGIN
DECLARE AREAACTUAL VARCHAR(255);
DECLARE CANTIDAD INT;
SET @AREAACTUAL:=(SELECT area_nombre from area where area_cod=ID);
IF @AREAACTUAL = NAREA THEN
		UPDATE area set
		area_estado=ESTATUS,
		area_nombre=NAREA
		where area_cod=ID;
		SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) from area where area_nombre=NAREA);
	IF @CANTIDAD = 0 THEN
		UPDATE area set
		area_estado=ESTATUS,
		area_nombre=NAREA
		where area_cod=ID;
		SELECT 1;
	ELSE
		SELECT 2;
	
	END IF;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_EMPLEADO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_EMPLEADO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_EMPLEADO`(IN ID INT,IN NDOCUMENTO CHAR(12),IN NOMBRE VARCHAR(150),IN APEPAT VARCHAR(100),IN APEMAT VARCHAR(100),IN FECHA DATE,IN MOVIL CHAR(9),IN DIRECCION VARCHAR(255),IN EMAIL VARCHAR(255),IN ESTATUS VARCHAR(20))
BEGIN
DECLARE NDOCUMENTOACTUAL CHAR(12);
DECLARE CANTIDAD INT;
SET @NDOCUMENTOACTUAL:=(SELECT emple_nrodocumento from empleado where empleado_id=ID);
IF @NDOCUMENTOACTUAL = NDOCUMENTO THEN
	UPDATE empleado SET
	emple_nrodocumento=NDOCUMENTO,
	emple_nombre=NOMBRE,
	emple_apepat=APEPAT,
	emple_apemat=APEMAT,
  emple_fechanacimiento=FECHA,
	emple_movil=MOVIL,
	emple_direccion=DIRECCION,
	emple_email=EMAIL,
	emple_estatus=ESTATUS
	WHERE empleado_id=ID;
	SELECT 1;
ELSE
	SET @CANTIDAD:=(SELECT COUNT(*) FROM empleado where emple_nrodocumento=NDOCUMENTO);
	IF @CANTIDAD = 0 THEN
		UPDATE empleado SET
		emple_nrodocumento=NDOCUMENTO,
		emple_nombre=NOMBRE,
		emple_apepat=APEPAT,
		emple_apemat=APEMAT,
		emple_fechanacimiento=FECHA,
		emple_movil=MOVIL,
		emple_direccion=DIRECCION,
		emple_email=EMAIL,
		emple_estatus=ESTATUS
		WHERE empleado_id=ID;
		SELECT 1;
	ELSE
	SELECT 2;
	END IF;

END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_TIPO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_TIPO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_TIPO`(IN ID INT,IN NTIPO VARCHAR(255),IN ESTATUS VARCHAR(20))
BEGIN
DECLARE TIPOACTUAL VARCHAR(255);
DECLARE CANTIDAD INT;
SET @TIPOACTUAL:=(SELECT tipodo_descripcion  FROM tipo_documento where tipodocumento_id=ID);
IF @TIPOACTUAL = NTIPO THEN
  UPDATE tipo_documento set
	tipodo_descripcion=NTIPO,
	tipodo_estado=ESTATUS
	where tipodocumento_id=ID;
	SELECT 1;
ELSE
	SET @CANTIDAD:=(SELECT COUNT(*) FROM tipo_documento where tipodo_descripcion=NTIPO);
	IF @CANTIDAD = 0 THEN
		UPDATE tipo_documento set
		tipodo_descripcion=NTIPO,
		tipodo_estado=ESTATUS
		where tipodocumento_id=ID;
		SELECT 1;
		SELECT 1;
	ELSE
		SELECT 2;
END IF;

END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_USUARIO`(IN ID INT,IN IDEMPLEADO INT,IN IDAREA INT,IN ROL VARCHAR(25))
UPDATE usuario set
empleado_id=IDEMPLEADO,
area_id=IDAREA,
usu_rol=ROL
where usu_id=ID
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_USUARIO_CONTRA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_USUARIO_CONTRA`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_USUARIO_CONTRA`(IN ID INT,IN CONTRA VARCHAR(250))
UPDATE usuario set
usu_contra=CONTRA
where usu_id=ID
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_MODIFICAR_USUARIO_ESTATUS
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_MODIFICAR_USUARIO_ESTATUS`;
delimiter ;;
CREATE PROCEDURE `SP_MODIFICAR_USUARIO_ESTATUS`(IN ID INT,IN ESTATUS VARCHAR(20))
UPDATE usuario set
usu_estatus=ESTATUS
where usu_id=ID
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_AREA
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_AREA`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_AREA`(IN NAREA VARCHAR(255))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM area where area_nombre=NAREA);
IF @CANTIDAD = 0 THEN
	INSERT INTO area(area_nombre,area_fecha_registro)VALUES(NAREA,NOW());
	SELECT 1;
ELSE
	SELECT 2;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_EMPLEADO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_EMPLEADO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_EMPLEADO`(IN NDOCUMENTO CHAR(12),IN NOMBRE VARCHAR(150),IN APEPAT VARCHAR(100),IN APEMAT VARCHAR(100),IN FECHA DATE,IN MOVIL CHAR(9),IN DIRECCION VARCHAR(255),IN EMAIL VARCHAR(255))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM empleado where emple_nrodocumento=NDOCUMENTO);
IF @CANTIDAD = 0 THEN
	INSERT INTO empleado(emple_nrodocumento,emple_nombre,emple_apepat,emple_apemat,emple_fechanacimiento,emple_movil,emple_direccion,emple_email,emple_feccreacion,emple_estatus,empl_fotoperfil) VALUES(NDOCUMENTO,NOMBRE,APEPAT,APEMAT,FECHA,MOVIL,DIRECCION,EMAIL,CURDATE(),'ACTIVO','controller/empleado/FOTOS/admin.png');
	SELECT 1;
ELSE
SELECT 2;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_TIPO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_TIPO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_TIPO`(IN NTIPO VARCHAR(255))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM tipo_documento where tipodo_descripcion=NTIPO);
IF @CANTIDAD = 0 THEN
	INSERT INTO tipo_documento(tipodo_descripcion,tipodo_estado,tipodo_fregistro) VALUES(NTIPO,'ACTIVO',NOW());
	SELECT 1;
ELSE
	SELECT 2;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_TRAMITE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_TRAMITE`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_TRAMITE`(IN DNI CHAR(8),IN NOMBRE VARCHAR(150),IN APEPAT VARCHAR(50),IN APEMAT VARCHAR(50),IN CEL CHAR(9),IN EMAIL VARCHAR(150),IN DIRECCION VARCHAR(255),IN REPRESENTACION VARCHAR(50),IN RUC CHAR(12),IN RAZON VARCHAR(255),IN AREAPRINCIPAL INT,IN AREADESTINO INT,IN TIPO INT,IN NRODOCUMENTO VARCHAR(15),IN ASUNTO VARCHAR(255),IN RUTA  VARCHAR(255),IN FOLIO INT,IN IDUSUARIO INT)
BEGIN
DECLARE cantidad INT;
declare cod char(12);
SET @cantidad :=(SELECT count(*) FROM documento );
IF @cantidad >= 1 AND @cantidad <= 8  THEN
SET @cod :=(SELECT CONCAT('D000000',(@cantidad+1)));
ELSEIF @cantidad >=9 AND @cantidad <=98 THEN
SET @cod :=(SELECT CONCAT('D00000',(@cantidad+1)));
ELSEIF @cantidad >=99 AND @cantidad <=998 THEN
SET @cod :=(SELECT CONCAT('D0000',(@cantidad+1)));
ELSEIF @cantidad >=999 AND @cantidad <=9998 THEN
SET @cod :=(SELECT CONCAT('D000',(@cantidad+1)));
ELSEIF @cantidad >=9999 AND @cantidad <=99998 THEN
SET @cod :=(SELECT CONCAT('D00',(@cantidad+1)));
ELSEIF @cantidad >=99999 AND @cantidad <=999998 THEN
SET @cod :=(SELECT CONCAT('D0',(@cantidad+1)));
ELSEIF @cantidad >=999999 THEN
SET @cod :=(SELECT CONCAT('D',(@cantidad+1)));
ELSE
SET @cod :=(SELECT CONCAT('D0000001'));
END IF;
INSERT INTO documento(documento_id,doc_dniremitente,doc_nombreremitente,doc_apepatremitente,doc_apematremitente,doc_celularremitente,doc_emailremitente,doc_direccionremitente,doc_representacion,doc_ruc,doc_empresa,area_origen,area_destino,tipodocumento_id,doc_nrodocumento,doc_asunto,doc_archivo,doc_folio) VALUES(@cod,DNI,NOMBRE,APEPAT,APEMAT,CEL,EMAIL,DIRECCION,REPRESENTACION,RUC,RAZON,AREAPRINCIPAL,AREADESTINO,TIPO,NRODOCUMENTO,ASUNTO,RUTA,FOLIO);
SELECT @cod;
INSERT INTO movimiento(documento_id,area_origen_id,areadestino_id,mov_fecharegistro,mov_descripcion,mov_estatus,usuario_id,mov_archivo) VALUES(@cod,AREAPRINCIPAL,AREADESTINO,NOW(),ASUNTO,'PENDIENTE',IDUSUARIO,RUTA);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_TRAMITE_DERIVAR
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_TRAMITE_DERIVAR`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_TRAMITE_DERIVAR`(IN ID CHAR(15),IN ORIGEN INT,IN DESTINO INT,IN DESCRIPCION VARCHAR(255),IN IDUSUARIO INT,IN RUTA VARCHAR(255),IN TIPO VARCHAR(255))
BEGIN
DECLARE IDMOVIMENTO INT;
SET @IDMOVIMENTO:=(select movimiento_id from movimiento where mov_estatus='PENDIENTE' AND documento_id=ID);
IF TIPO = "FINALIZAR" THEN

UPDATE movimiento SET
mov_estatus='FINALIZADO'
where movimiento_id=@IDMOVIMENTO;
UPDATE documento SET
area_origen=ORIGEN,
area_destino=ORIGEN,
doc_estatus='FINALIZADO'
WHERE documento_id=ID;
INSERT INTO movimiento(documento_id,area_origen_id,areadestino_id,mov_fecharegistro,mov_descripcion,mov_estatus,usuario_id,mov_archivo) VALUES(ID,ORIGEN,ORIGEN,NOW(),DESCRIPCION,'FINALIZADO',IDUSUARIO,RUTA);

ELSE

UPDATE movimiento SET
mov_estatus='DERIVADO'
where movimiento_id=@IDMOVIMENTO;
UPDATE documento SET
area_origen=ORIGEN,
area_destino=DESTINO
WHERE documento_id=ID;
INSERT INTO movimiento(documento_id,area_origen_id,areadestino_id,mov_fecharegistro,mov_descripcion,mov_estatus,usuario_id,mov_archivo) VALUES(ID,ORIGEN,DESTINO,NOW(),DESCRIPCION,'PENDIENTE',IDUSUARIO,RUTA);

END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_REGISTRAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_REGISTRAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_REGISTRAR_USUARIO`(IN USU VARCHAR(250),IN CONTRA VARCHAR(255),IN IDEMPLEADO INT,IN IDAREA INT,IN ROL VARCHAR(25))
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM usuario where usu_usuario=USU);
IF @CANTIDAD = 0 THEN
	
	INSERT INTO usuario(usu_usuario,usu_contra,empleado_id,area_id,usu_rol,usu_feccreacion,usu_estatus,empresa_id) VALUES(USU,CONTRA,IDEMPLEADO,IDAREA,ROL,CURDATE(),'ACTIVO',1);
	SELECT 1;

ELSE

SELECT 2;
END IF;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_TRAER_WIDGET
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_TRAER_WIDGET`;
delimiter ;;
CREATE PROCEDURE `SP_TRAER_WIDGET`()
SELECT
	(select COUNT(*) FROM documento),
	(select COUNT(*) FROM documento where doc_estatus="FINALIZADO")
FROM
	documento LIMIT 1
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_VERIFICAR_USUARIO
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_VERIFICAR_USUARIO`;
delimiter ;;
CREATE PROCEDURE `SP_VERIFICAR_USUARIO`(IN USU VARCHAR(255))
SELECT
	usuario.usu_id, 
	usuario.usu_usuario, 
	usuario.usu_contra, 
	usuario.usu_feccreacion, 
	usuario.usu_fecupdate, 
	usuario.empleado_id, 
	usuario.usu_observacion, 
	usuario.usu_estatus, 
	usuario.area_id, 
	usuario.usu_rol, 
	usuario.empresa_id
FROM
	usuario
	where usuario.usu_usuario  = BINARY USU
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
