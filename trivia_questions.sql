-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: db574822361.db.1and1.com
-- Generation Time: Jan 09, 2020 at 06:21 PM
-- Server version: 5.5.60-0+deb7u1-log
-- PHP Version: 7.0.33-0+deb9u6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db574822361`
--

-- --------------------------------------------------------

--
-- Table structure for table `trivia_questions`
--

CREATE TABLE `trivia_questions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `hidden` varchar(15) COLLATE latin1_german2_ci NOT NULL DEFAULT 'no',
  `question` text COLLATE latin1_german2_ci NOT NULL,
  `answer1` char(100) COLLATE latin1_german2_ci NOT NULL,
  `answer2` char(100) COLLATE latin1_german2_ci NOT NULL,
  `answer3` char(100) COLLATE latin1_german2_ci NOT NULL,
  `answer4` char(100) COLLATE latin1_german2_ci NOT NULL,
  `correct` int(1) NOT NULL,
  `category` varchar(60) COLLATE latin1_german2_ci NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `play_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `day_of_year` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

--
-- Dumping data for table `trivia_questions`
--

INSERT INTO `trivia_questions` (`id`, `user_id`, `hidden`, `question`, `answer1`, `answer2`, `answer3`, `answer4`, `correct`, `category`, `date_added`, `date_updated`, `play_date`, `day_of_year`) VALUES
(1, 1, 'no', 'What actor from the movie \"Dead Poets Society\" plays Dr. James Wilson on the TV show \"House\"?', 'Ethan Hawke', 'Dylan Kussman', 'Robert Sean Leonard', 'James Waterston', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(2, 1, 'no', 'Who played Ferris Bueller in \"Ferris Bueller\'s Day off\"?', 'Tom Hanks', 'Matthew Broderick', 'Alan Ruck', 'Tom Cruise', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(3, 1, 'no', 'A coach with a checkered past and a local drunk train a small town high school basketball team to become a top contender for the championship. What is the name of the movie?', 'Heroes', 'Friday Night Lights', 'Blue Chips', 'Hoosiers', 4, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(4, 1, 'no', 'What actor provided the voice for Darth Vader for the movie Star Wars(1977)?', 'David Prowse', 'James Earl Jones', 'John Paul Jones', 'Sean Connery', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(5, 1, 'no', 'A talented pool hustler has stayed out of the game for years, must go back to his old ways when his little brother gets involved with his enemy, the very man who held him back from greatness. Name this movie?', 'The Color of Money', 'Matchstick Men', 'Poolhall Junkies', 'The Hustler', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(6, 1, 'no', 'What actor portrayed Frodo Baggins in the \"Lord of the Rings\" trilogy? ', 'Elijah Wood', 'John Rhys-Davies', 'Ian Mckellen', 'Sean Astin', 1, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(7, 1, 'no', 'Who portrayed the Joker in \"The Dark Knight (2008)\"?', 'Christan Bale', 'Aaron Eckhart', 'Michael Caine', 'Heath Ledger', 4, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(8, 1, 'no', 'Who was the actor portrayed Gimli in the \"Lord of the Rings\" trilogy?\r', 'Elijah Wood', 'John Rhys-Davis', 'Ian McKellan', 'Sean Astin', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(9, 1, 'no', 'Who played Jor-El in \"Superman (1978)\"?\r', 'Glenn Ford', 'Ned Beatty', 'Christopher Reed', 'Marlon Brando', 4, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(10, 1, 'no', 'Actor Dustin Huffman was a roommate of what other famous actors?\r\n', 'Robert Duvall and Gene Hackman', 'Robert Duvall and Clint Eastwood', 'Robert Redford and Paul Newman', 'Paul Newman and Clint Eastwood', 1, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(11, 1, 'no', 'Who Played George M. Cohan in the movie \"Yankee Doodle Dandy\"?\r', 'James Stewart', 'Fred Astaire', 'James Cagney', 'Gene Kelly', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(12, 1, 'no', 'Who were the two main actors in the movie \"Casablanca\"?\r', 'Humphrey Bogart and Audrey Hepburn', 'Humphrey Bogart and Lauren Bacall', 'Humphrey Bogart and Katharine Hepburn', 'Humphrey Bogart and Ingrid Bergman', 4, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(13, 1, 'no', 'Who starred in the 1954 version of Sabrina?\r', 'Humphrey Bogart and Audrey Hepburn', 'Harrison Ford and Julia Ormond', 'Humphrey Bogart and Lauren Bacall', 'Humphrey Bogart and Katharine Hepburn', 1, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(14, 1, 'no', 'Who starred in the 1995 version of Sabrina?', 'Harrison Ford and Julia Ormond', 'Bill Murray and Julia Ormond', 'Tom Hanks and Julia Ormond', 'Humphrey Bogart and Audrey Hepburn', 1, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(15, 1, 'no', 'What was Gary Sinise Character\'s name in \"Forrest Gump\"?\r\n', 'LT. John Taylor', 'LT. Mike Taylor', 'LT. Tony Taylor', 'LT. Dan Taylor', 4, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(16, 1, 'no', 'Rand Peltzer is warned by the shop\'s owner that three rules must be obeyed by a Mogwai Owner: 1)Keep it away from bright light, 2) Don\'t get any water on it, 3) and never ever feed it after midnight. What is the name of the movie?\r\n', 'Cujo', 'Gremlins', 'Short Circuit', 'The Thing', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(17, 1, 'no', '\"You Maniacs! You blew it up! Ah, damn you! God damn you all to hell! \" What movie did this famous line come from?', 'Planet of the Apes (1968)', 'The Day After Tomorrow', 'The Matrix', 'Soylent Green', 1, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(18, 1, 'no', 'What movie did Charlton Heston win an Oscar for Best Actor?', 'Soylent Green', 'Planet of the Apes', 'Ben-Hur', 'The Ten Commandments', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(19, 1, 'no', 'Clint Eastwood\'s first Academy Awards came from what movie?', 'Gran Torino', 'Unforgiven', 'Pale Rider', 'Hang \'Em High', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(20, 1, 'no', 'Which famous movie actress was known for fruit-laden hats\r', 'Jennifer Lopez', 'Penelope Cruz', 'Carmen Miranda', 'Salma Hayek', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(21, 1, 'no', 'Who is William Abbott and Louis Francis Cristillo better known as?\r\n', 'Martin and Lewis', 'Laurel andHardy', 'Abbott and Costello', 'Conwayand Korman', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(22, 1, 'no', 'What movie did Dennis Hopper make his debut in?\r', 'Rebel Without a Cause', 'True Grit', 'Speed', 'Easy Rider', 1, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(23, 1, 'no', 'Joel had all the normal teenage fantasies...cars, girls, money. Then his parents left for a week, and all his fantasies came true. What is the name of that movie?\r', 'Top Gun', 'Risky Business', 'Hackers', 'The Karate Kid', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(24, 1, 'no', 'Who protrayed Mr. Kesuke Miyagi in \"The Karate Kid\"?', 'Pat Morita', 'Raph Macchio', 'George Takei', 'Masi Oka', 1, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(25, 1, 'no', 'A young boy is arrested for writing a computer virus and is banned from using a computer until his 18th Birthday. What is the name of the movie?', 'The Net', 'Hackers', 'War Games', 'Code Breakers', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(26, 1, 'no', 'What movie did the following come from? \"Ray, people will come Ray. They\'ll come to Iowa for reasons they can\'t even fathom. They\'ll turn up your driveway not knowing for sure why they\'re doing it...\" (Hint: Stars Kevin Costner)\r\n', 'The Natural', 'Field Of Dreams', 'Eight Men Out', 'Pride of the Yankees', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(27, 1, 'no', 'Chevy Chase, Rodney Dangerfield, Ted Knight and Bill Murray where all in this great comedy about golf?\r', 'Tin Cup', 'Caddyshack', 'Caddyshack 2', 'The Legend of Bagger Vance', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(28, 1, 'no', 'Chuck Nolan is stranded on an island and makes a Wilson volleyball his companion. What is the name of this movie?', 'Castaway', 'The Island', 'Cast Away', 'Stranded', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(29, 1, 'no', 'This movie stars Kevin Costener, Rene Russo, Don Johnson, and Cheech Marin and was about a washed up golf pro trying to steal his rival\'s girlfriend. Name the movie?', 'Happy Gilmore', 'Follow the Sun', 'The Legend of Bagger Vance', 'Tin Cup', 4, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(30, 1, 'no', 'Follow the Sun was about what real life golf pro?', 'Bobby Jones', 'Ben Hogan', 'Arnold Palmer', 'Jack Nicklaus', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(31, 1, 'no', 'What actor was born Marion Robert Morrison?', 'John Wayne', 'Glenn Ford', 'Marlon Brando', 'Clint Eastwood', 1, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(32, 1, 'no', 'George Peppard starred with what actress in the movie \"Breakfast at Tiffany\'s (1961)\"?', 'Jane Fonda', 'Katharine Hepburn', 'Audrey Hepburn', 'Claudette Colbert', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(33, 1, 'no', 'The President of the United States crashes into Manhattan, now a giant max. security prison and convicted bank robber is sent in for a rescue. ', 'Escape from New York (1981)', 'Nighthawks', 'Hero at Large', 'Fort Apache the Bronx (1981)', 1, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(34, 1, 'no', 'An alien (played by Jeff Bridges) takes the form of a young widow\'s husband and kidnaps her so she can drive him from Wisconsin to Arizona. Name the movie?', 'Close Encounters of the Third Kind', 'E.T.: The Extra-Terrestrial', 'Starman', 'Starperson', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(35, 1, 'no', 'This movie in 1972 was Directed by Francis Ford Coppola and was about about the mob?', 'Goodfellas', 'Scareface', 'The Godfather', 'The Godfather Part II', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(36, 1, 'no', 'Who played Elliot in E.T.: The Extra-Terrestrial?', 'C. Thomas Howell', 'Matt Dillion', 'Henry Thomas', 'Patrick Swayze', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(37, 1, 'no', 'Who played Ponyboy Curtis in the movie \"The Outsiders\"?', 'C. Thomas Howell', 'Matt Dillion', 'Henry Thomas', 'Patrick Swayze', 1, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(38, 1, 'no', 'What was Patrick Swayze last movie before his untimely death?', 'Power Blue', 'Road House', 'Dirty Dancing', 'Ghost', 1, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(39, 1, 'no', 'A troubled teenager is plagued by visions of a large bunny rabbit that manipulates him to commit a series of crimes, after narrowly escaping a bizarre accident?', 'Edward Scissorhands', 'Donnie Darko', 'Donnie Brasco', 'Flatliners', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(40, 1, 'no', 'What movie had these great actors/actresses: Kevin Bacon, Lori Singer, John Lithgrow, Dianne West, Chris Penn and Sarah Jessica Parker?', 'Girls Just Want to Have Fun', 'Footloose', 'Night of the Comet', 'Dirty Dancing', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(41, 1, 'no', 'Bob Barker has a fight with Adam Sandler in what movie?\r', 'Big Daddy', 'The Waterboy', 'Happy Gilmore', 'Mr. Deeds', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(42, 1, 'no', 'A high-school boy follows an up-and-coming rock band for Rolling Stone Magazine. What is the name of the movie?', 'Almost Famous', 'Fool\'s Gold', '200 Cigarettes', 'This is Spinal Tap', 1, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(43, 1, 'no', 'Who directed the movie \"Stand by Me\"?', 'Penny Marshall', 'Rob Reiner', 'Ron Howard', 'Stephen King', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(44, 1, 'no', '\"Stand By Me\" was based on the novel \"The Body\" which was written by?', 'Rob Reiner', 'Ron Howard', 'Stephen King', 'Abe Kobo', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(45, 1, 'no', 'Name the top two stars of \"The Shawshank Redemption\"?', 'Tom Cruise and Morgan Freeman', 'Tim Robbins and Denzel Washington', 'Morgan Freeman and Denzel Washington', 'Tim Robbins and Morgan Freeman', 4, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(46, 1, 'no', 'Mortimer Duke and Randolph Duke make a $1.00 bet in what movie?', 'Harry and the Hendersons', 'Trading Places', 'Coming to America', 'Cocoon', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(47, 1, 'no', 'Who starred in \"The Long, Long Trailer\"?', 'Katharine Hepburn and Humphrey Bogart', 'Cary Grant and Rosalind Russell', 'Desi Arnaz and Lucille Ball', 'Cary Grant and Lucille Ball', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(48, 1, 'no', 'What famous movie shows a shower scene where Marion Crane(Janet Leigh) gets stabbed to death?', 'Psycho', 'Friday the 13th', 'A Nightmare on Elm Street', 'Halloween', 1, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(49, 1, 'no', 'Who directed Cocoon?', 'Penny Marshall', 'Rob Reiner', 'Ron Howard', 'Henry Wrinkler', 3, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(50, 1, 'no', 'Most of the World\'s population is wiped out on Earth, leaving two Valley Girls to fight the evil types who survive. Name the movie?', 'Armageddon', 'War of the Worlds', 'Deep Impact', 'Night of the Comet', 4, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(51, 1, 'no', 'What famous actor played halfback for Florida State University, only to be injured in the first game of the season? (This ended his NFL dream)\r', 'Adam Sandler', 'Burt Reynolds', 'Tom Selleck', 'Clint Eastwood', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(52, 1, 'no', 'Cary Grant, Victor McLaglen, Douglas Fairbanks Jr. and Sam Jaffe starred in what movie?\r\n', 'The Longest Day', 'Gunga Din', 'Wizard of Oz', 'Gone With the Wind', 2, 'movie', '2014-06-09 14:12:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(53, 1, 'no', 'Sheb Wooley portrayed Cletus in the movie \"Hoosiers\", but is better known for this novelty song?\r\n', 'Alley-Oop', 'The Purple People Eater', 'Witch Doctor', 'Monster Mash', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(54, 1, 'no', 'The Mummy and The Mummy Returns two main stars are?\r', 'Tom Hanks and Rachel Weisz', 'Harrison Ford and Rachel Weisz', 'Tom Hanks and Meg Ryan', 'Brendan Fraser and Rachel Weisz', 4, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(55, 1, 'no', 'Who has won the most Oscars for Best Actress?\r', 'Meryl Streep', 'Katharine Hepburn', 'Audrey Hepburn', 'Jane Fonda', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(56, 1, 'no', 'Jane Russell appeared as Calamity Jane with Bob Hope in what Movie? ', 'The PaleFace', 'Unforgiven', 'Palerider', 'The Man Who Shot Liberty Valance', 1, 'movie', '2014-06-09 14:36:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(57, 1, 'no', 'Who were the first two astronauts to walk on the moon?', 'Neil Armstrong and Edwin Aldrin, Jr.', 'Michael Collins and Neil Armstrong', 'Edwin  Aldrin, Jr. and Clint Eastwood', 'Alan L. Bean and Charles Conrad, Jr.', 1, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(58, 1, 'no', 'What was the date that Neil Armstrong walk on the moon?', 'August 28, 1973', 'March 1, 1967', 'July 20, 1969', 'June 20, 1980', 3, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(59, 1, 'no', 'What does NASA stand for?', 'North American Space Agency', 'National Aeronautics and Space Administration', 'New Age Stuff Administration', 'National Association of Solar Area', 2, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(60, 1, 'no', 'Where did th Mercury, Gemini and Apollo spacecraft land when they returned to Earth?', 'Roswell, NM', 'Florida', 'Pacific or Atlantic', 'Michigan', 3, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(61, 1, 'no', 'Who was the first American woman in space?', 'Sally Munster', 'Sally Walk', 'Sally Ride', 'Valentina Vladimirovna Tereshkova', 3, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(62, 1, 'no', 'Who was the only original Mercury 7 astronaut to walk on the Moon?', 'Alan B. Shepard, Jr.', 'Walter M. Schirra', 'John Glenn', 'Virgil I. \'Gus\' Grissom', 1, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(63, 1, 'no', 'Who was the first man in space?', 'Alan B. Shepard, Jr.', 'John Glenn', 'Yuri A. Gagarin', 'Neil Alden Armstrong', 3, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(64, 1, 'no', 'Who was the first American to orbit the Earth?', 'Alan B. Shepard, Jr.', 'John Glenn', 'Yuri A. Gagarin', 'Neil Alden Armstrong', 2, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(65, 1, 'no', 'Who was the first American in space?', 'Alan B. Shepard, Jr.', 'John Glenn', 'Yuri A. Gagarin', 'Neil Alden Armstrong', 1, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(66, 1, 'no', 'Who was the second person to walk on the Moon?', 'Alan B. Shepard, Jr.', 'Edwin \'Buzz\' Aldrin, Jr.', 'Neil Armstrong', 'Edward Higgins White II', 2, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(67, 1, 'no', 'Who was the first person to break the sound barrier in an aircraft?', 'Capt. Charles E. Yeager', 'Neil Armstrong', 'John Glenn', 'Alan L. Nean', 1, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(68, 1, 'no', 'What Space Shuttle was the first to be launched into space?', 'Challenger', 'Discovery', 'Columbia', 'Atlantis', 3, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(69, 1, 'no', 'How many people have walked on the moon?', '17', '10', '16', '12', 4, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(70, 1, 'no', 'What happened to the Space Shuttle Challenger on January 28, 1986?', 'Shuttle was destroyed during re-entry', 'Shuttle exploded after 73 second of flight', 'Shuttle was first launched!', 'Repaired the Hubble Telescope', 2, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(71, 1, 'no', 'Who was the first American to walk in space?', 'Ed White', 'Alan B. Shepard, Jr.', 'John Glenn', 'Neil Armstrong', 1, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(72, 1, 'no', 'Who was the first person to walk in space?', 'Aleksei Leonov', 'Ed White', 'Yuri A. Gagarin', 'John Glenn', 1, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(73, 1, 'no', 'Who so far is America\'a Oldest Astronaut?', 'Scott Carpentar', 'Gordon Cooper', 'John Glenn', 'Alan B. Shepard, Jr.', 3, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(74, 1, 'no', 'Viking Mission to Mars was composed of how many spacecraft?', '1', '4', '3', '2', 4, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(75, 1, 'no', 'What were the name of the two rovers of the Mars Exploration Rover Mission (MER)?', 'Enterprise and Columbia', 'Spirit and Opportunity', 'Ghost and Spirit', 'Enterprise and Opportunity', 2, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(76, 1, 'no', 'Who was supposed to walk on the moon on the Apollo 13 mission to the moon, but didn\'t because of an incident?', 'Jim Lovell and Jack Swigert', 'Jim Lovell and Fred Haise', 'Jack Swigert and Ken Mattingly', 'Jim Lovell and Ken Mattingly', 2, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(77, 1, 'no', 'What was the first United States space station called?\r', 'MIR', 'Skylab', 'Death Star', 'Moonraker', 2, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(78, 1, 'no', 'What was the United States first space tragedy?', 'Challenger', 'Columbia', 'Apollo 1', 'Hindenburg', 3, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(79, 1, 'no', 'What was the first space probe to leave the solar system?', 'Voyager 2', 'Voyager 1', 'Viking 1', 'Mariner 3', 2, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(80, 1, 'no', 'How many moon landings have there been?', '6', '12', '8', '14', 1, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(81, 1, 'no', 'Who designed the Saturn V rocket that propelled man to the moon?', 'Albert Einstein', 'John F. Kennedy', 'Wernher von Braun', 'Bill Gates', 3, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(82, 1, 'no', 'What Apollo mission was the last to land on the moon?', 'Apollo 16', 'Apollo 13', 'Apollo 15', 'Apollo 17', 4, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(83, 1, 'no', 'What are Saturn\'s rings made of?', 'The rings are made of dust particles.', 'The rings are made of chunks of water ice.', 'The rings are made of milkyways.', 'The rings are made up of gas.', 2, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(84, 1, 'no', 'What is the name of the next generation United States spacecraft this is going to take humans to Mars?', 'Apollo', 'Mecury', 'Aries', 'Orion', 4, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(85, 1, 'no', 'How many planets in our solar system?', '7', '8', '9', '6', 2, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(86, 1, 'no', 'What planet is 3rd from the sun?', 'Venus', 'Mars', 'Earth', 'Saturn', 3, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(87, 1, 'no', 'What four inner solar system planets fall under the category of terrestrial planets?', 'Saturn, Mars, Jupiter, Uranus', 'Mercury, Venus, Earth, and Mars', 'Earth, Mars, Saturn, Neptune', 'Jupiter, Saturn, Mars, Venus', 2, 'space', '2015-05-24 09:15:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(88, 1, 'no', 'What two planets are considered gas giants (composed mainly of hydrogen and helium)?', 'Jupiter and Saturn', 'Uranus and Neptune', 'Mercury and Mars', 'Venus and Mars', 1, 'space', '2015-05-24 09:21:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(89, 1, 'no', 'What two planets are considered ice giants (containing many elements greater than hydrogen and helium)?', 'Jupiter and Saturn', 'Uranus and Neptune', 'Mercury and Mars', 'Venus and Mars', 2, 'space', '2015-05-24 09:23:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(90, 1, 'no', 'What are the eight planets in our solar system?', 'Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus and Pluto', 'Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus and Makemake', 'Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus and Neptune', 'Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus and Ceres', 3, 'space', '2015-05-24 09:37:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(91, 1, 'no', 'What planet was demoted from planetary status and is now considered a dwarf planet?', 'Pluto', 'Ceres', 'MakeMake', 'Neptune', 1, 'space', '2015-05-24 09:46:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(92, 1, 'no', 'What is the closet galaxy to our Milky Way? ', 'Draco Dwarf', 'Andromeda', 'Ursa Minor Dwarf', 'Canis Major Dwarf', 2, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(93, 1, 'no', 'How many moons does Mars have?', '1', '2', '3', '4', 2, 'space', '2015-05-24 09:57:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(94, 1, 'no', 'What are the two moons of Mars called?', 'Phobos and Deimos', 'Dione and Phobos', 'Enceladus and Dione', 'Kari and Dione', 1, 'space', '2015-05-24 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(95, 1, 'no', 'How does a day last on Mercury?', '24 Hours', 'Approximately as long as 59 days on earth', '1 earth year', '2 days', 2, 'space', '2015-05-24 15:58:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(96, 1, 'no', 'Who is the Astronaut that hit 2 golfballs on the moon?', 'Neil Armstrong', 'Buzz Aldrin', 'Buzz Lightyear', 'Alan B. Shepard', 4, 'space', '2015-05-24 22:56:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(97, 1, 'no', 'What is the giant red spot on Jupiter?', 'A land mass', 'A gigantic storm that has been raging for hundred of years', 'There is no red spot on Jupiter', 'Scientists still haven&#39;t determined what the red spot is', 2, 'space', '2015-05-24 23:03:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(98, 1, 'no', 'What was the first spacecraft to visit the planet Venus?', 'Pioneer Venus', 'Magellan', 'Marineer 2', 'Marineer 1', 3, 'space', '2015-05-24 23:08:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(99, 1, 'no', 'This planet is the sixth planet from the Sun and the second largest in the Solar System, after Jupiter. It is a gas giant with an average radius about nine times that of Earth.', 'Mars', 'Saturn', 'Neptune', 'Venus', 2, 'space', '2015-06-15 07:52:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(100, 1, 'no', 'What is the interplanetary space probe that study the planet Pluto, its moons and the Kuiper belt?', 'Voyager 1', 'New Horizons', 'Voyager 2', 'Marineer 1', 2, 'space', '2015-08-14 08:05:55', '2015-09-05 10:45:46', '0000-00-00 00:00:00', -1),
(101, 1, 'no', 'What was the first U.S. Satellite called?', 'Spuknit 1', 'Spuknit 2', 'Explorer 1', 'Exhibition 1', 3, 'space', '2015-08-14 12:54:47', '2015-09-05 10:45:38', '0000-00-00 00:00:00', -1),
(102, 1, 'no', 'This planet is known as the wandering star and is the 4th brightest object in the sky? (after the Sun, Venus and the Moon) ', 'Neptune', 'Saturn', 'Jupiter', 'Mercury', 3, 'space', '2015-08-16 17:38:05', '2015-09-06 08:40:36', '0000-00-00 00:00:00', -1),
(103, 1, 'no', 'What picture won the Oscar for best picture for 2017?', 'La La Land', 'Moonlight', 'Fences', 'Hidden Figures', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(104, 1, 'no', 'Who won the 2017 Oscar for best actor?', 'Denzel Washington - \"Fences\"', 'Ryan Gosling - \"La La Land\"', 'Victor Mortensen - \"Captain Fantastic\"', 'Casey Affleck - \"Manchester by the Sea\"', 4, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(105, 1, 'no', 'Who is the Founder and CEO of SpaceX?', 'Jeff Bezos', 'Larry Page', 'Elon Musk', 'Mark Zuckerberg', 3, 'space', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(106, 1, 'no', 'Who were the two main actors that starred in the \"Lethal Weapon\" movies?', 'Damon Wayans & Clayne Crawford', 'Mel Gibson & Danny Glover', 'Tom Hanks & Clint Eastwood', 'Bob Hope & Bing Crosby', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(107, 3, 'yes', 'jhk', 'hkjhkj', 'hkj', 'hjhkj', 'hkjhkj', 0, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -1),
(108, 1, 'yes', 'Christopher Reeve played what SuperHero?', 'Spiderman', 'Superman', 'Batman', 'The Flash', 2, 'movie', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2020-01-09 12:29:08', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `trivia_questions`
--
ALTER TABLE `trivia_questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `trivia_questions`
--
ALTER TABLE `trivia_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
