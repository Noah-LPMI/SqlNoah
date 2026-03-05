CREATE TABLE `Compagnie` (
  `id_compagnie` integer PRIMARY KEY,
  `code_compagnie` integer,
  `nom_compagnie` varchar(255),
  `siegeSocial_compagnie` varchar(255)
);

CREATE TABLE `Pilote` (
  `id_pilote` integer PRIMARY KEY,
  `matricule_pilote` integer,
  `nom_pilote` varchar(255),
  `prenom_pilote` varchar(255),
  `qualif_pilote` varchar(255),
  `id_compagnie` integer
);

CREATE TABLE `Avion` (
  `id_avion` integer PRIMARY KEY,
  `code_avion` varchar(255),
  `type_avion` varchar(255),
  `modele_avion` varchar(255),
  `nbPassager_avion` integer
);

CREATE TABLE `Vol` (
  `id_vol` integer,
  `id_compagnie` integer,
  `id_avion` integer,
  `id_billet` integer,
  `dateDépart` datetime,
  `dateArrivé` datetime,
  `heureDépart` timestamp,
  `heureArrivé` timestamp,
  `villeDépart` varchar(255),
  `villeArrivé` varchar(255),
  `retard` time,
  PRIMARY KEY (`id_vol`, `id_compagnie`, `id_avion`, `id_billet`)
);

CREATE TABLE `Passager` (
  `id_passager` integer PRIMARY KEY,
  `nom_passager` varchar(255),
  `prenom_passager` varchar(255),
  `dateNaissance_passager` datetime,
  `telephone_passager` varchar(255),
  `status_passager` varchar(255)
);

CREATE TABLE `Billet` (
  `id_billet` integer PRIMARY KEY,
  `num_billet` integer,
  `dateEmission_billet` datetime,
  `dateReservation_billet` datetime,
  `datePaiement_billet` datetime,
  `id_siege` integer,
  `id_passager` integer
);

CREATE TABLE `Siege` (
  `id_siege` integer PRIMARY KEY,
  `id_avion` integer,
  `numAllé_siege` integer,
  `numRang_siege` integer,
  `classe_siege` varchar(255)
);

ALTER TABLE `Pilote` ADD FOREIGN KEY (`id_compagnie`) REFERENCES `Compagnie` (`id_compagnie`);

ALTER TABLE `Vol` ADD FOREIGN KEY (`id_compagnie`) REFERENCES `Compagnie` (`id_compagnie`);

ALTER TABLE `Vol` ADD FOREIGN KEY (`id_avion`) REFERENCES `Avion` (`id_avion`);

ALTER TABLE `Billet` ADD FOREIGN KEY (`id_passager`) REFERENCES `Passager` (`id_passager`);

ALTER TABLE `Billet` ADD FOREIGN KEY (`id_siege`) REFERENCES `Siege` (`id_siege`);

ALTER TABLE `Siege` ADD FOREIGN KEY (`id_avion`) REFERENCES `Avion` (`id_avion`);

ALTER TABLE `Billet` ADD FOREIGN KEY (`id_billet`) REFERENCES `Vol` (`id_billet`);
