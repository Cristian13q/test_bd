-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 10:27:36
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fabrica_pet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `codigo_cliente` varchar(7) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `telefono` tinyint(4) NOT NULL,
  `dirección` text NOT NULL,
  `salario` tinyint(4) NOT NULL,
  `forma_pago` text NOT NULL,
  `empleado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`codigo_cliente`, `nombre`, `telefono`, `dirección`, `salario`, `forma_pago`, `empleado`) VALUES
('468906', 'Fernando ', 127, 'Mexico 22', 19, 'Tarjeta Credito', '76854');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` varchar(5) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `telefono` int(10) NOT NULL,
  `edad` tinyint(4) NOT NULL,
  `direccion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `apellidos`, `telefono`, `edad`, `direccion`) VALUES
('76854', 'Cristian', 'Méndez Mejía', 418127978, 28, 'Guanjuato #3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricantes`
--

CREATE TABLE `fabricantes` (
  `codigo_verificación` varchar(14) NOT NULL,
  `direccion` text NOT NULL,
  `fecha_entrega` date NOT NULL,
  `experiencia_laboral` varchar(15) NOT NULL,
  `telefono` int(10) NOT NULL,
  `Materiales` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fabricantes`
--

INSERT INTO `fabricantes` (`codigo_verificación`, `direccion`, `fecha_entrega`, `experiencia_laboral`, `telefono`, `Materiales`) VALUES
('#56y768y', 'Michoacan 37', '2023-10-09', '10 años', 415677867, 'di-metil tereftalato, acido tereftalatico y petroleo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo_producto` varchar(7) NOT NULL,
  `diseño` text NOT NULL,
  `cantidad` varchar(20) NOT NULL,
  `cliente` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo_producto`, `diseño`, `cantidad`, `cliente`) VALUES
('f7y5678', 'botella torcida', '16,000', '468906');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_fabricantes`
--

CREATE TABLE `producto_fabricantes` (
  `codigo_producto` varchar(7) NOT NULL,
  `fabricantes` varchar(60) NOT NULL,
  `fecha` date NOT NULL,
  `tiempo_aproximado` varchar(20) NOT NULL,
  `costo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto_fabricantes`
--

INSERT INTO `producto_fabricantes` (`codigo_producto`, `fabricantes`, `fecha`, `tiempo_aproximado`, `costo`) VALUES
('f7y5678', '#56y768y', '2022-10-26', '1 año y 20 días ', '$300,000');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo_cliente`),
  ADD KEY `idx_empleado` (`empleado`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `fabricantes`
--
ALTER TABLE `fabricantes`
  ADD PRIMARY KEY (`codigo_verificación`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo_producto`),
  ADD KEY `idx_cliente` (`cliente`) USING BTREE;

--
-- Indices de la tabla `producto_fabricantes`
--
ALTER TABLE `producto_fabricantes`
  ADD PRIMARY KEY (`codigo_producto`,`fabricantes`),
  ADD KEY `fabricantes` (`fabricantes`) USING BTREE;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `empleado` FOREIGN KEY (`empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`codigo_cliente`);

--
-- Filtros para la tabla `producto_fabricantes`
--
ALTER TABLE `producto_fabricantes`
  ADD CONSTRAINT `codigo_producto` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`codigo_producto`),
  ADD CONSTRAINT `fabricantes` FOREIGN KEY (`fabricantes`) REFERENCES `fabricantes` (`codigo_verificación`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
