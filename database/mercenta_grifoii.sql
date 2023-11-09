-- Active: 1696044409813@@127.0.0.1@3306@atenamtto_database
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 09-11-2023 a las 11:19:10
-- Versión del servidor: 10.6.14-MariaDB-cll-lve
-- Versión de PHP: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectosoftwareii`
--

DROP DATABASE IF EXISTS `proyectosoftwareii`;

CREATE DATABASE IF NOT EXISTS `proyectosoftwareii`;

USE `proyectosoftwareii`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `idAsistencia` bigint(20) UNSIGNED NOT NULL,
  `idEmpleado` bigint(20) UNSIGNED NOT NULL,
  `idCapacitacion` bigint(20) UNSIGNED NOT NULL,
  `idDepartamento` bigint(20) UNSIGNED NOT NULL,
  `asistio` enum('si','no','justifico') DEFAULT NULL,
  `justificacion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `asistencias`
--

INSERT INTO `asistencias` (`idAsistencia`, `idEmpleado`, `idCapacitacion`, `idDepartamento`, `asistio`, `justificacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, 1, NULL, NULL, '2023-11-08 21:14:40', '2023-11-08 21:14:40', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitacions`
--

CREATE TABLE `capacitacions` (
  `idCapacitacion` bigint(20) UNSIGNED NOT NULL,
  `capfechainicio` varchar(255) NOT NULL,
  `capfechafin` varchar(255) NOT NULL,
  `capcapacitador` varchar(255) NOT NULL,
  `idDepartamento` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `capacitacions`
--

INSERT INTO `capacitacions` (`idCapacitacion`, `capfechainicio`, `capfechafin`, `capcapacitador`, `idDepartamento`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2023-11-09', '2023-11-10', 'Desarrollo de análisis de control de peligros', 6, '2023-11-08 21:09:25', '2023-11-08 21:09:25', NULL),
(2, '2023-11-08', '2023-11-08', 'control de riesgo en estafas', 4, '2023-11-08 21:12:33', '2023-11-08 21:12:33', NULL),
(3, '2023-11-07', '2023-11-07', 'Medidas de reacción durante un accidente', 1, '2023-11-08 21:14:40', '2023-11-08 21:14:40', NULL),
(4, '2023-11-15', '2023-11-16', 'Control de actividades en seguridad financiera', 3, '2023-11-08 21:22:41', '2023-11-08 21:22:41', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idOrdencompra` bigint(20) UNSIGNED NOT NULL,
  `orcomfecha` varchar(255) NOT NULL,
  `orcomhora` varchar(255) NOT NULL,
  `orcomdescripcion` varchar(255) DEFAULT NULL,
  `orcomtotal` varchar(255) NOT NULL,
  `orcomestado` varchar(255) NOT NULL,
  `idTipocomprobante` bigint(20) UNSIGNED NOT NULL,
  `idTipopago` bigint(20) UNSIGNED NOT NULL,
  `idProveedor` bigint(20) UNSIGNED NOT NULL,
  `idEmpleado` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idOrdencompra`, `orcomfecha`, `orcomhora`, `orcomdescripcion`, `orcomtotal`, `orcomestado`, `idTipocomprobante`, `idTipopago`, `idProveedor`, `idEmpleado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2023-11-02', '09:20', 'sdfdsafs', '101.00', 'pagado', 1, 1, 1, 1, '2023-11-08 19:19:33', '2023-11-08 19:19:33', NULL),
(2, '2023-10-08', '10:20', NULL, '50.50', 'pagado', 2, 1, 1, 1, '2023-11-08 20:43:52', '2023-11-08 20:43:52', NULL),
(3, '2023-09-11', '09:44', NULL, '101.00', 'pagado', 5, 2, 2, 1, '2023-11-08 20:51:17', '2023-11-08 20:51:17', NULL),
(4, '2023-10-16', '16:15', NULL, '202.00', 'pagado', 6, 2, 2, 3, '2023-11-09 02:10:18', '2023-11-09 02:10:18', NULL),
(5, '2023-10-25', '21:34', NULL, '151.50', 'pagado', 2, 1, 1, 3, '2023-11-09 02:10:57', '2023-11-09 02:10:57', NULL),
(6, '2023-10-21', '10:13', NULL, '101.00', 'pagado', 6, 3, 1, 3, '2023-11-09 02:11:50', '2023-11-09 02:11:50', NULL),
(7, '2023-09-03', '15:53', NULL, '252.50', 'pagado', 5, 2, 1, 3, '2023-11-09 02:12:33', '2023-11-09 02:12:33', NULL),
(8, '2023-10-29', '19:12', NULL, '303.00', 'pagado', 2, 1, 2, 3, '2023-11-09 02:13:30', '2023-11-09 02:13:30', NULL),
(9, '2023-09-12', '17:16', NULL, '505.00', 'pagado', 6, 4, 2, 3, '2023-11-09 02:14:30', '2023-11-09 02:14:30', NULL),
(10, '2023-09-30', '18:14', NULL, '1363.50', 'pagado', 2, 4, 2, 3, '2023-11-09 02:15:39', '2023-11-09 02:15:39', NULL),
(11, '2023-10-18', '11:29', NULL, '454.50', 'pagado', 5, 2, 2, 3, '2023-11-09 03:25:45', '2023-11-09 03:25:45', NULL),
(12, '2023-09-13', '01:32', NULL, '404.00', 'pagado', 6, 4, 1, 3, '2023-11-09 03:27:11', '2023-11-09 03:27:11', NULL),
(13, '2023-08-30', '17:16', NULL, '151.50', 'pagado', 5, 5, 1, 1, '2023-11-09 03:34:06', '2023-11-09 03:34:06', NULL),
(14, '2023-09-25', '02:38', NULL, '303.00', 'pagado', 1, 1, 1, 1, '2023-11-09 03:35:27', '2023-11-09 03:35:27', NULL),
(15, '2023-11-03', '06:43', NULL, '505.00', 'pagado', 5, 2, 2, 1, '2023-11-09 03:38:06', '2023-11-09 03:38:06', NULL),
(16, '2023-10-06', '19:53', NULL, '454.50', 'pagado', 2, 1, 1, 1, '2023-11-09 03:51:43', '2023-11-09 03:51:43', NULL),
(17, '2023-10-05', '03:53', NULL, '252.50', 'pagado', 5, 2, 2, 1, '2023-11-09 03:52:39', '2023-11-09 03:52:39', NULL),
(18, '2023-10-01', '11:03', NULL, '252.50', 'pagado', 1, 4, 2, 1, '2023-11-09 03:54:00', '2023-11-09 03:54:00', NULL),
(19, '2023-10-15', '15:05', NULL, '101.00', 'pagado', 2, 1, 1, 1, '2023-11-09 04:03:04', '2023-11-09 04:03:04', NULL),
(20, '2023-11-05', '20:09', NULL, '252.50', 'pagado', 2, 2, 2, 1, '2023-11-09 04:03:48', '2023-11-09 04:03:48', NULL),
(21, '2023-10-21', '08:06', NULL, '303.00', 'pagado', 5, 5, 1, 1, '2023-11-09 04:04:21', '2023-11-09 04:04:21', NULL),
(22, '2023-10-09', '09:05', NULL, '151.50', 'pagado', 6, 4, 2, 1, '2023-11-09 04:04:57', '2023-11-09 04:04:57', NULL),
(23, '2023-10-30', '14:01', NULL, '353.50', 'pagado', 5, 2, 1, 1, '2023-11-09 04:05:43', '2023-11-09 04:05:43', NULL),
(24, '2023-09-24', '18:11', NULL, '404.00', 'pagado', 2, 1, 2, 1, '2023-11-09 04:06:13', '2023-11-09 04:06:13', NULL),
(25, '2023-11-02', '20:06', NULL, '202.00', 'pagado', 2, 1, 1, 1, '2023-11-09 04:06:47', '2023-11-09 04:06:47', NULL),
(26, '2023-10-02', '21:10', NULL, '505.00', 'pagado', 2, 1, 2, 1, '2023-11-09 04:07:23', '2023-11-09 04:07:23', NULL),
(27, '2023-10-19', '21:11', NULL, '252.50', 'pagado', 5, 2, 1, 1, '2023-11-09 04:08:07', '2023-11-09 04:08:07', NULL),
(28, '2023-10-29', '13:57', NULL, '151.50', 'pagado', 2, 1, 2, 1, '2023-11-09 04:08:33', '2023-11-09 04:08:33', NULL),
(29, '2023-10-31', '14:14', NULL, '252.50', 'pagado', 2, 5, 1, 1, '2023-11-09 04:09:11', '2023-11-09 04:09:11', NULL),
(30, '2023-09-17', '16:52', NULL, '252.50', 'pagado', 1, 1, 2, 1, '2023-11-09 04:09:54', '2023-11-09 04:09:54', NULL),
(31, '2023-11-03', '20:49', NULL, '252.50', 'pagado', 1, 1, 1, 1, '2023-11-09 04:49:31', '2023-11-09 04:49:31', NULL),
(32, '2023-10-14', '18:55', NULL, '151.50', 'pagado', 5, 4, 2, 1, '2023-11-09 04:50:03', '2023-11-09 04:50:03', NULL),
(33, '2023-09-11', '12:41', NULL, '202.00', 'pagado', 1, 2, 2, 1, '2023-11-09 04:52:32', '2023-11-09 04:52:32', NULL),
(34, '2023-09-19', '07:58', NULL, '303.00', 'pagado', 2, 1, 2, 1, '2023-11-09 04:56:05', '2023-11-09 04:56:05', NULL),
(35, '2023-09-21', '10:02', NULL, '151.50', 'pagado', 6, 4, 2, 1, '2023-11-09 04:57:43', '2023-11-09 04:57:43', NULL),
(36, '2023-09-26', '10:00', NULL, '202.00', 'pagado', 5, 2, 1, 1, '2023-11-09 04:58:50', '2023-11-09 04:58:50', NULL),
(37, '2023-09-05', '09:05', NULL, '404.00', 'pagado', 1, 1, 2, 1, '2023-11-09 04:59:27', '2023-11-09 04:59:27', NULL),
(38, '2023-10-03', '14:04', NULL, '303.00', 'pagado', 2, 5, 1, 1, '2023-11-09 05:00:22', '2023-11-09 05:00:22', NULL),
(39, '2023-10-06', '13:02', NULL, '252.50', 'pagado', 2, 4, 2, 1, '2023-11-09 05:00:56', '2023-11-09 05:00:56', NULL),
(40, '2023-10-17', '15:13', NULL, '151.50', 'pagado', 1, 2, 1, 1, '2023-11-09 05:01:38', '2023-11-09 05:01:38', NULL),
(41, '2023-09-14', '16:07', NULL, '303.00', 'pagado', 2, 1, 2, 1, '2023-11-09 05:02:15', '2023-11-09 05:02:15', NULL),
(42, '2023-10-29', '14:30', NULL, '202.00', 'pagado', 5, 4, 2, 1, '2023-11-09 05:02:51', '2023-11-09 05:02:51', NULL),
(43, '2023-10-20', '14:18', NULL, '252.50', 'pagado', 6, 4, 1, 1, '2023-11-09 05:03:24', '2023-11-09 05:03:24', NULL),
(44, '2023-11-04', '15:06', NULL, '151.50', 'pagado', 3, 3, 1, 1, '2023-11-09 05:04:00', '2023-11-09 05:04:00', NULL),
(45, '2023-09-27', '16:10', NULL, '252.50', 'pagado', 2, 1, 1, 1, '2023-11-09 05:04:31', '2023-11-09 05:04:31', NULL),
(46, '2023-10-11', '11:11', NULL, '353.50', 'pagado', 1, 4, 2, 1, '2023-11-09 05:05:25', '2023-11-09 05:05:25', NULL),
(47, '2023-10-18', '14:09', NULL, '202.00', 'pagado', 2, 1, 1, 1, '2023-11-09 05:05:53', '2023-11-09 05:05:53', NULL),
(48, '2023-10-25', '10:49', NULL, '404.00', 'pagado', 5, 2, 2, 1, '2023-11-09 05:06:20', '2023-11-09 05:06:20', NULL),
(49, '2023-09-28', '19:09', NULL, '151.50', 'pagado', 2, 5, 2, 1, '2023-11-09 05:06:47', '2023-11-09 05:06:47', NULL),
(50, '2023-10-27', '13:12', NULL, '303.00', 'pagado', 6, 5, 2, 1, '2023-11-09 05:07:23', '2023-11-09 05:07:23', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_detalles`
--

CREATE TABLE `compra_detalles` (
  `idDetallecompra` bigint(20) UNSIGNED NOT NULL,
  `idOrdencompra` bigint(20) UNSIGNED NOT NULL,
  `idProducto` bigint(20) UNSIGNED NOT NULL,
  `dcomcantidad` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compra_detalles`
--

INSERT INTO `compra_detalles` (`idDetallecompra`, `idOrdencompra`, `idProducto`, `dcomcantidad`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, '1', '2023-11-08 19:19:33', '2023-11-08 19:19:33', NULL),
(2, 1, 5, '1', '2023-11-08 19:19:33', '2023-11-08 19:19:33', NULL),
(3, 2, 2, '1', '2023-11-08 20:43:52', '2023-11-08 20:43:52', NULL),
(4, 3, 8, '2', '2023-11-08 20:51:17', '2023-11-08 20:51:17', NULL),
(5, 4, 5, '4', '2023-11-09 02:10:18', '2023-11-09 02:10:18', NULL),
(6, 5, 11, '3', '2023-11-09 02:10:57', '2023-11-09 02:10:57', NULL),
(7, 6, 12, '2', '2023-11-09 02:11:50', '2023-11-09 02:11:50', NULL),
(8, 7, 2, '5', '2023-11-09 02:12:33', '2023-11-09 02:12:33', NULL),
(9, 8, 6, '4', '2023-11-09 02:13:30', '2023-11-09 02:13:30', NULL),
(10, 8, 4, '2', '2023-11-09 02:13:30', '2023-11-09 02:13:30', NULL),
(11, 9, 9, '5', '2023-11-09 02:14:30', '2023-11-09 02:14:30', NULL),
(12, 9, 4, '2', '2023-11-09 02:14:30', '2023-11-09 02:14:30', NULL),
(13, 9, 1, '3', '2023-11-09 02:14:30', '2023-11-09 02:14:30', NULL),
(14, 10, 11, '10', '2023-11-09 02:15:39', '2023-11-09 02:15:39', NULL),
(15, 10, 1, '9', '2023-11-09 02:15:39', '2023-11-09 02:15:39', NULL),
(16, 10, 7, '8', '2023-11-09 02:15:39', '2023-11-09 02:15:39', NULL),
(17, 11, 11, '6', '2023-11-09 03:25:45', '2023-11-09 03:25:45', NULL),
(18, 11, 12, '3', '2023-11-09 03:25:45', '2023-11-09 03:25:45', NULL),
(19, 12, 1, '4', '2023-11-09 03:27:11', '2023-11-09 03:27:11', NULL),
(20, 12, 3, '4', '2023-11-09 03:27:11', '2023-11-09 03:27:11', NULL),
(21, 13, 9, '3', '2023-11-09 03:34:07', '2023-11-09 03:34:07', NULL),
(22, 14, 9, '3', '2023-11-09 03:35:27', '2023-11-09 03:35:27', NULL),
(23, 14, 10, '3', '2023-11-09 03:35:27', '2023-11-09 03:35:27', NULL),
(24, 15, 6, '8', '2023-11-09 03:38:06', '2023-11-09 03:38:06', NULL),
(25, 15, 10, '2', '2023-11-09 03:38:06', '2023-11-09 03:38:06', NULL),
(26, 16, 7, '9', '2023-11-09 03:51:43', '2023-11-09 03:51:43', NULL),
(27, 17, 1, '2', '2023-11-09 03:52:39', '2023-11-09 03:52:39', NULL),
(28, 17, 10, '3', '2023-11-09 03:52:39', '2023-11-09 03:52:39', NULL),
(29, 18, 11, '5', '2023-11-09 03:54:00', '2023-11-09 03:54:00', NULL),
(30, 19, 6, '2', '2023-11-09 04:03:04', '2023-11-09 04:03:04', NULL),
(31, 20, 4, '2', '2023-11-09 04:03:48', '2023-11-09 04:03:48', NULL),
(32, 20, 5, '2', '2023-11-09 04:03:48', '2023-11-09 04:03:48', NULL),
(33, 20, 2, '1', '2023-11-09 04:03:48', '2023-11-09 04:03:48', NULL),
(34, 21, 3, '6', '2023-11-09 04:04:21', '2023-11-09 04:04:21', NULL),
(35, 22, 1, '3', '2023-11-09 04:04:57', '2023-11-09 04:04:57', NULL),
(36, 23, 10, '7', '2023-11-09 04:05:43', '2023-11-09 04:05:43', NULL),
(37, 24, 3, '8', '2023-11-09 04:06:13', '2023-11-09 04:06:13', NULL),
(38, 25, 2, '3', '2023-11-09 04:06:47', '2023-11-09 04:06:47', NULL),
(39, 25, 3, '1', '2023-11-09 04:06:47', '2023-11-09 04:06:47', NULL),
(40, 26, 7, '10', '2023-11-09 04:07:23', '2023-11-09 04:07:23', NULL),
(41, 27, 10, '5', '2023-11-09 04:08:07', '2023-11-09 04:08:07', NULL),
(42, 28, 8, '3', '2023-11-09 04:08:33', '2023-11-09 04:08:33', NULL),
(43, 29, 2, '5', '2023-11-09 04:09:11', '2023-11-09 04:09:11', NULL),
(44, 30, 1, '5', '2023-11-09 04:09:54', '2023-11-09 04:09:54', NULL),
(45, 31, 9, '5', '2023-11-09 04:49:31', '2023-11-09 04:49:31', NULL),
(46, 32, 3, '3', '2023-11-09 04:50:03', '2023-11-09 04:50:03', NULL),
(47, 33, 4, '4', '2023-11-09 04:52:32', '2023-11-09 04:52:32', NULL),
(48, 34, 10, '6', '2023-11-09 04:56:05', '2023-11-09 04:56:05', NULL),
(49, 35, 2, '3', '2023-11-09 04:57:43', '2023-11-09 04:57:43', NULL),
(50, 36, 10, '4', '2023-11-09 04:58:50', '2023-11-09 04:58:50', NULL),
(51, 37, 8, '8', '2023-11-09 04:59:27', '2023-11-09 04:59:27', NULL),
(52, 38, 7, '6', '2023-11-09 05:00:22', '2023-11-09 05:00:22', NULL),
(53, 39, 5, '5', '2023-11-09 05:00:56', '2023-11-09 05:00:56', NULL),
(54, 40, 1, '3', '2023-11-09 05:01:38', '2023-11-09 05:01:38', NULL),
(55, 41, 9, '6', '2023-11-09 05:02:15', '2023-11-09 05:02:15', NULL),
(56, 42, 11, '4', '2023-11-09 05:02:51', '2023-11-09 05:02:51', NULL),
(57, 43, 3, '5', '2023-11-09 05:03:24', '2023-11-09 05:03:24', NULL),
(58, 44, 8, '3', '2023-11-09 05:04:00', '2023-11-09 05:04:00', NULL),
(59, 45, 3, '5', '2023-11-09 05:04:31', '2023-11-09 05:04:31', NULL),
(60, 46, 7, '7', '2023-11-09 05:05:25', '2023-11-09 05:05:25', NULL),
(61, 47, 3, '4', '2023-11-09 05:05:53', '2023-11-09 05:05:53', NULL),
(62, 48, 8, '8', '2023-11-09 05:06:20', '2023-11-09 05:06:20', NULL),
(63, 49, 1, '3', '2023-11-09 05:06:47', '2023-11-09 05:06:47', NULL),
(64, 50, 2, '6', '2023-11-09 05:07:23', '2023-11-09 05:07:23', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `idDepartamento` bigint(20) UNSIGNED NOT NULL,
  `depnombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`idDepartamento`, `depnombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Abastecimiento', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(2, 'Compras', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(3, 'Finanzas', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(4, 'Ventas', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(5, 'Adminstrar', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(6, 'Seguridad', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `idDocumento` bigint(20) UNSIGNED NOT NULL,
  `idTipoDocumento` bigint(20) UNSIGNED NOT NULL,
  `docnumero` varchar(255) NOT NULL,
  `docmonto` double NOT NULL,
  `docsimbolo` varchar(1) NOT NULL,
  `documentable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `documentable_type` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`idDocumento`, `idTipoDocumento`, `docnumero`, `docmonto`, `docsimbolo`, `documentable_id`, `documentable_type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, '2', 45.55, '+', 2, 'App\\Models\\Venta', NULL, '2023-11-08 19:14:06', '2023-11-08 19:14:06'),
(2, 1, '1', 101, '-', 1, 'App\\Models\\Compra', NULL, '2023-11-08 19:19:33', '2023-11-08 19:19:33'),
(3, 1, '2', 50.5, '-', 2, 'App\\Models\\Compra', NULL, '2023-11-08 20:43:52', '2023-11-08 20:43:52'),
(4, 2, '3', 42.01, '+', 3, 'App\\Models\\Venta', NULL, '2023-11-08 20:49:57', '2023-11-08 20:49:57'),
(5, 1, '3', 101, '-', 3, 'App\\Models\\Compra', NULL, '2023-11-08 20:51:17', '2023-11-08 20:51:17'),
(6, 2, '4', 233.64, '+', 4, 'App\\Models\\Venta', NULL, '2023-11-09 01:20:55', '2023-11-09 01:20:55'),
(7, 2, '5', 566.4, '+', 5, 'App\\Models\\Venta', NULL, '2023-11-09 01:32:05', '2023-11-09 01:32:05'),
(8, 2, '6', 252.05, '+', 6, 'App\\Models\\Venta', NULL, '2023-11-09 01:33:40', '2023-11-09 01:33:40'),
(9, 2, '7', 280.37, '+', 7, 'App\\Models\\Venta', NULL, '2023-11-09 01:37:05', '2023-11-09 01:37:05'),
(10, 2, '8', 63.01, '+', 8, 'App\\Models\\Venta', NULL, '2023-11-09 01:37:40', '2023-11-09 01:37:40'),
(11, 2, '9', 59, '+', 9, 'App\\Models\\Venta', NULL, '2023-11-09 01:38:16', '2023-11-09 01:38:16'),
(12, 2, '10', 94.4, '+', 10, 'App\\Models\\Venta', NULL, '2023-11-09 01:39:05', '2023-11-09 01:39:05'),
(13, 2, '11', 186.91, '+', 11, 'App\\Models\\Venta', NULL, '2023-11-09 01:40:12', '2023-11-09 01:40:12'),
(14, 2, '12', 126.02, '+', 12, 'App\\Models\\Venta', NULL, '2023-11-09 01:41:06', '2023-11-09 01:41:06'),
(15, 2, '13', 163.55, '+', 13, 'App\\Models\\Venta', NULL, '2023-11-09 01:43:11', '2023-11-09 01:43:11'),
(16, 2, '14', 231.04, '+', 14, 'App\\Models\\Venta', NULL, '2023-11-09 01:43:44', '2023-11-09 01:43:44'),
(17, 2, '15', 147.5, '+', 15, 'App\\Models\\Venta', NULL, '2023-11-09 01:44:14', '2023-11-09 01:44:14'),
(18, 1, '4', 202, '-', 4, 'App\\Models\\Compra', NULL, '2023-11-09 02:10:18', '2023-11-09 02:10:18'),
(19, 1, '5', 151.5, '-', 5, 'App\\Models\\Compra', NULL, '2023-11-09 02:10:57', '2023-11-09 02:10:57'),
(20, 1, '6', 101, '-', 6, 'App\\Models\\Compra', NULL, '2023-11-09 02:11:50', '2023-11-09 02:11:50'),
(21, 1, '7', 252.5, '-', 7, 'App\\Models\\Compra', NULL, '2023-11-09 02:12:33', '2023-11-09 02:12:33'),
(22, 1, '8', 303, '-', 8, 'App\\Models\\Compra', NULL, '2023-11-09 02:13:30', '2023-11-09 02:13:30'),
(23, 1, '9', 505, '-', 9, 'App\\Models\\Compra', NULL, '2023-11-09 02:14:30', '2023-11-09 02:14:30'),
(24, 1, '10', 1363.5, '-', 10, 'App\\Models\\Compra', NULL, '2023-11-09 02:15:39', '2023-11-09 02:15:39'),
(25, 1, '11', 454.5, '-', 11, 'App\\Models\\Compra', NULL, '2023-11-09 03:25:45', '2023-11-09 03:25:45'),
(26, 1, '12', 404, '-', 12, 'App\\Models\\Compra', NULL, '2023-11-09 03:27:11', '2023-11-09 03:27:11'),
(27, 1, '13', 151.5, '-', 13, 'App\\Models\\Compra', NULL, '2023-11-09 03:34:07', '2023-11-09 03:34:07'),
(28, 1, '14', 303, '-', 14, 'App\\Models\\Compra', NULL, '2023-11-09 03:35:27', '2023-11-09 03:35:27'),
(29, 2, '16', 93.46, '+', 16, 'App\\Models\\Venta', NULL, '2023-11-09 03:38:01', '2023-11-09 03:38:01'),
(30, 1, '15', 505, '-', 15, 'App\\Models\\Compra', NULL, '2023-11-09 03:38:06', '2023-11-09 03:38:06'),
(31, 2, '17', 294.53, '+', 17, 'App\\Models\\Venta', NULL, '2023-11-09 03:38:50', '2023-11-09 03:38:50'),
(32, 2, '18', 283.2, '+', 18, 'App\\Models\\Venta', NULL, '2023-11-09 03:39:53', '2023-11-09 03:39:53'),
(33, 2, '19', 212.4, '+', 19, 'App\\Models\\Venta', NULL, '2023-11-09 03:40:31', '2023-11-09 03:40:31'),
(34, 2, '20', 105.02, '+', 20, 'App\\Models\\Venta', NULL, '2023-11-09 03:41:23', '2023-11-09 03:41:23'),
(35, 2, '21', 265.5, '+', 21, 'App\\Models\\Venta', NULL, '2023-11-09 03:41:59', '2023-11-09 03:41:59'),
(36, 2, '22', 188.8, '+', 22, 'App\\Models\\Venta', NULL, '2023-11-09 03:42:34', '2023-11-09 03:42:34'),
(37, 2, '23', 236, '+', 23, 'App\\Models\\Venta', NULL, '2023-11-09 03:43:19', '2023-11-09 03:43:19'),
(38, 2, '24', 252.05, '+', 24, 'App\\Models\\Venta', NULL, '2023-11-09 03:43:53', '2023-11-09 03:43:53'),
(39, 2, '25', 252.05, '+', 25, 'App\\Models\\Venta', NULL, '2023-11-09 03:48:17', '2023-11-09 03:48:17'),
(40, 2, '26', 318.6, '+', 26, 'App\\Models\\Venta', NULL, '2023-11-09 03:50:38', '2023-11-09 03:50:38'),
(41, 2, '27', 177, '+', 27, 'App\\Models\\Venta', NULL, '2023-11-09 03:51:36', '2023-11-09 03:51:36'),
(42, 1, '16', 454.5, '-', 16, 'App\\Models\\Compra', NULL, '2023-11-09 03:51:43', '2023-11-09 03:51:43'),
(43, 1, '17', 252.5, '-', 17, 'App\\Models\\Compra', NULL, '2023-11-09 03:52:39', '2023-11-09 03:52:39'),
(44, 2, '28', 186.91, '+', 28, 'App\\Models\\Venta', NULL, '2023-11-09 03:53:49', '2023-11-09 03:53:49'),
(45, 1, '18', 252.5, '-', 18, 'App\\Models\\Compra', NULL, '2023-11-09 03:54:00', '2023-11-09 03:54:00'),
(46, 2, '29', 70.8, '+', 29, 'App\\Models\\Venta', NULL, '2023-11-09 03:54:25', '2023-11-09 03:54:25'),
(47, 2, '30', 84.02, '+', 30, 'App\\Models\\Venta', NULL, '2023-11-09 03:57:30', '2023-11-09 03:57:30'),
(48, 1, '19', 101, '-', 19, 'App\\Models\\Compra', NULL, '2023-11-09 04:03:04', '2023-11-09 04:03:04'),
(49, 1, '20', 252.5, '-', 20, 'App\\Models\\Compra', NULL, '2023-11-09 04:03:48', '2023-11-09 04:03:48'),
(50, 1, '21', 303, '-', 21, 'App\\Models\\Compra', NULL, '2023-11-09 04:04:21', '2023-11-09 04:04:21'),
(51, 1, '22', 151.5, '-', 22, 'App\\Models\\Compra', NULL, '2023-11-09 04:04:57', '2023-11-09 04:04:57'),
(52, 1, '23', 353.5, '-', 23, 'App\\Models\\Compra', NULL, '2023-11-09 04:05:43', '2023-11-09 04:05:43'),
(53, 1, '24', 404, '-', 24, 'App\\Models\\Compra', NULL, '2023-11-09 04:06:13', '2023-11-09 04:06:13'),
(54, 1, '25', 202, '-', 25, 'App\\Models\\Compra', NULL, '2023-11-09 04:06:47', '2023-11-09 04:06:47'),
(55, 1, '26', 505, '-', 26, 'App\\Models\\Compra', NULL, '2023-11-09 04:07:23', '2023-11-09 04:07:23'),
(56, 1, '27', 252.5, '-', 27, 'App\\Models\\Compra', NULL, '2023-11-09 04:08:07', '2023-11-09 04:08:07'),
(57, 2, '31', 252.05, '+', 31, 'App\\Models\\Venta', NULL, '2023-11-09 04:08:22', '2023-11-09 04:08:22'),
(58, 1, '28', 151.5, '-', 28, 'App\\Models\\Compra', NULL, '2023-11-09 04:08:33', '2023-11-09 04:08:33'),
(59, 1, '29', 252.5, '-', 29, 'App\\Models\\Compra', NULL, '2023-11-09 04:09:11', '2023-11-09 04:09:11'),
(60, 1, '30', 252.5, '-', 30, 'App\\Models\\Compra', NULL, '2023-11-09 04:09:54', '2023-11-09 04:09:54'),
(61, 2, '32', 126.02, '+', 32, 'App\\Models\\Venta', NULL, '2023-11-09 04:11:05', '2023-11-09 04:11:05'),
(62, 2, '33', 168.03, '+', 33, 'App\\Models\\Venta', NULL, '2023-11-09 04:12:10', '2023-11-09 04:12:10'),
(63, 2, '34', 94.4, '+', 34, 'App\\Models\\Venta', NULL, '2023-11-09 04:17:31', '2023-11-09 04:17:31'),
(64, 2, '35', 140.18, '+', 35, 'App\\Models\\Venta', NULL, '2023-11-09 04:19:30', '2023-11-09 04:19:30'),
(65, 2, '36', 247.8, '+', 36, 'App\\Models\\Venta', NULL, '2023-11-09 04:20:20', '2023-11-09 04:20:20'),
(66, 2, '37', 280.37, '+', 37, 'App\\Models\\Venta', NULL, '2023-11-09 04:29:08', '2023-11-09 04:29:08'),
(67, 2, '38', 88.5, '+', 38, 'App\\Models\\Venta', NULL, '2023-11-09 04:32:29', '2023-11-09 04:32:29'),
(68, 2, '39', 88.5, '+', 39, 'App\\Models\\Venta', NULL, '2023-11-09 04:32:56', '2023-11-09 04:32:56'),
(69, 2, '40', 189.04, '+', 40, 'App\\Models\\Venta', NULL, '2023-11-09 04:33:22', '2023-11-09 04:33:22'),
(70, 1, '31', 252.5, '-', 31, 'App\\Models\\Compra', NULL, '2023-11-09 04:49:31', '2023-11-09 04:49:31'),
(71, 1, '32', 151.5, '-', 32, 'App\\Models\\Compra', NULL, '2023-11-09 04:50:03', '2023-11-09 04:50:03'),
(72, 1, '33', 202, '-', 33, 'App\\Models\\Compra', NULL, '2023-11-09 04:52:32', '2023-11-09 04:52:32'),
(73, 2, '41', 186.91, '+', 41, 'App\\Models\\Venta', NULL, '2023-11-09 04:54:29', '2023-11-09 04:54:29'),
(74, 2, '42', 186.91, '+', 42, 'App\\Models\\Venta', NULL, '2023-11-09 04:55:02', '2023-11-09 04:55:02'),
(75, 1, '34', 303, '-', 34, 'App\\Models\\Compra', NULL, '2023-11-09 04:56:05', '2023-11-09 04:56:05'),
(76, 2, '43', 29.5, '+', 43, 'App\\Models\\Venta', NULL, '2023-11-09 04:56:50', '2023-11-09 04:56:50'),
(77, 2, '44', 35.4, '+', 44, 'App\\Models\\Venta', NULL, '2023-11-09 04:57:21', '2023-11-09 04:57:21'),
(78, 1, '35', 151.5, '-', 35, 'App\\Models\\Compra', NULL, '2023-11-09 04:57:43', '2023-11-09 04:57:43'),
(79, 2, '45', 140.18, '+', 45, 'App\\Models\\Venta', NULL, '2023-11-09 04:58:43', '2023-11-09 04:58:43'),
(80, 1, '36', 202, '-', 36, 'App\\Models\\Compra', NULL, '2023-11-09 04:58:50', '2023-11-09 04:58:50'),
(81, 1, '37', 404, '-', 37, 'App\\Models\\Compra', NULL, '2023-11-09 04:59:27', '2023-11-09 04:59:27'),
(82, 1, '38', 303, '-', 38, 'App\\Models\\Compra', NULL, '2023-11-09 05:00:22', '2023-11-09 05:00:22'),
(83, 1, '39', 252.5, '-', 39, 'App\\Models\\Compra', NULL, '2023-11-09 05:00:56', '2023-11-09 05:00:56'),
(84, 1, '40', 151.5, '-', 40, 'App\\Models\\Compra', NULL, '2023-11-09 05:01:38', '2023-11-09 05:01:38'),
(85, 1, '41', 303, '-', 41, 'App\\Models\\Compra', NULL, '2023-11-09 05:02:15', '2023-11-09 05:02:15'),
(86, 1, '42', 202, '-', 42, 'App\\Models\\Compra', NULL, '2023-11-09 05:02:51', '2023-11-09 05:02:51'),
(87, 1, '43', 252.5, '-', 43, 'App\\Models\\Compra', NULL, '2023-11-09 05:03:24', '2023-11-09 05:03:24'),
(88, 1, '44', 151.5, '-', 44, 'App\\Models\\Compra', NULL, '2023-11-09 05:04:00', '2023-11-09 05:04:00'),
(89, 1, '45', 252.5, '-', 45, 'App\\Models\\Compra', NULL, '2023-11-09 05:04:31', '2023-11-09 05:04:31'),
(90, 1, '46', 353.5, '-', 46, 'App\\Models\\Compra', NULL, '2023-11-09 05:05:25', '2023-11-09 05:05:25'),
(91, 1, '47', 202, '-', 47, 'App\\Models\\Compra', NULL, '2023-11-09 05:05:53', '2023-11-09 05:05:53'),
(92, 1, '48', 404, '-', 48, 'App\\Models\\Compra', NULL, '2023-11-09 05:06:20', '2023-11-09 05:06:20'),
(93, 1, '49', 151.5, '-', 49, 'App\\Models\\Compra', NULL, '2023-11-09 05:06:47', '2023-11-09 05:06:47'),
(94, 1, '50', 303, '-', 50, 'App\\Models\\Compra', NULL, '2023-11-09 05:07:23', '2023-11-09 05:07:23'),
(95, 2, '46', 116.82, '+', 46, 'App\\Models\\Venta', NULL, '2023-11-09 05:52:16', '2023-11-09 05:52:16'),
(96, 2, '47', 35.4, '+', 47, 'App\\Models\\Venta', NULL, '2023-11-09 05:52:41', '2023-11-09 05:52:41'),
(97, 2, '48', 84.02, '+', 48, 'App\\Models\\Venta', NULL, '2023-11-09 05:53:06', '2023-11-09 05:53:06'),
(98, 2, '49', 105.02, '+', 49, 'App\\Models\\Venta', NULL, '2023-11-09 05:53:33', '2023-11-09 05:53:33'),
(99, 2, '50', 122.72, '+', 50, 'App\\Models\\Venta', NULL, '2023-11-09 05:53:59', '2023-11-09 05:53:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` bigint(20) UNSIGNED NOT NULL,
  `empnombres` varchar(255) NOT NULL,
  `empapellidop` varchar(255) NOT NULL,
  `empapellidom` varchar(255) NOT NULL,
  `empdni` varchar(255) NOT NULL,
  `empdireccion` varchar(255) NOT NULL,
  `emptelefono` varchar(255) NOT NULL,
  `idDepartamento` bigint(20) UNSIGNED NOT NULL,
  `idUser` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `empnombres`, `empapellidop`, `empapellidom`, `empdni`, `empdireccion`, `emptelefono`, `idDepartamento`, `idUser`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Jaime Eduardo', 'Centurion', 'Goicochea', '70683607', 'Dirección 99', '981268897', 1, 1, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(2, 'Carmen Idalia', 'Niño Ladron de Guevara', 'Arroyo', '77326765', 'Mariano Melgar #197', '967548002', 4, 2, '2023-11-09 01:22:24', '2023-11-09 01:22:24', NULL),
(3, 'Xiomara Sadith', 'Amambal', 'Bances', '70487702', 'Jorge Desmaizon - Cafetal 1', '945 205 255', 3, 3, '2023-11-09 01:30:37', '2023-11-09 01:30:37', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_09_10_184654_create_sessions_table', 1),
(7, '2023_09_11_031754_create_tipo_productos_table', 1),
(8, '2023_09_11_031819_create_departamentos_table', 1),
(9, '2023_09_11_031842_create_empleados_table', 1),
(10, '2023_09_11_031842_create_unidad_medidas_table', 1),
(11, '2023_09_11_031902_create_tipo_comprobantes_table', 1),
(12, '2023_09_11_032048_create_tipo_pagos_table', 1),
(13, '2023_09_11_032101_create_proveedores_table', 1),
(14, '2023_09_11_032218_create_productos_table', 1),
(15, '2023_09_11_032235_create_ventas_table', 1),
(16, '2023_09_11_032243_create_venta_detalles_table', 1),
(17, '2023_09_11_032724_create_compras_table', 1),
(18, '2023_09_11_032729_create_compra_detalles_table', 1),
(19, '2023_09_11_032749_create_capacitacions_table', 1),
(20, '2023_09_11_032803_create_asistencias_table', 1),
(21, '2023_09_11_131001_create_solicituds_table', 1),
(22, '2023_09_26_131010_create_solicitud_detalles_table', 1),
(23, '2023_09_26_181530_create_permission_tables', 1),
(24, '2023_10_30_034922_create_tipo_documentos_table', 1),
(25, '2023_10_30_035046_create_documentos_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 2),
(10, 'App\\Models\\User', 3),
(12, 'App\\Models\\User', 3),
(13, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `tipo` enum('panel','crud','reporte','grafico','otro') NOT NULL DEFAULT 'otro',
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`, `tipo`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'panel.Abastecimiento', 'Acceso al panel de abastecimiento', 'panel', 'web', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(2, 'panel.Compras', 'Acceso al panel de compras', 'panel', 'web', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(3, 'panel.Finanzas', 'Acceso al panel de finanzas', 'panel', 'web', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(4, 'panel.Ventas', 'Acceso al panel de ventas', 'panel', 'web', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(5, 'panel.Adminstrar', 'Acceso al panel de administracion', 'panel', 'web', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(6, 'panel.Seguridad', 'Acceso al panel de seguridad', 'panel', 'web', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(7, 'productos.index', 'Ver listado de productos', 'crud', 'web', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(8, 'productos.create', 'Crear producto', 'crud', 'web', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(9, 'productos.show', 'Ver detalle de producto', 'crud', 'web', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(10, 'productos.edit', 'Editar producto', 'crud', 'web', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(11, 'productos.destroy', 'Eliminar producto', 'crud', 'web', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(12, 'solicituds.index', 'Crear solicitud', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(13, 'solicituds.create', 'Ver listado de solicitudes', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(14, 'solicituds.show', 'Ver detalle de solicitud', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(15, 'solicituds.edit', 'Editar solicitud', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(16, 'solicituds.destroy', 'Eliminar solicitud', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(17, 'ventas.index', 'Ver listado de ventas', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(18, 'ventas.create', 'Crear venta', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(19, 'ventas.show', 'Ver detalle de venta', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(20, 'ventas.edit', 'Editar venta', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(21, 'ventas.destroy', 'Eliminar venta', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(22, 'documentos-contables.index', 'Ver listado de documentos contables', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(23, 'documentos-contables.create', 'Crear documento contable', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(24, 'documentos-contables.show', 'Ver detalle de documento contable', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(25, 'documentos-contables.edit', 'Editar documento contable', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(26, 'documentos-contables.destroy', 'Eliminar documento contable', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(27, 'tipo-pagos.index', 'Ver listado de tipo de pagos', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(28, 'tipo-pagos.create', 'Crear tipo de pago', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(29, 'tipo-pagos.show', 'Ver detalle de tipo de pago', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(30, 'tipo-pagos.edit', 'Editar tipo de pago', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(31, 'tipo-pagos.destroy', 'Eliminar tipo de pago', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(32, 'tipo-comprobante.index', 'Ver listado de tipo de comprobantes', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(33, 'tipo-comprobante.create', 'Crear tipo de comprobante', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(34, 'tipo-comprobante.show', 'Ver detalle de tipo de comprobante', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(35, 'tipo-comprobante.edit', 'Editar tipo de comprobante', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(36, 'tipo-comprobante.destroy', 'Eliminar tipo de comprobante', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(37, 'capacitacions.index', 'Ver listado de capacitaciones', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(38, 'capacitacions.create', 'Crear capacitacion', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(39, 'capacitacions.show', 'Ver detalle de capacitacion', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(40, 'capacitacions.edit', 'Editar capacitacion', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(41, 'capacitacions.destroy', 'Eliminar capacitacion', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(42, 'departamentos.index', 'Ver listado de departamentos', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(43, 'departamentos.create', 'Crear departamento', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(44, 'departamentos.show', 'Ver detalle de departamento', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(45, 'departamentos.edit', 'Editar departamento', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(46, 'departamentos.destroy', 'Eliminar departamento', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(47, 'empleados.index', 'Ver listado de empleados', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(48, 'empleados.create', 'Crear empleado', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(49, 'empleados.show', 'Ver detalle de empleado', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(50, 'empleados.edit', 'Editar empleado', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(51, 'empleados.destroy', 'Eliminar empleado', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(52, 'roles.index', 'Ver listado de roles', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(53, 'roles.create', 'Crear rol', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(54, 'roles.show', 'Ver detalle de rol', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(55, 'roles.edit', 'Editar rol', 'crud', 'web', '2023-11-08 18:32:31', '2023-11-08 18:32:31'),
(56, 'roles.destroy', 'Eliminar rol', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(57, 'permisos.index', 'Ver listado de permisos', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(58, 'permisos.create', 'Crear permiso', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(59, 'permisos.show', 'Ver detalle de permiso', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(60, 'permisos.edit', 'Editar permiso', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(61, 'permisos.destroy', 'Eliminar permiso', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(62, 'orden-compras.index', 'Ver listado de ordenes de compras', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(63, 'orden-compras.create', 'Crear orden de compra', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(64, 'orden-compras.show', 'Ver detalle de orden de compra', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(65, 'orden-compras.edit', 'Editar orden de compra', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(66, 'orden-compras.destroy', 'Eliminar orden de compra', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(67, 'proveedores.index', 'Ver listado de proveedores', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(68, 'proveedores.create', 'Crear proveedor', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(69, 'proveedores.show', 'Ver detalle de proveedor', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(70, 'proveedores.edit', 'Editar proveedor', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32'),
(71, 'proveedores.destroy', 'Eliminar proveedor', 'crud', 'web', '2023-11-08 18:32:32', '2023-11-08 18:32:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` bigint(20) UNSIGNED NOT NULL,
  `pronombre` varchar(255) NOT NULL,
  `prodescripcion` varchar(255) NOT NULL,
  `propreciounitario` varchar(255) DEFAULT NULL,
  `propreciocompra` varchar(255) NOT NULL,
  `prostock` int(11) NOT NULL,
  `prostockminimo` int(11) NOT NULL,
  `idTipoproducto` bigint(20) UNSIGNED NOT NULL,
  `idUnidadmedida` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `pronombre`, `prodescripcion`, `propreciounitario`, `propreciocompra`, `prostock`, `prostockminimo`, `idTipoproducto`, `idUnidadmedida`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Gasolina 95', 'Gasolina premium', '20.8', '50.5', 81, 100, 1, 1, '2023-11-08 18:32:32', '2023-11-09 05:53:59', NULL),
(2, 'Gasolina 90', 'Gasolina super', '19.8', '50.5', 999906, 100, 1, 1, '2023-11-08 18:32:32', '2023-11-09 05:52:16', NULL),
(3, 'Gasolina 84', 'Gasolina normal', '17.8', '50.5', 999888, 100, 1, 1, '2023-11-08 18:32:32', '2023-11-09 05:53:33', NULL),
(4, 'Espejos para carros', 'Espejos para carros', NULL, '50.5', 50, 2, 4, 3, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(5, 'Espejos para motos kirin', 'Espejos para motos', NULL, '50.5', 50, 2, 4, 3, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(6, 'Llantas para carro Michelin', 'Llantas para carros', '70', '50.5', 100, 4, 4, 3, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(7, 'Llantas para motos kirin', 'Llantas para motos', '120', '50.5', 96, 4, 4, 3, '2023-11-08 18:32:32', '2023-11-09 01:32:05', NULL),
(8, 'Aceite 10w40', 'Aceite para motor', '25', '50.5', 21, 2, 3, 2, '2023-11-08 18:32:32', '2023-11-09 04:56:50', NULL),
(9, 'Aceite 10w30', 'Aceite para motor', '20', '50.5', 0, 2, 3, 2, '2023-11-08 18:32:32', '2023-11-09 04:17:31', NULL),
(10, 'Aceite 20w50', 'Aceite para motor', '30', '50.5', 32, 2, 4, 2, '2023-11-08 18:32:32', '2023-11-09 05:52:41', NULL),
(11, 'Mangeras de combustible', 'Mangera donde pasa el combustible', NULL, '50.5', 30, 2, 2, 3, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(12, 'Mangeras de incendio', 'Mangera para extintor', NULL, '50.5', 30, 2, 2, 3, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` bigint(20) UNSIGNED NOT NULL,
  `provdoc` varchar(255) NOT NULL,
  `provtelefono` varchar(255) NOT NULL,
  `provcorreo` varchar(255) NOT NULL,
  `provdireccion` varchar(255) NOT NULL,
  `provrazonsocial` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedor`, `provdoc`, `provtelefono`, `provcorreo`, `provdireccion`, `provrazonsocial`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '789587412568', '987654321', 'correo1@example.com', 'Dirección 1', 'Razón Social 1', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(2, '951235745896', '987654321', 'correo2@example.com', 'Dirección 2', 'Razón Social 2', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `tipo` enum('panel','cargo') NOT NULL DEFAULT 'cargo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `tipo`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', 'cargo', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(2, 'Abastecimiento', 'web', 'panel', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(3, 'Compras', 'web', 'panel', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(4, 'Finanzas', 'web', 'panel', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(5, 'Ventas', 'web', 'panel', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(6, 'Adminstrar', 'web', 'panel', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(7, 'Seguridad', 'web', 'panel', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(8, 'Supervisor', 'web', 'cargo', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(9, 'Jefe Comercial', 'web', 'cargo', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(10, 'Jefe Finanzas', 'web', 'cargo', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(11, 'Gerente General', 'web', 'cargo', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(12, 'Contador', 'web', 'cargo', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(13, 'Vendedor', 'web', 'cargo', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(14, 'Jefe de Personal', 'web', 'cargo', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(15, 'Jefe Seguridad', 'web', 'cargo', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(16, 'Brigadista', 'web', 'cargo', '2023-11-08 18:32:30', '2023-11-08 18:32:30'),
(17, 'Prevencionista', 'web', 'cargo', '2023-11-08 18:32:30', '2023-11-08 18:32:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(2, 1),
(2, 3),
(3, 1),
(3, 4),
(4, 1),
(4, 5),
(5, 1),
(5, 6),
(6, 1),
(6, 7),
(7, 1),
(7, 8),
(7, 11),
(8, 1),
(8, 8),
(8, 11),
(9, 1),
(9, 8),
(9, 11),
(10, 1),
(10, 8),
(10, 11),
(11, 1),
(11, 8),
(11, 11),
(12, 1),
(12, 8),
(12, 10),
(12, 11),
(13, 1),
(13, 8),
(13, 10),
(13, 11),
(14, 1),
(14, 8),
(14, 10),
(14, 11),
(15, 1),
(15, 8),
(15, 10),
(15, 11),
(16, 1),
(16, 8),
(16, 10),
(16, 11),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2IBqF9LvEOJKgSyGZVLIbTEVhxfSLleOLJOwBWas', 1, '179.6.26.84', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/119.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTUxrVUxmM1B3T3VhSEx2WHRtR3pXMU9xa3J6aFFObGRZMkF2eWg4eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vZ3JpZm9paS5tZXJjZW50YW4uY29tL2VtcGxlYWRvcy8xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRBR3lnT2V5WUdyRFF3RkhJL3Y1YVFlZ3F6RTVkbm41a29CWGU4MXpWdXNCcmJzUEx4N09IbSI7fQ==', 1699495675),
('5jTne5koX1HqsyRBxl2ahgKb8lYGESTE6MpzUrtp', NULL, '35.88.188.244', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVFhWWlp2Y0tNNFBmeVU4WVhUSXVPR1RJN2xLREJ0VFhjVFZOQ3J6eSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMzoiaHR0cHM6Ly93d3cuZ3JpZm9paS5tZXJjZW50YW4uY29tIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3LmdyaWZvaWkubWVyY2VudGFuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1699485828),
('ags68dX8ROV3EWrYvm2sfS8MnvEqzAgA8kVKMy8u', NULL, '47.88.101.3', 'Mozilla/5.0 (Linux; Android 11; M2004J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibmc2S0hZc0NWbmtaNm9LNW55WVhEdE9OZXZGc0NYaU9PdnFuc2ZLMyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMzoiaHR0cHM6Ly93d3cuZ3JpZm9paS5tZXJjZW50YW4uY29tIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3LmdyaWZvaWkubWVyY2VudGFuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1699497712),
('cAqr4Ws0OvOD4F7CZsXgJXIPhVzf7Tdf2qXuHSjB', NULL, '87.236.176.161', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidmpRREhsMG1EZGpMQ1Q5ZU9lZmdvU0o5V09mNmprdEZhVmt6N0gyNyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyODoiaHR0cDovL2dyaWZvaWkubWVyY2VudGFuLmNvbSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM0OiJodHRwOi8vZ3JpZm9paS5tZXJjZW50YW4uY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1699546386),
('GlNuVkLWCXAJTqXzuhKjpPQQK2mgmhpkrKEEA7uW', NULL, '47.242.224.70', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2225.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT2V2V0kxZnl5VjRzNDhuNzY2TjJOaWY3eGJrUlc2WVlVWkw3NjRKNSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyOToiaHR0cHM6Ly9ncmlmb2lpLm1lcmNlbnRhbi5jb20iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNToiaHR0cHM6Ly9ncmlmb2lpLm1lcmNlbnRhbi5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1699485705),
('IhgQEfzMst3y1K2g69IO97cnMD8aJM3LxGEHj7nb', NULL, '47.242.224.70', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; cs; rv:1.9) Gecko/2008052906', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoienZJbkI5U1ZvNDNPaW9sT0RNZ2ZIaDZJMFVQbkw4cTcyaTZUYU4wZiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMzoiaHR0cHM6Ly93d3cuZ3JpZm9paS5tZXJjZW50YW4uY29tIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vd3d3LmdyaWZvaWkubWVyY2VudGFuLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1699485705),
('JI513xsHxLtFRdRA41x8zINQnbEMiKkx9f5BjVwk', NULL, '87.236.176.231', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYXlleEVHNUFjdE9zMU5iZHBIODlZVnZGZktDTm1MczFLSWtyaUh6YyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMzoiaHR0cHM6Ly93d3cuZ3JpZm9paS5tZXJjZW50YW4uY29tIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3LmdyaWZvaWkubWVyY2VudGFuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1699529396),
('jmIzc4ql5Qql7SuBXFGq7xkF2NJWyR2nVgHGa0Fj', NULL, '157.245.98.127', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZXFnUnYwbUdpWkNQU2tVbG1FOFV1Q1I4Rk5CWUhUWVhHSWtQRGl6ZiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMjoiaHR0cDovL3d3dy5ncmlmb2lpLm1lcmNlbnRhbi5jb20iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMjoiaHR0cDovL3d3dy5ncmlmb2lpLm1lcmNlbnRhbi5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1699515436),
('Ju4pYv0Om1AlVG3a2p5ZlOUcxaPkbCHic6nEFXP1', NULL, '35.88.188.244', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQmdwejdKMmNyMWpwT0lad1B3Q1FjelVlYnJTd053S2RFZjJhSGI4UiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyOToiaHR0cHM6Ly9ncmlmb2lpLm1lcmNlbnRhbi5jb20iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ncmlmb2lpLm1lcmNlbnRhbi5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1699485825),
('LlQQb6qkfzlHhZRCA4qRq9rMycWtgTPGBFPvlI4c', NULL, '47.88.101.3', 'Mozilla/5.0 (Linux; Android 11; M2004J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2ExZzE1YU41THRBekI5ODM4ZEt4QlJtRGxMdGttcURxVWNvejF0byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vd3d3LmdyaWZvaWkubWVyY2VudGFuLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1699497712),
('mbdNTNYsDPqwpqKDf4QHjUJB0QTAD5lMylFJSSHz', NULL, '157.245.98.127', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYU53dmtZS3hBVEtFOHUzS0pUU2xpbmJVS2NmcUNWdVhGNFlrTGpmeSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMzoiaHR0cHM6Ly93d3cuZ3JpZm9paS5tZXJjZW50YW4uY29tIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3LmdyaWZvaWkubWVyY2VudGFuLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1699515437),
('n7cco8QNtn8ypIS90WSW8FlXENM6281rhkAf3PU3', NULL, '47.254.16.187', 'Mozilla/5.0 (Linux; Android 11; M2004J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjlVSTlJcFBUUFZtMGxWSW1vbU1yNzJaNVVBTDR6eVRXOVZCekRaWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vZ3JpZm9paS5tZXJjZW50YW4uY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1699497712),
('pCDXWusWbfANrv0jQzEa4A4WrhNta0MQXi2joDLK', NULL, '47.254.16.187', 'Mozilla/5.0 (Linux; Android 11; M2004J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS0Vqd29TU0ZOUjV6a2dZSGMxRVo2a0RQSTBDZWwzdVhwMXVVUGlEMyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyOToiaHR0cHM6Ly9ncmlmb2lpLm1lcmNlbnRhbi5jb20iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9ncmlmb2lpLm1lcmNlbnRhbi5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1699497711),
('Pokfk4I8GoD6ZqwIGfqLm2rG0w4YAicsIwfH7lJw', 1, '190.239.192.53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoicUNueXNXNDhTRWJ1eE5YVVJZWHZkNnZWRHhpRGpiVGZ1Q25oUkhEZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vZ3JpZm9paS5tZXJjZW50YW4uY29tL2RvY3VtZW50b3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRBR3lnT2V5WUdyRFF3RkhJL3Y1YVFlZ3F6RTVkbm41a29CWGU4MXpWdXNCcmJzUEx4N09IbSI7fQ==', 1699502544),
('rQi6cd2BZySPqdchxX14UObL3bnnyPfSgOW6TAat', 3, '181.64.93.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiOVUzdkdaMGJSdGZwVnFtbXRxdHlFVllabDNwazd3RzVyZVloV2U5bCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ2OiJodHRwczovL2dyaWZvaWkubWVyY2VudGFuLmNvbS90aXBvY29tcHJvYmFudGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MztzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRyWG5XUVBzeS9tRlV0akF0U0RJTjcueEFiODFjbVZLUEowMGdFSkFIVTdRMHpvWUt2N3QwaSI7fQ==', 1699501764),
('T22aWW5XYmTM6aI96BzrAypdUjpX5gSE67IMkd1q', NULL, '87.236.176.231', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXRxZEpOaWFEZTFyVUFtZFIxbWVmRExLdzltTll6b0dpU203aFp3UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vd3d3LmdyaWZvaWkubWVyY2VudGFuLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1699529397),
('vJgvIc2Ral1coWmwXuVchHus6UmfhMSTLhrlYua9', 1, '181.64.93.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiYkV0aDhYR01PV0g2U2liUGJRYlU3dmdGc2lsMjYxTzNRQTlWOThmZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM2OiJodHRwczovL2dyaWZvaWkubWVyY2VudGFuLmNvbS92ZW50YXMiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJEFHeWdPZXlZR3JEUXdGSEkvdjVhUWVncXpFNWRubjVrb0JYZTgxelZ1c0JyYnNQTHg3T0htIjt9', 1699493236),
('weXmwotIvJg67ZT7UwTpzfDNonDC0lkkL0U3kRZt', 1, '38.250.130.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoidjJ2VGRYOEZLNDU4MWlidkpBclJ3dWFhOHhCUlpHa0MxbWxlSUs3byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vZ3JpZm9paS5tZXJjZW50YW4uY29tL3ZlbnRhcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkQUd5Z09leVlHckRRd0ZISS92NWFRZWdxekU1ZG5uNWtvQlhlODF6VnVzQnJic1BMeDdPSG0iO3M6MTg6ImFkbWlubHRlX2RhcmtfbW9kZSI7YjoxO30=', 1699491239),
('XjO0iC7sV0kv7wGNE8S0tkWxavLb5RPnRdJVlwgu', NULL, '190.233.177.52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUjZEbGx0WVlzM3RaNndFV3Q5MjdVQkZyZHpFckZNV2JrZkVDMGpqdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyOToiaHR0cHM6Ly9ncmlmb2lpLm1lcmNlbnRhbi5jb20iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNToiaHR0cHM6Ly9ncmlmb2lpLm1lcmNlbnRhbi5jb20vbG9naW4iO319', 1699540649);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicituds`
--

CREATE TABLE `solicituds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_detalles`
--

CREATE TABLE `solicitud_detalles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_comprobantes`
--

CREATE TABLE `tipo_comprobantes` (
  `idTipocomprobante` bigint(20) UNSIGNED NOT NULL,
  `tcomcomprobante` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_comprobantes`
--

INSERT INTO `tipo_comprobantes` (`idTipocomprobante`, `tcomcomprobante`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Factura', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(2, 'Boleta', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(3, 'Nota de Crédito', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(4, 'Nota de Débito', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(5, 'Factura Electrónica', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(6, 'Boleta Electrónica', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documentos`
--

CREATE TABLE `tipo_documentos` (
  `idTipoDocumento` bigint(20) UNSIGNED NOT NULL,
  `tidDocumento` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_documentos`
--

INSERT INTO `tipo_documentos` (`idTipoDocumento`, `tidDocumento`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Compra', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(2, 'Venta', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pagos`
--

CREATE TABLE `tipo_pagos` (
  `idTipopago` bigint(20) UNSIGNED NOT NULL,
  `tpagotipo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_pagos`
--

INSERT INTO `tipo_pagos` (`idTipopago`, `tpagotipo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Efectivo', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(2, 'Tarjeta', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(3, 'Cheque', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(4, 'Transferencia', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(5, 'Deposito', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(6, 'Otro', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_productos`
--

CREATE TABLE `tipo_productos` (
  `idTipoproducto` bigint(20) UNSIGNED NOT NULL,
  `tpronombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_productos`
--

INSERT INTO `tipo_productos` (`idTipoproducto`, `tpronombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Combustible', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(2, 'Repuestos', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(3, 'Acesorios', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(4, 'Lubricantes', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medidas`
--

CREATE TABLE `unidad_medidas` (
  `idUnidadmedida` bigint(20) UNSIGNED NOT NULL,
  `umednombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidad_medidas`
--

INSERT INTO `unidad_medidas` (`idUnidadmedida`, `umednombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Galón', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(2, 'Litro', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(3, 'Unidad', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(4, 'Caja', '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `idUser` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idUser`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Jaime Eduardo Centurion', 'admin@example.com', NULL, '$2y$10$AGygOeyYGrDQwFHI/v5aQegqzE5dnn5koBXe81zVusBrbsPLx7OHm', NULL, NULL, NULL, 'VZNhA8tIRYEWQSLlxqCgBZzIIDRTvVHw2t5uSNbPBzVzXdemUZVsJ8qUKXlQ', NULL, NULL, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(2, 'Carmen Idalia Niño Ladron de Guevara', 'idaliacarmen092@gmail.com', NULL, '$2y$10$Iyy5RQUFjjoshkR5qyvHbu5EvFFvwQNg.K4poC67Y30oLwvPbJw76', NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-09 01:22:24', '2023-11-09 01:22:24', NULL),
(3, 'Xiomara Sadith Amambal', 'amambal.xiomara@gmail.com', NULL, '$2y$10$rXnWQPsy/mFUtjAtSDIN7.xAb81cmVKPJ00gEJAHU7Q0zoYKv7t0i', NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-09 01:30:37', '2023-11-09 01:30:37', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVenta` bigint(20) UNSIGNED NOT NULL,
  `venfecha` varchar(255) NOT NULL,
  `vendocumentocliente` varchar(255) DEFAULT NULL,
  `vennombrecliente` varchar(255) NOT NULL DEFAULT 'cliente generico',
  `venhora` varchar(255) NOT NULL,
  `venestado` varchar(255) NOT NULL DEFAULT 'pagado',
  `venmonto` varchar(255) NOT NULL,
  `venimpuesto` varchar(255) NOT NULL,
  `ventotalneto` varchar(255) NOT NULL,
  `venobservacion` varchar(255) DEFAULT NULL,
  `idTipocomprobante` bigint(20) UNSIGNED NOT NULL,
  `idTipopago` bigint(20) UNSIGNED NOT NULL,
  `idEmpleado` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idVenta`, `venfecha`, `vendocumentocliente`, `vennombrecliente`, `venhora`, `venestado`, `venmonto`, `venimpuesto`, `ventotalneto`, `venobservacion`, `idTipocomprobante`, `idTipopago`, `idEmpleado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, '2023-11-01', '333333', 'cliente generico', '09:13', 'pagado', '38.60', '6.95', '45.55', 'fsadfas', 2, 1, 1, '2023-11-08 19:14:06', '2023-11-08 19:14:06', NULL),
(3, '2023-09-30', '70487752', 'cliente generico', '12:51', 'pagado', '35.60', '6.41', '42.01', NULL, 1, 2, 1, '2023-11-08 20:49:57', '2023-11-08 20:49:57', NULL),
(4, '2023-03-20', '77326765', 'cliente generico', '15:20', 'pagado', '198.00', '35.64', '233.64', NULL, 2, 2, 1, '2023-11-09 01:20:55', '2023-11-09 01:20:55', NULL),
(5, '2023-11-08', '76354678', 'cliente generico', '12:09', 'pagado', '480.00', '86.40', '566.40', NULL, 1, 1, 1, '2023-11-09 01:32:05', '2023-11-09 01:32:05', NULL),
(6, '2023-10-15', '72365098', 'cliente generico', '13:09', 'pagado', '213.60', '38.45', '252.05', NULL, 4, 2, 1, '2023-11-09 01:33:40', '2023-11-09 01:33:40', NULL),
(7, '2023-10-08', '76890987', 'cliente generico', '15:35', 'pagado', '237.60', '42.77', '280.37', NULL, 1, 2, 1, '2023-11-09 01:37:05', '2023-11-09 01:37:05', NULL),
(8, '2023-10-06', '19872365', 'cliente generico', '12:09', 'pagado', '53.40', '9.61', '63.01', NULL, 1, 6, 1, '2023-11-09 01:37:40', '2023-11-09 01:37:40', NULL),
(9, '2023-10-12', '89876534', 'cliente generico', '16:09', 'pagado', '50.00', '9.00', '59.00', NULL, 1, 2, 1, '2023-11-09 01:38:16', '2023-11-09 01:38:16', NULL),
(10, '2023-10-15', '76590987', 'cliente generico', '09:45', 'pagado', '80.00', '14.40', '94.40', NULL, 2, 6, 1, '2023-11-09 01:39:05', '2023-11-09 01:39:05', NULL),
(11, '2023-11-02', '65787652', 'cliente generico', '15:39', 'pagado', '158.40', '28.51', '186.91', NULL, 2, 3, 1, '2023-11-09 01:40:12', '2023-11-09 01:40:12', NULL),
(12, '2023-11-02', '78765243', 'cliente generico', '10:30', 'pagado', '106.80', '19.22', '126.02', NULL, 1, 1, 1, '2023-11-09 01:41:06', '2023-11-09 01:41:06', NULL),
(13, '2023-10-25', '87234598', 'cliente generico', '13:21', 'pagado', '138.60', '24.95', '163.55', NULL, 1, 2, 1, '2023-11-09 01:43:11', '2023-11-09 01:43:11', NULL),
(14, '2023-10-30', '65898736', 'cliente generico', '15:09', 'pagado', '195.80', '35.24', '231.04', NULL, 1, 2, 1, '2023-11-09 01:43:44', '2023-11-09 01:43:44', NULL),
(15, '2023-11-02', '87653409', 'cliente generico', '11:09', 'pagado', '125.00', '22.50', '147.50', NULL, 2, 2, 1, '2023-11-09 01:44:14', '2023-11-09 01:44:14', NULL),
(16, '2023-10-08', '76524354', 'cliente generico', '17:36', 'pagado', '79.20', '14.26', '93.46', NULL, 1, 2, 1, '2023-11-09 03:38:01', '2023-11-09 03:38:01', NULL),
(17, '2023-10-09', '89837468', 'cliente generico', '13:09', 'pagado', '249.60', '44.93', '294.53', NULL, 2, 2, 1, '2023-11-09 03:38:50', '2023-11-09 03:38:50', NULL),
(18, '2023-10-23', '76890987', 'cliente generico', '14:09', 'pagado', '240.00', '43.20', '283.20', NULL, 1, 2, 1, '2023-11-09 03:39:53', '2023-11-09 03:39:53', NULL),
(19, '2023-10-29', '76239812', 'cliente generico', '13:09', 'pagado', '180.00', '32.40', '212.40', NULL, 1, 1, 1, '2023-11-09 03:40:31', '2023-11-09 03:40:31', NULL),
(20, '2023-10-27', '65230987', 'cliente generico', '17:41', 'pagado', '89.00', '16.02', '105.02', NULL, 1, 2, 1, '2023-11-09 03:41:23', '2023-11-09 03:41:23', NULL),
(21, '2023-10-27', '73245674', 'cliente generico', '16:09', 'pagado', '225.00', '40.50', '265.50', NULL, 2, 2, 1, '2023-11-09 03:41:59', '2023-11-09 03:41:59', NULL),
(22, '2023-10-31', '78092345', 'cliente generico', '10:59', 'pagado', '160.00', '28.80', '188.80', NULL, 1, 2, 1, '2023-11-09 03:42:34', '2023-11-09 03:42:34', NULL),
(23, '2023-10-24', '65345654', 'cliente generico', '12:04', 'pagado', '200.00', '36.00', '236.00', NULL, 1, 1, 1, '2023-11-09 03:43:19', '2023-11-09 03:43:19', NULL),
(24, '2023-11-03', '89872356', 'cliente generico', '12:06', 'pagado', '213.60', '38.45', '252.05', NULL, 1, 2, 1, '2023-11-09 03:43:53', '2023-11-09 03:43:53', NULL),
(25, '2023-10-29', '19283746', 'cliente generico', '13:04', 'pagado', '213.60', '38.45', '252.05', NULL, 2, 1, 1, '2023-11-09 03:48:17', '2023-11-09 03:48:17', NULL),
(26, '2023-10-29', '65243567', 'cliente generico', '17:50', 'pagado', '270.00', '48.60', '318.60', NULL, 1, 4, 1, '2023-11-09 03:50:38', '2023-11-09 03:50:38', NULL),
(27, '2023-11-05', '19098234', 'cliente generico', '09:12', 'pagado', '150.00', '27.00', '177.00', NULL, 2, 2, 1, '2023-11-09 03:51:36', '2023-11-09 03:51:36', NULL),
(28, '2023-10-06', '98234567', 'cliente generico', '12:39', 'pagado', '158.40', '28.51', '186.91', NULL, 2, 2, 1, '2023-11-09 03:53:49', '2023-11-09 03:53:49', NULL),
(29, '2023-11-06', '76543219', 'cliente generico', '17:54', 'pagado', '60.00', '10.80', '70.80', NULL, 1, 2, 1, '2023-11-09 03:54:25', '2023-11-09 03:54:25', NULL),
(30, '2023-11-07', '54678765', 'cliente generico', '12:06', 'pagado', '71.20', '12.82', '84.02', NULL, 2, 2, 1, '2023-11-09 03:57:30', '2023-11-09 03:57:30', NULL),
(31, '2023-11-01', '89765678', 'cliente generico', '09:07', 'pagado', '213.60', '38.45', '252.05', NULL, 1, 1, 1, '2023-11-09 04:08:22', '2023-11-09 04:08:22', NULL),
(32, '2023-11-02', '65789098', 'cliente generico', '08:12', 'pagado', '106.80', '19.22', '126.02', NULL, 1, 1, 1, '2023-11-09 04:11:05', '2023-11-09 04:11:05', NULL),
(33, '2023-10-12', '45678987', 'cliente generico', '15:45', 'pagado', '142.40', '25.63', '168.03', NULL, 1, 1, 1, '2023-11-09 04:12:10', '2023-11-09 04:12:10', NULL),
(34, '2023-10-22', '65432189', 'cliente generico', '12:34', 'pagado', '80.00', '14.40', '94.40', NULL, 1, 2, 1, '2023-11-09 04:17:31', '2023-11-09 04:17:31', NULL),
(35, '2023-10-21', '67908765', 'cliente generico', '18:18', 'pagado', '118.80', '21.38', '140.18', NULL, 1, 1, 1, '2023-11-09 04:19:30', '2023-11-09 04:19:30', NULL),
(36, '2023-10-19', '45673435', 'cliente generico', '09:35', 'pagado', '210.00', '37.80', '247.80', NULL, 2, 1, 1, '2023-11-09 04:20:20', '2023-11-09 04:20:20', NULL),
(37, '2023-10-18', '65890987', 'cliente generico', '18:28', 'pagado', '237.60', '42.77', '280.37', NULL, 1, 2, 1, '2023-11-09 04:29:08', '2023-11-09 04:29:08', NULL),
(38, '2023-10-19', '87345672', 'cliente generico', '11:07', 'pagado', '75.00', '13.50', '88.50', NULL, 2, 2, 1, '2023-11-09 04:32:29', '2023-11-09 04:32:29', NULL),
(39, '2023-10-20', '76354678', 'cliente generico', '11:13', 'pagado', '75.00', '13.50', '88.50', NULL, 1, 2, 1, '2023-11-09 04:32:56', '2023-11-09 04:32:56', NULL),
(40, '2023-10-12', '76340928', 'cliente generico', '12:34', 'pagado', '160.20', '28.84', '189.04', NULL, 2, 2, 1, '2023-11-09 04:33:22', '2023-11-09 04:33:22', NULL),
(41, '2023-10-17', '90876545', 'cliente generico', '12:34', 'pagado', '158.40', '28.51', '186.91', NULL, 1, 1, 1, '2023-11-09 04:54:29', '2023-11-09 04:54:29', NULL),
(42, '2023-10-23', '56348987', 'cliente generico', '14:09', 'pagado', '158.40', '28.51', '186.91', NULL, 1, 2, 1, '2023-11-09 04:55:02', '2023-11-09 04:55:02', NULL),
(43, '2023-10-25', '12432345', 'cliente generico', '15:04', 'pagado', '25.00', '4.50', '29.50', NULL, 1, 2, 1, '2023-11-09 04:56:50', '2023-11-09 04:56:50', NULL),
(44, '2023-10-26', '23409876', 'cliente generico', '15:59', 'pagado', '30.00', '5.40', '35.40', NULL, 1, 2, 1, '2023-11-09 04:57:21', '2023-11-09 04:57:21', NULL),
(45, '2023-10-28', '77635489', 'cliente generico', '15:32', 'pagado', '118.80', '21.38', '140.18', NULL, 1, 2, 1, '2023-11-09 04:58:43', '2023-11-09 04:58:43', NULL),
(46, '2023-10-28', '98237834', 'cliente generico', '19:52', 'pagado', '99.00', '17.82', '116.82', NULL, 1, 2, 1, '2023-11-09 05:52:16', '2023-11-09 05:52:16', NULL),
(47, '2023-11-07', '89234587', 'cliente generico', '18:07', 'pagado', '30.00', '5.40', '35.40', NULL, 2, 1, 1, '2023-11-09 05:52:41', '2023-11-09 05:52:41', NULL),
(48, '2023-11-06', '87230912', 'cliente generico', '16:23', 'pagado', '71.20', '12.82', '84.02', NULL, 2, 1, 1, '2023-11-09 05:53:06', '2023-11-09 05:53:06', NULL),
(49, '2023-10-14', '87103923', 'cliente generico', '13:34', 'pagado', '89.00', '16.02', '105.02', NULL, 1, 2, 1, '2023-11-09 05:53:33', '2023-11-09 05:53:33', NULL),
(50, '2023-10-13', '90238740', 'cliente generico', '15:34', 'pagado', '104.00', '18.72', '122.72', NULL, 1, 2, 1, '2023-11-09 05:53:59', '2023-11-09 05:53:59', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalles`
--

CREATE TABLE `venta_detalles` (
  `idDventa` bigint(20) UNSIGNED NOT NULL,
  `idVenta` bigint(20) UNSIGNED NOT NULL,
  `idProducto` bigint(20) UNSIGNED NOT NULL,
  `dvcantidad` varchar(255) NOT NULL,
  `dvpreciounitario` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `venta_detalles`
--

INSERT INTO `venta_detalles` (`idDventa`, `idVenta`, `idProducto`, `dvcantidad`, `dvpreciounitario`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, '1', '20.8', '2023-11-08 19:14:06', '2023-11-08 19:14:06', NULL),
(2, 2, 3, '1', '17.8', '2023-11-08 19:14:06', '2023-11-08 19:14:06', NULL),
(3, 3, 3, '2', '17.8', '2023-11-08 20:49:57', '2023-11-08 20:49:57', NULL),
(4, 4, 2, '10', '19.8', '2023-11-09 01:20:55', '2023-11-09 01:20:55', NULL),
(5, 5, 7, '4', '120', '2023-11-09 01:32:05', '2023-11-09 01:32:05', NULL),
(6, 6, 3, '12', '17.8', '2023-11-09 01:33:40', '2023-11-09 01:33:40', NULL),
(7, 7, 2, '12', '19.8', '2023-11-09 01:37:05', '2023-11-09 01:37:05', NULL),
(8, 8, 3, '3', '17.8', '2023-11-09 01:37:40', '2023-11-09 01:37:40', NULL),
(9, 9, 8, '2', '25', '2023-11-09 01:38:16', '2023-11-09 01:38:16', NULL),
(10, 10, 9, '4', '20', '2023-11-09 01:39:05', '2023-11-09 01:39:05', NULL),
(11, 11, 2, '8', '19.8', '2023-11-09 01:40:12', '2023-11-09 01:40:12', NULL),
(12, 12, 3, '6', '17.8', '2023-11-09 01:41:06', '2023-11-09 01:41:06', NULL),
(13, 13, 2, '7', '19.8', '2023-11-09 01:43:11', '2023-11-09 01:43:11', NULL),
(14, 14, 3, '11', '17.8', '2023-11-09 01:43:44', '2023-11-09 01:43:44', NULL),
(15, 15, 8, '5', '25', '2023-11-09 01:44:14', '2023-11-09 01:44:14', NULL),
(16, 16, 2, '4', '19.8', '2023-11-09 03:38:01', '2023-11-09 03:38:01', NULL),
(17, 17, 1, '12', '20.8', '2023-11-09 03:38:50', '2023-11-09 03:38:50', NULL),
(18, 18, 9, '12', '20', '2023-11-09 03:39:53', '2023-11-09 03:39:53', NULL),
(19, 19, 9, '9', '20', '2023-11-09 03:40:31', '2023-11-09 03:40:31', NULL),
(20, 20, 3, '5', '17.8', '2023-11-09 03:41:23', '2023-11-09 03:41:23', NULL),
(21, 21, 8, '9', '25', '2023-11-09 03:41:59', '2023-11-09 03:41:59', NULL),
(22, 22, 9, '8', '20', '2023-11-09 03:42:34', '2023-11-09 03:42:34', NULL),
(23, 23, 9, '10', '20', '2023-11-09 03:43:19', '2023-11-09 03:43:19', NULL),
(24, 24, 3, '12', '17.8', '2023-11-09 03:43:53', '2023-11-09 03:43:53', NULL),
(25, 25, 3, '12', '17.8', '2023-11-09 03:48:17', '2023-11-09 03:48:17', NULL),
(26, 26, 10, '9', '30', '2023-11-09 03:50:38', '2023-11-09 03:50:38', NULL),
(27, 27, 8, '6', '25', '2023-11-09 03:51:36', '2023-11-09 03:51:36', NULL),
(28, 28, 2, '8', '19.8', '2023-11-09 03:53:49', '2023-11-09 03:53:49', NULL),
(29, 29, 9, '3', '20', '2023-11-09 03:54:25', '2023-11-09 03:54:25', NULL),
(30, 30, 3, '4', '17.8', '2023-11-09 03:57:30', '2023-11-09 03:57:30', NULL),
(31, 31, 3, '12', '17.8', '2023-11-09 04:08:22', '2023-11-09 04:08:22', NULL),
(32, 32, 3, '6', '17.8', '2023-11-09 04:11:05', '2023-11-09 04:11:05', NULL),
(33, 33, 3, '8', '17.8', '2023-11-09 04:12:10', '2023-11-09 04:12:10', NULL),
(34, 34, 9, '4', '20', '2023-11-09 04:17:31', '2023-11-09 04:17:31', NULL),
(35, 35, 2, '6', '19.8', '2023-11-09 04:19:30', '2023-11-09 04:19:30', NULL),
(36, 36, 10, '7', '30', '2023-11-09 04:20:20', '2023-11-09 04:20:20', NULL),
(37, 37, 2, '12', '19.8', '2023-11-09 04:29:08', '2023-11-09 04:29:08', NULL),
(38, 38, 8, '3', '25', '2023-11-09 04:32:29', '2023-11-09 04:32:29', NULL),
(39, 39, 8, '3', '25', '2023-11-09 04:32:56', '2023-11-09 04:32:56', NULL),
(40, 40, 3, '9', '17.8', '2023-11-09 04:33:22', '2023-11-09 04:33:22', NULL),
(41, 41, 2, '8', '19.8', '2023-11-09 04:54:29', '2023-11-09 04:54:29', NULL),
(42, 42, 2, '8', '19.8', '2023-11-09 04:55:02', '2023-11-09 04:55:02', NULL),
(43, 43, 8, '1', '25', '2023-11-09 04:56:50', '2023-11-09 04:56:50', NULL),
(44, 44, 10, '1', '30', '2023-11-09 04:57:21', '2023-11-09 04:57:21', NULL),
(45, 45, 2, '6', '19.8', '2023-11-09 04:58:43', '2023-11-09 04:58:43', NULL),
(46, 46, 2, '5', '19.8', '2023-11-09 05:52:16', '2023-11-09 05:52:16', NULL),
(47, 47, 10, '1', '30', '2023-11-09 05:52:41', '2023-11-09 05:52:41', NULL),
(48, 48, 3, '4', '17.8', '2023-11-09 05:53:06', '2023-11-09 05:53:06', NULL),
(49, 49, 3, '5', '17.8', '2023-11-09 05:53:33', '2023-11-09 05:53:33', NULL),
(50, 50, 1, '5', '20.8', '2023-11-09 05:53:59', '2023-11-09 05:53:59', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`idAsistencia`),
  ADD KEY `asistencias_idempleado_foreign` (`idEmpleado`),
  ADD KEY `asistencias_idcapacitacion_foreign` (`idCapacitacion`),
  ADD KEY `asistencias_iddepartamento_foreign` (`idDepartamento`);

--
-- Indices de la tabla `capacitacions`
--
ALTER TABLE `capacitacions`
  ADD PRIMARY KEY (`idCapacitacion`),
  ADD KEY `capacitacions_iddepartamento_foreign` (`idDepartamento`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idOrdencompra`),
  ADD KEY `compras_idtipocomprobante_foreign` (`idTipocomprobante`),
  ADD KEY `compras_idtipopago_foreign` (`idTipopago`),
  ADD KEY `compras_idproveedor_foreign` (`idProveedor`),
  ADD KEY `compras_idempleado_foreign` (`idEmpleado`);

--
-- Indices de la tabla `compra_detalles`
--
ALTER TABLE `compra_detalles`
  ADD PRIMARY KEY (`idDetallecompra`),
  ADD KEY `compra_detalles_idordencompra_foreign` (`idOrdencompra`),
  ADD KEY `compra_detalles_idproducto_foreign` (`idProducto`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`idDepartamento`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`idDocumento`),
  ADD KEY `documentos_idtipodocumento_foreign` (`idTipoDocumento`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `empleados_iddepartamento_foreign` (`idDepartamento`),
  ADD KEY `empleados_iduser_foreign` (`idUser`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `productos_idtipoproducto_foreign` (`idTipoproducto`),
  ADD KEY `productos_idunidadmedida_foreign` (`idUnidadmedida`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `solicituds`
--
ALTER TABLE `solicituds`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitud_detalles`
--
ALTER TABLE `solicitud_detalles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_comprobantes`
--
ALTER TABLE `tipo_comprobantes`
  ADD PRIMARY KEY (`idTipocomprobante`);

--
-- Indices de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  ADD PRIMARY KEY (`idTipoDocumento`);

--
-- Indices de la tabla `tipo_pagos`
--
ALTER TABLE `tipo_pagos`
  ADD PRIMARY KEY (`idTipopago`);

--
-- Indices de la tabla `tipo_productos`
--
ALTER TABLE `tipo_productos`
  ADD PRIMARY KEY (`idTipoproducto`);

--
-- Indices de la tabla `unidad_medidas`
--
ALTER TABLE `unidad_medidas`
  ADD PRIMARY KEY (`idUnidadmedida`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `ventas_idtipocomprobante_foreign` (`idTipocomprobante`),
  ADD KEY `ventas_idtipopago_foreign` (`idTipopago`),
  ADD KEY `ventas_idempleado_foreign` (`idEmpleado`);

--
-- Indices de la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  ADD PRIMARY KEY (`idDventa`),
  ADD KEY `venta_detalles_idventa_foreign` (`idVenta`),
  ADD KEY `venta_detalles_idproducto_foreign` (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `idAsistencia` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `capacitacions`
--
ALTER TABLE `capacitacions`
  MODIFY `idCapacitacion` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idOrdencompra` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `compra_detalles`
--
ALTER TABLE `compra_detalles`
  MODIFY `idDetallecompra` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `idDepartamento` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `idDocumento` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `solicituds`
--
ALTER TABLE `solicituds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitud_detalles`
--
ALTER TABLE `solicitud_detalles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_comprobantes`
--
ALTER TABLE `tipo_comprobantes`
  MODIFY `idTipocomprobante` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  MODIFY `idTipoDocumento` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_pagos`
--
ALTER TABLE `tipo_pagos`
  MODIFY `idTipopago` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_productos`
--
ALTER TABLE `tipo_productos`
  MODIFY `idTipoproducto` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `unidad_medidas`
--
ALTER TABLE `unidad_medidas`
  MODIFY `idUnidadmedida` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `idUser` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idVenta` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  MODIFY `idDventa` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `asistencias_idcapacitacion_foreign` FOREIGN KEY (`idCapacitacion`) REFERENCES `capacitacions` (`idCapacitacion`) ON DELETE CASCADE,
  ADD CONSTRAINT `asistencias_iddepartamento_foreign` FOREIGN KEY (`idDepartamento`) REFERENCES `departamentos` (`idDepartamento`) ON DELETE CASCADE,
  ADD CONSTRAINT `asistencias_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE;

--
-- Filtros para la tabla `capacitacions`
--
ALTER TABLE `capacitacions`
  ADD CONSTRAINT `capacitacions_iddepartamento_foreign` FOREIGN KEY (`idDepartamento`) REFERENCES `departamentos` (`idDepartamento`) ON DELETE CASCADE;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE,
  ADD CONSTRAINT `compras_idproveedor_foreign` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`) ON DELETE CASCADE,
  ADD CONSTRAINT `compras_idtipocomprobante_foreign` FOREIGN KEY (`idTipocomprobante`) REFERENCES `tipo_comprobantes` (`idTipocomprobante`) ON DELETE CASCADE,
  ADD CONSTRAINT `compras_idtipopago_foreign` FOREIGN KEY (`idTipopago`) REFERENCES `tipo_pagos` (`idTipopago`) ON DELETE CASCADE;

--
-- Filtros para la tabla `compra_detalles`
--
ALTER TABLE `compra_detalles`
  ADD CONSTRAINT `compra_detalles_idordencompra_foreign` FOREIGN KEY (`idOrdencompra`) REFERENCES `compras` (`idOrdencompra`) ON DELETE CASCADE,
  ADD CONSTRAINT `compra_detalles_idproducto_foreign` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `documentos_idtipodocumento_foreign` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipo_documentos` (`idTipoDocumento`) ON DELETE CASCADE;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_iddepartamento_foreign` FOREIGN KEY (`idDepartamento`) REFERENCES `departamentos` (`idDepartamento`) ON DELETE CASCADE,
  ADD CONSTRAINT `empleados_iduser_foreign` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_idtipoproducto_foreign` FOREIGN KEY (`idTipoproducto`) REFERENCES `tipo_productos` (`idTipoproducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `productos_idunidadmedida_foreign` FOREIGN KEY (`idUnidadmedida`) REFERENCES `unidad_medidas` (`idUnidadmedida`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_idempleado_foreign` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE,
  ADD CONSTRAINT `ventas_idtipocomprobante_foreign` FOREIGN KEY (`idTipocomprobante`) REFERENCES `tipo_comprobantes` (`idTipocomprobante`) ON DELETE CASCADE,
  ADD CONSTRAINT `ventas_idtipopago_foreign` FOREIGN KEY (`idTipopago`) REFERENCES `tipo_pagos` (`idTipopago`) ON DELETE CASCADE;

--
-- Filtros para la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  ADD CONSTRAINT `venta_detalles_idproducto_foreign` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `venta_detalles_idventa_foreign` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
