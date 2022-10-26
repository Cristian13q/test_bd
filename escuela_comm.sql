-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 07:32:51
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
-- Base de datos: `escuela_comm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `clave` varchar(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL,
  `horas_totales` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`clave`, `nombre`, `horas_semana`, `horas_totales`) VALUES
('CBD', 'Construye bases de datos', 6, 0),
('CD', 'Calculo Diferencial', 4, 0),
('CS', 'Ciencias Sociales', 4, 0),
('DAW', 'Desarrolla base de datos', 6, 0),
('F', 'Fisica', 6, 0),
('I', 'Ingles', 3, 0),
('T', 'Tutoria', 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(20) NOT NULL,
  `turno` varchar(15) NOT NULL,
  `lider_academia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('Contabilidad', 'Matutino', ''),
('Electricidad', 'Matutino', 'Cristian Omar Méndez'),
('Logistica', 'Vespertino', ''),
('Mecanica', 'Vespertino', 'Ricardo Méndez Rojas '),
('Programación', 'Mixto', 'Ricardo Méndez Mejía'),
('Recursos humanos', 'Mixto', 'Carlos Terán'),
('Soporte y mantenimie', 'Vespertino', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `num_control` varchar(14) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `edad` tinyint(4) NOT NULL,
  `domicilio` text NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `grupo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`num_control`, `nombre`, `apellidos`, `edad`, `domicilio`, `telefono`, `grupo`) VALUES
('82478675691039', 'Moises Emmanuel', 'Méndez Barrientos', 17, 'Lomabonita', '4181986756', '5PV'),
('82487898979109', 'Rey Gerardo', 'Avalos Mellado', 17, 'Guanajuato', '4181897867', '5PV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura`
--

CREATE TABLE `estudiante_asignatura` (
  `num_control` varchar(14) NOT NULL,
  `asignatura` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `semestre` tinyint(4) NOT NULL,
  `calificación` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante_asignatura`
--

INSERT INTO `estudiante_asignatura` (`num_control`, `asignatura`, `fecha`, `semestre`, `calificación`) VALUES
('82478675691039', 'CBD', '2022-09-27', 5, 10),
('82478675691039', 'DAW', '2022-09-27', 5, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(3) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `representante` varchar(30) NOT NULL,
  `tutor` varchar(30) NOT NULL,
  `carrera` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `representante`, `tutor`, `carrera`) VALUES
('1CV', 'Vespertino', 'Cabello Rodriguez', 'Tomas Turbas', 'Contabilidad'),
('1PV', 'Vespertino', 'Camila', 'Carrallo Mendiola', 'Programación'),
('5CM', 'Matutino', 'Angel Gonzale<', 'Ricardo Méndez', 'Contabilidad'),
('5CV', 'Vespertino', 'Lionel Mejía', 'Ricardo Méndez', 'Contabilidad'),
('5EM', 'Matutino', 'Luis Gonzales', 'Gabriel Barron', 'Electricidad'),
('5LV', 'Vespertino', 'Cristian Omar', 'Maria Perez', 'Logistica'),
('5MM', 'Matutino', 'Roberto Martinez', 'Elizabet Flores', 'Mecanica'),
('5PM', 'Matutino', 'Cesar Méndez', 'Ricardo Méndez', 'Programación'),
('5PV', 'Vespertino', 'Dulce Alejandra', 'Silvia Carrillo Mastache', 'Programación'),
('5RM', 'Matutino', 'Selena Guitierres', 'Aurora Andena', 'Recursos humanos'),
('5RV', 'Vespertino', 'Lorena Hernande<', 'Luis Godinez', 'Recursos humanos'),
('5SV', 'Vespertino', 'Selena Quintanilla', 'Natanael Cano', 'Soporte y mantenimie');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `estudiante` (`nombre`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `indice_grupo` (`grupo`);

--
-- Indices de la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD PRIMARY KEY (`num_control`,`asignatura`),
  ADD KEY `asignatura` (`asignatura`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `indice_carrera` (`carrera`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `grupo` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`clave`),
  ADD CONSTRAINT `num_control` FOREIGN KEY (`num_control`) REFERENCES `estudiante` (`num_control`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
