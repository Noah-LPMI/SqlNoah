USE master
GO
CREATE DATABASE biblio
GO
USE biblio
GO

CREATE TABLE [Auteur] (
  [id_auteur] integer PRIMARY KEY,
  [nom_auteur] nvarchar(255),
  [prenom_auteur] nvarchar(255),
  [date_auteur] datetime,
  [id_pays] integer
)
GO

CREATE TABLE [Pays] (
  [id_pays] integer PRIMARY KEY,
  [nom_pays] nvarchar(255)
)
GO

CREATE TABLE [Livre] (
  [id_Livre] integer PRIMARY KEY,
  [titre_livre] nvarchar(255),
  [annee_parution] datetime,
  [resume] nvarchar(255)
)
GO

CREATE TABLE [AEcrit] (
  [id_Livre] integer,
  [id_Auteur] integer,
  PRIMARY KEY ([id_Livre], [id_Auteur])
)
GO

CREATE TABLE [Exemplaire] (
  [id_exemplaire] integer PRIMARY KEY,
  [reference_exemplaire] nvarchar(255),
  [id_livre] integer,
  [id_edition] integer
)
GO

CREATE TABLE [Edition] (
  [id_edition] integer PRIMARY KEY,
  [nom_edition] nvarchar(255)
)
GO

CREATE TABLE [Type] (
  [id_type] integer PRIMARY KEY,
  [nom_type] nvarchar(255)
)
GO

CREATE TABLE [ApourType] (
  [id_type] integer,
  [id_livre] integer,
  PRIMARY KEY ([id_type], [id_livre])
)
GO

CREATE TABLE [Inscrit] (
  [id_inscrit] integer PRIMARY KEY,
  [nom_inscrit] nvarchar(255),
  [prenom_inscrit] nvarchar(255),
  [adresse_rue_inscrit] nvarchar(255),
  [asdresse_cp_inscrit] integer,
  [telephone_inscrit] integer,
  [email_inscrit] nvarchar(255)
)
GO

CREATE TABLE [Emprunt] (
  [reference_emprunt] nvarchar(255),
  [date_emprunt] datetime,
  [delai_emprunt] integer,
  [id_inscrit] integer,
  [id_exemplaire] integer
)
GO

ALTER TABLE [Auteur] ADD FOREIGN KEY ([id_pays]) REFERENCES [Pays] ([id_pays])
GO

ALTER TABLE [AEcrit] ADD FOREIGN KEY ([id_Auteur]) REFERENCES [Auteur] ([id_auteur])
GO

ALTER TABLE [AEcrit] ADD FOREIGN KEY ([id_Livre]) REFERENCES [Livre] ([id_Livre])
GO

ALTER TABLE [Exemplaire] ADD FOREIGN KEY ([id_edition]) REFERENCES [Edition] ([id_edition])
GO

ALTER TABLE [Exemplaire] ADD FOREIGN KEY ([id_livre]) REFERENCES [Livre] ([id_Livre])
GO

ALTER TABLE [ApourType] ADD FOREIGN KEY ([id_livre]) REFERENCES [Livre] ([id_Livre])
GO

ALTER TABLE [ApourType] ADD FOREIGN KEY ([id_type]) REFERENCES [Type] ([id_type])
GO

ALTER TABLE [Emprunt] ADD FOREIGN KEY ([id_exemplaire]) REFERENCES [Exemplaire] ([id_exemplaire])
GO

ALTER TABLE [Emprunt] ADD FOREIGN KEY ([id_inscrit]) REFERENCES [Inscrit] ([id_inscrit])
GO
