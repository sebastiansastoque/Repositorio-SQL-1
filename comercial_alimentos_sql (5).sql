-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-04-2024 a las 16:57:05
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comercial_alimentos_sql`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `cod_cargo` int(11) NOT NULL,
  `nombre_cargo` varchar(25) NOT NULL,
  `salario` decimal(10,0) NOT NULL CHECK (`salario` >= 900000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`cod_cargo`, `nombre_cargo`, `salario`) VALUES
(1, 'Administrador', 2200000),
(2, 'Vendedor', 1800000),
(3, 'Contador', 2500000),
(4, 'Facturador', 1200000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `cod_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `observaciones` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`cod_categoria`, `nombre_categoria`, `observaciones`) VALUES
(1, 'Lacteos', 'leche, yogurt y queso'),
(2, 'Panaderia', 'panes y repostería'),
(3, 'Galleteria', 'galletas saladas y dulces'),
(4, 'Golosinas', 'Chupetas, caramelos y bombones'),
(5, 'Salsas', 'salsa de tomate y aderezos'),
(6, 'Refrescos', 'Bebidas gaseosas y jugos'),
(7, 'Carnes Frías', 'Salchichas, mortadelas y jamones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `nombre1` varchar(25) NOT NULL,
  `nombre2` varchar(25) NOT NULL,
  `apellido1` varchar(25) NOT NULL,
  `apellido2` varchar(25) NOT NULL,
  `tipo_documento` enum('CC','CE','NIT','RUT') DEFAULT NULL,
  `no_documento` varchar(25) NOT NULL,
  `sexo` enum('masculino','femenini') DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `fecha_ingreso` date DEFAULT curdate(),
  `edad` int(11) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `estado_civil` enum('soltero','casado','divorciado','union libre','viudo') DEFAULT NULL,
  `tipo_cliente` enum('detallista','mayorista','empresarial') DEFAULT NULL,
  `activo` varchar(4) NOT NULL,
  `empleado_cod` int(11) NOT NULL,
  `cod_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`nombre1`, `nombre2`, `apellido1`, `apellido2`, `tipo_documento`, `no_documento`, `sexo`, `direccion`, `ciudad`, `fecha_ingreso`, `edad`, `telefono`, `estado_civil`, `tipo_cliente`, `activo`, `empleado_cod`, `cod_cliente`) VALUES
('Mario', 'Alexis', 'Aroca', 'Martínez', 'CC', '1122239857', 'masculino', 'CALLE 40 SUR #96-16', 'Bogota', '2024-03-14', 38, '3158097309', 'soltero', 'mayorista', '', 3, 1),
('Jerónimo', '', 'burgos', 'diez', 'CC', '10000459', 'masculino', 'CRA 98 # 58-90', 'Bogota', '2024-03-14', 40, '9015872', 'soltero', '', '', 3, 2),
('Estefanía', 'Tatiana', 'Villegas', 'sierra', 'CC', '1023581203', 'masculino', 'TRV 110 #81-40', 'Bogota', '2024-03-14', 32, '6047599', 'casado', 'mayorista', '', 4, 3),
('Guillermo', 'Mauricio', 'Fernandez', 'Vallejo', 'CC', '125692614', 'masculino', 'CALLE 75 #23SUR-40', 'Barranquilla', '2024-03-14', 43, '7057522', 'soltero', 'mayorista', '', 4, 4),
('Eliana', 'Marcela', 'Ramírez', 'Guerrero', 'NIT', '1222333445', '', 'Calle 181 #2-45 ', 'Barranquilla', '2024-03-14', 50, '8019053', 'viudo', 'mayorista', '', 5, 5),
('José', 'Gregorio', 'Carmona', 'Guerra', 'CC', '1091562345', 'masculino', 'Cra 3 A # 5-89', 'Barranquilla', '2024-03-14', 29, '3134409180', 'casado', 'detallista', '', 5, 6),
('Marcela', 'Eliana', 'De santis', 'Rodríguez', 'CC', '1091562348', '', 'calle 9b # 4-20', 'Cali', '2024-03-14', 35, '3108156310', 'union libre', 'mayorista', '', 6, 7),
('Daniela', '', 'Franco', 'Marulanda', 'CC', '1091562312', '', 'Carrera 56A No. 51 - 81', 'Cali', '2024-03-14', 45, '3212598228', 'union libre', 'mayorista', '', 6, 8),
('Rafael', 'Fabian', 'Cortes', 'Palacio', 'CC', '1091562336', 'masculino', 'Calle 10 No. 9 - 78 Centro', 'Medellin', '2024-03-14', 48, '7586412', 'soltero', 'mayorista', '', 7, 9),
('Camilo', 'Andres', 'Berrios', 'Bermudez', 'CC', '1091562314', 'masculino', 'Calle 24D #5676', 'Medellin', '2024-03-14', 36, '4341235', 'casado', 'mayorista', '', 7, 10),
('Francisco', 'David', 'Arias', 'Toledo', 'CC', '1091562349', 'masculino', 'calle 5b #78c 05', 'Bogota', '2024-03-14', 27, '6018954', 'casado', 'empresarial', '', 8, 11),
('Antonio', 'Giovanny', 'Merizalde', 'Arango', 'CC', '1091562103', 'masculino', 'Calle 23 #54-9', 'Barranquilla', '2024-03-14', 53, '3165846257', 'viudo', 'mayorista', '', 8, 12),
('Karen', 'Rocio', 'Restrepo', 'Acevedo', 'CC', '1091562425', '', 'cra 7a # 34-89sur', 'Barranquilla', '2024-03-14', 43, '8017936', 'viudo', 'detallista', '', 9, 13),
('David', 'Santiago', 'Lemus', 'Cock', 'NIT', '1112239564', 'masculino', 'cr 5a #20-34 sur', 'Bogota', '2024-03-14', 55, '3412658975', 'soltero', 'mayorista', '', 9, 14),
('Javier', 'Mauricio', 'Santana', 'Casadiegos', 'CC', '1233669874', 'masculino', 'CALLE 27 #58-63', 'Cali', '2024-03-14', 40, '315648301', 'casado', 'mayorista', '', 10, 15),
('Virginia', '', 'Saldarriaga', 'Salamanca', 'CC', '1556998745', '', 'cll 36 3 1-81 este', 'Medellin', '2024-03-14', 38, '4518992', 'casado', 'detallista', '', 10, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratista`
--

CREATE TABLE `contratista` (
  `cod_contratista` int(11) NOT NULL,
  `nombre1` varchar(25) NOT NULL,
  `nombre2` varchar(25) NOT NULL,
  `apellido1` varchar(25) NOT NULL,
  `apellido2` varchar(25) NOT NULL,
  `tipo_documento` enum('CC','CE','NIT','RUT') DEFAULT NULL,
  `no_documento` varchar(25) NOT NULL,
  `sexo` enum('masculino','femenino') DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `camion` enum('camioneta','furgon','camion') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contratista`
--

INSERT INTO `contratista` (`cod_contratista`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `tipo_documento`, `no_documento`, `sexo`, `direccion`, `telefono`, `camion`) VALUES
(1, 'Alberto', 'Alexis', 'Santos', 'Martínez', 'CC', '1122239867', 'masculino', 'CALLE 40 SUR #96-16', '3158097309', 'furgon'),
(2, 'Claudio', '', 'Berrio', 'Diem', 'CC', '10000457', 'masculino', 'CRA 98 # 58-90', '9015872', 'camion'),
(3, 'Sandra', 'Tatiana', 'Viloria', 'Sierra', 'CC', '1023581203', 'femenino', 'TRV 110 #81-40', '6047599', 'furgon'),
(4, 'Gustavo', 'Mauricio', 'Ferrer', 'Vallejo', 'CC', '125692614', 'masculino', 'CALLE 75 #23SUR-40', '7057522', 'camion'),
(5, 'Diana', 'Marcela', 'Ramírez', 'Guerrero', 'NIT', '1222333445', 'femenino', 'Calle 181 #2-45 ', '8019053', 'furgon'),
(6, 'José', 'Carlos', 'Calle', 'Guerra', 'CC', '1091562345', 'masculino', 'Cra 3A # 5-89', '3134409180', 'camion'),
(7, 'Marcela', 'Sofia', 'Castro', 'Rodríguez', 'CC', '1091562348', 'femenino', 'calle 9b # 4-20', '3108156310', 'furgon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despachos`
--

CREATE TABLE `despachos` (
  `cod_despacho` int(11) NOT NULL,
  `contratista_cod` int(11) NOT NULL,
  `factura_cod` int(11) NOT NULL,
  `fecha_recibo` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `valor_flete` decimal(10,0) NOT NULL DEFAULT 0,
  `entregado` varchar(1) NOT NULL,
  `observaciones` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `despachos`
--

INSERT INTO `despachos` (`cod_despacho`, `contratista_cod`, `factura_cod`, `fecha_recibo`, `fecha_entrega`, `valor_flete`, `entregado`, `observaciones`) VALUES
(1, 1, 1, '2023-08-06', '2023-08-07', 200000, 's', 'Completo'),
(2, 1, 2, '2023-08-06', '2023-08-07', 200000, 's', 'Completo'),
(3, 2, 3, '2023-08-06', '2023-08-07', 200000, 's', 'Completo'),
(4, 2, 4, '2023-08-06', '2023-08-07', 200000, 's', 'Completo'),
(5, 3, 5, '2023-08-06', '2023-08-07', 200000, 's', 'Completo'),
(6, 3, 6, '2023-08-06', '2023-08-07', 200000, 's', 'Completo'),
(7, 4, 7, '2023-08-06', '2023-08-07', 100000, 's', 'Completo'),
(8, 3, 8, '2023-08-07', '2023-08-07', 340000, 's', 'Completo'),
(9, 4, 9, '2023-08-07', '2023-08-07', 250000, 's', 'Completo'),
(10, 5, 10, '2023-08-07', '2023-08-07', 270000, 's', 'Completo'),
(11, 6, 11, '2023-08-08', '2023-08-08', 320000, 's', 'Completo'),
(12, 7, 12, '2023-08-08', '2023-08-08', 220000, 's', 'Completo'),
(13, 1, 13, '2023-08-09', '2023-08-09', 350000, 's', 'Completo'),
(14, 2, 14, '2023-08-09', '2023-08-09', 280000, 's', 'Completo'),
(15, 3, 15, '2023-08-10', '2023-08-10', 330000, 's', 'Completo'),
(16, 4, 16, '2023-08-10', '2023-08-10', 265000, 's', 'Completo'),
(17, 5, 17, '2023-08-10', '2023-08-10', 320000, 's', 'Completo'),
(18, 6, 18, '2023-08-10', '2023-08-10', 280000, 's', 'Completo'),
(19, 7, 19, '2023-08-10', '2023-08-10', 260000, 's', 'Completo'),
(20, 1, 20, '2023-08-10', '2023-08-10', 370000, 's', 'Completo'),
(21, 2, 21, '2023-08-11', '2023-08-11', 230000, 's', 'Completo'),
(22, 3, 22, '2023-08-11', '2023-08-11', 240000, 's', 'Completo'),
(23, 4, 23, '2023-08-11', '2023-08-11', 270000, 's', 'Completo'),
(24, 5, 24, '2023-08-11', '2023-08-11', 240000, 's', 'Completo'),
(25, 6, 25, '2023-08-12', '2023-08-12', 250000, 's', 'Completo'),
(26, 7, 26, '2023-08-12', '2023-08-12', 260000, 's', 'Completo'),
(27, 1, 21, '2023-08-13', '2023-08-13', 320000, 's', 'Completo'),
(28, 2, 22, '2023-08-13', '2023-08-13', 300000, 's', 'Completo'),
(29, 3, 23, '2023-08-13', '2023-08-13', 310000, 's', 'Completo'),
(30, 4, 24, '2023-08-13', '2023-08-13', 310000, 's', 'Completo'),
(31, 5, 25, '2023-08-13', '2023-08-13', 230000, 's', 'Completo'),
(32, 6, 26, '2023-08-14', '2023-08-14', 250000, 's', 'Completo'),
(33, 7, 27, '2023-08-14', '2023-08-14', 260000, 's', 'Completo'),
(34, 1, 28, '2023-08-14', '2023-08-14', 270000, 's', 'Completo'),
(35, 2, 29, '2023-08-15', '2023-08-15', 290000, 's', 'Completo'),
(36, 3, 30, '2023-08-15', '2023-08-15', 300000, 's', 'Completo'),
(37, 4, 31, '2023-08-15', '2023-08-15', 320000, 's', 'Completo'),
(38, 5, 32, '2023-08-15', '2023-08-15', 280000, 's', 'Completo'),
(39, 6, 33, '2023-08-15', '2023-08-15', 350000, 's', 'Completo'),
(40, 7, 34, '2023-08-15', '2023-08-15', 260000, 's', 'Completo'),
(41, 1, 35, '2023-08-15', '2023-08-15', 320000, 's', 'Completo'),
(42, 2, 36, '2023-08-16', '2023-08-16', 350000, 's', 'Completo'),
(43, 3, 37, '2023-08-16', '2023-08-16', 400000, 's', 'Completo'),
(44, 4, 38, '2023-08-16', '2023-08-16', 350000, 's', 'Completo'),
(45, 5, 39, '2023-08-16', '2023-08-16', 320000, 's', 'Completo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `cod_empleado` int(11) NOT NULL,
  `nombre1` varchar(25) NOT NULL,
  `nombre2` varchar(25) NOT NULL,
  `apellido1` varchar(25) NOT NULL,
  `apellido2` varchar(25) NOT NULL,
  `tipo_documento` varchar(25) NOT NULL,
  `sexo` enum('masculino','femenino') DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `edad` int(11) NOT NULL CHECK (`edad` >= 18),
  `telefono` varchar(25) NOT NULL,
  `fecha_ingreso` date DEFAULT curdate(),
  `estado_civil` enum('soltera','soltero','casada','casado','divorciada','divorciado','union libre','viuda','viudo') DEFAULT NULL,
  `cargo_cod` int(11) NOT NULL,
  `nivel_estudios` enum('primaria','bachillerato','tecnico','tecnologo','profecianal','otro') DEFAULT NULL,
  `eps` enum('saniatas','sura','capital salud','nueva eps','compenasar','famiasanar','aliansalud') DEFAULT NULL,
  `pensiones` enum('fna','porveir','colfondos','proteccion') DEFAULT NULL,
  `banco` enum('BBVA','davivienda','bancolombia','caja social','popular','las villas') DEFAULT NULL,
  `activo` varchar(4) NOT NULL DEFAULT 'A',
  `no_documento` int(11) NOT NULL,
  `cesantias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`cod_empleado`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `tipo_documento`, `sexo`, `direccion`, `ciudad`, `edad`, `telefono`, `fecha_ingreso`, `estado_civil`, `cargo_cod`, `nivel_estudios`, `eps`, `pensiones`, `banco`, `activo`, `no_documento`, `cesantias`) VALUES
(1, 'Gonzalo', '', 'Betancur', 'Arroyave', 'cc', 'masculino', 'cra 78c # 5c 48', 'bogota', 30, '3145778421', '2024-03-14', 'soltero', 1, '', '', 'colfondos', 'BBVA', 'A', 80161094, 0),
(2, 'Santiago', '', 'Betancurt', 'Lemos', 'cc', 'masculino', 'cra 71d # 7a 48', 'bogota', 32, '3202568945', '2024-03-14', 'casado', 1, 'tecnico', 'sura', 'proteccion', 'davivienda', 'A', 79843321, 0),
(3, 'Isabella', '', 'Marquez', 'Jaramillo', 'cc', 'femenino', 'CALLE 28 #58-69', 'barranquilla', 28, '3457634512', '2024-03-14', 'casada', 2, '', 'capital salud', 'colfondos', '', 'A', 52951079, 0),
(4, 'Karla', 'Maria', 'Molina', 'Lema', 'cc', 'femenino', 'cra 78c # 5c 25', 'cali', 34, '3124772431', '2024-03-14', 'soltera', 2, 'tecnico', 'nueva eps', 'proteccion', 'popular', 'A', 53456798, 0),
(5, 'Hilda', '', 'Rodriguez', 'Caro', 'cc', 'femenino', 'Av 68 # 5a _45', 'bogota', 31, '3025975960', '2024-03-14', 'soltera', 2, '', '', '', '', 'A', 1020567980, 0),
(6, 'Victoria', '', 'Hincapie', 'Vergara', 'cc', 'femenino', 'Calle 10 # 5-51', 'medellin', 22, '3103336590', '2024-03-14', 'casada', 2, '', 'sura', '', 'popular', 'A', 19654789, 0),
(7, 'Pablo', 'Santiago', 'Rojas', 'Duque', 'cc', 'masculino', 'Calle 100 # 11B-27 Bogotá', 'bogota', 25, '3456676895', '2024-03-14', 'soltero', 2, 'primaria', 'capital salud', 'colfondos', 'davivienda', 'A', 1018765324, 0),
(8, 'Pamela', '', 'Serna', 'Muñoz', 'cc', 'femenino', 'Calle 53 No 10-60/46, Pis', 'barranquilla', 40, '3225986478', '2024-03-14', 'soltera', 2, 'tecnico', 'nueva eps', '', 'BBVA', 'A', 1010654382, 0),
(9, 'Stepania', '', 'Zapata', 'Pelaez', 'cc', 'femenino', 'Carrera 21 # 17 -63', 'cali', 25, '3028912345', '2024-03-14', 'soltera', 2, '', '', '', 'davivienda', 'A', 1014343567, 0),
(10, 'Manuel', 'Andres', 'Toro', 'Sanchez', 'cc', 'masculino', 'Calle 24D #5676', 'medellin', 28, '3026598745', '2024-03-14', 'casado', 2, '', 'sura', '', 'popular', 'A', 1013567900, 0),
(11, 'Barbara', '', 'Henao', 'Cano', 'cc', 'femenino', 'CALLE 12#45-17', 'bogota', 35, '8018043009', '2024-03-14', 'soltera', 4, '', 'capital salud', 'colfondos', '', 'A', 51593856, 0),
(12, 'Leonardo', '', 'Vasquez', 'Uribe', 'cc', 'masculino', 'Av 26 No 59-51 Edificio A', 'medellin', 24, '3201452698', '2024-03-14', 'union libre', 4, 'tecnico', 'nueva eps', 'proteccion', '', 'A', 79804568, 0),
(13, 'Juliana', '', 'Castrillón', 'Florez', 'cc', 'femenino', 'Av Boyaca # 2a 71', 'cali', 32, '3412589678', '2024-03-14', 'soltera', 3, '', '', 'colfondos', 'davivienda', 'A', 1015678904, 0),
(14, 'Rocio', '', 'Muñoz', 'Gutierrez', 'cc', 'femenino', 'CR 5B #50-49A SUR', 'barranquilla', 37, '3125847512', '2024-03-14', 'soltera', 3, 'tecnico', 'sura', '', 'BBVA', 'A', 1015768903, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_cabeza`
--

CREATE TABLE `entrada_cabeza` (
  `cod_entrada` int(11) NOT NULL,
  `fecha_entrada` date NOT NULL,
  `proveedor_cod` int(11) NOT NULL,
  `empleado_cod` int(11) NOT NULL,
  `forma_pago` enum('efectivo','nequi','credito') DEFAULT NULL,
  `tipomov_cod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrada_cabeza`
--

INSERT INTO `entrada_cabeza` (`cod_entrada`, `fecha_entrada`, `proveedor_cod`, `empleado_cod`, `forma_pago`, `tipomov_cod`) VALUES
(1, '2023-08-05', 2, 1, 'efectivo', 2),
(2, '2023-08-05', 2, 1, 'efectivo', 2),
(3, '2023-08-05', 3, 1, 'efectivo', 2),
(4, '2023-08-06', 3, 1, 'efectivo', 2),
(5, '2023-08-06', 4, 1, 'efectivo', 2),
(6, '2023-08-06', 4, 1, 'efectivo', 2),
(7, '2023-08-06', 5, 1, 'efectivo', 4),
(8, '2023-08-07', 7, 1, 'efectivo', 2),
(9, '2023-08-07', 2, 1, 'efectivo', 2),
(10, '2023-08-07', 3, 1, 'efectivo', 2),
(11, '2023-08-08', 4, 1, 'efectivo', 2),
(12, '2023-08-08', 3, 1, 'efectivo', 2),
(13, '2023-08-08', 6, 1, 'efectivo', 2),
(14, '2023-08-08', 1, 1, 'efectivo', 4),
(15, '2023-08-09', 1, 1, 'efectivo', 4),
(16, '2023-08-09', 8, 1, 'efectivo', 2),
(17, '2023-08-10', 1, 1, 'efectivo', 4),
(18, '2023-08-11', 1, 1, 'efectivo', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_detalle`
--

CREATE TABLE `entrada_detalle` (
  `cod_detalle` int(11) NOT NULL,
  `entrada_cod` int(11) NOT NULL,
  `producto_cod` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor_compra` decimal(10,0) NOT NULL DEFAULT 0,
  `subtotal` decimal(10,0) GENERATED ALWAYS AS (`valor_compra` * `cantidad`) VIRTUAL,
  `cod_entrada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrada_detalle`
--

INSERT INTO `entrada_detalle` (`cod_detalle`, `entrada_cod`, `producto_cod`, `cantidad`, `valor_compra`, `cod_entrada`) VALUES
(193, 1, 1, 100, 2000, 0),
(194, 1, 2, 500, 7000, 0),
(195, 1, 3, 400, 2800, 0),
(196, 2, 1, 100, 2000, 0),
(197, 2, 2, 500, 7000, 0),
(198, 2, 3, 400, 2800, 0),
(199, 3, 4, 100, 4500, 0),
(200, 3, 5, 600, 6500, 0),
(201, 3, 8, 500, 5500, 0),
(202, 4, 4, 100, 4500, 0),
(203, 4, 5, 600, 6500, 0),
(204, 4, 8, 500, 5500, 0),
(205, 5, 10, 500, 6500, 0),
(206, 5, 4, 700, 4500, 0),
(207, 6, 8, 500, 5500, 0),
(208, 6, 5, 100, 6500, 0),
(209, 7, 2, 150, 5500, 0),
(210, 8, 11, 200, 5500, 0),
(211, 8, 12, 150, 5500, 0),
(212, 8, 13, 120, 7500, 0),
(213, 9, 14, 300, 9000, 0),
(214, 9, 15, 500, 7200, 0),
(215, 9, 16, 400, 8000, 0),
(216, 10, 17, 180, 6300, 0),
(217, 10, 18, 260, 5600, 0),
(218, 10, 19, 400, 2800, 0),
(219, 11, 23, 500, 2500, 0),
(220, 11, 24, 300, 3400, 0),
(221, 11, 25, 250, 4200, 0),
(222, 12, 3, 170, 3000, 0),
(223, 13, 26, 300, 1800, 0),
(224, 13, 27, 250, 2500, 0),
(225, 13, 28, 140, 6000, 0),
(226, 14, 14, 4, 9000, 0),
(227, 14, 15, 2, 7200, 0),
(228, 14, 16, 5, 8000, 0),
(229, 15, 12, 6, 5500, 0),
(230, 15, 13, 3, 7500, 0),
(231, 15, 14, 5, 9000, 0),
(232, 16, 8, 300, 5500, 0),
(233, 16, 9, 240, 7500, 0),
(234, 16, 10, 220, 6500, 0),
(235, 17, 5, 3, 6500, 0),
(236, 18, 10, 4, 6500, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_cabeza`
--

CREATE TABLE `factura_cabeza` (
  `cod_factura` int(11) NOT NULL,
  `fecha_factura` date NOT NULL,
  `cliente_cod` int(11) NOT NULL,
  `empleado_cod` int(11) NOT NULL,
  `forma_pago` enum('efectivo','nequi','credito') DEFAULT NULL,
  `tipomov_cod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura_cabeza`
--

INSERT INTO `factura_cabeza` (`cod_factura`, `fecha_factura`, `cliente_cod`, `empleado_cod`, `forma_pago`, `tipomov_cod`) VALUES
(1, '2023-08-05', 4, 3, 'efectivo', 1),
(2, '2023-08-05', 7, 3, 'efectivo', 1),
(3, '2023-08-05', 5, 4, 'efectivo', 1),
(4, '2023-08-06', 3, 4, 'nequi', 1),
(5, '2023-08-06', 6, 5, 'nequi', 1),
(6, '2023-08-06', 7, 3, 'nequi', 1),
(7, '2023-08-06', 7, 3, 'efectivo', 3),
(8, '2023-08-07', 8, 5, 'nequi', 1),
(9, '2023-08-07', 8, 6, 'efectivo', 1),
(10, '2023-08-08', 9, 6, 'credito', 1),
(11, '2023-08-08', 9, 7, 'credito', 1),
(12, '2023-08-08', 10, 7, 'credito', 1),
(13, '2023-08-09', 10, 8, 'credito', 1),
(14, '2023-08-09', 11, 8, 'nequi', 1),
(15, '2023-08-10', 11, 9, 'nequi', 1),
(16, '2023-08-11', 12, 9, 'efectivo', 1),
(17, '2023-08-11', 12, 10, 'efectivo', 1),
(18, '2023-08-12', 13, 10, 'efectivo', 1),
(19, '2023-08-12', 13, 5, 'credito', 1),
(20, '2023-08-13', 14, 6, 'credito', 1),
(21, '2023-08-13', 14, 4, 'nequi', 1),
(22, '2023-08-14', 15, 8, 'nequi', 1),
(23, '2023-08-15', 16, 9, 'efectivo', 3),
(24, '2023-08-15', 10, 7, 'efectivo', 3),
(25, '2023-08-16', 3, 5, 'efectivo', 3),
(26, '2023-08-16', 5, 3, 'efectivo', 3),
(27, '2023-08-17', 8, 11, 'nequi', 1),
(28, '2023-08-17', 4, 10, 'nequi', 1),
(29, '2023-08-17', 8, 7, 'efectivo', 1),
(30, '2023-08-18', 9, 4, 'credito', 1),
(31, '2023-08-18', 2, 9, 'nequi', 1),
(32, '2023-08-18', 6, 7, 'nequi', 1),
(33, '2023-08-19', 13, 3, 'efectivo', 1),
(34, '2023-08-19', 8, 8, 'credito', 1),
(35, '2023-08-20', 14, 5, 'nequi', 1),
(36, '2023-08-20', 15, 3, 'efectivo', 1),
(37, '2023-08-21', 16, 6, 'nequi', 1),
(38, '2023-08-21', 11, 8, 'efectivo', 1),
(39, '2023-08-22', 12, 6, 'credito', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina`
--

CREATE TABLE `nomina` (
  `cod_nomina` int(11) NOT NULL,
  `fecha_nomina` date NOT NULL,
  `empleado_cod` int(11) NOT NULL,
  `salario_base` decimal(10,0) NOT NULL DEFAULT 0,
  `dias_trabajados` int(11) NOT NULL,
  `salario` decimal(10,0) NOT NULL,
  `auxilio_transporte` decimal(10,0) NOT NULL DEFAULT 0,
  `nro_recargo` int(11) DEFAULT 0,
  `recargo_noche` decimal(10,0) NOT NULL,
  `comisiones_otros` decimal(10,0) NOT NULL,
  `total_vengado` decimal(10,0) NOT NULL,
  `salud` decimal(10,0) NOT NULL,
  `pension` decimal(10,0) NOT NULL,
  `prestamos_otros` decimal(10,0) NOT NULL DEFAULT 0,
  `total_deducido` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `cod_producto` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `valor_compra` decimal(10,0) NOT NULL DEFAULT 0,
  `valor_venta` decimal(10,0) NOT NULL DEFAULT 0,
  `existencia` bigint(20) NOT NULL CHECK (`existencia` >= 0),
  `nro_lote` int(11) NOT NULL,
  `fecha_fabricacion` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `categoria_cod` int(11) NOT NULL,
  `proveedor_cod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`cod_producto`, `descripcion`, `valor_compra`, `valor_venta`, `existencia`, `nro_lote`, `fecha_fabricacion`, `fecha_vencimiento`, `categoria_cod`, `proveedor_cod`) VALUES
(1, 'Galletas Festival Bsax12', 2000, 3000, 4000, 4089, '2023-04-01', '2024-04-01', 3, 2),
(2, 'Galletas Ducales taco', 7000, 8000, 5000, 4088, '2023-04-01', '2024-04-01', 3, 2),
(3, 'Bom bom bum barrax50', 3000, 3800, 3500, 4081, '2023-05-01', '2024-05-01', 4, 3),
(4, 'Pan Blanco tajado', 4500, 5500, 5500, 4080, '2023-02-01', '2024-02-01', 2, 4),
(5, 'Salsa de tomate frasco', 6500, 7500, 6000, 4084, '2023-06-01', '2024-06-01', 5, 7),
(6, 'Jugo Fresa frasco', 2500, 3500, 6500, 4086, '2023-03-01', '2024-03-01', 6, 6),
(7, 'Leche pasteurizada bsa', 4500, 5500, 7500, 4080, '2023-03-01', '2024-03-01', 1, 5),
(8, 'Ranchera', 5500, 7150, 8500, 4070, '2023-08-30', '2023-09-20', 7, 8),
(9, 'Ranchera', 7500, 9350, 9500, 4071, '2023-08-30', '2023-09-20', 7, 8),
(10, 'Ranchera', 6500, 8250, 8500, 4072, '2023-08-30', '2023-09-20', 7, 8),
(11, 'Salsa de soya frasco', 5500, 6500, 6500, 4079, '2023-08-20', '2024-09-20', 5, 7),
(12, 'Salsa mayonesa frasco', 5500, 6500, 8000, 4079, '2023-08-20', '2024-09-20', 5, 7),
(13, 'Salsa rosada frasco', 7500, 8500, 7600, 4079, '2023-08-20', '2024-09-20', 5, 7),
(14, 'Galletas Recreo bsa', 9000, 10000, 8200, 4077, '2023-08-20', '2024-08-20', 3, 2),
(15, 'Galletas Ducales taco', 7200, 8200, 9000, 4077, '2023-08-20', '2024-08-20', 3, 2),
(16, 'Galletas Saltin taco', 8000, 9000, 10000, 4077, '2023-08-20', '2024-08-20', 3, 2),
(17, 'Menta Helada Bsa', 6300, 7300, 5500, 4076, '2023-09-10', '2024-09-10', 4, 3),
(18, 'Confites Choco Bsa', 5600, 6600, 3700, 4076, '2023-09-10', '2024-09-10', 4, 3),
(19, 'Arequipe mum tarro', 2800, 3880, 4500, 4076, '2023-09-10', '2024-09-10', 4, 3),
(20, 'Queso Costeño pq', 6000, 7000, 3000, 4075, '2023-09-10', '2024-09-10', 1, 5),
(21, 'Leche Entera bsa', 8000, 9000, 5000, 4075, '2023-09-10', '2024-09-10', 1, 5),
(22, 'Yogurt Dulce tarro', 2100, 3100, 6000, 4075, '2023-09-10', '2024-09-10', 1, 5),
(23, 'Pan mogolla x 10 bsa', 2500, 3500, 5000, 4074, '2023-09-10', '2024-09-10', 2, 4),
(24, 'Ponque Bimbox5 bsa', 3400, 4400, 3500, 4074, '2023-09-10', '2024-09-10', 2, 4),
(25, 'Brownie x 5 bsa', 4200, 5200, 7000, 4074, '2023-09-10', '2024-09-10', 2, 4),
(26, 'Agua Cristal bote', 1800, 2800, 8500, 4073, '2023-09-10', '2024-09-10', 6, 6),
(27, 'Jugo Mora Frasco', 2500, 3500, 6300, 4073, '2023-09-10', '2024-09-10', 6, 6),
(28, 'Pony Malta litro', 6000, 7000, 8400, 4073, '2023-09-10', '2024-09-10', 6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `cod_proveedor` int(11) NOT NULL,
  `razon_social` varchar(50) NOT NULL,
  `tipo_documento` enum('NIT','RUT','CC') DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `e_mail` varchar(50) NOT NULL,
  `asesor_comercial` varchar(25) NOT NULL,
  `telefono_asesor` varchar(50) NOT NULL,
  `e_mail_asesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`cod_proveedor`, `razon_social`, `tipo_documento`, `direccion`, `ciudad`, `telefono`, `e_mail`, `asesor_comercial`, `telefono_asesor`, `e_mail_asesor`) VALUES
(1, 'Devolución Buena', '', 'N/A', 'BOGOTA', 'N/A', 'N/A', 'N/A', 'N/A', 0),
(2, 'GALLETAS POLLY', 'NIT', 'CRA 41B NO.9-65', 'BOGOTA', '3701266', 'servicioproveedor@pull.co', 'RODRIGO TORRES', '319423218', 0),
(3, 'DULCES SUGAR', 'NIT', 'CRA 29B No.18A-61 SUR', 'BOGOTA', '7133907', 'clientes@dulsugar.co', 'SANDRA VALBUENA', '314763218', 0),
(4, 'PAN MIMOS', 'NIT', 'CRA 31A No.10-78', 'BUCARAMANGA', '2084765', 'atencioncliente@mimos.co', 'ROCIO MORENO', '3134487965', 0),
(5, 'LACTEOS VAQUERIA', 'NIT', 'CRA 20 No.22-48', 'MEDELLIN', '76712474', 'serviciocliente@vaqueria.co', 'AMAYA', '3108156311', 0),
(6, 'BEBIDAS YAYOS', 'NIT', 'CRA 24 NO.54-32', 'BARRANQUILLA', '68856743', 'clientes@yayos.co', 'FREDY CARDENAS', '3124512107', 0),
(7, 'SALSAS PIRRY', 'NIT', 'CLL 12A No.37-122', 'CALI', '24457740', ' servicioalcliente@pirry.com', 'SONIA VIVAS', '3194321290', 0),
(8, 'Carnicos Zenu', 'NIT', 'CLL 220A No.7-122', 'BOGOTA', '24457735', ' servicioalcliente@cows.com', 'BARTIMEO RIOS', '3194321298', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomov`
--

CREATE TABLE `tipomov` (
  `cod_tipomov` int(11) NOT NULL,
  `nombre_mov` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipomov`
--

INSERT INTO `tipomov` (`cod_tipomov`, `nombre_mov`) VALUES
(1, 'Venta'),
(2, 'Compra'),
(3, 'Salida V'),
(4, 'Devolucion V');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_cargo_producto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_cargo_producto` (
`nombre_cargo` varchar(25)
,`descripcion` varchar(50)
,`valor_compra` decimal(10,0)
,`valor_venta` decimal(10,0)
,`existencia` bigint(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_categoria_producto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_categoria_producto` (
`nombre_categoria` varchar(50)
,`descripcion` varchar(50)
,`valor_compra` decimal(10,0)
,`valor_venta` decimal(10,0)
,`existencia` bigint(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_empleado_cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_empleado_cliente` (
`empleado` varchar(50)
,`cliente` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_proveedor_producto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_proveedor_producto` (
`razon_social` varchar(50)
,`ciudad` varchar(20)
,`descripcion` varchar(50)
,`valor_compra` decimal(10,0)
,`valor_venta` decimal(10,0)
,`existencia` bigint(20)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_cargo_producto`
--
DROP TABLE IF EXISTS `vista_cargo_producto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_cargo_producto`  AS SELECT `t1`.`nombre_cargo` AS `nombre_cargo`, `t2`.`descripcion` AS `descripcion`, `t2`.`valor_compra` AS `valor_compra`, `t2`.`valor_venta` AS `valor_venta`, `t2`.`existencia` AS `existencia` FROM (`cargo` `t1` join `producto` `t2`) WHERE `t1`.`cod_cargo` = `t2`.`categoria_cod` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_categoria_producto`
--
DROP TABLE IF EXISTS `vista_categoria_producto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_categoria_producto`  AS SELECT `t1`.`nombre_categoria` AS `nombre_categoria`, `t2`.`descripcion` AS `descripcion`, `t2`.`valor_compra` AS `valor_compra`, `t2`.`valor_venta` AS `valor_venta`, `t2`.`existencia` AS `existencia` FROM (`categoria` `t1` join `producto` `t2`) WHERE `t1`.`cod_categoria` = `t2`.`categoria_cod` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_empleado_cliente`
--
DROP TABLE IF EXISTS `vista_empleado_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_empleado_cliente`  AS SELECT concat(`t1`.`nombre1`,`t1`.`apellido1`) AS `empleado`, concat(`t2`.`nombre1`,`t2`.`apellido1`) AS `cliente` FROM (`empleado` `t1` join `cliente` `t2`) WHERE `t1`.`cod_empleado` = `t2`.`empleado_cod` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_proveedor_producto`
--
DROP TABLE IF EXISTS `vista_proveedor_producto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_proveedor_producto`  AS SELECT `t1`.`razon_social` AS `razon_social`, `t1`.`ciudad` AS `ciudad`, `t2`.`descripcion` AS `descripcion`, `t2`.`valor_compra` AS `valor_compra`, `t2`.`valor_venta` AS `valor_venta`, `t2`.`existencia` AS `existencia` FROM (`proveedor` `t1` join `producto` `t2`) WHERE `t1`.`cod_proveedor` = `t2`.`proveedor_cod` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`cod_cargo`),
  ADD KEY `nombre_cargo` (`nombre_cargo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cod_categoria`),
  ADD KEY `nombre_categoria` (`nombre_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`),
  ADD KEY `empleado_cod` (`empleado_cod`);

--
-- Indices de la tabla `contratista`
--
ALTER TABLE `contratista`
  ADD PRIMARY KEY (`cod_contratista`);

--
-- Indices de la tabla `despachos`
--
ALTER TABLE `despachos`
  ADD PRIMARY KEY (`cod_despacho`),
  ADD KEY `fecha_entrega` (`fecha_entrega`,`entregado`),
  ADD KEY `contratista_cod` (`contratista_cod`),
  ADD KEY `factura_cod` (`factura_cod`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`cod_empleado`),
  ADD KEY `nombre1` (`nombre1`),
  ADD KEY `cargo_cod` (`cargo_cod`);

--
-- Indices de la tabla `entrada_cabeza`
--
ALTER TABLE `entrada_cabeza`
  ADD PRIMARY KEY (`cod_entrada`),
  ADD KEY `proveedor_cod` (`proveedor_cod`),
  ADD KEY `empleado_cod` (`empleado_cod`);

--
-- Indices de la tabla `entrada_detalle`
--
ALTER TABLE `entrada_detalle`
  ADD PRIMARY KEY (`cod_detalle`),
  ADD KEY `entrada_cod` (`entrada_cod`),
  ADD KEY `producto_cod` (`producto_cod`);

--
-- Indices de la tabla `factura_cabeza`
--
ALTER TABLE `factura_cabeza`
  ADD PRIMARY KEY (`cod_factura`),
  ADD KEY `cliente_cod` (`cliente_cod`),
  ADD KEY `empleado_cod` (`empleado_cod`);

--
-- Indices de la tabla `nomina`
--
ALTER TABLE `nomina`
  ADD PRIMARY KEY (`cod_nomina`),
  ADD KEY `fecha_nomina` (`fecha_nomina`),
  ADD KEY `empleado_cod` (`empleado_cod`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`cod_producto`),
  ADD KEY `descripcion` (`descripcion`),
  ADD KEY `categoria_cod` (`categoria_cod`),
  ADD KEY `proveedor_cod` (`proveedor_cod`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`cod_proveedor`),
  ADD KEY `razon_social` (`razon_social`);

--
-- Indices de la tabla `tipomov`
--
ALTER TABLE `tipomov`
  ADD PRIMARY KEY (`cod_tipomov`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `cod_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `cod_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cod_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `contratista`
--
ALTER TABLE `contratista`
  MODIFY `cod_contratista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `despachos`
--
ALTER TABLE `despachos`
  MODIFY `cod_despacho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `cod_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `entrada_cabeza`
--
ALTER TABLE `entrada_cabeza`
  MODIFY `cod_entrada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `entrada_detalle`
--
ALTER TABLE `entrada_detalle`
  MODIFY `cod_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT de la tabla `factura_cabeza`
--
ALTER TABLE `factura_cabeza`
  MODIFY `cod_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `nomina`
--
ALTER TABLE `nomina`
  MODIFY `cod_nomina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `cod_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `cod_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipomov`
--
ALTER TABLE `tipomov`
  MODIFY `cod_tipomov` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`empleado_cod`) REFERENCES `empleado` (`cod_empleado`);

--
-- Filtros para la tabla `despachos`
--
ALTER TABLE `despachos`
  ADD CONSTRAINT `despachos_ibfk_1` FOREIGN KEY (`contratista_cod`) REFERENCES `contratista` (`cod_contratista`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `despachos_ibfk_2` FOREIGN KEY (`factura_cod`) REFERENCES `factura_cabeza` (`cod_factura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`cargo_cod`) REFERENCES `cargo` (`cod_cargo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entrada_cabeza`
--
ALTER TABLE `entrada_cabeza`
  ADD CONSTRAINT `entrada_cabeza_ibfk_1` FOREIGN KEY (`proveedor_cod`) REFERENCES `proveedor` (`cod_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entrada_cabeza_ibfk_2` FOREIGN KEY (`empleado_cod`) REFERENCES `empleado` (`cod_empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entrada_detalle`
--
ALTER TABLE `entrada_detalle`
  ADD CONSTRAINT `entrada_detalle_ibfk_1` FOREIGN KEY (`entrada_cod`) REFERENCES `entrada_cabeza` (`cod_entrada`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entrada_detalle_ibfk_2` FOREIGN KEY (`producto_cod`) REFERENCES `producto` (`cod_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura_cabeza`
--
ALTER TABLE `factura_cabeza`
  ADD CONSTRAINT `factura_cabeza_ibfk_1` FOREIGN KEY (`cliente_cod`) REFERENCES `cliente` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_cabeza_ibfk_2` FOREIGN KEY (`empleado_cod`) REFERENCES `empleado` (`cod_empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nomina`
--
ALTER TABLE `nomina`
  ADD CONSTRAINT `nomina_ibfk_1` FOREIGN KEY (`empleado_cod`) REFERENCES `empleado` (`cod_empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria_cod`) REFERENCES `categoria` (`cod_categoria`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`proveedor_cod`) REFERENCES `proveedor` (`cod_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
