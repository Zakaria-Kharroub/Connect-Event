-- creationn database
CREATE DATABASE connect_event;
USE connect_event;

-- la creation de table organisateur 
CREATE TABLE organisateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(255),
    email VARCHAR(255)
) ENGINE=InnoDB;

-- creation de table lieu
CREATE TABLE lieu (
    id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255),
    address VARCHAR(255)
) ENGINE=InnoDB;

-- creation de table evenement
CREATE TABLE evenement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    date_debut DATE,
    date_fin DATE,
    id_organisateur INT,
    id_lieu INT,
    FOREIGN KEY (id_organisateur) REFERENCES organisateur(id),
    FOREIGN KEY (id_lieu) REFERENCES lieu(id)
) ENGINE=InnoDB;


-- creation de table organisation
creation de table 
CREATE TABLE organisation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_evenement INT,
    id_organisateur INT,
    FOREIGN KEY (id_evenement) REFERENCES evenement(id),
    FOREIGN KEY (id_organisateur) REFERENCES organisateur(id)
) ENGINE=InnoDB;


-- creation de table participant
CREATE TABLE participant (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
) ENGINE=InnoDB;


-- creation de table billet
CREATE TABLE billet (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prix DECIMAL(10, 2),
    type VARCHAR(50),
    id_evenement INT,
    FOREIGN KEY (id_evenement) REFERENCES evenement(id)
) ENGINE=InnoDB;


-- creation de table sponsor
CREATE TABLE sponsor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
) ENGINE=InnoDB;



creation de table 
CREATE TABLE pub (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_evenement INT,
    id_sponsor INT,
    FOREIGN KEY (id_evenement) REFERENCES evenement(id),
    FOREIGN KEY (id_sponsor) REFERENCES sponsor(id)
) ENGINE=InnoDB;

CREATE TABLE retour (
    id INT AUTO_INCREMENT PRIMARY KEY,
    note VARCHAR(255),
    id_evenement INT,
    FOREIGN KEY (id_evenement) REFERENCES evenement(id)
) ENGINE=InnoDB;



-- j'ai oublier ajouter id_participant dans la table biller

ALTER TABLE billet
ADD COLUMN id_participant INT,
ADD FOREIGN KEY (id_participant) REFERENCES participant(id);