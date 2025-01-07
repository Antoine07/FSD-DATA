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
('KK11', 'Avenue des Champs', 'Paris', 300, 'Eiffel Airways', 'published', 250.00),
('LL12', 'Boulevard Montmartre', 'Paris', 150, 'Blue Sky Airlines', 'draft', 200.00),
('MM13', 'Place de la Concorde', 'Paris', 100, 'Concorde Aviation', 'published', 350.00),
('NN14', 'Rue de la Paix', 'Paris', 120, 'LuxAir', 'unpublished', 0.00),
('OO15', 'Avenue de l’Opéra', 'Paris', 85, 'Opéra Air', 'published', 400.00),
('PP16', 'Boulevard Haussmann', 'Paris', 50, 'Paris Jet', 'draft', 150.00),
('QQ17', 'Rue Saint-Honoré', 'Paris', 80, 'Honoré Aviation', 'published', 500.00);


-- Données pour la table pilots avec bonus
INSERT INTO pilots (certificate, company, num_flying, name, created, birth_date, next_flight, num_jobs, age, plane, bonus) VALUES
('ABC100', 'JJ10', 40.0, 'Alice Martin', '2024-01-15 08:00:00', '1980-03-15 00:00:00', '2025-01-20 10:00:00', 5, 45, 'A320', 150.00),
('DEF101', 'KK11', 35.0, 'Ben Dupont', '2024-01-17 09:30:00', '1990-07-18 00:00:00', '2025-02-05 12:00:00', 4, 34, 'A330', 180.00),
('GHI102', 'LL12', 28.0, 'Clara Dubois', '2024-01-20 11:00:00', '1985-12-02 00:00:00', '2025-03-01 13:30:00', 6, 39, 'B767', 120.00),
('JKL103', 'MM13', 22.0, 'David Lefevre', '2024-02-10 10:15:00', '1992-01-10 00:00:00', '2025-04-20 09:00:00', 3, 32, 'A350', 0.00),
('MNO104', 'NN14', 50.0, 'Evelyn Petit', '2024-02-15 12:00:00', '1981-06-25 00:00:00', '2025-05-05 11:30:00', 7, 43, 'B777', 250.00),
('PQR105', 'OO15', 45.0, 'Franck Renault', '2024-02-18 14:30:00', '1984-09-05 00:00:00', '2025-06-10 15:00:00', 8, 40, 'B737', 100.00),
('STU106', 'PP16', 30.0, 'Géraldine Moreau', '2024-03-02 09:00:00', '1991-03-25 00:00:00', '2025-07-15 13:45:00', 4, 34, 'A380', 50.00),
('XYZ107', 'QQ17', 40.0, 'Hugo Lefevre', '2024-03-05 11:00:00', '1995-10-22 00:00:00', '2025-08-01 09:30:00', 2, 29, 'A340', 80.00),
('LMN108', 'JJ10', 30.0, 'Iris Tanguy', '2024-03-10 13:30:00', '1990-04-18 00:00:00', '2025-09-05 14:30:00', 5, 34, 'A330', 180.00),
('OPQ109', 'KK11', 25.0, 'Jackie Bourgeois', '2024-03-15 10:00:00', '1988-08-25 00:00:00', '2025-10-10 13:00:00', 3, 36, 'B787', 120.00),
('RST110', 'LL12', 50.0, 'Lise Perrot', '2024-04-01 15:00:00', '1980-01-20 00:00:00', '2025-11-05 12:00:00', 9, 45, 'A320', 220.00),
('UVW111', 'MM13', 20.0, 'Maya Chartier', '2024-04-05 09:30:00', '1997-07-10 00:00:00', '2025-12-25 10:30:00', 1, 28, 'B767', 30.00),
('XYZ112', 'NN14', 45.0, 'Nicolas Delacroix', '2024-04-10 12:45:00', '1983-12-12 00:00:00', '2026-01-10 14:00:00', 7, 41, 'A350', 200.00),
('LMN113', 'OO15', 40.0, 'Olivier Vasseur', '2024-04-12 08:30:00', '1986-06-07 00:00:00', '2026-02-20 11:15:00', 4, 39, 'B777', 150.00),
('OPQ114', 'PP16', 50.0, 'Pauline Lambert', '2024-04-15 10:00:00', '1990-04-18 00:00:00', '2026-03-25 12:00:00', 8, 35, 'A330', 100.00),
('RST115', 'QQ17', 55.0, 'Quentin Charron', '2024-04-17 13:30:00', '1982-11-15 00:00:00', '2026-04-10 10:30:00', 6, 42, 'B787', 75.00),
('UVW116', 'JJ10', 45.0, 'Rachel Dupuis', '2024-05-01 08:30:00', '1990-08-10 00:00:00', '2026-05-12 14:45:00', 4, 35, 'A320', 90.00),
('XYZ117', 'KK11', 33.0, 'Sophie Garcin', '2024-05-10 11:45:00', '1992-03-01 00:00:00', '2026-06-01 13:00:00', 2, 33, 'A350', 160.00),
('LMN118', 'LL12', 38.0, 'Théo Boisvert', '2024-05-12 09:00:00', '1985-01-12 00:00:00', '2026-07-05 12:00:00', 6, 40, 'B767', 120.00),
('OPQ119', 'MM13', 40.0, 'Ursula Lefevre', '2024-05-18 08:00:00', '1987-09-20 00:00:00', '2026-08-15 11:30:00', 5, 38, 'A330', 50.00),
('RST120', 'NN14', 42.0, 'Victor Lambert', '2024-05-22 14:15:00', '1982-04-14 00:00:00', '2026-09-25 13:30:00', 7, 43, 'B787', 170.00),
('UVW121', 'OO15', 39.0, 'Wendy Marchand', '2024-05-25 10:00:00', '1996-02-02 00:00:00', '2026-10-10 09:45:00', 3, 29, 'A350', 60.00),
('XYZ122', 'PP16', 35.0, 'Xavier Duval', '2024-06-02 12:30:00', '1989-11-12 00:00:00', '2026-11-05 15:00:00', 5, 36, 'B777', 110.00),
('LMN123', 'QQ17', 42.0, 'Yasmine Granger', '2024-06-10 09:00:00', '1984-03-30 00:00:00', '2026-12-01 10:30:00', 6, 41, 'A320', 150.00);
