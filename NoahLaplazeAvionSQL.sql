USE master
GO
IF NOT EXISTS(
  SELECT top 1 1 
  FROM sys DATABASE
  WHERE NAME='avion'
  )
BEGIN  
    EXEC('CREATE DATABASE avion')
GO
USE avion
GO

CREATE TABLE [Compagnie] (
  [id_compagnie] integer PRIMARY KEY,
  [code_compagnie] integer,
  [nom_compagnie] nvarchar(255),
  [siegeSocial_compagnie] nvarchar(255)
)
GO

CREATE TABLE [Pilote] (
  [id_pilote] integer PRIMARY KEY,
  [matricule_pilote] integer,
  [nom_pilote] nvarchar(255),
  [prenom_pilote] nvarchar(255),
  [qualif_pilote] nvarchar(255),
  [id_compagnie] integer
)
GO

CREATE TABLE [Avion] (
  [id_avion] integer PRIMARY KEY,
  [code_avion] nvarchar(255),
  [type_avion] nvarchar(255),
  [modele_avion] nvarchar(255),
  [nbPassager_avion] integer
)
GO

CREATE TABLE [Vol] (
  [id_vol] integer,
  [id_compagnie] integer,
  [id_avion] integer,
  [id_billet] integer,
  [dateDépart] datetime,
  [dateArrivé] datetime,
  [heureDépart] timestamp,
  [heureArrivé] timestamp,
  [villeDépart] nvarchar(255),
  [villeArrivé] nvarchar(255),
  [retard] time,
  PRIMARY KEY ([id_vol], [id_compagnie], [id_avion], [id_billet])
)
GO

CREATE TABLE [Passager] (
  [id_passager] integer PRIMARY KEY,
  [nom_passager] nvarchar(255),
  [prenom_passager] nvarchar(255),
  [dateNaissance_passager] datetime,
  [telephone_passager] nvarchar(255),
  [status_passager] nvarchar(255)
)
GO

CREATE TABLE [Billet] (
  [id_billet] integer PRIMARY KEY,
  [num_billet] integer,
  [dateEmission_billet] datetime,
  [dateReservation_billet] datetime,
  [datePaiement_billet] datetime,
  [id_siege] integer,
  [id_passager] integer
)
GO

CREATE TABLE [Siege] (
  [id_siege] integer PRIMARY KEY,
  [id_avion] integer,
  [numAllé_siege] integer,
  [numRang_siege] integer,
  [classe_siege] nvarchar(255)
)
GO

ALTER TABLE [Pilote] ADD FOREIGN KEY ([id_compagnie]) REFERENCES [Compagnie] ([id_compagnie])
GO

ALTER TABLE [Vol] ADD FOREIGN KEY ([id_compagnie]) REFERENCES [Compagnie] ([id_compagnie])
GO

ALTER TABLE [Vol] ADD FOREIGN KEY ([id_avion]) REFERENCES [Avion] ([id_avion])
GO

ALTER TABLE [Billet] ADD FOREIGN KEY ([id_passager]) REFERENCES [Passager] ([id_passager])
GO

ALTER TABLE [Billet] ADD FOREIGN KEY ([id_siege]) REFERENCES [Siege] ([id_siege])
GO

ALTER TABLE [Siege] ADD FOREIGN KEY ([id_avion]) REFERENCES [Avion] ([id_avion])
GO

ALTER TABLE [Billet] ADD FOREIGN KEY ([id_billet]) REFERENCES [Vol] ([id_billet])
GO
