-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: db2448.perfora.net
-- Generation Time: Jan 08, 2020 at 08:25 PM
-- Server version: 5.5.60-0+deb7u1-log
-- PHP Version: 7.0.33-0+deb9u6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db329926348`
--

-- --------------------------------------------------------

--
-- Table structure for table `nasaTrivia`
--

CREATE TABLE `nasaTrivia` (
  `id` int(11) NOT NULL,
  `question` text COLLATE latin1_german2_ci NOT NULL,
  `answerA` char(50) COLLATE latin1_german2_ci NOT NULL,
  `answerB` char(50) COLLATE latin1_german2_ci NOT NULL,
  `answerC` char(50) COLLATE latin1_german2_ci NOT NULL,
  `answerD` char(50) COLLATE latin1_german2_ci NOT NULL,
  `correct` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

--
-- Dumping data for table `nasaTrivia`
--

INSERT INTO `nasaTrivia` (`id`, `question`, `answerA`, `answerB`, `answerC`, `answerD`, `correct`) VALUES
(1, 'Who were the first two astronauts to walk on the moon?', 'Neil Armstrong and Edwin Aldrin, Jr.', 'Michael Collins and Neil Armstrong', 'Edwin  Aldrin, Jr. and Michael Collins', 'Alan L. Bean and Charles Conrad, Jr.', 1),
(2, 'What was the date that Neil Armstrong walk on the moon?', 'August 28, 1974', 'March 1, 1967', 'July 20, 1969', 'June 20, 1980', 3),
(3, 'What does NASA stand for?', 'North American Space Agency', 'National Aeronautics and Space Administration', 'New Age Stuff Administration', 'National Association of Solar Area', 2),
(4, 'Where did th Mercury, Gemini and Apollo spacecraft land when they returned to Earth?', 'Roswell, NM', 'Florida', 'Pacific or Atlantic', 'Michigan', 3),
(5, 'Who was the first American woman in space?', 'Sally Fields', 'Sally Struthers', 'Sally Ride', 'Valentina Vladimirovna Tereshkova', 3),
(6, 'Who was the only original Mercury 7 astronaut to walk on the Moon?', 'Alan B. Sheppard', 'Walter M. Schirra', 'John Glenn', 'Virgil I. \'Gus\' Grissom', 1),
(7, 'Who was the first man in space?', 'Alan B. Shepard, Jr.', 'John Glenn', 'Yuri A. Gagarin', 'Neil Alden Armstrong', 3),
(8, 'Who was the first American to orbit the Earth?', 'Alan B. Sheppard, Jr.', 'John Glenn', 'Yuri A. Gagarin', 'Neil Alden Armstrong', 2),
(9, 'Who was the first American in space?', 'Alan B. Shepard, Jr.', 'John Glenn', 'Yuri A. Gagarin', 'Neil Alden Armstrong', 1),
(10, 'Who was the second person to walk on the Moon?', 'Alan B. Sheppard', 'Edwin \'Buzz\' Aldrin, Jr.', 'Neil Armstrong', 'Edward Higgins White II', 2),
(11, 'Who was the first person to break the sound barrier in an aircraft', 'Capt. Charles E. Yeager', 'Neil Armstrong', 'John Glenn', 'Alan L. Nean', 1),
(12, 'What Space Shuttle was the first to be launched into space?', 'Challenger', 'Discovery', 'Columbia', 'Atlantis', 3),
(13, 'How many people have walked on the moon?', '17', '10', '16', '12', 4),
(14, 'What happened to the Space Shuttle Challenger on January 28, 1986?', 'Shuttle was destroyed during re-entry', 'Shuttle exploded after 73 second of flight', 'Nothing', 'Repaired the Hubble Telescope', 2),
(15, 'Who was the first American to walk in space?', 'Ed White', 'Alan B. Shepard, Jr.', 'John Glenn', 'Neil Armstrong', 1),
(16, 'Who was the first person to walk in space?', 'Aleksei Leonov', 'Ed White', 'Yuri A. Gagarin', 'John Glenn', 1),
(17, 'Who so far is America\'a Oldest Astronaut?', 'Scott Carpentar', 'Gordon Cooper', 'John Glenn', 'Alan B. Shepard, Jr.', 3),
(18, 'Viking Mission to Mars was composed of how many spacecraft?', '1', '4', '3', '2', 4),
(19, 'What were the name of the two rovers of the Mars Exploration Rover Mission (MER)?', 'Enterprise and Columbia', 'Spirit and Opportunity', 'Ghost and Spirit', 'Enterprise and Opportunity', 2),
(20, 'Who was supposed to walk on the moon on the Apollo 13 mission to the moon, but didn\'t because of an incident?', 'Jim Lovell and Jack Swigert', 'Jim Lovell and Fred Haise', 'Jack Swigert and Ken Mattingly', 'Jim Lovell and Ken Mattingly', 2),
(21, 'What was the first United States space station called?\r', 'MIR', 'Skylab', 'Death Star', 'Moonraker', 2),
(22, 'What was the United States first space tragedy?', 'Challenger', 'Columbia', 'Apollo 1', 'Hindenburg', 3),
(23, 'What was the first space probe to leave the solar system?', 'Voyager 2', 'Voyager 1', 'Viking 1', 'Mariner 3', 2),
(24, 'How many moon landings have there been?', '6', '12', '8', '14', 1),
(25, 'Who designed the Saturn V rocket that propelled man to the moon', 'Albert Einstein', 'John F. Kennedy', 'Wernher von Braun', 'Bill Gates', 3),
(26, 'What Apollo mission was the last to land on the moon?', 'Apollo 16', 'Apollo 13', 'Apollo 15', 'Apollo 17', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nasaTrivia`
--
ALTER TABLE `nasaTrivia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nasaTrivia`
--
ALTER TABLE `nasaTrivia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
