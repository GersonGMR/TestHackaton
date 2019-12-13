-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-12-2019 a las 05:27:58
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jujuDB`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cargos`
--

CREATE TABLE `Cargos` (
  `Id_Cargo` int(11) NOT NULL,
  `cargo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categorias`
--

CREATE TABLE `Categorias` (
  `Id_Categoria` int(11) NOT NULL,
  `categoria` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Denuncias`
--

CREATE TABLE `Denuncias` (
  `Id_Denuncia` int(11) NOT NULL,
  `fechaPM` date NOT NULL,
  `descripcion` varchar(240) NOT NULL,
  `ubicacion` varchar(1000) NOT NULL,
  `clasificacion` int(11) NOT NULL DEFAULT 0,
  `tags` varchar(500) NOT NULL,
  `Id_Estado` int(11) NOT NULL,
  `Id_Categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estados`
--

CREATE TABLE `Estados` (
  `Id_Estado` int(11) NOT NULL,
  `estado` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Municipios`
--

CREATE TABLE `Municipios` (
  `Id_Municipio` int(11) NOT NULL,
  `municipio` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Respuestas`
--

CREATE TABLE `Respuestas` (
  `Id_Respuesta` int(11) NOT NULL,
  `fechaR` date NOT NULL,
  `comentario` varchar(240) DEFAULT NULL,
  `Id_Denuncia` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `Id_Usuario` int(11) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `alias` varchar(30) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `fotoUser` blob NOT NULL,
  `Id_Cargo` int(11) NOT NULL,
  `Id_Municipio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Cargos`
--
ALTER TABLE `Cargos`
  ADD PRIMARY KEY (`Id_Cargo`);

--
-- Indices de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  ADD PRIMARY KEY (`Id_Categoria`);

--
-- Indices de la tabla `Denuncias`
--
ALTER TABLE `Denuncias`
  ADD PRIMARY KEY (`Id_Denuncia`),
  ADD KEY `Id_Estado` (`Id_Estado`),
  ADD KEY `Id_Categoria` (`Id_Categoria`);

--
-- Indices de la tabla `Estados`
--
ALTER TABLE `Estados`
  ADD PRIMARY KEY (`Id_Estado`);

--
-- Indices de la tabla `Municipios`
--
ALTER TABLE `Municipios`
  ADD PRIMARY KEY (`Id_Municipio`);

--
-- Indices de la tabla `Respuestas`
--
ALTER TABLE `Respuestas`
  ADD PRIMARY KEY (`Id_Respuesta`),
  ADD KEY `Id_Denuncia` (`Id_Denuncia`),
  ADD KEY `Id_Usuario` (`Id_Usuario`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD KEY `Id_Cargo` (`Id_Cargo`),
  ADD KEY `Id_Municipio` (`Id_Municipio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Cargos`
--
ALTER TABLE `Cargos`
  MODIFY `Id_Cargo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  MODIFY `Id_Categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Denuncias`
--
ALTER TABLE `Denuncias`
  MODIFY `Id_Denuncia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Estados`
--
ALTER TABLE `Estados`
  MODIFY `Id_Estado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Municipios`
--
ALTER TABLE `Municipios`
  MODIFY `Id_Municipio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Respuestas`
--
ALTER TABLE `Respuestas`
  MODIFY `Id_Respuesta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Denuncias`
--
ALTER TABLE `Denuncias`
  ADD CONSTRAINT `Denuncias_ibfk_1` FOREIGN KEY (`Id_Estado`) REFERENCES `Estados` (`Id_Estado`),
  ADD CONSTRAINT `Denuncias_ibfk_2` FOREIGN KEY (`Id_Categoria`) REFERENCES `Categorias` (`Id_Categoria`);

--
-- Filtros para la tabla `Respuestas`
--
ALTER TABLE `Respuestas`
  ADD CONSTRAINT `Respuestas_ibfk_1` FOREIGN KEY (`Id_Denuncia`) REFERENCES `Denuncias` (`Id_Denuncia`),
  ADD CONSTRAINT `Respuestas_ibfk_2` FOREIGN KEY (`Id_Usuario`) REFERENCES `Usuarios` (`Id_Usuario`);

--
-- Filtros para la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD CONSTRAINT `Usuarios_ibfk_1` FOREIGN KEY (`Id_Cargo`) REFERENCES `Cargos` (`Id_Cargo`),
  ADD CONSTRAINT `Usuarios_ibfk_2` FOREIGN KEY (`Id_Municipio`) REFERENCES `Municipios` (`Id_Municipio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
