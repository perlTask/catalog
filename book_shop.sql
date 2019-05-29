-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 16 2019 г., 04:03
-- Версия сервера: 5.5.58
-- Версия PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `book_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `author` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`id`, `author`) VALUES
(1, 'Стивен Кинг'),
(2, 'Джон Р. Р. Толкиен');

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `title`, `description`, `price`) VALUES
(1, 'Кристина', 'Это была любовь с первого взгляда. Когда семнадцатилетний Арни увидел Кристину, он понял: они должны принадлежать друг другу. Однако остальные не разделяли его восторга. Лучший друг Деннис сразу же проникся к Кристине недоверием. Подружка, первая школьная красавица, ревновала Арни к Кристине и боялась ее. Но вскоре и близкие, и враги Арни поймут, что случается, если перейти Кристине дорогу. Потому что Кристина — не девушка, а порожденная Злом машина смерти…', 200),
(2, 'Хоббит', 'В 1937 году был написан \"Хоббит\", а в середине 1950-х годов увидели свет три книги \"Властелина колец\", повествующие о Средиземье - мире, населенном представителями волшебных рас со сложной культурой, историей и мифологией.', 150);

-- --------------------------------------------------------

--
-- Структура таблицы `books_authors`
--

CREATE TABLE `books_authors` (
  `id` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  `authorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `books_authors`
--

INSERT INTO `books_authors` (`id`, `bookID`, `authorID`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `books_genres`
--

CREATE TABLE `books_genres` (
  `id` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  `genreID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `books_genres`
--

INSERT INTO `books_genres` (`id`, `bookID`, `genreID`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `genre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genres`
--

INSERT INTO `genres` (`id`, `genre`) VALUES
(1, 'Ужасы'),
(2, 'Фэнтези');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `books_authors`
--
ALTER TABLE `books_authors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookID` (`bookID`),
  ADD KEY `authorID` (`authorID`);

--
-- Индексы таблицы `books_genres`
--
ALTER TABLE `books_genres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookID` (`bookID`),
  ADD KEY `genreID` (`genreID`);

--
-- Индексы таблицы `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `books_authors`
--
ALTER TABLE `books_authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `books_genres`
--
ALTER TABLE `books_genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `books_authors`
--
ALTER TABLE `books_authors`
  ADD CONSTRAINT `books_authors_ibfk_1` FOREIGN KEY (`bookID`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `FK_books-authors_authors` FOREIGN KEY (`authorID`) REFERENCES `authors` (`id`);

--
-- Ограничения внешнего ключа таблицы `books_genres`
--
ALTER TABLE `books_genres`
  ADD CONSTRAINT `books_genres_ibfk_1` FOREIGN KEY (`bookID`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `FK_books-genres_genres` FOREIGN KEY (`genreID`) REFERENCES `genres` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;