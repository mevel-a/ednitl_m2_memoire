-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 04 juin 2023 à 13:18
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `punr`
--

-- --------------------------------------------------------

--
-- Structure de la table `about`
--

DROP TABLE IF EXISTS `about`;
CREATE TABLE IF NOT EXISTS `about` (
  `aIdent` tinyint(3) UNSIGNED NOT NULL,
  `sIdent` tinyint(3) UNSIGNED NOT NULL,
  `asImportance` tinyint(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`aIdent`,`sIdent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `about`
--

INSERT INTO `about` (`aIdent`, `sIdent`, `asImportance`) VALUES
(1, 1, 0),
(1, 2, 1),
(1, 3, 3),
(1, 4, 1),
(1, 5, 2),
(1, 6, 3),
(1, 7, 3),
(1, 26, 3),
(1, 27, 3),
(2, 2, 1),
(2, 3, 2),
(2, 4, 0),
(2, 5, 1),
(2, 6, 2),
(2, 8, 2),
(2, 9, 3),
(2, 14, 2),
(2, 16, 3),
(2, 18, 2),
(2, 19, 2),
(2, 20, 2),
(2, 22, 2),
(2, 23, 3),
(2, 26, 2),
(2, 27, 2),
(3, 2, 1),
(3, 3, 3),
(3, 4, 0),
(3, 5, 1),
(3, 6, 3),
(3, 7, 3),
(3, 12, 3),
(3, 13, 3),
(3, 14, 3),
(3, 19, 2),
(3, 20, 2),
(3, 23, 3),
(3, 24, 2),
(3, 25, 2),
(3, 26, 3),
(4, 2, 3),
(4, 4, 0),
(4, 6, 3),
(4, 7, 3),
(4, 8, 1),
(4, 10, 1),
(4, 11, 1),
(4, 14, 1),
(4, 16, 2),
(4, 17, 1),
(4, 20, 3),
(4, 21, 2),
(4, 22, 2),
(4, 27, 3),
(5, 1, 0),
(5, 2, 2),
(5, 4, 1),
(6, 2, 0),
(6, 3, 2),
(6, 4, 2),
(6, 5, 2),
(6, 14, 1),
(6, 17, 1),
(6, 20, 2),
(6, 22, 2),
(6, 26, 1),
(6, 27, 3),
(7, 2, 0),
(7, 4, 1),
(7, 7, 2),
(7, 14, 2),
(7, 15, 3),
(7, 16, 3),
(7, 20, 2),
(7, 26, 2),
(8, 2, 0),
(8, 4, 1),
(8, 6, 1),
(8, 8, 3),
(8, 10, 3),
(8, 11, 3),
(8, 14, 2),
(8, 17, 3),
(8, 24, 2),
(8, 25, 3),
(8, 27, 2),
(9, 2, 0),
(9, 4, 1),
(9, 6, 1),
(9, 9, 3),
(9, 10, 3),
(9, 11, 3),
(9, 14, 3),
(9, 17, 2),
(9, 19, 2),
(9, 20, 2),
(9, 24, 2),
(10, 2, 0),
(10, 4, 1),
(10, 7, 2),
(10, 19, 2),
(10, 20, 2),
(10, 26, 2),
(11, 2, 1),
(11, 3, 3),
(11, 4, 0),
(11, 5, 1),
(11, 6, 2),
(11, 7, 2),
(11, 8, 3),
(11, 10, 2),
(11, 15, 3),
(11, 16, 3),
(11, 17, 3),
(11, 19, 2),
(11, 20, 2),
(11, 22, 3),
(11, 23, 3),
(11, 24, 2),
(11, 25, 2),
(11, 26, 3),
(12, 2, 1),
(12, 3, 3),
(12, 4, 0),
(12, 5, 2),
(12, 6, 2),
(12, 7, 3),
(12, 10, 3),
(12, 17, 3),
(12, 18, 3),
(12, 19, 3),
(12, 20, 3),
(12, 22, 2),
(12, 23, 2),
(12, 24, 2),
(12, 26, 3),
(12, 27, 3),
(13, 1, 1),
(13, 2, 2),
(13, 3, 3),
(13, 4, 0),
(13, 5, 2),
(13, 6, 3),
(13, 7, 3),
(13, 8, 3),
(13, 10, 3),
(13, 11, 3),
(13, 12, 3),
(13, 13, 3),
(13, 14, 3),
(13, 15, 2),
(13, 16, 2),
(13, 17, 3),
(13, 18, 2),
(13, 19, 2),
(13, 20, 1),
(13, 22, 2),
(13, 23, 1),
(13, 24, 1),
(13, 25, 3),
(13, 27, 3);

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `aIdent` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aTitle` varchar(150) NOT NULL,
  `aOrder` tinyint(2) UNSIGNED NOT NULL,
  `aPageBegining` tinyint(3) UNSIGNED NOT NULL,
  `aPageEnd` tinyint(3) UNSIGNED NOT NULL,
  `aDateFirst` year(4) DEFAULT NULL,
  `aDateLast` year(4) DEFAULT NULL,
  PRIMARY KEY (`aIdent`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`aIdent`, `aTitle`, `aOrder`, `aPageBegining`, `aPageEnd`, `aDateFirst`, `aDateLast`) VALUES
(1, 'À quoi servent les théories', 1, 7, 15, 1955, 1963),
(2, 'Une voie pour le roman futur', 2, 17, 27, 1956, NULL),
(3, 'Sur quelques notions périmées', 3, 29, 53, 1957, NULL),
(4, 'Nature, humanisme, tragédie', 4, 55, 84, 1958, NULL),
(5, 'Éléments d\'une anthologie moderne', 5, 85, 141, NULL, NULL),
(6, 'Énigmes et transparence chez Raymond Roussel', 6, 87, 94, 1963, NULL),
(7, 'La conscience malade de Zeno', 7, 96, 101, 1954, NULL),
(8, 'Joë Bousquet le rêveur', 8, 102, 117, 1953, NULL),
(9, 'Samuel Beckett, ou la présence sur la scène', 9, 119, 135, 1953, 1957),
(10, 'Un roman qui s\'invente lui-même', 10, 136, 142, 1954, NULL),
(11, 'Nouveau roman, homme nouveau', 11, 143, 153, 1961, NULL),
(12, 'Temps et descriptions dans le récit d\'aujourd\'hui', 12, 155, 169, 1963, NULL),
(13, 'Du réalisme à la réalité', 13, 171, 183, 1955, 1963);

-- --------------------------------------------------------

--
-- Structure de la table `firstpublications`
--

DROP TABLE IF EXISTS `firstpublications`;
CREATE TABLE IF NOT EXISTS `firstpublications` (
  `fpIdent` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fpTitle` varchar(150) NOT NULL,
  `fpDate` varchar(20) NOT NULL,
  `fpSrcTitle` varchar(30) NOT NULL,
  `fpSrcNature` varchar(20) NOT NULL,
  `fpSrcType` varchar(20) NOT NULL,
  `fpSrcNum` smallint(3) UNSIGNED DEFAULT NULL,
  `fpPageBegining` smallint(4) UNSIGNED DEFAULT NULL,
  `fpPageEnd` smallint(4) UNSIGNED DEFAULT NULL,
  `aIdent` tinyint(3) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`fpIdent`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `firstpublications`
--

INSERT INTO `firstpublications` (`fpIdent`, `fpTitle`, `fpDate`, `fpSrcTitle`, `fpSrcNature`, `fpSrcType`, `fpSrcNum`, `fpPageBegining`, `fpPageEnd`, `aIdent`) VALUES
(1, 'Samuel Beckett, Auteur dramatique', '1953/02', 'Critique', 'revue', 'specialisée', 69, 108, 114, 9),
(2, 'Joë Bousquet le rêveur', '1953/10', 'Critique', 'revue', 'specialisée', 77, 819, 829, 8),
(3, 'Un roman qui s\'invente lui-même', '1954/01', 'Critique', 'revue', 'specialisée', 80, 82, 88, 10),
(4, 'La conscience malade de Zeno', '1954/07', 'Nouvelle Revue Française', 'revue', 'specialisée', 19, 138, 141, 7),
(5, 'Une voie pour le roman future', '1956/07', 'Nouvelle Revue Française', 'revue', 'specialisée', 43, 77, 84, 2),
(6, 'Écrire pour son temps', '1957/10/10', 'France Observateur', 'magazine', 'généraliste', 387, 17, 17, 3),
(7, 'Il n\'y a pas \"d\'avant-garde\"', '1957/10/17', 'France Observateur', 'magazine', 'généraliste', 388, 19, 19, 3),
(8, 'La mort du personnage', '1957/10/24', 'France Observateur', 'magazine', 'généraliste', 389, 20, 20, 3),
(9, 'Un joli talent de conteur', '1957/10/31', 'France Observateur', 'magazine', 'généraliste', 390, 19, 19, 3),
(10, 'La forme et le contenu', '1957/11/14', 'France Observateur', 'magazine', 'généraliste', 392, 19, 19, 3),
(11, 'Nature, Humanisme, Tragédie', '1958/10', 'Nouvelle Revue Française', 'revue', 'specialisée', 70, 580, 603, 4),
(12, 'Nouveau roman, homme nouveau', '1961/09', 'Revue de Paris', 'revue', 'specialisée', 68, 115, 121, 11),
(13, 'Samuel Beckett ou la présence sur la scène', '1963/02', 'Critique', 'revue', 'specialisée', 69, 108, 114, 9),
(14, 'Comment mesurer l\'inventeur des mesures ?', '1963/06/20', 'L\'Express', 'quotidien', 'généraliste', 627, 44, 45, 12),
(15, 'La littérature, aujourd\'hui - VI', '1963 été', 'Tel Quel', 'revue', 'specialisée', 14, 39, 45, 1),
(16, 'Énigmes et transparences chez Raymond Roussel', '1963/12', 'Critique', 'revue', 'specialisée', 199, 1027, 1033, 6),
(17, 'Réalisme et révolution', '1955/01/03', 'L\'Express', 'quotidien', 'généraliste', NULL, 15, 15, 2),
(18, 'Il écrit comme Stendhal', '1955/10/25', 'L\'Express', 'quotidien', 'généraliste', NULL, 8, 8, 1),
(19, 'Littérature engagée, littérature réactionnaire', '1955/12/20', 'L\'Express', 'quotidien', 'généraliste', NULL, 11, 11, 3),
(20, 'Le réalisme socialiste est bourgeois', '1956/02/21', 'L\'Express', 'quotidien', 'généraliste', NULL, 11, 11, 3),
(21, 'Monsieur personne répond... Pour un « nouveau roman »', '1963/12/05-11', 'Le Figaro Littéraire', 'quotidien', 'généraliste', NULL, 1, 26, 13),
(22, 'Pour un réalisme de la présence', '1956/01/17', 'L\'Express', 'quotidien', 'généraliste', NULL, 11, 11, 2);

-- --------------------------------------------------------

--
-- Structure de la table `mention`
--

DROP TABLE IF EXISTS `mention`;
CREATE TABLE IF NOT EXISTS `mention` (
  `aIdent` tinyint(3) UNSIGNED NOT NULL,
  `ttIdent` tinyint(3) UNSIGNED NOT NULL,
  `mAxiologicStatus` varchar(12) NOT NULL,
  `mReferenceStatus` tinyint(1) NOT NULL,
  PRIMARY KEY (`aIdent`,`ttIdent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `mention`
--

INSERT INTO `mention` (`aIdent`, `ttIdent`, `mAxiologicStatus`, `mReferenceStatus`) VALUES
(1, 1, 'éloge', 1),
(7, 2, 'éloge', 0),
(7, 3, 'indifférent', 1),
(7, 4, 'indifférent', 1),
(2, 5, 'indifférent', 1),
(3, 6, 'blâme', 0),
(3, 7, 'blâme', 1),
(11, 7, 'blâme', 1),
(12, 7, 'blâme', 1),
(13, 7, 'blâme', 1),
(3, 8, 'blâme', 1),
(11, 8, 'éloge', 1),
(3, 9, 'éloge', 1),
(11, 9, 'éloge', 1),
(12, 9, 'éloge', 1),
(3, 10, 'éloge', 1),
(11, 10, 'éloge', 1),
(3, 11, 'éloge', 1),
(11, 11, 'éloge', 1),
(3, 12, 'blâme', 3),
(4, 12, 'indifférent', 2),
(3, 13, 'éloge', 1),
(3, 14, 'blâme', 1),
(4, 15, 'éloge', 0),
(4, 16, 'blâme', 0),
(4, 17, 'blâme', 0),
(4, 18, 'blâme', 4),
(4, 19, 'blâme', 4),
(4, 20, 'indifférent', 1),
(4, 21, 'indifférent', 1),
(6, 22, 'éloge', 0),
(8, 22, 'éloge', 1),
(7, 23, 'indifférent', 1),
(11, 23, 'éloge', 1),
(8, 24, 'éloge', 0),
(8, 25, 'indifférent', 1),
(8, 26, 'indifférent', 1),
(11, 26, 'éloge', 1),
(12, 26, 'éloge', 1),
(8, 27, 'éloge', 0),
(9, 28, 'éloge', 0),
(10, 29, 'éloge', 0),
(11, 30, 'éloge', 1),
(11, 31, 'éloge', 1),
(11, 32, 'éloge', 1),
(13, 32, 'éloge', 1),
(13, 33, 'ambiguë', 1),
(13, 34, 'ambiguë', 1),
(13, 35, 'blâme', 1),
(3, 36, 'blâme', 4),
(3, 37, 'éloge', 1),
(4, 37, 'blâme', 0),
(3, 38, 'éloge', 1),
(4, 38, 'blâme', 0),
(3, 39, 'éloge', 1),
(3, 40, 'blâme', 1),
(3, 41, 'ambiguë', 3),
(11, 41, 'blâme', 0),
(3, 42, 'éloge', 0),
(4, 42, 'éloge', 0),
(4, 43, 'blâme', 4),
(4, 44, 'blâme', 0),
(4, 45, 'blâme', 0),
(4, 46, 'indifférent', 0),
(6, 47, 'éloge', 1),
(6, 48, 'éloge', 0),
(7, 49, 'indifférent', 1),
(7, 50, 'indifférent', 1),
(7, 51, 'indifférent', 1),
(9, 51, 'éloge', 1),
(8, 52, 'éloge', 0),
(9, 53, 'éloge', 1),
(9, 54, 'éloge', 1),
(9, 55, 'éloge', 1),
(9, 56, 'éloge', 0),
(9, 57, 'éloge', 4),
(10, 58, 'éloge', 0),
(10, 59, 'éloge', 0),
(10, 60, 'indifférent', 1),
(11, 61, 'éloge', 1),
(11, 62, 'blâme', 1),
(12, 63, 'éloge', 1),
(12, 64, 'éloge', 1),
(12, 65, 'éloge', 1),
(13, 66, 'éloge', 1),
(13, 67, 'éloge', 1),
(13, 68, 'éloge', 1),
(13, 69, 'éloge', 1),
(13, 70, 'éloge', 1),
(1, 71, 'ambiguë', 3),
(1, 72, 'ambiguë', 3),
(2, 73, 'blâme', 3),
(9, 74, 'éloge', 0),
(12, 75, 'éloge', 3),
(13, 76, 'blâme', 0),
(13, 78, 'blâme', 3),
(4, 77, 'ambiguë', 4),
(1, 79, 'blâme', 2),
(11, 79, 'blâme', 2),
(1, 80, 'blâme', 2),
(11, 80, 'blâme', 2),
(12, 80, 'blâme', 2),
(1, 81, 'blâme', 2),
(11, 81, 'blâme', 2),
(1, 82, 'blâme', 2),
(11, 82, 'blâme', 2),
(1, 83, 'blâme', 2),
(4, 83, 'blâme', 2),
(3, 84, 'blâme', 2),
(2, 85, 'blâme', 3),
(3, 86, 'blâme', 2),
(1, 87, 'blâme', 2),
(2, 88, 'blâme', 2),
(3, 89, 'blâme', 2),
(4, 90, 'éloge', 2),
(6, 91, 'blâme', 2),
(11, 92, 'blâme', 0),
(3, 93, 'blâme', 3),
(6, 94, 'éloge', 2),
(1, 95, 'blâme', 3),
(3, 96, 'blâme', 2),
(3, 97, 'ambiguë', 3),
(3, 98, 'blâme', 1),
(4, 99, 'ambiguë', 1),
(13, 99, 'blâme', 1),
(4, 100, 'blâme', 1),
(4, 101, 'blâme', 1),
(4, 102, 'blâme', 1),
(4, 103, 'blâme', 0),
(3, 104, 'éloge', 2),
(4, 105, 'blâme', 4),
(13, 105, 'ambiguë', 1),
(4, 106, 'éloge', 4),
(11, 107, 'éloge', 3),
(8, 108, 'éloge', 0),
(13, 108, 'ambiguë', 1),
(12, 109, 'blâme', 2),
(13, 109, 'blâme', 2),
(12, 110, 'blâme', 2),
(13, 110, 'blâme', 2),
(13, 111, 'ambiguë', 1),
(13, 112, 'ambiguë', 1),
(13, 113, 'ambiguë', 2),
(13, 114, 'blâme', 2),
(13, 115, 'blâme', 2),
(13, 116, 'blâme', 0),
(13, 117, 'blâme', 2),
(13, 118, 'blâme', 2),
(13, 119, 'blâme', 2),
(13, 120, 'blâme', 3),
(13, 121, 'blâme', 2),
(13, 122, 'blâme', 2),
(6, 123, 'blâme', 1),
(12, 124, 'blâme', 1);

-- --------------------------------------------------------

--
-- Structure de la table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `sIdent` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sDomain` varchar(55) NOT NULL,
  PRIMARY KEY (`sIdent`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `subjects`
--

INSERT INTO `subjects` (`sIdent`, `sDomain`) VALUES
(1, 'seuil'),
(2, 'critique littéraire synchronique'),
(3, 'théorie littéraire XIXe'),
(4, 'théorie littéraire XXe'),
(5, 'théorie littéraire synchronique'),
(6, 'histoire littéraire française synchronique'),
(7, 'histoire littéraire internationale synchronique'),
(8, 'existentialisme français XXe'),
(9, 'existentialisme allemand XXe'),
(10, 'phénoménologie allemande XXe'),
(11, 'phénoménologie française XXe'),
(12, 'politique française XXe'),
(13, 'politique internationale XXe'),
(14, 'métaphysique synchronique'),
(15, 'science et technique'),
(16, 'anthropologie synchronique'),
(17, 'humanisme'),
(18, 'cinéma'),
(19, 'personnage'),
(20, 'narration'),
(21, 'tragique'),
(22, 'description'),
(23, 'réalisme'),
(24, 'formalisme'),
(25, 'engagement'),
(26, 'psychologie'),
(27, 'histoire de l\'art synchronique');

-- --------------------------------------------------------

--
-- Structure de la table `transtexts`
--

DROP TABLE IF EXISTS `transtexts`;
CREATE TABLE IF NOT EXISTS `transtexts` (
  `ttIdent` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ttNature` varchar(20) NOT NULL,
  `ttTitle` varchar(60) DEFAULT NULL,
  `ttAuthor` varchar(50) DEFAULT NULL,
  `ttDateFirst` varchar(4) DEFAULT NULL,
  `ttDateLast` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ttIdent`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `transtexts`
--

INSERT INTO `transtexts` (`ttIdent`, `ttNature`, `ttTitle`, `ttAuthor`, `ttDateFirst`, `ttDateLast`) VALUES
(1, 'œuvre', 'Fictions', 'Borges Jorge Luis', '1944', '1956'),
(2, 'œuvre', 'La Conscience de Zeno', 'Svevo Italo', '1923', '1954'),
(3, 'œuvre', 'Michael Kohlhaas', 'Kleist (von) Heinrich', '1810', '1830'),
(4, 'œuvre', 'Le Procès', 'Kafka Franz', '1925', '1933'),
(5, 'auteur', NULL, 'Schönberg Arnold', '1874', '1951'),
(6, 'auteur', NULL, 'Clouard Henri', '1889', '1974'),
(7, 'auteur', NULL, 'Balzac Honoré', '1799', '1850'),
(8, 'auteur', NULL, 'Dostoïevski Fedor', '1821', '1881'),
(9, 'auteur', NULL, 'Faulkner William', '1897', '1962'),
(10, 'auteur', NULL, 'Kafka Franz', '1883', '1924'),
(11, 'auteur', NULL, 'Beckett Samuel', '1906', '1989'),
(12, 'auteur', NULL, 'Sartre Jean-Paul', '1905', '1980'),
(13, 'auteur', NULL, 'Ehrenburg Ilya', '1891', '1967'),
(14, 'auteur', NULL, 'Jdanov Andreï', '1896', '1948'),
(15, 'auteur', NULL, 'Barthes Roland', '1915', '1980'),
(16, 'auteur', NULL, 'Mauriac François', '1885', '1970'),
(17, 'auteur', NULL, 'Rousseaux André', '1896', '1973'),
(18, 'auteur', NULL, 'Musset (de) Alphonse', '1810', '1857'),
(19, 'auteur', NULL, 'Hugo Victor', '1802', '1885'),
(20, 'auteur', NULL, 'Pascal Blaise', '1623', '1662'),
(21, 'auteur', NULL, 'Paulhan Jean', '1884', '1968'),
(22, 'auteur', NULL, 'Roussel Raymond', '1877', '1933'),
(23, 'auteur', NULL, 'Joyce James', '1882', '1941'),
(24, 'auteur', NULL, 'Bousquet Joë', '1897', '1950'),
(25, 'auteur', NULL, 'Sade (de) Donatien Alphonse François', '1740', '1814'),
(26, 'auteur', NULL, 'Proust Marcel', '1871', '1922'),
(27, 'auteur', NULL, 'Breton André', '1893', '1966'),
(28, 'auteur', NULL, 'Heidegger Martin', '1889', '1976'),
(29, 'auteur', NULL, 'Pinget Robert', '1919', '1997'),
(30, 'auteur', NULL, 'Robbe-Grillet Alain', '1922', '2008'),
(31, 'auteur', NULL, 'Simon Claude', '1913', '2005'),
(32, 'auteur', NULL, 'Flaubert Gustave', '1821', '1880'),
(33, 'auteur', NULL, 'Claudel Paul', '1868', '1955'),
(34, 'auteur', NULL, 'Camus Albert', '1913', '1960'),
(35, 'auteur', NULL, 'Zola Émile', '1840', '1902'),
(36, 'concept', 'caratères', '[Hugo Victor]', '1838', NULL),
(37, 'œuvre', 'La Nausée', 'Sartre Jean-Paul', '1938', NULL),
(38, 'œuvre', 'L\'Étranger', 'Camus Albert', '1942', NULL),
(39, 'œuvre', 'Voyage au bout de la nuit', 'Céline Louis-Ferdinand', '1932', NULL),
(40, 'œuvre', 'Le Père Goriot', 'Balzac Honoré', '1842', NULL),
(41, 'œuvre', 'Qu\'est-ce que la littérature', 'Sartre Jean-Paul', '1948', NULL),
(42, 'œuvre', 'L\'Ère du soupçon', 'Sarraute Nathalie', '1956', NULL),
(43, 'œuvre', 'Le Vallon', 'Lamartine (de) Alphonse', '1820', NULL),
(44, 'œuvre', 'Situations I', 'Sartre Jean-Paul', '1947', NULL),
(45, 'œuvre', 'Le Parti pris des choses', 'Ponge Francis', '1942', NULL),
(46, 'œuvre', 'Le Sentiment tragique de la vie', 'Unamono (de) Miguel', '1912', NULL),
(47, 'œuvre', 'Le Chateau des Pyrénées', 'Magritte René', '1959', NULL),
(48, 'œuvre', 'Locus Solus', 'Roussel Raymond', '1914', NULL),
(49, 'œuvre', 'Les Frères Karamazov', 'Dostoïevski Fedor', '1880', NULL),
(50, 'œuvre', 'Moby Dick', 'Melville Herman', '1851', NULL),
(51, 'œuvre', 'Molloy', 'Beckett Samuel', '1951', NULL),
(52, 'œuvre', 'Le Meneur de lune', 'Bousquet Joë', '1946', NULL),
(53, 'œuvre', 'Murphy', 'Beckett Samuel', '1938', NULL),
(54, 'œuvre', 'Malone meurt', 'Beckett Samuel', '1951', NULL),
(55, 'œuvre', 'L\'Innomable', 'Beckett Samuel', '1953', NULL),
(56, 'œuvre', 'En attendant Godot', 'Beckett Samuel', '1952', NULL),
(57, 'œuvre', '[Oh les beaux jours!]', 'Beckett Samuel', '1961', NULL),
(58, 'œuvre', 'Mahu ou le matériaux', 'Pinget Robert', '1952', NULL),
(59, 'œuvre', 'Le Renard et la Boussole', 'Pinget Robert', '1953', NULL),
(60, 'œuvre', 'L’Ingénieux Hidalgo Don Quichotte de la Manche', 'Cervantes (de) Miguel', '1615', NULL),
(61, 'œuvre', 'La Chartreuse de Parme', 'Stendhal', '1841', NULL),
(62, 'œuvre', 'Le Médecin de campagne', 'Balzac Honoré', '1833', NULL),
(63, 'œuvre', 'L\'Immortelle', 'Robbe-Grillet Alain', '1963', NULL),
(64, 'œuvre', 'L\'Année dernière à Marienbad', 'Resnais Alain', '1961', NULL),
(65, 'œuvre', 'La Jalousie', 'Robbe-Grillet Alain', '1957', NULL),
(66, 'œuvre', 'Le Voyeur', 'Robbe-Grillet Alain', '1955', NULL),
(67, 'œuvre', 'Le Chiendent', 'Queneau Raymond', '1933', NULL),
(68, 'œuvre', 'Loin de Rueil', 'Queneau Raymond', '1944', NULL),
(69, 'œuvre', 'Journal', 'Kafka Franz', '1945', NULL),
(70, 'œuvre', 'Le Château', 'Kafka Franz', '1926', NULL),
(71, 'concept', 'école du regard', '[Barthes Roland]', NULL, NULL),
(72, 'concept', 'Roman objectif', '[Barthes Roland]', NULL, NULL),
(73, 'concept', 'le cœur romantique de choses', 'un essayiste contemporain', NULL, NULL),
(74, 'concept', 'être là [dasein]', 'Heidegger', NULL, NULL),
(75, 'concept', 'Balzac [selon Barthes]', '[Barthes Roland]', NULL, NULL),
(76, 'concept', 'bon sens', 'Descartes René', NULL, NULL),
(77, 'concept', 'Tragédie', '[Barthes Roland]', NULL, NULL),
(78, 'concept', 'effet de réel', '[Barthes Roland]', NULL, NULL),
(79, 'articles', 'critiques de Les Gommes', NULL, NULL, NULL),
(80, 'articles', 'critiques de Le Voyeur', NULL, NULL, NULL),
(81, 'articles', 'éloges dans la presse', NULL, NULL, NULL),
(82, 'articles', 'éloges dans les revues', NULL, NULL, NULL),
(83, 'articles', 'réactions aux articles dans l\'express', NULL, NULL, NULL),
(84, 'articles', 'reproche des révolutionnaires les plus zélés', NULL, NULL, NULL),
(85, 'œuvre', 'un de nos plus célèbres dictionnaires encyclopédiques', NULL, NULL, NULL),
(86, 'courant artistique', 'réalisme socialiste', NULL, NULL, NULL),
(87, 'auteur', 'jeune écrivan d\'aujourd\'hui', NULL, NULL, NULL),
(88, 'entité collective', 'la plupart de nos romanciers contemporains', NULL, NULL, NULL),
(89, 'entité collective', 'les plus sérieux essayistes', NULL, NULL, NULL),
(90, 'entité collective', 'quelques esprits engagés dans des recherches comparables', NULL, NULL, NULL),
(91, 'entité collective', 'certains matérialistes', NULL, NULL, NULL),
(92, 'entité collective', 'on [les critiques]', NULL, NULL, NULL),
(93, 'œuvre', 'dessin satirique russe', NULL, NULL, NULL),
(94, 'genre', 'roman noir', NULL, NULL, NULL),
(95, 'concept', 'École de minuit', NULL, NULL, NULL),
(96, 'concept', '[antonomase]', NULL, NULL, NULL),
(97, 'concept', 'littérature de laboratoire', NULL, NULL, NULL),
(98, 'concept', 'Russie et ses républiques [URSS]', NULL, NULL, NULL),
(99, 'concept', 'humanisme', NULL, NULL, NULL),
(100, 'concept', 'valeurs de la chrétienté', NULL, NULL, NULL),
(101, 'concept', 'fées des contes', NULL, NULL, NULL),
(102, 'concept', 'la Nature', NULL, NULL, NULL),
(103, 'concept', 'Œdipe (mythe)', NULL, NULL, NULL),
(104, 'concept', '[république moderne]', NULL, NULL, NULL),
(105, 'courant artistique', '[romantisme]', NULL, NULL, NULL),
(106, 'concept', '[altérité]', NULL, NULL, NULL),
(107, 'concept', 'objet', NULL, NULL, NULL),
(108, 'courant littéraire', 'surréalisme', NULL, NULL, NULL),
(109, 'articles', 'réactions à L\'Immortelle', NULL, NULL, NULL),
(110, 'articles', 'interprétations de L\'Année dernière à Marienbad', NULL, NULL, NULL),
(111, 'courant artistique', 'classiques', NULL, NULL, NULL),
(112, 'courant artistique', 'naturalisme', NULL, NULL, NULL),
(113, 'entité collective', 'les engagés', NULL, NULL, NULL),
(114, 'entité collective', 'la critique soviétique', NULL, NULL, NULL),
(115, 'entité collective', 'la critique bourgeoise', NULL, NULL, NULL),
(116, 'entité collective', 'la critique académique', NULL, NULL, NULL),
(117, 'articles', 'critiques de La Jalousie', NULL, NULL, NULL),
(118, 'concept', 'rationalisme des siècles passés', NULL, NULL, NULL),
(119, 'entité collective', 'les prétendus descendants de Kafka', NULL, NULL, NULL),
(120, 'concept', 'art décadent', NULL, NULL, NULL),
(121, 'entité collective', 'extrême droite', NULL, NULL, NULL),
(122, 'entité collective', 'extrême gauche', NULL, NULL, NULL),
(123, 'institution', 'concours Lépine', NULL, '1900', '2022'),
(124, 'institution', 'Académie Française', NULL, '1635', '2022');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
