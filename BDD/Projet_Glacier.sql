-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 09 août 2023 à 16:20
-- Version du serveur : 10.6.12-MariaDB-0ubuntu0.22.04.1
-- Version de PHP : 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Projet_Glacier`
--

-- --------------------------------------------------------

--
-- Structure de la table `Congélateur`
--

CREATE TABLE `Congélateur` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(190) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `congélateur_glace`
--

CREATE TABLE `congélateur_glace` (
  `congélateur_id` bigint(20) UNSIGNED NOT NULL,
  `glace_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `congélateur_utilisateur`
--

CREATE TABLE `congélateur_utilisateur` (
  `congélateur_id` bigint(11) UNSIGNED NOT NULL,
  `utilisateur_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Glaces`
--

CREATE TABLE `Glaces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `volume` int(11) NOT NULL,
  `date_production` date NOT NULL,
  `date_sortie` date NOT NULL,
  `parfum_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Parfum`
--

CREATE TABLE `Parfum` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(190) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rôle`
--

CREATE TABLE `rôle` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(190) NOT NULL,
  `password` varchar(190) NOT NULL,
  `rôle_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Congélateur`
--
ALTER TABLE `Congélateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `congélateur_glace`
--
ALTER TABLE `congélateur_glace`
  ADD PRIMARY KEY (`congélateur_id`,`glace_id`),
  ADD KEY `fk_congélateur_glace_glace_id` (`glace_id`);

--
-- Index pour la table `congélateur_utilisateur`
--
ALTER TABLE `congélateur_utilisateur`
  ADD PRIMARY KEY (`congélateur_id`,`utilisateur_id`),
  ADD KEY `fk_congélateur_utilisateur_utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `Glaces`
--
ALTER TABLE `Glaces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Glaces_Parfum` (`parfum_id`);

--
-- Index pour la table `Parfum`
--
ALTER TABLE `Parfum`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rôle`
--
ALTER TABLE `rôle`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_utilisateur_rôle_id` (`rôle_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Congélateur`
--
ALTER TABLE `Congélateur`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Glaces`
--
ALTER TABLE `Glaces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Parfum`
--
ALTER TABLE `Parfum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rôle`
--
ALTER TABLE `rôle`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `congélateur_glace`
--
ALTER TABLE `congélateur_glace`
  ADD CONSTRAINT `fk_congélateur_glace_congélateur_id` FOREIGN KEY (`congélateur_id`) REFERENCES `Congélateur` (`id`),
  ADD CONSTRAINT `fk_congélateur_glace_glace_id` FOREIGN KEY (`glace_id`) REFERENCES `Glaces` (`id`);

--
-- Contraintes pour la table `congélateur_utilisateur`
--
ALTER TABLE `congélateur_utilisateur`
  ADD CONSTRAINT `fk_congélateur_utilisateur_congélateur_id` FOREIGN KEY (`congélateur_id`) REFERENCES `Congélateur` (`id`),
  ADD CONSTRAINT `fk_congélateur_utilisateur_utilisateur_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `Glaces`
--
ALTER TABLE `Glaces`
  ADD CONSTRAINT `fk_Glaces_Parfum` FOREIGN KEY (`parfum_id`) REFERENCES `Parfum` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_utilisateur_rôle_id` FOREIGN KEY (`rôle_id`) REFERENCES `rôle` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
