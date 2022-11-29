-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2022 a las 04:16:14
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portafoliobd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_accomodation`
--

CREATE TABLE `hotel_accomodation` (
  `id` int(11) NOT NULL,
  `accomodation` varchar(30) NOT NULL,
  `description` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hotel_accomodation`
--

INSERT INTO `hotel_accomodation` (`id`, `accomodation`, `description`) VALUES
(12, 'Habitación Estandar', 'Wifi - Estacionamiento'),
(13, 'Estadía', 'Wifi - Estacionamiento'),
(15, 'Habitación Premium', 'Wifi - Estacionamiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_payment`
--

CREATE TABLE `hotel_payment` (
  `id` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `confirmation_code` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `message` tinyint(1) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_reservation`
--

CREATE TABLE `hotel_reservation` (
  `id` int(11) NOT NULL,
  `confirmation_code` varchar(50) NOT NULL,
  `transaction_date` date NOT NULL,
  `room_id` int(11) NOT NULL,
  `arrival` datetime NOT NULL,
  `departure` datetime NOT NULL,
  `room_price` double NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `status` varchar(11) NOT NULL,
  `book_date` datetime NOT NULL,
  `remark` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_room`
--

CREATE TABLE `hotel_room` (
  `id` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `accomodation_id` int(11) NOT NULL,
  `room` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `number_person` int(11) NOT NULL,
  `price` int(10) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `room_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hotel_room`
--

INSERT INTO `hotel_room` (`id`, `room_number`, `accomodation_id`, `room`, `description`, `number_person`, `price`, `picture`, `room_type`) VALUES
(11, 10, 12, 'Dpto. Viña del mar', '-Wifi - Amoblado - Estacionamiento', 1, 30000, '1.jpg', 0),
(12, 12, 12, 'Dpto. La Serena', '-Wifi - Amoblado - Estacionamiento', 2, 27000, '2.jpg', 0),
(13, 1, 13, 'Dpto. Pucón', '-Wifi - Amoblado - Estacionamiento', 1, 25000, '3.jpg', 0),
(14, 2, 13, 'Dpto. Puerto Varas', '-Wifi - Amoblado - Estacionamiento', 2, 26000, '4.jpg', 0),
(15, 1, 15, 'Dpto. Valparaiso', '-Wifi - Amoblado - Estacionamiento', 5, 25000, '5.jpg', 0),
(16, 3, 12, 'Dpto. Cajón del Maipo', '-Wifi - Amoblado - Estacionamiento', 1, 27000, '6.jpg', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_user`
--

CREATE TABLE `hotel_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `address` text NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `role` enum('admin','user') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hotel_user`
--

INSERT INTO `hotel_user` (`id`, `first_name`, `last_name`, `gender`, `email`, `password`, `mobile`, `address`, `created`, `role`) VALUES
(1, 'Jhon', 'Lennon', 'Male', 'admin@reservaciones.com', '202cb962ac59075b964b07152d234b70', '1234567890', '', '2022-10-28 22:45:58', 'admin'),
(2, 'Ryan', 'Smith', 'Male', 'user1@reservaciones.com', '202cb962ac59075b964b07152d234b70', '123456789', '', '2022-10-28 22:45:58', 'user'),
(3, 'Jhon', 'Eyan', 'Male', 'user2@reservaciones.com', '202cb962ac59075b964b07152d234b70', '123456789', '', '2022-10-28 22:45:58', 'user'),
(4, 'Dunkun', 'damian', 'Male', 'user3@reservaciones.com', '202cb962ac59075b964b07152d234b70', '123456789', '', '2022-10-28 22:45:58', 'user'),
(5, NULL, NULL, 'Male', 'sdf', '$2y$10$cJ.zyD.DUuttF2MPv68.qeMJ6eABn9zBDbHKzFfpY7SmP1vSxnd46', '', '', '2022-11-24 18:07:06', NULL),
(6, NULL, NULL, 'Male', 'asad', '$2y$10$FlmBaIuAWvwX49Rm01Tmpuz6j8fNqG2ls/oP7ulwVxaUuKOtmyPea', '', '', '2022-11-24 18:07:10', NULL),
(7, NULL, NULL, 'Male', 'nicow054@gmail.com', '$2y$10$loVCU90OyNH4ybnz3yDiROiKUb/nQ6/fUhM8RQ2dqjdyCtXHPXsLO', '', '', '2022-11-24 18:08:09', NULL),
(8, NULL, NULL, 'Male', 'nicow054@gmail.com', '$2y$10$15DGxgTYzvgwZev4hNJCLumwg9XiZHEVZ98GCSRk7iti3BoU289uq', '', '', '2022-11-24 18:08:13', NULL),
(9, NULL, NULL, 'Male', 'admin@reservaciones.com', '$2y$10$/Wa4T55C/ZZ9loh5zdxp/.LqTvG6x6UFRdMitGYyMjRFdBjHNBt.O', '', '', '2022-11-28 16:44:47', NULL),
(10, NULL, NULL, 'Male', 'admin@reservaciones.com', '$2y$10$bC0.T.aa6A2/i7fomrdAwe8V/sg3UOu1Sd5GVXMVYng8uLtX0rt.i', '', '', '2022-11-28 16:45:44', NULL),
(11, NULL, NULL, 'Male', 'admin@reservaciones.com', '$2y$10$hcY8Y2nFhf68EslyTh/i5OibHcuMHqBPpEWFqXT7c0LtCvOuO3mja', '', '', '2022-11-28 16:46:37', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `hotel_accomodation`
--
ALTER TABLE `hotel_accomodation`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hotel_payment`
--
ALTER TABLE `hotel_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hotel_reservation`
--
ALTER TABLE `hotel_reservation`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hotel_room`
--
ALTER TABLE `hotel_room`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hotel_user`
--
ALTER TABLE `hotel_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `hotel_accomodation`
--
ALTER TABLE `hotel_accomodation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `hotel_payment`
--
ALTER TABLE `hotel_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hotel_reservation`
--
ALTER TABLE `hotel_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hotel_room`
--
ALTER TABLE `hotel_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `hotel_user`
--
ALTER TABLE `hotel_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
