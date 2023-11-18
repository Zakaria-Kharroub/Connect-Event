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



-- creation de table pub
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





-- insertion de table participant

INSERT INTO participant (name, email)
VALUES 
    ('hamza', 'hamza@gmail.com'),
    ('khalid', 'khalid@gmail.com'),
    ('yasser', 'yasser@gmail.com'),
    ('adam', 'adam@gmail.com'),
    ('ali', 'ali@gmail.com'),
    ('khadijam', 'khadijam@gmail.com'),
    ('siren', 'siren@gmail.com');



-- insertion dans la table organisateur
INSERT INTO organisateur
VALUES ('BDE group', 'bdegroup@example.com'),
('youcode', 'youcode@example.com'),
('um6p','um6p@gmail.com'),
('simplon','simplon@gmail.com');

--  insert dans la table lieu
INSERT INTO lieu (name, address)
VALUES 
    ('casa', 'bernoussi TARIQ'),
    ('yousoufia', 'quatier mohamadi'),
    ('rabat', 'agdal - rue france');


-- insession dans la table evenement
INSERT INTO evenement (name, date_debut, date_fin, id_organisateur, id_lieu)
VALUES 
    ('journey integration', '2023-11-25', '2023-11-28', 3, 1),
    ('workshop', '2023-11-26', '2023-11-29', 3, 1),
    ('hackathon', '2023-11-30', '2024-1-4', 2, 3),
    ('workshop mysql', '2024-1-25', '2024-1-29', 2, 3),
    ('DEVOX', '2024-2-12', '2024-2-18', 1, 2),
    ('evenement de META', '2024-3-20', '2024-3-27', 2, 2),
    ('huawei', '2024-4-2', '2024-4-4', 2, 3),
    ('workshop java', '2024-4-22', '2024-4-25', 3, 1),
    ('AI', '2024-5-2', '2024-5-3', 1, 2);



-- insertion das la table organisation
INSERT INTO organisation (id_evenement, id_organisateur)
VALUES 
    (2, 2), 
    (1, 1), 
    (2, 3),
    (3, 3);



-- insertion dans la table billet
INSERT INTO billet (prix, type, id_evenement)
VALUES 
    (50.00, 'VIP', 1),
    (30.00, 'Standard', 1),
    (45.00, 'VIP', 1),
    (25.00, 'Standard', 2),
    (55.00, 'VIP', 2),
    (35.00, 'Standard', 2),
    (40.00, 'VIP', 1),
    (28.00, 'Standard', 1),
    (48.00, 'VIP', 2),
    (32.00, 'Standard', 2);



