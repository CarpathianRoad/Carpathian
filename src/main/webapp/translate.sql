-- phpMyAdmin SQL Dump
-- version 4.4.15deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 29 2015 г., 15:11
-- Версия сервера: 5.6.25-4
-- Версия PHP: 5.6.14-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `carpath`
--

-- --------------------------------------------------------

--
-- Структура таблицы `translate`
--

CREATE TABLE IF NOT EXISTS `translate` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `UA` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `EN` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `SK` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `HU` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `RO` varchar(300) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `translate`
--

INSERT INTO `translate` (`id`, `name`, `UA`, `EN`, `SK`, `HU`, `RO`) VALUES
(1, 'setCountryALL', 'ВСІ КРАЇНИ', 'ALL COUNTRIES', 'VŠETKY KRAJINY', 'Összes ország', 'TOATE TARILE'),
(2, 'setCountryUA', 'УКРАЇНА', 'UKRAINE', 'UKRAJINA', 'UKRAJNA', 'UCRAINA'),
(3, 'setCountryHU', 'УГОРЩИНА', 'HUNGARY', 'MAĎARSKO', 'MAGYARORSZÁG', 'UNGARIA'),
(4, 'setCountryPL', 'ПОЛЬЩА', 'POLAND', 'POĽSKO', 'LENGYELORSZÁG', 'POLONIA'),
(5, 'setCountrySK', 'СЛОВАЧЧИНА', 'SLOVAKIA', 'SLOVENSKO', 'SZLOVÁKIA', 'SLOVACIA'),
(6, 'setCountryRO', 'РУМУНІЯ', 'ROMANIA', 'RUMUNSKO', 'ROMÁNIA', 'ROM NIA'),
(7, 'setRouteALL', 'ВСІ ВИДИ', 'ALL METHODS', 'všetky metódy', 'Minden módszer', 'Toate metodele'),
(8, 'setRouteBIC', 'ВЕЛОСИПЕДНІ', 'BICYCLE', 'KOLO', 'KERÉKPÁR', 'BICICLETA'),
(9, 'setRouteHOR', 'КІННІ', 'HORSES', 'KONE', 'LÓ', 'CAI'),
(10, 'setRouteSKI', 'ЛИЖНІ', 'SKI', 'lyže', 'sí', 'schi'),
(11, 'setRouteWAL', 'ПІШІ', 'WALK', 'prechádzka', 'séta', 'drumeții'),
(12, 'setRouteWAT', 'ВОДНІ', 'WATER', 'vodnú', 'KERÉKPÁR', 'VÍZ'),
(13, 'country', 'Країна', 'Country', 'Krajina', 'Ország', 'Ţară'),
(14, 'type', 'Тип', 'Type', 'Typ', 'Típus', 'Tip'),
(15, 'title', 'Назва', 'Title', 'Názov', 'Név', 'Titlu'),
(16, 'duration', 'Тривалість', 'Duration', 'Trvania', 'Idő', 'Durată'),
(17, 'length', 'Протяжність', 'Length', 'Dĺžka', 'Hossz', 'Lungime'),
(18, 'description', 'Опис', 'Description', 'Popis', 'Leírás', 'Descriere'),
(19, 'difficulty', 'Складність', 'Difficulty', 'Obtiažnosť', 'Nehézség', 'Dificultate');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `translate`
--
ALTER TABLE `translate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `translate`
--
ALTER TABLE `translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
