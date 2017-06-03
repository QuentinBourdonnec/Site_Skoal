-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 14 Mars 2017 à 16:23
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `db-projetphp`
--
CREATE DATABASE IF NOT EXISTS `db-projetphp` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
USE `db-projetphp`;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `ID_CLIENT` int(11) NOT NULL,
  `PRENOM` text,
  `DATE_DE_NAISSANCE` date DEFAULT NULL,
  `ADRESSE` text,
  `NEWSLETTER` tinyint(1) DEFAULT NULL,
  `NOM_CLIENT` text,
  `PASSWORD` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `LOGIN` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `CIVILITE` tinyint(1) NOT NULL,
  `VILLE` varchar(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `CODE_POSTAL` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`ID_CLIENT`, `PRENOM`, `DATE_DE_NAISSANCE`, `ADRESSE`, `NEWSLETTER`, `NOM_CLIENT`, `PASSWORD`, `LOGIN`, `CIVILITE`, `VILLE`, `CODE_POSTAL`) VALUES
(1, 'Arthur', '1997-12-20', 'une rue a Saint-Gregoire', 0, 'Sicard', 'arthur', 'asicard', 1, 'Saint-Gregoire', 35760),
(2, 'Matthias', '1997-06-12', 'une rue a Nantes', 1, 'Clouet', 'clouet', 'mC1ouet', 1, 'NANTES', 44000),
(3, 'Quentin', '1997-08-17', 'Fougeres la capitale', 0, 'Bourdennec', 'arsouille', 'Ricard', 1, 'Fougere', 35000),
(4, 'Benjamin', '1997-11-12', 'Moron', 0, 'Binnard', 'valere', 'VOD', 1, 'Moron Cities', 54000),
(5, 'Mathilde', '1996-12-20', 'une rue de Sarzeau', 0, 'Juillet', '07', 'madam3', 0, 'Sarzeau', 54000),
(6, 'Max', '1996-07-06', 'Bruz', 1, 'Buridant', 'max1m3', 'fourriere', 1, 'Ponrean', 35000),
(11, 'Arthuro', '2017-03-15', '9 rue jacques monod', 0, 'Sicardo', 'clouet', 'mC1ouetqdf', 1, 'Saint Gregoire', 35760),
(12, 'Arthuro', '2017-03-15', '9 rue jacques monod', 0, 'Sicardo', 'clouet', 'mC1ouetqdf', 1, 'Saint Gregoire', 35760),
(13, 'Arthuro', '2017-03-15', '9 rue jacques monod', 0, 'Sicardo', 'clouet', 'mC1ouetqdf', 1, 'Saint Gregoire', 35760);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE `commande` (
  `ID_COMMANDE` int(11) NOT NULL,
  `ID_CLIENT` int(11) NOT NULL,
  `DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`ID_COMMANDE`, `ID_CLIENT`, `DATE`) VALUES
(1, 1, '2016-03-24'),
(2, 1, '2017-02-19'),
(3, 2, '2017-03-13'),
(4, 2, '2017-03-14'),
(5, 2, '2017-03-14'),
(6, 1, '2017-03-14');

-- --------------------------------------------------------

--
-- Structure de la table `prefere`
--

DROP TABLE IF EXISTS `prefere`;
CREATE TABLE `prefere` (
  `ID_THEME` int(11) NOT NULL,
  `ID_CLIENT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `prefere`
--

INSERT INTO `prefere` (`ID_THEME`, `ID_CLIENT`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(1, 2),
(5, 2),
(3, 3),
(2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE `produit` (
  `ID_PRODUIT` int(11) NOT NULL,
  `ID_THEME` int(11) NOT NULL,
  `NOM_PRODUIT` text NOT NULL,
  `PRIX_PRODUIT` float NOT NULL,
  `STOCK` int(11) DEFAULT NULL,
  `DEGRE` float DEFAULT NULL,
  `VOLUME` float DEFAULT NULL,
  `DESCRIPTION` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`ID_PRODUIT`, `ID_THEME`, `NOM_PRODUIT`, `PRIX_PRODUIT`, `STOCK`, `DEGRE`, `VOLUME`, `DESCRIPTION`) VALUES
(1, 1, 'Absolute', 11, 267, 38, 1, '<h4>Le go&ucirc;t d\'Absolut Vodka.</h4><p>Chaque goutte &eacute;mane d\'une seule et unique source : &Aring;hus en Su&ecirc;de. A base de bl&eacute;s d\'hiver, Absolut Vodka est distill&eacute;e plus d\'une centaine de fois pour obtenir une vodka d\'une puret&eacute; exceptionnelle. Contrairement &agrave; d\'autres vodkas, elle ne contient aucun sucre ajout&eacute; et est exclusivement compos&eacute;e d\'ingr&eacute;dients naturels. Riche, cors&eacute;e et complexe, Absolut reste souple et moelleuse avec un gôut prononc&eacute; de c&eacute;r&eacute;ale, suivi d\'une pointe de fruit sec.</p><h4>Conserver le naturel.</h4><p>Absolut Vodka se compose principalement d\'eau douce et de bl&eacute;s d\'hiver. L\'eau provient de puits profonds situ&eacute;s &agrave; &Aring;hus, où elle est prot&eacute;g&eacute;e de toute impuret&eacute;. Les bl&eacute;s d\'hiver proviennent de cultures particuli&ecirc;res, ils sont plant&eacute;s avec tr&ecirc;s peu de fertilisants en automne et r&eacute;colt&eacute;s &agrave; la m&ecirc;me saison, l\'ann&eacute;e suivante. Tout au long de l\'ann&eacute;e, les bl&eacute;s sont cultiv&eacute;s sous la neige et d&eacute;veloppent ainsi une &eacute;corce robuste.</p>'),
(2, 1, 'Absolute Mango', 14, 15, 38, 1, '<h4>Le go&ucirc;t d\'Absolut Mango.</h4><p>Absolut Mango est exclusivement compos&eacute;e d\'ingr&eacute;dients naturels. Contrairement &agrave; la plupart des autres vodkas aromatis&eacute;es, elle ne contient aucun sucre ajout&eacute;. Absolut Mango exprime tout le caract&ecirc;re ample et fondant de la mangue pure, accompagn&eacute;e de notes de fruits tropicaux.</p><h4>Conserver le naturel.</h4><p>Absolut Mango se compose principalement d\'Absolut Vodka et d’arôme de mangue. Absolut Vodka est compos&eacute;e d\'eau douce et de bl&eacute;s d\'hiver. L\'eau provient de puits profonds situ&eacute;s &agrave; &Aring;hus, où elle est prot&eacute;g&eacute;e de toute impuret&eacute;. Les bl&eacute;s d\'hiver proviennent de cultures particuli&ecirc;res, ils sont plant&eacute;s en automne avec tr&ecirc;s peu de fertilisants et r&eacute;colt&eacute;s &agrave; la m&ecirc;me saison, l\'ann&eacute;e suivante. Tout au long de l\'ann&eacute;e, les bl&eacute;s sont cultiv&eacute;s sous la neige et d&eacute;veloppent ainsi une &eacute;corce robuste.</p>'),
(3, 1, 'Absolute Raspberri', 15, 45, 38, 1, '<h4>Le go&ucirc;t d\'Absolut Raspberri.</h4><p>Absolut Raspberri est exclusivement compos&eacute;e d\'ingr&eacute;dients naturels. Contrairement &agrave; la plupart des vodkas aromatis&eacute;es, elle ne contient aucun sucre ajout&eacute;. Le caract&egrave;re conciliant de la framboise s\'accorde parfaitement &agrave; de nombreuses autres saveurs.</p><h4>Conserver le naturel.</h4><p>Absolut Raspberri se compose principalement d\'Absolut Vodka et dâ??arÃ´me de framboise. Absolut Vodka est compos&eacute;e d\'eau douce et de bl&eacute;s d\'hiver. L\'eau provient de puits profonds situ&eacute;s &agrave; Ã?hus, oÃ¹ elle est prot&eacute;g&eacute;e de toute impuret&eacute;. Les bl&eacute;s d\'hiver proviennent de cultures particuli&egrave;res, ils sont plant&eacute;s en automne avec tr&egrave;s peu de fertilisants et r&eacute;colt&eacute;s &agrave; la mÃªme saison, l\'ann&eacute;e suivante. Tout au long de l\'ann&eacute;e, les bl&eacute;s sont cultiv&eacute;s sous la neige et d&eacute;veloppent ainsi une &eacute;corce robuste.</p>'),
(4, 1, 'Absolute Citron', 14, 78, 38, 1, '<h4>Le go&ucirc;t d\'Absolut Citron.</h4><p>Absolut Citron est exclusivement compos&eacute;e d\'ingr&eacute;dients naturels. Contrairement &agrave; la plupart des autres vodkas aromatis&eacute;es, elle ne contient aucun sucre ajout&eacute;. Suave et douce, Absolut Citron se d&eacute;marque par une note d\'agrume fra&icirc;che et fruit&eacute;e, ainsi que d\'une touche d\'&eacute;corce de citron. Absolut Citron comporte &eacute;galement une note de citron vert pour une vodka parfaitement &eacute;quilibr&eacute;e.</p><h4>Conserver le naturel.</h4><p>Absolut Citron se compose principalement d\'Absolut Vodka et d\'arôme de citron. Absolut Vodka est compos&eacute;e d\'eau douce et de bl&eacute;s d\'hiver. L\'eau provient de puits profonds situ&eacute;s &agrave; &Aring;hus, où elle est prot&eacute;g&eacute;e de toute impuret&eacute;. Les bl&eacute;s d\'hiver proviennent de cultures particuli&ecirc;res, ils sont plant&eacute;s en automne avec tr&ecirc;s peu de fertilisants et r&eacute;colt&eacute;s &agrave; la m&ecirc;me saison, l\'ann&eacute;e suivante. Tout au long de l\'ann&eacute;e, les bl&eacute;s sont cultiv&eacute;s sous la neige et d&eacute;veloppent ainsi une &eacute;corce robuste.</p>'),
(5, 1, 'Absolute Vanille', 13, 54, 38, 1, '<h4>Le go&ucirc;t d\'Absolut Vanilia.</h4><p>Absolut Vanilia est exclusivement compos&eacute;e d\'ingr&eacute;dients naturels. Contrairement &agrave; la plupart des autres vodkas aromatis&eacute;es, elle ne contient aucun sucre ajout&eacute;. Absolut Vanilia exhale une saveur prononc&eacute;e de vanille, des notes de caramel et une pointe de chocolat noir.</p><h4>Le go&ucirc;t d\'Absolut Vanilia.</h4><p>Absolut Vanilia est exclusivement compos&eacute;e d\'ingr&eacute;dients naturels. Contrairement &agrave; la plupart des autres vodkas aromatis&eacute;es, elle ne contient aucun sucre ajout&eacute;. Absolut Vanilia exhale une saveur prononc&eacute;e de vanille, des notes de caramel et une pointe de chocolat noir.</p>'),
(6, 1, 'Eristoff ', 11, 652, 38, 1, '<h4>ERISTOFF ORIGINAL</h4><p>Made from 100% pure grain, which contains just the right level of moisture and pure character, and demineralised water , Eristoff is triple distilled and finally charcoal filtered to ensure absolute purity, to create a clean and crisp taste. With a slight hint of liquorice and green apple this awarded vodka leaves you with a smooth, creamy aftertaste and a hankering for more.</p>'),
(7, 1, 'Poliakov', 10, 147, 38, 1, '<h4>Vodka POLIAKOV Prenium</h4><p>H&eacute;riti&ecirc;re de traditions ancestrales russes, la Vodka POLIAKOV est &eacute;labor&eacute;e &agrave; partir d’une s&eacute;lection des meilleurs grains et est distill&eacute;e 3 fois pour une puret&eacute; unique et une finesse extr&ecirc;me. Sa transparence cristalline d&eacute;voile un bouquet tr&ecirc;s &eacute;quilibr&eacute; de poire m&ucirc;re, de fruits tropicaux (mangue, ananas…), une texture riche en bouche et une finale franche et d&eacute;licate.<br>Vodka Premium, 100% pur grain, triple distillation, 37.5% vol.</p><p>Disponible en 5 cl, 20 cl, 35 cl, 50 cl, 70 cl, 75 cl, 100 cl, 150 cl et 200 cl.</p>'),
(8, 1, 'Crystal Head', 12, 267, 40, 1, '<h4>LA MEILLEURE DES VODKAS, NATURELLEMENT DOUCE. </h4><p>Une vari&eacute;t&eacute; de maïs de la plus haute qualit&eacute; appel&eacute;e \' p&ecirc;ches et cr&ecirc;me \' / \'peaches and cream\' est distill&eacute;e quatre fois dans un m&eacute;lange d\'alcool de grain neutre avant d\'&ecirc;tre ensuite m&eacute;lang&eacute;e &agrave; l\'eau cristalline de la r&eacute;gion de \'Terre Neuve\', au Canada. Ce liquide est ensuite filtr&eacute; sept fois, dont trois &agrave; travers des diamants d’Herkimer, cristaux de quartz semi-pr&eacute;cieux.</p><h4>LA BOUTEILLE CRYSTAL HEAD A ETE DESIGNEE POUR REFLETER LA PLUS GRANDE PURETE.</h4><p>Dan Aykroyd et John Alexander ont voulu cr&eacute;er une bouteille digne d’une des vodkas les plus pures au monde. Un symbole de vie, refl&eacute;tant pouvoir et illumination, ainsi que l’esprit pur de ce spiritueux aux multiples r&eacute;compenses.</p><p>Crystal Head ne contient aucun additif. Pas de glyc&eacute;rol, pas d’huiles d’agrumes, pas de sucre … Rien n’est ajout&eacute; pour am&eacute;liorer ou masquer le gout.</p><h4>DE LA PURET&eacute;. RIEN D’AUTRE.</h4>'),
(9, 1, 'Belvedere', 35, 58, 38, 1, 'Une description bidon'),
(10, 1, 'Zubrowka', 18, 96, 38, 1, '<h4>Pr&eacute;sentation G&eacute;n&eacute;rale</h4><p>Zubrowka, traduit par vodka de bison, est une vodka &agrave; 40% de taux d\'alcool. Elle a &eacute;t&eacute; produite pour la premi&ecirc;re fois en 1405, suite &agrave; l\'&eacute;chec des polonais dans la fermentation de leur vin. Cette boisson tient sa particularit&eacute; de l\'herbe sauvage qu\'on peut trouver dans la for&ecirc;t de Bialowieza, dans la plaine du bison. Elle n&eacute;cessite trois &eacute;tapes de distillation et se fabrique traditionnellement comme les polonais l\'ont toujours fait. C\'est ensuite qu\'on y met l\'herbe pour l\'aromatiser mais aussi pour lui conf&eacute;rer ce go&ucirc;t unique indescriptible.</p><h4>Les utilisations de Zubrowka</h4><p>La zubrowka peut servir &agrave; de nombreuses pr&eacute;parations dans l\'art culinaire et apporte une touche personnelle dans la saveur de tout plat auquel elle a &eacute;t&eacute; rajout&eacute;e. Elle accompagne parfaitement les mets tels que les poissons et les caviars. Ajout&eacute;e &agrave; d\'autres boissons, elle se d&eacute;guste aussi en cocktail comme le Bloody Mary, le Blue Lagoon, Zub cucumr, Green Grass, Zub\'Mint etc. Il s\'agit juste de faire travailler son imagination pour obtenir un savoureux coctail. C\'est &eacute;galement un tr&ecirc;s bon digestif et cette boisson se d&eacute;guste g&eacute;n&eacute;ralement avec quelques citrons</p>'),
(11, 1, 'Skyy', 21, 45, 40, 1, '<h4>Arome</h4><p>La vodka est fr&eacute;quemment aromatis&eacute;e car les nombreuses distillations font d\'elle un alcool blanc au go&ucirc;t peu prononc&eacute;. On note d\'ailleurs que les rares &eacute;tudes de d&eacute;gustation en aveugle r&eacute;v&ecirc;lent l\'incapacit&eacute; des participants &agrave; distinguer de façon significative diff&eacute;rentes vodka simplement &agrave; leur go&ucirc;t10,11 ce qui reste contest&eacute; par les amateurs de cette boisson.En ce qui concerne les vodka aromatis&eacute;es, la zubrówka polonaise ou bi&eacute;lorusse utilise l\'herbe aux bisons, qui lui donne une l&eacute;g&ecirc;re coloration et un arôme caract&eacute;ristique, et est r&eacute;colt&eacute;e durant une courte p&eacute;riode de l\'&eacute;t&eacute; (la plus chaude possible) pour ensuite servir lors de la distillation de l\'eau de vie de grain. Il y a plusieurs autres arômes traditionnels : piment (souvent avec du miel, surtout en Ukraine), bouleau, airelles, baies de sorbier, noix de c&ecirc;dre, orties, poivre.D\'autres arômes sont plus r&eacute;cents : citron, cerise, caramel, voire dans certains cas cannabis</p>'),
(12, 2, 'Jack Daniel', 17, 45, 40, 1, '<h4>Un Arome special</h4><p>La version originale de Jack Daniel\'s depuis 1866. Il conserve ce go&ucirc;t unique grâce &agrave; la filtration sur charbon de bois d\'&eacute;rable.Le nez : Moelleux avec des nuances bois&eacute;es et l&eacute;g&ecirc;rement fruit&eacute;es.La couleur : Whiskey clair li&eacute; aux f&ucirc;ts de ch&ecirc;ne blanc.La saveur : Rond et &eacute;quilibr&eacute;, avec des notes caram&eacute;lis&eacute;es, vanill&eacute;es et bois&eacute;es soulign&eacute;es par un arôme l&eacute;g&ecirc;rement fruit&eacute;. </p>'),
(13, 2, 'Sir Edwards', 13, 71, 40, 1, '<h4>Un Arome ecossais</h4><p>Le whisky &eacute;cossais ne livre pas tous ses tr&eacute;sors en une fois. Tout comme l’&eacute;cosse, il s’apprivoise par &eacute;tapes successives.<br>Quelles sont les sensations au nez ? Est-il piquant comme l’hiver dans les Cairngorms ou rafra&icirc;chissant comme les embruns sur le port d’Aberdeen ?<br>Au palais, les arômes du scotch whisky font &eacute;cho &agrave; la terre qui l’a vu na&icirc;tre. Que ce soient les c&eacute;r&eacute;ales de la vall&eacute;e de la Spey, la bruy&ecirc;re de l’&icirc;le de Mull ou le fum&eacute; des poissons des Lochs, le whisky d’&eacute;cosse porte en lui ces terres sauvages.<br>Le temps qui passe fait aussi voyager les arômes du scotch whisky. Noix de coco, gingembre ou cannelle viennent compl&eacute;ter une palette aromatique d’une grande richesse.</p>'),
(14, 2, 'William Peel', 12, 75, 40, 1, '<h4>Un Arome de malte</h4><p>C’est la rencontre des whiskies de malt et de grains vieillis en f&ucirc;ts de ch&ecirc;ne, soigneusement s&eacute;lectionn&eacute;s, puis assembl&eacute;s selon un savoir-faire pr&eacute;cis, qui lui donne son caract&ecirc;re unique : rond et parfaitement &eacute;quilibr&eacute;, aux g&eacute;n&eacute;reuses notes malt&eacute;es et fruit&eacute;es.Grâce &agrave; ses diff&eacute;rents formats, il s’adapte &agrave; toutes vos façons de consommer avec des saveurs ambr&eacute;<br>On retrouve toute sa rondeur ainsi que la g&eacute;n&eacute;rosit&eacute; de ses notes malt&eacute;es et fruit&eacute;es</p>'),
(15, 2, 'Label 5', 11, 45, 40, 1, '<h4>Un Arome de malte</h4><p>C’est la rencontre des whiskies de malt et de grains vieillis en f&ucirc;ts de ch&ecirc;ne, soigneusement s&eacute;lectionn&eacute;s, puis assembl&eacute;s selon un savoir-faire pr&eacute;cis, qui lui donne son caract&ecirc;re unique : rond et parfaitement &eacute;quilibr&eacute;, aux g&eacute;n&eacute;reuses notes malt&eacute;es et fruit&eacute;es.Grâce &agrave; ses diff&eacute;rents formats, il s’adapte &agrave; toutes vos façons de consommer avec des saveurs ambr&eacute;<br>On retrouve toute sa rondeur ainsi que la g&eacute;n&eacute;rosit&eacute; de ses notes malt&eacute;es et fruit&eacute;es</p>'),
(16, 2, 'Cardhu', 21, 45, 78, 1, '<h4>Un Arome de delicat</h4><p>La distillerie Cardhu poss&ecirc;de des alambics de premi&ecirc;re distillation (wash still) de grande taille et des alambics de seconde distillation (spirit still) de tr&ecirc;s petite taille. Elle &eacute;labore un single malt tr&ecirc;s classique. L&eacute;ger, celui-ci d&eacute;veloppe des notes fruit&eacute;es tout en restant tr&ecirc;s proche de la c&eacute;r&eacute;ale (bouillie d’orge). Cardhu entre en grande partie dans la composition des blends de la famille Johnnie Walker. Commentaire de d&eacute;gustation : De couleur jaune &agrave; reflets verdâtres, le nez est l&eacute;ger et peu d&eacute;fini (agrumes). La bouche sur le malt manque un peu de mati&ecirc;re. La finale est assez am&ecirc;re. Un whisky l&eacute;ger manquant de personnalit&eacute; et de mati&ecirc;re. </p>'),
(17, 2, 'Chivas', 25, 78, 40, 1, '<h4>Le Scotch</h4><p>R&eacute;f&eacute;rence embl&eacute;matique, Chivas Regal 12 ans d’âge est le fruit de l’assemblage subtil de whiskies de grain et de malt provenant des quatre r&eacute;gions d’Ecosse. Elabor&eacute; dans l’une des plus anciennes distilleries du Speyside, le Single Malt Strathisla est au cœur de cette composition et lui conf&ecirc;re &eacute;l&eacute;gance, richesse et notes fruit&eacute;es. </p>'),
(18, 2, 'Monkey Shoulder', 35, 65, 40, 1, '<h4Un arome britanique</h4><p>Monkey Shoulder is the world\'s first Triple Malt, a blend of three of Speyside\'s finest single malt whiskies. Single Malts - Glenfiddich, Balvenie and Kininvie. On its own or over ice it\'s deliciously smooth and rich. However, this is a whisky that loves company and is perfectly balanced for mixing. Make yours a Monkey.<br>Situated adjacent to the Balvenie Distillery, Kininvie Distillery is one of the youngest distilleries in Scotland, having begun production of Scotch Whisky only 23 years ago. As a result of its location and shared ownership, much of the equipment used to produce Kininvie Single Malt Whisky is housed within the Balvenie Distillery complex, although the equipment is maintained and operated independently.</p>'),
(19, 2, 'Ballantines', 16, 78, 40, 1, '<h4>La finesse</h4><p>Fond&eacute;e en 1827 &agrave; Edimbourg, la maison Ballantine\'s &eacute;tait &agrave; l\'origine une &eacute;picerie avant de se sp&eacute;cialiser dans le Whisky et de devenir un assembleur professionnel. Ballantine\'s f&ucirc;t l\'une des toutes premi&ecirc;res maison &agrave; proposer des Whiskies super-premium en lançant en 1930 deux embouteillages de luxe, le 17 ans et 30 ans. Dans les ann&eacute;es 30, Ballantine\'s d&eacute;velippa peu &agrave; peu sa pr&eacute;sence aux &eacute;tats-Unis et en Europe. </p>'),
(20, 2, 'J&B', 14, 65, 40, 1, '<h4>La finesse</h4><p>Fond&eacute;e en 1827 &agrave; Edimbourg, la maison Ballantine\'s &eacute;tait &agrave; l\'origine une &eacute;picerie avant de se sp&eacute;cialiser dans le Whisky et de devenir un assembleur professionnel. Ballantine\'s f&ucirc;t l\'une des toutes premi&ecirc;res maison &agrave; proposer des Whiskies super-premium en lançant en 1930 deux embouteillages de luxe, le 17 ans et 30 ans. Dans les ann&eacute;es 30, Ballantine\'s d&eacute;velippa peu &agrave; peu sa pr&eacute;sence aux &eacute;tats-Unis et en Europe. </p>'),
(21, 3, '1664', 2, 45, 5, 1, '<h4>La 1664</h4><p>La 1664 est une bi&ecirc;re de fermentation basse, une lager de type pils de couleur blonde (5,5 %), presque jaune. Elle contient du malt d\'orge et du malt de bl&eacute;. Sa mousse blanche est dense et ses bulles sont fines. Le descriptif commercial &eacute;voque un nez domin&eacute; par le malt et les houblons aromatiques floraux, ainsi que des notes de fruits jaunes, de miel, de banane et de poivre. Cette bi&ecirc;re est marqu&eacute;e par son amertume fine et son arri&ecirc;re-go&ucirc;t long en bouche d&ucirc; &agrave; sa fermentation longue en cave. Sa saveur oscille entre le sucr&eacute; et l\'acide.<br>Valeur nutritionnelle de la bi&ecirc;re blonde 1664 5,5&ordm;</p>'),
(22, 3, 'Kronenbourg', 3, 71, 6, 1, '<h4>La kronenbourg</h4><p>En 1922, la brasserie Hatt rach&ecirc;te le restaurant strasbourgeois du Grand Tigre et nomme sa bi&ecirc;re Tigre Bock. Celle-ci est relanc&eacute;e en 1947 sous le nom de Kronenbourg, d\'apr&ecirc;s le quartier de Cronenbourg, &agrave; Strasbourg, où s\'est install&eacute;e la brasserie au milieu du XIXe si&ecirc;cle. Cronenbourg &eacute;tant orthographi&eacute; \' Kronenburg \' durant le rattachement de l\'Alsace-Lorraine &agrave; l\'Empire allemand de 1871 &agrave; 1919. Cette orthographe germanique peut &eacute;galement faire r&eacute;f&eacute;rence &agrave; la qualit&eacute; allemande de la bi&ecirc;re. Vendue dans des bouteilles encapsul&eacute;es de 33 cl - une nouveaut&eacute; pour l\'&eacute;poque -, elle connait rapidement un grand succ&ecirc;s. La bi&ecirc;re conditionn&eacute;e en bo&icirc;te m&eacute;tallique est d&eacute;velopp&eacute;e en 1952. Kronenbourg devient la marque de bi&ecirc;re la plus vendue en France.</p>'),
(23, 3, 'Heineken', 2, 75, 4, 1, '<h4>La heineken</h4><p>Heineken International  est un groupe brassicole d’origine n&eacute;erlandaise fond&eacute; en 1873 par Gerard Adriaan Heineken. C’est, en 2011, le 3e brasseur au niveau mondial5, avec une part de march&eacute; en volume de 8,8 %, derri&ecirc;re Anheuser-Busch InBev (18,3 %) et SABMiller (9,8 %)6.<br>Le groupe est pr&eacute;sent &agrave; l\'international, grâce &agrave; sa marque Heineken commercialis&eacute;e dans plus de 170 pays. Heineken International produit ou commercialise environ 250 marques de bi&ecirc;res et cidres, dont Heineken, Amstel, Desperados, Sol ou Tiger.</p>'),
(24, 3, 'Leffe', 3, 45, 5, 1, '<h4>La leffe</h4><p>Du nom de l\'Abbaye de Leffe situ&eacute;e sur la commune de Dinant en Belgique (&agrave; ne pas confondre avec Neffe qui est sur l\'autre rive) dans la vall&eacute;e de la Meuse, la bi&ecirc;re de Leffe fait partie de la vari&eacute;t&eacute; des bi&ecirc;res d\'abbaye.<br>Cette bi&ecirc;re a &eacute;t&eacute; cr&eacute;e par les chanoines pr&eacute;montr&eacute;s, install&eacute;s &agrave; Leffe depuis 1152, qui ach&ecirc;tent en 1240 au clerc Gossuin et en pr&eacute;sence des &eacute;chevins de Dinant, divers biens dont une brasserie 1.<br>Au Moyen Âge, dans l’impossibilit&eacute; de v&eacute;rifier si l’eau de source &eacute;tait saine, les moines trouvaient dans la fabrication de bi&ecirc;re un moyen pr&eacute;cieux d\'&eacute;chapper aux &eacute;pid&eacute;mies (grâce au processus assainissant de la fermentation) et rapidement on transf&eacute;ra le moulin et sa brasserie dans l\'enceinte m&ecirc;me de l\'abbaye.</p>'),
(25, 3, 'Desperados', 5, 45, 6, 1, '<h4>La desperado</h4><p>Bi&ecirc;re aromatis&eacute;e, 5,9 % cr&eacute;e en 1995, elle est brass&eacute;e principalement &agrave; Schiltigheim. L\'originale est une bi&ecirc;re blonde aromatis&eacute;e &agrave; la tequila. Elle est propos&eacute;e &agrave; la vente en bouteilles de verre de 25 cl, 33 cl, 65 cl et 120 cl (Serie 120) seule ou en pack (3 &agrave; 20) ainsi qu\'en canettes aluminium (33 cl;25cl et 50 cl). Selon le site internet Heineken, son nom provient du fait qu\'apr&ecirc;s l\'avoir cr&eacute;e, elle &eacute;tait toujours sans nom et l\'entreprise &eacute;tait d&eacute;sesp&eacute;r&eacute;e de lui en trouver un. Parfois, des s&eacute;ries de bouteilles sp&eacute;ciales font leur apparition. La police d\'&eacute;criture du logotype rappelle le style western.</p>'),
(26, 3, 'Cubanisto', 5, 78, 5, 1, '<h4>La cubanisto</h4><p>Bi&ecirc;re tendance<br>Aromatis&eacute;e au rhum des Caraïbes<br>Notes de citron/citron vert et d\'orange.<br>Go&ucirc;t frais parfaitement &eacute;quilibr&eacute; accentu&eacute; par un arôme de sucre de canne caram&eacute;lis&eacute;<br>Sous conditionnement en 4 pack</p>'),
(27, 3, 'Skoll', 5, 65, 4, 1, '<h4>La Skoll</h4><p>Cette nouvelle marque d&eacute;barqu&eacute;e du Nord propose une bi&ecirc;re aromatis&eacute;e &agrave; la vodka et aux agrumes. Un m&eacute;lange &eacute;tonnant qui permet un peu changement &agrave; l’heure des traditionnelles bi&ecirc;res aromatis&eacute;es &agrave; la tequila. Le m&eacute;lange bi&ecirc;re-vodka est connu des pays de l’Est avec le shooter de vodka au fond de la pinte mais cela peu en &eacute;tonner plus d’un ici.<br>Cette boisson atteignant les 6&ordm; se veut rafraichissante avec une robe dor&eacute;e et une mousse bien blanche. Du côt&eacute; de l’odeur, ce n’est pas &eacute;cœurant et une odeur de pamplemousse nous accroche quelque peu.<br>Le groupe Kronembourg communique &eacute;galement sur le moment d&eacute;gustation et pas seulement sur la boisson en elle-m&ecirc;me. En effet, les bouteilles ont &eacute;t&eacute; pourvues de capsules &agrave; d&eacute;goupiller pour permettre l’ouverture sans d&eacute;capsuleur (pour ceux n’arrivant toujours pas &agrave; utiliser le syst&ecirc;me dentaire, le portable, le briquet…). Quant aux canettes, une pastille fra&icirc;cheur a &eacute;t&eacute; appos&eacute;e afin de savoir si la temp&eacute;rature est id&eacute;ale pour s’abreuver.</p>'),
(28, 3, 'Grimbergen', 3, 78, 3, 1, '<h4>La grimbergen</h4><p>L\'abbaye de Grimbergen est construite en 1128 par saint Norbert de Xanten (fondateur de l\'ordre de Pr&eacute;montr&eacute;), d&eacute;truite en 1142 puis reconstruite grâce &agrave; des dons. Elle est de nouveau d&eacute;truite en 1566, puis les Pr&eacute;montr&eacute;s y reviennent en 1585 et c\'est en 1629 qu\'ils entreprennent une grande restauration et la construction de la brasserie. Symbole de la renaissance de l\'abbaye, l\'embl&ecirc;me du ph&eacute;nix est choisi en 1629, ainsi que sa devise (devenu le son slogan de la bi&ecirc;re) : Ardet nec consumitur (litt. « elle br&ucirc;le mais ne se consume pas »).</p>'),
(29, 3, 'Rince-Cochon', 4, 65, 6, 1, '<h4>La rince cochon</h4><p>La Rince Cochon est une bi&ecirc;re &agrave; façon blonde &agrave; l\'origine française mais actuellement brass&eacute;e en Belgique pour le compte d\'une soci&eacute;t&eacute; française1. C\'est une bi&ecirc;re de fermentation haute, poss&eacute;dant un haut degr&eacute; d\'alcool (8,5 % alc./vol.). Elle est fabriqu&eacute;e &agrave; partir d\'eau, de malt, de houblon, d\'orge, et de levure.<br>La Rince Cochon a &eacute;t&eacute; conçue par le brasseur SBA et brass&eacute;e par les brasseries Huyghe </p>'),
(30, 4, 'Cotes de Provence', 12, 75, 7, 1, '<h4>La cote de provence</h4><p>Le côtes-de-provence2 est un vin d\'appellation d\'origine contrôl&eacute;e produit sur une vaste partie du vignoble de Provence, principalement dans le d&eacute;partement du Var, dans une partie des Bouches-du-Rhône et m&ecirc;me sur la petite commune de Villars-sur-Var des Alpes-Maritimes.<br>Le nom de l\'appellation peut &ecirc;tre compl&eacute;t&eacute; depuis 2005 par les d&eacute;nominations g&eacute;ographiques Sainte-Victoire (dans les Bouches-du-Rhône) et Fr&eacute;jus (dans le Var), et depuis 2008 par la d&eacute;nomination La Londe (dans le Var).<br>Mais, contrairement &agrave; ce que l\'on pense trop souvent, les Côtes de Provence ne sont pas produits sur toute la superficie de la Provence. Seuls 18 000 ha, soigneusement d&eacute;limit&eacute;s, ont droit &agrave; l\'Appellation d\'Origine Contrôl&eacute;e</p>'),
(31, 4, 'Syrah', 11, 45, 9, 1, '<h4>Le Syrah</h4><p>Les provenances les plus diverses ont &eacute;t&eacute; donn&eacute;es &agrave; ce c&eacute;page typiquement rhodanien, sur la base d\'assonances avec la Syrie, Syracuse, ou encore Shiraz1, m&ecirc;me si Syros, une &icirc;le grecque des Cyclades, productrice de raisins secs, dont le port et la ville principale est Hermopolis (ou Syra), est rarement mentionn&eacute;e. De nombreuses hypoth&ecirc;ses sur son origine ont &eacute;t&eacute; &eacute;mises, devenant m&ecirc;me des l&eacute;gendes<br>Cependant, on ne trouve trace de la syrah dans aucune de ces r&eacute;gions, ni m&ecirc;me un c&eacute;page lui ressemblant. Andr&eacute; et Levadoux3, en 1964 classent la syrah dans le groupe de c&eacute;page des s&eacute;rines avec la mondeuse noire N, la mondeuse blanche B, le viognier, la marsanne et la roussanne.</p>'),
(32, 4, 'Merlot', 7, 45, 12, 1, '<h4>Le Merlot</h4><p>Le merlot  est un c&eacute;page de cuve noir français. Utilis&eacute; traditionnellement dans le Bordelais, ses qualit&eacute;s lui ont permis de gagner le vignoble du sud-ouest et du Languedoc-Roussillon. Expatri&eacute; en Italie et en Suisse, il l\'est &eacute;galement dans les pays producteurs comme les &eacute;tats-Unis (Californie), l\'Afrique du Sud, l\'Argentine...<br>C&eacute;page d\'assemblage &agrave; Bordeaux, il apporte rondeur et tanins souples &agrave; l\'aust&eacute;rit&eacute; du cabernet sauvignon jeune. Sa culture pr&eacute;pond&eacute;rante dans certains domaines du vignoble du Libournais ont conduit &agrave; essayer de le vinifier en solo. Les r&eacute;sultats tr&ecirc;s int&eacute;ressants en ont fait un des principaux acteurs en vin de c&eacute;page.</p>'),
(33, 4, 'gewurztraminer', 8, 78, 12, 1, '<h4>Le gewurztraminer</h4><p>Le gewurztraminer d\'Alsace, ou alsace gewurztraminer1, est un vin blanc français produit dans le vignoble d\'Alsace &agrave; partir du c&eacute;page gewurztraminer Rs. Il s\'agit d\'une d&eacute;nomination de c&eacute;page au sein de l\'appellation alsace1.<br>Parmi les vins d\'Alsace, c\'est le vin blanc le plus aromatique ; il est donc class&eacute; parmi ceux produits &agrave; partir des « c&eacute;pages nobles » alsaciens, avec le riesling, le pinot gris et le muscat.</p>'),
(34, 4, 'Chardonnay', 7, 65, 9, 1, '<h4>Le chardonnais</h4><p>Le chardonnay  est un c&eacute;page blanc français. Originaire du vignoble de Bourgogne, il est devenu un c&eacute;page international ayant conquis de tr&ecirc;s nombreux pays producteurs de vin du monde.<br>Ses qualit&eacute;s le font utiliser pour de nombreux types de vin blanc, des grands crus de Bourgogne aux vins effervescents de champagne en passant par les vins de c&eacute;pages.</p>'),
(35, 4, 'Sauvignon', 6, 78, 11, 1, '<h4>Le sauvignon</h4><p>Le sauvignon B (ou sauvignon blanc) est un c&eacute;page de vigne (Vitis vinifera) français, tr&ecirc;s r&eacute;pandu en France, aux &eacute;tats-Unis, en Afrique du Sud, en Australie et en Nouvelle-Z&eacute;lande. Il existe une variante &agrave; grains roses, le sauvignon gris G. Il pr&eacute;sente les m&ecirc;mes caract&ecirc;res. Les diff&eacute;rences mineures concernent une meilleure aptitude &agrave; la production de vins moelleux ou liquoreux.<br>Les vins jeunes de sauvignon blanc ont un arôme caract&eacute;ristique, distinct de celui des autres c&eacute;pages, dont les principaux descripteurs sont le gen&ecirc;t, le buis, le bourgeon de cassis, le pamplemousse, le fruit de la passion et, dans certains cas, la fum&eacute;e, la viande rôtie ou encore la pierre &agrave; fusil.</p>'),
(36, 4, 'Riesling', 9, 65, 10, 1, '<h4>Le Riesling</h4><p>Le sauvignon B (ou sauvignon blanc) est un c&eacute;page de vigne (Vitis vinifera) français, tr&ecirc;s r&eacute;pandu en France, aux &eacute;tats-Unis, en Afrique du Sud, en Australie et en Nouvelle-Z&eacute;lande. Il existe une variante &agrave; grains roses, le sauvignon gris G. Il pr&eacute;sente les m&ecirc;mes caract&ecirc;res. Les diff&eacute;rences mineures concernent une meilleure aptitude &agrave; la production de vins moelleux ou liquoreux.<br>Les vins jeunes de sauvignon blanc ont un arôme caract&eacute;ristique, distinct de celui des autres c&eacute;pages, dont les principaux descripteurs sont le gen&ecirc;t, le buis, le bourgeon de cassis, le pamplemousse, le fruit de la passion et, dans certains cas, la fum&eacute;e, la viande rôtie ou encore la pierre &agrave; fusil.</p>'),
(37, 5, 'Havana Club', 14, 45, 40, 1, '<h4>Le Havana Club</h4><p>Havana Club est une marque de rhum, fabriqu&eacute;e &agrave; Santa Cruz del Norte &agrave; Cuba. Elle a &eacute;t&eacute; cr&eacute;e par Jos&eacute; Arechabala en 1878. Apr&ecirc;s la r&eacute;volution cubaine de 1959, la compagnie fut nationalis&eacute;e par le gouvernement, ce qui contraint la famille Arechabala &agrave; partir pour l\'Espagne puis &agrave; &eacute;migrer aux &eacute;tats-Unis. Depuis 1993, le rhum est produit par la marque Havana Club International, fruit d\'un accord entre Pernod Ricard et le gouvernement cubain.</p>'),
(38, 5, 'Saint James', 18, 71, 40, 1, '<h4>Le Saint James</h4><p>Saint-James Imp&eacute;rial Blanc 40&ordm; (70 cl) : Arômes de la canne &agrave; sucre fra&icirc;chement coup&eacute;e, notes florales, fruit&eacute;es et l&eacute;g&ecirc;rement poivr&eacute;es et &eacute;pic&eacute;es.<br>Saint-James Royal Blanc 50&ordm; (70 cl)<br>Saint-James Royal Blanc 55&ordm; (1 l)<br>Saint-James Fleur de Canne 50&ordm; (70 cl) : rhum blanc produit exclusivement &agrave; partir de canne &agrave; sucre r&eacute;colt&eacute;e durant la saison s&ecirc;che, ce qui lui donne un bouquet riche et fruit&eacute;</p>'),
(39, 5, 'Dillon', 12, 75, 35, 1, '<h4>Le Dillon</h4><p>Saint-James Imp&eacute;rial Blanc 40&ordm; (70 cl) : Arômes de la canne &agrave; sucre fra&icirc;chement coup&eacute;e, notes florales, fruit&eacute;es et l&eacute;g&ecirc;rement poivr&eacute;es et &eacute;pic&eacute;es.<br>Saint-James Royal Blanc 50&ordm; (70 cl)<br>Saint-James Royal Blanc 55&ordm; (1 l)<br>Saint-James Fleur de Canne 50&ordm; (70 cl) : rhum blanc produit exclusivement &agrave; partir de canne &agrave; sucre r&eacute;colt&eacute;e durant la saison s&ecirc;che, ce qui lui donne un bouquet riche et fruit&eacute;</p>'),
(40, 5, 'Bacardi', 11, 45, 38, 1, '<h4>Le Bacardi</h4><p>Bacardí est une entreprise de spiritueux, sp&eacute;cialis&eacute;e notamment dans la production et la distribution de rhum. Fond&eacute;e par Facundo Bacardí Masso &agrave; Santiago de Cuba le 4 f&eacute;vrier 1862, Bacardí a son si&ecirc;ge actuel &agrave; Hamilton, aux Bermudes. L\'entreprise Bacardí poss&ecirc;de d\'autres marques, notamment les vodkas Grey Goose et Eristoff, le whisky Dewar\'s, le gin Bombay Sapphire, les vermouths Martini & Rossi, le rhum Bacardí et la tequila Cazadores.<br>Bacardí est la plus grande entreprise familiale de spiritueux, produisant des rhums, notamment Bacardí Superior et Bacardí 151. Elle vend plus de 240 millions de bouteilles par an dans 170 pays, ce qui la situe au troisi&ecirc;me rang mondial dans le secteur des spiritueux. Ses ventes en 2004 atteignaient 3,3 milliards de dollars US, &agrave; comparer aux 2,7 milliards de 2000. Plusieurs tentatives d\'introduction en bourse ont &eacute;chou&eacute;, la derni&ecirc;re remontant &agrave; 2000.</p>'),
(41, 5, 'Clement', 17, 45, 40, 1, '<h4>Le Clement</h4><p>Le rhum agricole est le fruit de la distillation du pur jus de canne &agrave; sucre. R&eacute;colt&eacute;e dans les premiers mois de l’ann&eacute;e (de janvier &agrave; juin), les cannes &agrave; sucre sont d’abord apport&eacute;es &agrave; la distillerie, puis broy&eacute;es dans les moulins pour en extraire le jus appel&eacute; vesou.<br>Le jus filtr&eacute; subit ensuite une fermentation pendant 36 heures dans des cuves en inox jusqu’&agrave; l’obtention d’un vin de canne tirant entre 4 et 5&ordm; d’alcool. Une fois ferment&eacute;, il est envoy&eacute; dans une colonne &agrave; distiller et donne un rhum agricole blanc limpide tirant entre 65 et 75&ordm;. La suite du processus rel&ecirc;ve du savoir-faire du ma&icirc;tre de chais.<br>Le rhum Cl&eacute;ment produit ainsi du rhum vieux, du rhum blanc, du punch traditionnel et de la liqueur moderne.</p>'),
(42, 5, 'HSE', 18, 78, 40, 1, '<h4>HSE</h4><p>Le rhum HSE R&eacute;serve Sp&eacute;ciale VSOP se caract&eacute;rise par une robe ambr&eacute;e avec des reflets fauves.<br>Le nez du rhum HSE R&eacute;serve Sp&eacute;ciale VSOP s’ouvre lentement sur des arômes de pruneaux et de caramel au beurre. La bouche, vive et fringante, d&eacute;voile des saveurs de cire d’abeille et de fruits compot&eacute;s avec quelques notes d’&eacute;pices et de vanille.<br>Tr&ecirc;s concentr&eacute;e en tanins, le rhum HSE R&eacute;serve Sp&eacute;ciale VSOP s’ach&ecirc;ve sur une finale originalement &eacute;pic&eacute;e.</p>'),
(43, 5, 'Charette', 17, 65, 40, 1, '<h4>Le charette</h4><p>Le nom « Rhum Charrette » est n&eacute; en 1972, en m&ecirc;me temps que la cr&eacute;ation du Groupement d\'int&eacute;r&ecirc;t &eacute;conomique « Rhums R&eacute;union », lequel a permis aux producteurs de conditionner et commercialiser leurs rhums en bouteille au lieu de passer par la livraison aux d&eacute;pôts douaniers. Ce nom vient de l\'&eacute;tiquette &agrave; dominance verte sur laquelle est dessin&eacute;e une charrette pleine de cannes &agrave; sucre tir&eacute;e par un bœuf et son propri&eacute;taire.<br>Rhum Charette ambr&eacute;<br>L\'&eacute;tiquette originale a &eacute;t&eacute; conçue et dessin&eacute;e par Eug&ecirc;ne Gonthier en 1976 selon le concept « Rhum Charrette » qu\'il avait imagin&eacute; et propos&eacute; &agrave; l\'agence de publicit&eacute; Havas R&eacute;union. Bien qu’il soit l’auteur du projet de l\'&eacute;tiquette originale qui portait sa signature et l’inventeur du slogan « Rhum Charrette » port&eacute; plus tard sur les &eacute;tiquettes &eacute;dit&eacute;es par la suite et où sa signature fut omise, les b&eacute;n&eacute;ficiaires de son œuvre n’ont jamais consenti &agrave; lui r&eacute;tribuer ses droits d’auteur.</p>'),
(44, 5, 'Old Nick', 16, 78, 40, 1, '<h4>Le Old Nick</h4><p>Le nom « Rhum Charrette » est n&eacute; en 1972, en m&ecirc;me temps que la cr&eacute;ation du Groupement d\'int&eacute;r&ecirc;t &eacute;conomique « Rhums R&eacute;union », lequel a permis aux producteurs de conditionner et commercialiser leurs rhums en bouteille au lieu de passer par la livraison aux d&eacute;pôts douaniers. Ce nom vient de l\'&eacute;tiquette &agrave; dominance verte sur laquelle est dessin&eacute;e une charrette pleine de cannes &agrave; sucre tir&eacute;e par un bœuf et son propri&eacute;taire.<br>Rhum Charette ambr&eacute;<br>L\'&eacute;tiquette originale a &eacute;t&eacute; conçue et dessin&eacute;e par Eug&ecirc;ne Gonthier en 1976 selon le concept « Rhum Charrette » qu\'il avait imagin&eacute; et propos&eacute; &agrave; l\'agence de publicit&eacute; Havas R&eacute;union. Bien qu’il soit l’auteur du projet de l\'&eacute;tiquette originale qui portait sa signature et l’inventeur du slogan « Rhum Charrette » port&eacute; plus tard sur les &eacute;tiquettes &eacute;dit&eacute;es par la suite et où sa signature fut omise, les b&eacute;n&eacute;ficiaires de son œuvre n’ont jamais consenti &agrave; lui r&eacute;tribuer ses droits d’auteur.</p>'),
(45, 5, 'Trois Rivieres', 19, 65, 37, 1, '<h4>Le Trois Rivi&ecirc;re</h4><p>Sur les 600 hectares de la plantation Trois Rivi&ecirc;res au sud de la Martinique3, 120 hectares de canne &agrave; sucre sont cultiv&eacute;s en alternance avec l\'&eacute;levage de bovins &agrave; viande.[r&eacute;f. n&eacute;cessaire]<br>Le rhum blanc agricole Trois Rivi&ecirc;res est distill&eacute; sur le site de La Mauny &agrave; Rivi&ecirc;re-Pilote selon le cahier des charges propres &agrave; l’AOC Rhum de la Martinique. Les bonnes ann&eacute;es sont mises &agrave; vieillir en f&ucirc;ts de ch&ecirc;ne pour une dur&eacute;e minimum de 3 ans4 afin d\'obtenir l’appellation AOC Martinique pour les Rhum Vieux. La marque au Moulin est sp&eacute;cialement reconnue pour la qualit&eacute; de ses rhums vieux et mill&eacute;simes rares aux saveurs d’&eacute;pices et de fruits secs, conserv&eacute; dans la qui&eacute;tude de l’obscurit&eacute; des Chais de la Maison depuis des d&eacute;cennies.<br>Chaque ann&eacute;e, sont produits pr&ecirc;s de 1 400 000 litres de rhum agricole</p>'),
(46, 1, 'Absolute', 8, 26, 38, 0.7, '<h4>Le go&ucirc;t d\'Absolut Vodka.</h4><p>Chaque goutte &eacute;mane d\'une seule et unique source : &Aring;hus en Su&ecirc;de. A base de bl&eacute;s d\'hiver, Absolut Vodka est distill&eacute;e plus d\'une centaine de fois pour obtenir une vodka d\'une puret&eacute; exceptionnelle. Contrairement &agrave; d\'autres vodkas, elle ne contient aucun sucre ajout&eacute; et est exclusivement compos&eacute;e d\'ingr&eacute;dients naturels. Riche, cors&eacute;e et complexe, Absolut reste souple et moelleuse avec un gôut prononc&eacute; de c&eacute;r&eacute;ale, suivi d\'une pointe de fruit sec.</p><h4>Conserver le naturel.</h4><p>Absolut Vodka se compose principalement d\'eau douce et de bl&eacute;s d\'hiver. L\'eau provient de puits profonds situ&eacute;s &agrave; &Aring;hus, où elle est prot&eacute;g&eacute;e de toute impuret&eacute;. Les bl&eacute;s d\'hiver proviennent de cultures particuli&ecirc;res, ils sont plant&eacute;s avec tr&ecirc;s peu de fertilisants en automne et r&eacute;colt&eacute;s &agrave; la m&ecirc;me saison, l\'ann&eacute;e suivante. Tout au long de l\'ann&eacute;e, les bl&eacute;s sont cultiv&eacute;s sous la neige et d&eacute;veloppent ainsi une &eacute;corce robuste.</p>'),
(47, 1, 'Absolute Mango', 21, 15, 38, 1.5, '<h4>Le go&ucirc;t d\'Absolut Mango.</h4><p>Absolut Mango est exclusivement compos&eacute;e d\'ingr&eacute;dients naturels. Contrairement &agrave; la plupart des autres vodkas aromatis&eacute;es, elle ne contient aucun sucre ajout&eacute;. Absolut Mango exprime tout le caract&ecirc;re ample et fondant de la mangue pure, accompagn&eacute;e de notes de fruits tropicaux.</p><h4>Conserver le naturel.</h4><p>Absolut Mango se compose principalement d\'Absolut Vodka et d’arôme de mangue. Absolut Vodka est compos&eacute;e d\'eau douce et de bl&eacute;s d\'hiver. L\'eau provient de puits profonds situ&eacute;s &agrave; &Aring;hus, où elle est prot&eacute;g&eacute;e de toute impuret&eacute;. Les bl&eacute;s d\'hiver proviennent de cultures particuli&ecirc;res, ils sont plant&eacute;s en automne avec tr&ecirc;s peu de fertilisants et r&eacute;colt&eacute;s &agrave; la m&ecirc;me saison, l\'ann&eacute;e suivante. Tout au long de l\'ann&eacute;e, les bl&eacute;s sont cultiv&eacute;s sous la neige et d&eacute;veloppent ainsi une &eacute;corce robuste.</p>'),
(48, 1, 'Absolute Raspberri', 10, 30, 38, 0.7, '<h4>Le go&ucirc;t d\'Absolut Raspberri.</h4><p>Absolut Raspberri est exclusivement compos&eacute;e d\'ingr&eacute;dients naturels. Contrairement &agrave; la plupart des vodkas aromatis&eacute;es, elle ne contient aucun sucre ajout&eacute;. Le caract&egrave;re conciliant de la framboise s\'accorde parfaitement &agrave; de nombreuses autres saveurs.</p><h4>Conserver le naturel.</h4><p>Absolut Raspberri se compose principalement d\'Absolut Vodka et dâ??arÃ´me de framboise. Absolut Vodka est compos&eacute;e d\'eau douce et de bl&eacute;s d\'hiver. L\'eau provient de puits profonds situ&eacute;s &agrave; Ã?hus, oÃ¹ elle est prot&eacute;g&eacute;e de toute impuret&eacute;. Les bl&eacute;s d\'hiver proviennent de cultures particuli&egrave;res, ils sont plant&eacute;s en automne avec tr&egrave;s peu de fertilisants et r&eacute;colt&eacute;s &agrave; la mÃªme saison, l\'ann&eacute;e suivante. Tout au long de l\'ann&eacute;e, les bl&eacute;s sont cultiv&eacute;s sous la neige et d&eacute;veloppent ainsi une &eacute;corce robuste.</p>'),
(49, 1, 'Absolute Mango', 10, 4, 38, 0.7, '<h4>Le go&ucirc;t d\'Absolut Mango.</h4><p>Absolut Mango est exclusivement compos&eacute;e d\'ingr&eacute;dients naturels. Contrairement &agrave; la plupart des autres vodkas aromatis&eacute;es, elle ne contient aucun sucre ajout&eacute;. Absolut Mango exprime tout le caract&ecirc;re ample et fondant de la mangue pure, accompagn&eacute;e de notes de fruits tropicaux.</p><h4>Conserver le naturel.</h4><p>Absolut Mango se compose principalement d\'Absolut Vodka et d’arôme de mangue. Absolut Vodka est compos&eacute;e d\'eau douce et de bl&eacute;s d\'hiver. L\'eau provient de puits profonds situ&eacute;s &agrave; &Aring;hus, où elle est prot&eacute;g&eacute;e de toute impuret&eacute;. Les bl&eacute;s d\'hiver proviennent de cultures particuli&ecirc;res, ils sont plant&eacute;s en automne avec tr&ecirc;s peu de fertilisants et r&eacute;colt&eacute;s &agrave; la m&ecirc;me saison, l\'ann&eacute;e suivante. Tout au long de l\'ann&eacute;e, les bl&eacute;s sont cultiv&eacute;s sous la neige et d&eacute;veloppent ainsi une &eacute;corce robuste.</p>');

-- --------------------------------------------------------

--
-- Structure de la table `quoi`
--

DROP TABLE IF EXISTS `quoi`;
CREATE TABLE `quoi` (
  `ID_COMMANDE` int(11) NOT NULL,
  `ID_PRODUIT` int(11) NOT NULL,
  `QUANTITE` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `quoi`
--

INSERT INTO `quoi` (`ID_COMMANDE`, `ID_PRODUIT`, `QUANTITE`) VALUES
(1, 1, 3),
(2, 4, 8),
(2, 24, 1),
(2, 47, 3),
(3, 38, 1),
(4, 49, 3),
(5, 3, 5),
(5, 4, 5),
(5, 5, 5),
(5, 48, 5),
(6, 49, 4);

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `ID_THEME` int(11) NOT NULL,
  `NOM_THEME` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `theme`
--

INSERT INTO `theme` (`ID_THEME`, `NOM_THEME`) VALUES
(1, 'Vodka'),
(2, 'Wisky'),
(3, 'Biere'),
(4, 'Vins'),
(5, 'Rhum');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID_CLIENT`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`ID_COMMANDE`),
  ADD KEY `FK_QUI` (`ID_CLIENT`);

--
-- Index pour la table `prefere`
--
ALTER TABLE `prefere`
  ADD PRIMARY KEY (`ID_THEME`,`ID_CLIENT`),
  ADD KEY `FK_PREFERE2` (`ID_CLIENT`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`ID_PRODUIT`),
  ADD KEY `FK_APPARTIENT` (`ID_THEME`);

--
-- Index pour la table `quoi`
--
ALTER TABLE `quoi`
  ADD PRIMARY KEY (`ID_COMMANDE`,`ID_PRODUIT`),
  ADD KEY `FK_QUOI2` (`ID_PRODUIT`);

--
-- Index pour la table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`ID_THEME`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `ID_CLIENT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `ID_COMMANDE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `ID_PRODUIT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT pour la table `theme`
--
ALTER TABLE `theme`
  MODIFY `ID_THEME` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_QUI` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`);

--
-- Contraintes pour la table `prefere`
--
ALTER TABLE `prefere`
  ADD CONSTRAINT `FK_PREFERE` FOREIGN KEY (`ID_THEME`) REFERENCES `theme` (`ID_THEME`),
  ADD CONSTRAINT `FK_PREFERE2` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_APPARTIENT` FOREIGN KEY (`ID_THEME`) REFERENCES `theme` (`ID_THEME`);

--
-- Contraintes pour la table `quoi`
--
ALTER TABLE `quoi`
  ADD CONSTRAINT `FK_QUOI` FOREIGN KEY (`ID_COMMANDE`) REFERENCES `commande` (`ID_COMMANDE`),
  ADD CONSTRAINT `FK_QUOI2` FOREIGN KEY (`ID_PRODUIT`) REFERENCES `produit` (`ID_PRODUIT`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
