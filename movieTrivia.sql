-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: db2448.perfora.net
-- Generation Time: Jan 08, 2020 at 08:22 PM
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
-- Table structure for table `movieTrivia`
--

CREATE TABLE `movieTrivia` (
  `id` int(11) NOT NULL,
  `confirm` enum('yes','no') COLLATE latin1_german2_ci NOT NULL,
  `question` text COLLATE latin1_german2_ci NOT NULL,
  `answerA` char(50) COLLATE latin1_german2_ci NOT NULL,
  `answerB` char(50) COLLATE latin1_german2_ci NOT NULL,
  `answerC` char(50) COLLATE latin1_german2_ci NOT NULL,
  `answerD` char(50) COLLATE latin1_german2_ci NOT NULL,
  `correct` int(1) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

--
-- Dumping data for table `movieTrivia`
--

INSERT INTO `movieTrivia` (`id`, `confirm`, `question`, `answerA`, `answerB`, `answerC`, `answerD`, `correct`, `dateAdded`) VALUES
(1, 'yes', 'What actor from the movie \"Dead Poets Society\" plays Dr. James Wilson on the TV show \"House\"?  ', 'Ethan Hawke', 'Tom Cruise', 'Robert Sean Leonard', 'James Waterston', 3, '2014-06-27 13:56:40'),
(2, 'yes', 'Who played Ferris Bueller in \"Ferris Bueller\'s Day off\"?', 'Tom Hanks', 'Matthew Broderick', 'Alan Ruck', 'Tom Cruise', 2, '2014-06-09 19:21:08'),
(3, 'yes', 'A coach with a checkered past and a local drunk train a small town high school basketball team to become a top contender for the championship. What is the name of the movie?', 'Heroes', 'Friday Night Lights', 'Blue Chips', 'Hoosiers', 4, '2014-06-11 00:11:30'),
(4, 'yes', 'What actor provided the voice for Darth Vader for the movie Star Wars(1977)?', 'David Prowse', 'James Earl Jones', 'John Paul Jones', 'Sean Connery', 2, '2014-06-27 13:09:23'),
(5, 'yes', 'A talented pool hustler has stayed out of the game for years, must go back to his old ways when his little brother gets involved with his enemy, the very man who held him back from greatness. What is the name of this movie?', 'The Color of Money', 'Matchstick Men', 'Poolhall Junkies', 'The Hustler', 3, '2014-06-24 16:35:24'),
(6, 'yes', 'What actor portrayed Frodo Baggins in the \"Lord of the Rings\" trilogy? ', 'Elijah Wood', 'John Rhys-Davies', 'Ian Mckellen', 'Sean Astin', 1, '0000-00-00 00:00:00'),
(7, 'yes', 'Who portrayed the Joker in \"The Dark Knight (2008)\"?', 'Christan Bale', 'Aaron Eckhart', 'Michael Caine', 'Heath Ledger', 4, '0000-00-00 00:00:00'),
(12, 'yes', 'Who was the actor portrayed Gimli in the \"Lord of the Rings\" trilogy?\r', 'Elijah Wood', 'John Rhys-Davis', 'Ian McKellan', 'Sean Astin', 2, '0000-00-00 00:00:00'),
(13, 'yes', 'Who played Jor-El in \"Superman (1978)\"?\r', 'Glenn Ford', 'Ned Beatty', 'Christopher Reed', 'Marlon Brando', 4, '0000-00-00 00:00:00'),
(14, 'yes', 'Actor Dustin Huffman was a roommate of what other famous actors?\r\n', 'Robert Duvall and Gene Hackman', 'Robert Duvall and Clint Eastwood', 'Robert Redford and Paul Newman', 'Paul Newman and Clint Eastwood', 1, '0000-00-00 00:00:00'),
(16, 'yes', 'Who portrayed George M. Cohan in the movie \"Yankee Doodle Dandy\"?', 'James Stewart', 'Fred Astaire', 'James Cagney', 'Gene Kelly', 3, '2014-06-24 16:36:28'),
(17, 'yes', 'Who were the two main actors in the movie \"Casablanca\"?\r', 'Humphrey Bogart and Audrey Hepburn', 'Humphrey Bogart and Lauren Bacall', 'Humphrey Bogart and Katharine Hepburn', 'Humphrey Bogart and Ingrid Bergman', 4, '0000-00-00 00:00:00'),
(18, 'yes', 'Who starred in the 1954 version of Sabrina?\r', 'Humphrey Bogart and Audrey Hepburn', 'Harrison Ford and Julia Ormond', 'Humphrey Bogart and Lauren Bacall', 'Humphrey Bogart and Katharine Hepburn', 1, '0000-00-00 00:00:00'),
(19, 'yes', 'Who starred in the 1995 version of Sabrina?', 'Harrison Ford and Julia Ormond', 'Bill Murray and Julia Ormond', 'Tom Hanks and Julia Ormond', 'Humphrey Bogart and Audrey Hepburn', 1, '0000-00-00 00:00:00'),
(20, 'yes', 'What was Gary Sinise Character\'s name in \"Forrest Gump\"?\r\n', 'LT. John Taylor', 'LT. Mike Taylor', 'LT. Tony Taylor', 'LT. Dan Taylor', 4, '0000-00-00 00:00:00'),
(21, 'yes', 'Rand Peltzer is warned by the shop\'s owner that three rules must be obeyed by a Mogwai Owner: 1)Keep it away from bright light, 2) Don\'t get any water on it, 3) and never ever feed it after midnight. What is the name of the movie?\r\n', 'Cujo', 'Gremlins', 'Short Circuit', 'The Thing', 2, '0000-00-00 00:00:00'),
(22, 'yes', '\"You Maniacs! You blew it up! Ah, damn you! God damn you all to hell! \" What movie did this famous line come from?', 'Planet of the Apes (1968)', 'The Day After Tomorrow', 'The Matrix', 'Soylent Green', 1, '0000-00-00 00:00:00'),
(23, 'yes', 'What movie did Charlton Heston win an Oscar for Best Actor?', 'Soylent Green', 'Planet of the Apes', 'Ben-Hur', 'The Ten Commandments', 3, '0000-00-00 00:00:00'),
(24, 'yes', 'Clint Eastwood\'s first Academy Awards came from what movie?', 'Gran Torino', 'Unforgiven', 'Pale Rider', 'Hang \'Em High', 2, '0000-00-00 00:00:00'),
(25, 'yes', 'Which famous movie actress was known for fruit-laden hats\r', 'Jennifer Lopez', 'Penelope Cruz', 'Carmen Miranda', 'Salma Hayek', 3, '0000-00-00 00:00:00'),
(26, 'yes', 'Who is William Abbott and Louis Francis Cristillo better known as?\r\n', 'Martin and Lewis', 'Laurel andHardy', 'Abbott and Costello', 'Conwayand Korman', 3, '0000-00-00 00:00:00'),
(27, 'yes', 'What movie did Dennis Hopper make his debut in?\r', 'Rebel Without a Cause', 'True Grit', 'Speed', 'Easy Rider', 1, '0000-00-00 00:00:00'),
(28, 'yes', 'Joel had all the normal teenage fantasies...cars, girls, money. Then his parents left for a week, and all his fantasies came true. What is the name of that movie?\r', 'Top Gun', 'Risky Business', 'Hackers', 'The Karate Kid', 2, '0000-00-00 00:00:00'),
(29, 'yes', 'Who protrayed Mr. Kesuke Miyagi in \"The Karate Kid\"?', 'Pat Morita', 'Raph Macchio', 'George Takei', 'Masi Oka', 1, '0000-00-00 00:00:00'),
(30, 'yes', 'A young boy is arrested for writing a computer virus and is banned from using a computer until his 18th Birthday. What is the name of the movie?', 'The Net', 'Hackers', 'War Games', 'Code Breakers', 2, '0000-00-00 00:00:00'),
(31, 'yes', 'What movie did the following come from? \"Ray, people will come Ray. They\'ll come to Iowa for reasons they can\'t even fathom. They\'ll turn up your driveway not knowing for sure why they\'re doing it...\" (Hint: Stars Kevin Costner)\r\n', 'The Natural', 'Field Of Dreams', 'Eight Men Out', 'Pride of the Yankees', 2, '0000-00-00 00:00:00'),
(32, 'yes', 'Chevy Chase, Rodney Dangerfield, Ted Knight and Bill Murray where all in this great comedy about golf?\r', 'Tin Cup', 'Caddyshack', 'Caddyshack 2', 'The Legend of Bagger Vance', 2, '0000-00-00 00:00:00'),
(33, 'yes', 'Chuck Nolan is stranded on an island and makes a Wilson volleyball his companion. What is the name of this movie?', 'Castaway', 'The Island', 'Cast Away', 'Stranded', 3, '0000-00-00 00:00:00'),
(34, 'yes', 'This movie stars Kevin Costener, Rene Russo, Don Johnson, and Cheech Marin and was about a washed up golf pro trying to steal his rival\'s girlfriend. Name the movie?', 'Happy Gilmore', 'Follow the Sun', 'The Legend of Bagger Vance', 'Tin Cup', 4, '0000-00-00 00:00:00'),
(35, 'yes', 'Follow the Sun was about what real life golf pro?', 'Bobby Jones', 'Ben Hogan', 'Arnold Palmer', 'Jack Nicklaus', 2, '0000-00-00 00:00:00'),
(36, 'yes', 'What actor was born Marion Robert Morrison?', 'John Wayne', 'Glenn Ford', 'Marlon Brando', 'Clint Eastwood', 1, '0000-00-00 00:00:00'),
(37, 'yes', 'George Peppard starred with what actress in the movie \"Breakfast at Tiffany\'s (1961)\"?', 'Jane Fonda', 'Katharine Hepburn', 'Audrey Hepburn', 'Claudette Colbert', 3, '0000-00-00 00:00:00'),
(38, 'yes', 'The President of the United States crashes into Manhattan, now a giant max. security prison and convicted bank robber is sent in for a rescue. ', 'Escape from New York (1981)', 'Nighthawks', 'Hero at Large', 'Fort Apache the Bronx (1981)', 1, '0000-00-00 00:00:00'),
(39, 'yes', 'An alien (played by Jeff Bridges) takes the form of a young widow\'s husband and kidnaps her so she can drive him from Wisconsin to Arizona. Name the movie?', 'Close Encounters of the Third Kind', 'E.T.: The Extra-Terrestrial', 'Starman', 'Starperson', 3, '0000-00-00 00:00:00'),
(40, 'yes', 'This movie in 1972 was Directed by Francis Ford Coppola and was about about the mob?', 'Goodfellas', 'Scareface', 'The Godfather', 'The Godfather Part II', 3, '0000-00-00 00:00:00'),
(41, 'yes', 'Who played Elliot in E.T.: The Extra-Terrestrial?', 'C. Thomas Howell', 'Matt Dillion', 'Henry Thomas', 'Patrick Swayze', 3, '0000-00-00 00:00:00'),
(42, 'yes', 'Who played Ponyboy Curtis in the movie \"The Outsiders\"?', 'C. Thomas Howell', 'Matt Dillion', 'Henry Thomas', 'Patrick Swayze', 1, '0000-00-00 00:00:00'),
(43, 'yes', 'What was Patrick Swayze last movie before his untimely death?', 'Power Blue', 'Road House', 'Dirty Dancing', 'Ghost', 1, '0000-00-00 00:00:00'),
(44, 'yes', 'A troubled teenager is plagued by visions of a large bunny rabbit that manipulates him to commit a series of crimes, after narrowly escaping a bizarre accident?', 'Edward Scissorhands', 'Donnie Darko', 'Donnie Brasco', 'Flatliners', 2, '0000-00-00 00:00:00'),
(45, 'yes', 'What movie had these great actors/actresses: Kevin Bacon, Lori Singer, John Lithgrow, Dianne West, Chris Penn and Sarah Jessica Parker?', 'Girls Just Want to Have Fun', 'Footloose', 'Night of the Comet', 'Dirty Dancing', 2, '0000-00-00 00:00:00'),
(46, 'yes', 'Bob Barker has a fight with Adam Sandler in what movie?\r', 'Big Daddy', 'The Waterboy', 'Happy Gilmore', 'Mr. Deeds', 3, '0000-00-00 00:00:00'),
(47, 'yes', 'A high-school boy follows an up-and-coming rock band for Rolling Stone Magazine. What is the name of the movie?', 'Almost Famous', 'Fool\'s Gold', '200 Cigarettes', 'This is Spinal Tap', 1, '0000-00-00 00:00:00'),
(48, 'yes', 'Who directed the movie \"Stand by Me\"?', 'Penny Marshall', 'Rob Reiner', 'Ron Howard', 'Stephen King', 2, '0000-00-00 00:00:00'),
(49, 'yes', '\"Stand By Me\" was based on the novel \"The Body\" which was written by?', 'Rob Reiner', 'Ron Howard', 'Stephen King', 'Abe Kobo', 3, '0000-00-00 00:00:00'),
(50, 'yes', 'Name the top two stars of \"The Shawshank Redemption\"?', 'Tom Cruise and Morgan Freeman', 'Tim Robbins and Denzel Washington', 'Morgan Freeman and Denzel Washington', 'Tim Robbins and Morgan Freeman', 4, '0000-00-00 00:00:00'),
(51, 'yes', 'Mortimer Duke and Randolph Duke make a $1.00 bet in what movie?', 'Harry and the Hendersons', 'Trading Places', 'Coming to America', 'Cocoon', 2, '0000-00-00 00:00:00'),
(52, 'yes', 'Who starred in \"The Long, Long Trailer\"?', 'Katharine Hepburn and Humphrey Bogart', 'Cary Grant and Rosalind Russell', 'Desi Arnaz and Lucille Ball', 'Cary Grant and Lucille Ball', 3, '0000-00-00 00:00:00'),
(53, 'yes', 'What famous movie shows a shower scene where Marion Crane(Janet Leigh) gets stabbed to death?', 'Psycho', 'Friday the 13th', 'A Nightmare on Elm Street', 'Halloween', 1, '0000-00-00 00:00:00'),
(54, 'yes', 'Who directed Cocoon?', 'Penny Marshall', 'Rob Reiner', 'Ron Howard', 'Henry Wrinkler', 3, '0000-00-00 00:00:00'),
(55, 'yes', 'Most of the World\'s population is wiped out on Earth, leaving two Valley Girls to fight the evil types who survive. Name the movie?', 'Armageddon', 'War of the Worlds', 'Deep Impact', 'Night of the Comet', 4, '0000-00-00 00:00:00'),
(56, 'yes', 'What famous actor played halfback for Florida State University, only to be injured in the first game of the season? (This ended his NFL dream)\r', 'Adam Sandler', 'Burt Reynolds', 'Tom Selleck', 'Clint Eastwood', 2, '0000-00-00 00:00:00'),
(57, 'yes', 'Cary Grant, Victor McLaglen, Douglas Fairbanks Jr. and Sam Jaffe starred in what movie?\r\n', 'The Longest Day', 'Gunga Din', 'Wizard of Oz', 'Gone With the Wind', 2, '2014-06-09 20:21:04'),
(59, 'yes', 'Sheb Wooley portrayed Cletus in the movie \"Hoosiers\", but is better known for this novelty song?\r\n', 'Alley-Oop', 'The Purple People Eater', 'Witch Doctor', 'Monster Mash', 2, '0000-00-00 00:00:00'),
(60, 'yes', 'The Mummy and The Mummy Returns two main stars are?\r', 'Tom Hanks and Rachel Weisz', 'Harrison Ford and Rachel Weisz', 'Tom Hanks and Meg Ryan', 'Brendan Fraser and Rachel Weisz', 4, '0000-00-00 00:00:00'),
(61, 'yes', 'Who has won the most Oscars for Best Actress?\r', 'Meryl Streep', 'Katharine Hepburn', 'Audrey Hepburn', 'Jane Fonda', 2, '0000-00-00 00:00:00'),
(62, 'yes', 'Jane Russell appeared as Calamity Jane with Bob Hope in what Movie?\r\n', 'The PaleFace', 'True Grit', 'Palerider', 'The Man Who Shot Liberty Valance', 1, '2014-06-09 21:54:56'),
(65, 'yes', 'A United States Navy destroyer escort participates in a Navy \"invisibility\" experiment that inadvertently sends two sailors 40 years into the future. What is the name of the movie?', 'The Manhattan Project', 'The Philadelphia Experiment', 'The Invisible Men', 'The Final Countdown', 2, '2014-06-10 19:12:28'),
(66, 'yes', 'Name the movie where a golf course has to deal with an obnoxious new member and a destructive dancing gopher? ', 'Meatballs', 'Tootsie', 'Tin Cup', 'Caddyshack', 4, '2014-06-10 19:53:02'),
(67, 'yes', 'Who played Colonel James Braddock in the \"Missing in Action\" movie Series?', 'Tom Cruise', 'Tom Selleck', 'Clint Eastwood', 'Chuck Norris', 4, '2014-06-10 19:55:40'),
(68, 'yes', 'Who was not offered the role of Harry Callahan in the movie \"Dirty Harry\"?', 'John Wayne', 'Frank Sinatra', 'Paul Newman', 'Robert Mitchum', 3, '2014-06-22 13:55:44'),
(69, 'yes', 'This actor had a trouble youth and spent time in reform schools, but went on to become a great movie star. He died of mesothelioma in 1980, but is still considered hip and cool, and he endures as an icon of popular culture. Who is this actor?', 'John Wayne', 'Henry Fonda', 'Paul Newman', 'Steve McQueen', 4, '2014-06-23 03:43:36'),
(70, 'yes', 'This actor won an Oscar for his performance as Terry Malloy in \"On the Waterfront\"(1954). Who was the actor?', 'Charlton Heston', 'Marlon Brando', 'Henry Fonda', 'Clint Eastwood', 2, '2014-06-23 12:26:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movieTrivia`
--
ALTER TABLE `movieTrivia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movieTrivia`
--
ALTER TABLE `movieTrivia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
