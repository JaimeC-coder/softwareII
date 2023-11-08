-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 08-11-2023 a las 14:29:09
-- Versión del servidor: 8.0.34
-- Versión de PHP: 8.2.3

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `idAsistencia` bigint UNSIGNED NOT NULL,
  `idEmpleado` bigint UNSIGNED NOT NULL,
  `idCapacitacion` bigint UNSIGNED NOT NULL,
  `idDepartamento` bigint UNSIGNED NOT NULL,
  `asistio` enum('si','no','justifico') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `justificacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitacions`
--

CREATE TABLE `capacitacions` (
  `idCapacitacion` bigint UNSIGNED NOT NULL,
  `capfechainicio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capfechafin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capcapacitador` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idDepartamento` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idOrdencompra` bigint UNSIGNED NOT NULL,
  `orcomfecha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orcomhora` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orcomdescripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orcomtotal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orcomestado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idTipocomprobante` bigint UNSIGNED NOT NULL,
  `idTipopago` bigint UNSIGNED NOT NULL,
  `idProveedor` bigint UNSIGNED NOT NULL,
  `idEmpleado` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idOrdencompra`, `orcomfecha`, `orcomhora`, `orcomdescripcion`, `orcomtotal`, `orcomestado`, `idTipocomprobante`, `idTipopago`, `idProveedor`, `idEmpleado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2023-11-02', '09:20', 'sdfdsafs', '101.00', 'pagado', 1, 1, 1, 1, '2023-11-08 19:19:33', '2023-11-08 19:19:33', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_detalles`
--

CREATE TABLE `compra_detalles` (
  `idDetallecompra` bigint UNSIGNED NOT NULL,
  `idOrdencompra` bigint UNSIGNED NOT NULL,
  `idProducto` bigint UNSIGNED NOT NULL,
  `dcomcantidad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compra_detalles`
--

INSERT INTO `compra_detalles` (`idDetallecompra`, `idOrdencompra`, `idProducto`, `dcomcantidad`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, '1', '2023-11-08 19:19:33', '2023-11-08 19:19:33', NULL),
(2, 1, 5, '1', '2023-11-08 19:19:33', '2023-11-08 19:19:33', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `idDepartamento` bigint UNSIGNED NOT NULL,
  `depnombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `idDocumento` bigint UNSIGNED NOT NULL,
  `idTipoDocumento` bigint UNSIGNED NOT NULL,
  `docnumero` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `docmonto` double NOT NULL,
  `docsimbolo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documentable_id` bigint UNSIGNED DEFAULT NULL,
  `documentable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`idDocumento`, `idTipoDocumento`, `docnumero`, `docmonto`, `docsimbolo`, `documentable_id`, `documentable_type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, '2', 45.55, '+', 2, 'App\\Models\\Venta', NULL, '2023-11-08 19:14:06', '2023-11-08 19:14:06'),
(2, 1, '1', 101, '-', 1, 'App\\Models\\Compra', NULL, '2023-11-08 19:19:33', '2023-11-08 19:19:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` bigint UNSIGNED NOT NULL,
  `empnombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empapellidop` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empapellidom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empdni` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empdireccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emptelefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idDepartamento` bigint UNSIGNED NOT NULL,
  `idUser` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `empnombres`, `empapellidop`, `empapellidom`, `empdni`, `empdireccion`, `emptelefono`, `idDepartamento`, `idUser`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Jaime Eduardo', 'Centurion', 'Goicochea', '70683607', 'Dirección 99', '981268897', 1, 1, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
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
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('panel','crud','reporte','grafico','otro') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'otro',
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
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
  `idProducto` bigint UNSIGNED NOT NULL,
  `pronombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodescripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `propreciounitario` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propreciocompra` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prostock` int NOT NULL,
  `prostockminimo` int NOT NULL,
  `idTipoproducto` bigint UNSIGNED NOT NULL,
  `idUnidadmedida` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `pronombre`, `prodescripcion`, `propreciounitario`, `propreciocompra`, `prostock`, `prostockminimo`, `idTipoproducto`, `idUnidadmedida`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Gasolina 95', 'Gasolina premium', '20.8', '50.5', 98, 100, 1, 1, '2023-11-08 18:32:32', '2023-11-08 19:14:06', NULL),
(2, 'Gasolina 90', 'Gasolina super', '19.8', '50.5', 1000000, 100, 1, 1, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(3, 'Gasolina 84', 'Gasolina normal', '17.8', '50.5', 999999, 100, 1, 1, '2023-11-08 18:32:32', '2023-11-08 19:14:06', NULL),
(4, 'Espejos para carros', 'Espejos para carros', NULL, '50.5', 50, 2, 4, 3, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(5, 'Espejos para motos kirin', 'Espejos para motos', NULL, '50.5', 50, 2, 4, 3, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(6, 'Llantas para carro Michelin', 'Llantas para carros', '70', '50.5', 100, 4, 4, 3, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(7, 'Llantas para motos kirin', 'Llantas para motos', '120', '50.5', 100, 4, 4, 3, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(8, 'Aceite 10w40', 'Aceite para motor', '25', '50.5', 50, 2, 3, 2, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(9, 'Aceite 10w30', 'Aceite para motor', '20', '50.5', 50, 2, 3, 2, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(10, 'Aceite 20w50', 'Aceite para motor', '30', '50.5', 50, 2, 4, 2, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(11, 'Mangeras de combustible', 'Mangera donde pasa el combustible', NULL, '50.5', 30, 2, 2, 3, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL),
(12, 'Mangeras de incendio', 'Mangera para extintor', NULL, '50.5', 30, 2, 2, 3, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` bigint UNSIGNED NOT NULL,
  `provdoc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provtelefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provcorreo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provdireccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provrazonsocial` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('panel','cargo') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cargo',
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
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
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
(71, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(1, 8),
(7, 8),
(8, 8),
(9, 8),
(10, 8),
(11, 8),
(12, 8),
(13, 8),
(14, 8),
(15, 8),
(16, 8),
(1, 9),
(1, 10),
(12, 10),
(13, 10),
(14, 10),
(15, 10),
(16, 10),
(1, 11),
(7, 11),
(8, 11),
(9, 11),
(10, 11),
(11, 11),
(12, 11),
(13, 11),
(14, 11),
(15, 11),
(16, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('etLTMb9eEvlTvPy1dm2EZ6zsP8mWqb1rkn1wzCgu', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiR3k0WG9mUlpyWU5ZRlNBMDhZcHZ2clJuQ1R6cmZIN3l2ZjlRRDVFTSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvY29tcHJhcy8xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRBR3lnT2V5WUdyRFF3RkhJL3Y1YVFlZ3F6RTVkbm41a29CWGU4MXpWdXNCcmJzUEx4N09IbSI7czoxODoiYWRtaW5sdGVfZGFya19tb2RlIjtiOjA7fQ==', 1699453670),
('pxcBnnE22XE9sYIHeMnm9mllrCUyW6nosjdhAwcH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUk1Jb1FMMW9yR0ExOFI2SENmdVlYYzNvZHlPTjVZRDF6a05kb3RHbiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovL2xvY2FsaG9zdDo4MDAwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1699453328);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicituds`
--

CREATE TABLE `solicituds` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_detalles`
--

CREATE TABLE `solicitud_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_comprobantes`
--

CREATE TABLE `tipo_comprobantes` (
  `idTipocomprobante` bigint UNSIGNED NOT NULL,
  `tcomcomprobante` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `idTipoDocumento` bigint UNSIGNED NOT NULL,
  `tidDocumento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `idTipopago` bigint UNSIGNED NOT NULL,
  `tpagotipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `idTipoproducto` bigint UNSIGNED NOT NULL,
  `tpronombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `idUnidadmedida` bigint UNSIGNED NOT NULL,
  `umednombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `idUser` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idUser`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Jaime Eduardo Centurion', 'admin@example.com', NULL, '$2y$10$AGygOeyYGrDQwFHI/v5aQegqzE5dnn5koBXe81zVusBrbsPLx7OHm', NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-08 18:32:32', '2023-11-08 18:32:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVenta` bigint UNSIGNED NOT NULL,
  `venfecha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendocumentocliente` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vennombrecliente` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cliente generico',
  `venhora` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venestado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pagado',
  `venmonto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venimpuesto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ventotalneto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venobservacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idTipocomprobante` bigint UNSIGNED NOT NULL,
  `idTipopago` bigint UNSIGNED NOT NULL,
  `idEmpleado` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idVenta`, `venfecha`, `vendocumentocliente`, `vennombrecliente`, `venhora`, `venestado`, `venmonto`, `venimpuesto`, `ventotalneto`, `venobservacion`, `idTipocomprobante`, `idTipopago`, `idEmpleado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, '2023-11-01', '333333', 'cliente generico', '09:13', 'pagado', '38.60', '6.95', '45.55', 'fsadfas', 2, 1, 1, '2023-11-08 19:14:06', '2023-11-08 19:14:06', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalles`
--

CREATE TABLE `venta_detalles` (
  `idDventa` bigint UNSIGNED NOT NULL,
  `idVenta` bigint UNSIGNED NOT NULL,
  `idProducto` bigint UNSIGNED NOT NULL,
  `dvcantidad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dvpreciounitario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `venta_detalles`
--

INSERT INTO `venta_detalles` (`idDventa`, `idVenta`, `idProducto`, `dvcantidad`, `dvpreciounitario`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, '1', '20.8', '2023-11-08 19:14:06', '2023-11-08 19:14:06', NULL),
(2, 2, 3, '1', '17.8', '2023-11-08 19:14:06', '2023-11-08 19:14:06', NULL);

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
  MODIFY `idAsistencia` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `capacitacions`
--
ALTER TABLE `capacitacions`
  MODIFY `idCapacitacion` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idOrdencompra` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compra_detalles`
--
ALTER TABLE `compra_detalles`
  MODIFY `idDetallecompra` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `idDepartamento` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `idDocumento` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `solicituds`
--
ALTER TABLE `solicituds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitud_detalles`
--
ALTER TABLE `solicitud_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_comprobantes`
--
ALTER TABLE `tipo_comprobantes`
  MODIFY `idTipocomprobante` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  MODIFY `idTipoDocumento` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_pagos`
--
ALTER TABLE `tipo_pagos`
  MODIFY `idTipopago` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_productos`
--
ALTER TABLE `tipo_productos`
  MODIFY `idTipoproducto` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `unidad_medidas`
--
ALTER TABLE `unidad_medidas`
  MODIFY `idUnidadmedida` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `idUser` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idVenta` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  MODIFY `idDventa` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
