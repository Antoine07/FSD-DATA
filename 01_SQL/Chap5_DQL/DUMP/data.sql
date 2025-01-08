DROP TABLE pilots, companies;

CREATE TABLE companies (
    comp CHAR(10) PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    num_street INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL,
    bonus DECIMAL(10, 2) DEFAULT 0
);

CREATE TABLE pilots (
    certificate CHAR(20) PRIMARY KEY,
    company CHAR(10),
    name VARCHAR(255) NOT NULL,
    num_flying DECIMAL(5, 2),
    created DATETIME,
    birth_date DATETIME NOT NULL,
    next_flight DATETIME,
    num_jobs INT ,
    age SMALLINT UNSIGNED,
    plane VARCHAR(10) ,
    bonus DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (company) REFERENCES companies(comp) 
);


-- Données pour la table companies
-- ALTER TABLE companies
-- ADD COLUMN bonus DECIMAL(10, 2) DEFAULT 0;

INSERT INTO companies (comp, street, city, num_street, name, status, bonus) VALUES
('JJ10', 'Rue de Rivoli', 'Paris', 220, 'Paris Air', 'published', 300.00),
('KK11', 'Avenue des Champs', 'Lyon', 300, 'Lyon Airways', 'published', 250.00),
('LL12', 'Boulevard Montmartre', 'Marseille', 150, 'Blue Sky Airlines', 'draft', 200.00),
('MM13', 'Place de la Concorde', 'Bordeaux', 100, 'Concorde Aviation', 'published', 350.00),
('NN14', 'Rue de la Paix', 'Nice', 120, 'Riviera Air', 'unpublished', 0.00),
('OO15', 'Avenue de l’Opéra', 'Toulouse', 85, 'Opéra Air', 'published', 400.00),
('PP16', 'Boulevard Haussmann', 'Nantes', 50, 'Atlantic Jet', 'draft', 150.00),
('QQ17', 'Rue Saint-Honoré', 'Strasbourg', 80, 'Alsace Aviation', 'published', 500.00),
('RR18', 'Oxford Street', 'London', 200, 'London Skies', 'published', 420.00),
('SS19', 'Broadway', 'New York', 300, 'Empire Airways', 'draft', 300.00),
('TT20', 'Friedrichstraße', 'Berlin', 250, 'Berlin Air', 'published', 350.00),
('UU21', 'Via Condotti', 'Rome', 150, 'Rome Jet', 'published', 380.00),
('VV22', 'Gran Vía', 'Madrid', 180, 'Madrid Skies', 'draft', 275.00),
('WW23', 'Avenue Louise', 'Brussels', 130, 'Brussels Aviation', 'unpublished', 0.00),
('XX24', 'La Rambla', 'Barcelona', 110, 'Catalonia Air', 'published', 450.00),
('YY25', 'Orchard Road', 'Singapore', 90, 'Singapore Flyers', 'published', 600.00),
('ZZ26', 'Nathan Road', 'Hong Kong', 70, 'Hong Kong Skies', 'published', 550.00),
('AA27', 'Fifth Avenue', 'Los Angeles', 310, 'Pacific Airways', 'draft', 400.00),
('BB28', 'Collins Street', 'Melbourne', 220, 'Aussie Aviation', 'published', 500.00),
('CC29', 'Shinjuku Avenue', 'Tokyo', 330, 'Tokyo Skies', 'published', 650.00);



-- Données pour la table pilots avec bonus

INSERT INTO pilots (certificate, company, num_flying, name, created, birth_date, next_flight, num_jobs, age, plane, bonus) VALUES
-- Pilotes pour Paris
('PIL100', 'JJ10', 45.0, 'Alice Martin', '2024-01-15 08:00:00', '1980-03-15 00:00:00', '2025-01-20 10:00:00', 5, 45, 'A320', 150.00),
('PIL101', 'JJ10', 50.0, 'Pierre Dupont', '2024-01-20 09:30:00', '1985-07-12 00:00:00', '2025-02-15 11:00:00', 7, 39, 'A380', 200.00),

-- Pilotes pour Lyon
('PIL102', 'KK11', 35.0, 'Chloé Dubois', '2024-02-10 10:00:00', '1990-08-20 00:00:00', '2025-03-01 14:00:00', 4, 34, 'A330', 180.00),
('PIL103', 'KK11', 30.0, 'Hugo Lefevre', '2024-02-15 11:30:00', '1995-03-10 00:00:00', '2025-03-20 09:00:00', 6, 29, 'B737', 150.00),

-- Pilotes pour Marseille
('PIL104', 'LL12', 28.0, 'Emma Petit', '2024-03-01 09:00:00', '1992-11-25 00:00:00', '2025-04-05 13:30:00', 5, 32, 'B767', 100.00),
('PIL105', 'LL12', 33.0, 'Théo Boisvert', '2024-03-05 13:00:00', '1988-01-14 00:00:00', '2025-04-25 11:00:00', 3, 36, 'A320', 140.00),

-- Pilotes pour Berlin
('PIL106', 'TT20', 40.0, 'Hans Müller', '2024-03-10 12:00:00', '1987-07-07 00:00:00', '2025-05-10 10:00:00', 4, 37, 'B777', 180.00),
('PIL107', 'TT20', 38.0, 'Sophia Schmidt', '2024-03-15 14:00:00', '1990-04-22 00:00:00', '2025-06-01 12:30:00', 5, 34, 'A350', 170.00),

-- Pilotes pour New York
('PIL108', 'SS19', 50.0, 'John Smith', '2024-04-01 10:00:00', '1980-09-15 00:00:00', '2025-07-10 15:00:00', 7, 44, 'A380', 250.00),
('PIL109', 'SS19', 45.0, 'Laura Jones', '2024-04-05 11:00:00', '1983-02-14 00:00:00', '2025-08-05 09:00:00', 8, 41, 'B787', 230.00),

-- Pilotes pour Tokyo
('PIL110', 'CC29', 48.0, 'Takumi Tanaka', '2024-04-10 13:30:00', '1979-12-01 00:00:00', '2025-09-01 11:45:00', 10, 46, 'A320', 300.00),
('PIL111', 'CC29', 52.0, 'Haruka Sato', '2024-04-15 08:00:00', '1981-05-20 00:00:00', '2025-10-01 14:30:00', 9, 43, 'B767', 280.00),

-- Autres pilotes pour divers pays
('PIL112', 'YY25', 60.0, 'Sarah Lee', '2024-05-01 09:00:00', '1985-06-10 00:00:00', '2025-11-10 13:00:00', 12, 39, 'A350', 400.00),
('PIL113', 'ZZ26', 55.0, 'Jason Wong', '2024-05-05 14:00:00', '1990-03-05 00:00:00', '2025-12-01 10:00:00', 11, 34, 'B777', 370.00),
('PIL114', 'UU21', 44.0, 'Marco Rossi', '2024-05-10 12:30:00', '1988-09-22 00:00:00', '2026-01-15 09:30:00', 7, 36, 'A330', 220.00),
('PIL115', 'VV22', 30.0, 'Carlos Fernandez', '2024-05-15 15:00:00', '1995-11-30 00:00:00', '2026-02-10 14:15:00', 4, 29, 'B787', 180.00);
-- Ajoutez davantage pour atteindre 50 pilotes.

INSERT INTO pilots (certificate, company, num_flying, name, created, birth_date, next_flight, num_jobs, age, plane, bonus) VALUES
-- Pilotes pour Brussels
('PIL116', 'WW23', 42.0, 'Julien Lambert', '2024-06-01 10:00:00', '1986-04-12 00:00:00', '2025-01-15 13:30:00', 6, 38, 'A320', 200.00),
('PIL117', 'WW23', 38.0, 'Nina Dupuis', '2024-06-05 08:30:00', '1990-07-18 00:00:00', '2025-02-05 12:00:00', 4, 34, 'B737', 180.00),

-- Pilotes pour Barcelona
('PIL118', 'XX24', 46.0, 'Miguel López', '2024-06-10 09:00:00', '1982-03-25 00:00:00', '2025-03-15 14:00:00', 7, 42, 'B777', 250.00),
('PIL119', 'XX24', 49.0, 'Clara Torres', '2024-06-15 13:00:00', '1980-09-10 00:00:00', '2025-04-01 11:30:00', 8, 44, 'A350', 300.00),

-- Pilotes pour Rome
('PIL120', 'UU21', 40.0, 'Giulia Bianchi', '2024-06-20 12:00:00', '1985-02-20 00:00:00', '2025-04-20 10:00:00', 6, 39, 'B787', 220.00),
('PIL121', 'UU21', 36.0, 'Luca Moretti', '2024-06-25 14:30:00', '1989-05-15 00:00:00', '2025-05-15 09:15:00', 4, 35, 'A320', 180.00),

-- Pilotes pour Melbourne
('PIL122', 'BB28', 50.0, 'Emily Johnson', '2024-07-01 08:00:00', '1984-11-22 00:00:00', '2025-06-01 12:30:00', 9, 40, 'A330', 280.00),
('PIL123', 'BB28', 48.0, 'Oliver Davis', '2024-07-05 10:30:00', '1982-01-30 00:00:00', '2025-06-20 11:45:00', 8, 42, 'B777', 260.00),

-- Pilotes pour Singapore
('PIL124', 'YY25', 60.0, 'Amara Singh', '2024-07-10 09:00:00', '1981-09-12 00:00:00', '2025-07-15 14:00:00', 12, 43, 'A380', 450.00),
('PIL125', 'YY25', 55.0, 'Wei Tan', '2024-07-15 12:30:00', '1988-12-05 00:00:00', '2025-08-01 09:30:00', 10, 36, 'A350', 400.00),

-- Pilotes pour Los Angeles
('PIL126', 'AA27', 45.0, 'Jessica Brown', '2024-07-20 08:30:00', '1985-06-20 00:00:00', '2025-08-20 13:15:00', 8, 39, 'B787', 320.00),
('PIL127', 'AA27', 48.0, 'Ryan Wilson', '2024-07-25 11:00:00', '1983-09-30 00:00:00', '2025-09-05 14:30:00', 9, 41, 'A320', 340.00),

-- Pilotes pour Hong Kong
('PIL128', 'ZZ26', 58.0, 'Ling Wei', '2024-08-01 09:00:00', '1980-03-15 00:00:00', '2025-09-20 12:30:00', 11, 45, 'B777', 420.00),
('PIL129', 'ZZ26', 52.0, 'Kai Zhang', '2024-08-05 14:00:00', '1987-11-28 00:00:00', '2025-10-10 11:15:00', 10, 37, 'A380', 380.00),

-- Pilotes pour Berlin
('PIL130', 'TT20', 42.0, 'Klaus Wagner', '2024-08-10 13:30:00', '1983-07-14 00:00:00', '2025-11-01 14:45:00', 7, 41, 'B737', 220.00),
('PIL131', 'TT20', 40.0, 'Ingrid Meier', '2024-08-15 12:00:00', '1985-05-10 00:00:00', '2025-11-15 09:30:00', 6, 39, 'A350', 240.00),

-- Pilotes pour New York
('PIL132', 'SS19', 54.0, 'Michael Johnson', '2024-08-20 08:30:00', '1981-09-25 00:00:00', '2025-12-01 13:15:00', 11, 43, 'B777', 380.00),
('PIL133', 'SS19', 51.0, 'Anna Roberts', '2024-08-25 14:30:00', '1987-12-20 00:00:00', '2025-12-15 10:30:00', 10, 37, 'A320', 350.00),

-- Pilotes pour Tokyo
('PIL134', 'CC29', 49.0, 'Yuki Nakamura', '2024-09-01 12:00:00', '1983-04-22 00:00:00', '2026-01-01 14:30:00', 8, 41, 'A330', 300.00),
('PIL135', 'CC29', 45.0, 'Aya Suzuki', '2024-09-05 09:30:00', '1985-11-12 00:00:00', '2026-01-15 11:15:00', 7, 39, 'B787', 280.00),

-- Pilotes pour Paris
('PIL136', 'JJ10', 55.0, 'Émilie Rousseau', '2024-09-10 10:00:00', '1981-08-20 00:00:00', '2026-02-01 10:00:00', 9, 43, 'A380', 400.00),
('PIL137', 'JJ10', 52.0, 'Antoine Girard', '2024-09-15 14:30:00', '1984-03-15 00:00:00', '2026-02-20 12:30:00', 10, 40, 'A350', 380.00);
