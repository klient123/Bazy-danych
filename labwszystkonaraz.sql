CREATE TABLE IF NOT EXISTS pracownik (
    id_pracownika INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(40) NOT NULL,
    nazwisko VARCHAR(60) NOT NULL,
    data_urodzenia DATE NOT NULL
);

INSERT INTO pracownik (imie, nazwisko, data_urodzenia) VALUES
('Jan', 'Kowalski', '1990-05-12'),
('Anna', 'Nowak', '1985-10-20'),
('Piotr', 'Zieliński', '1992-03-15');

UPDATE pracownik 
SET data_urodzenia = '1991-01-01' 
WHERE id_pracownika = 1;

CREATE TABLE IF NOT EXISTS zadanie (
    id_zadania INT AUTO_INCREMENT PRIMARY KEY,
    nazwa_zadania VARCHAR(150) NOT NULL,
    priorytet ENUM('normalny', 'wysoki', 'niski'),
    opis TEXT,
    pracownik INT,
    FOREIGN KEY (pracownik) REFERENCES pracownik(id_pracownika) ON DELETE SET NULL
);

ALTER TABLE zadanie MODIFY COLUMN priorytet ENUM('normalny', 'wysoki', 'niski') DEFAULT 'normalny';
 
INSERT INTO zadanie (nazwa_zadania, priorytet, opis, pracownik) VALUES 
('Projektowanie bazy danych', 'wysoki', 'Przygotowanie schematu ERD', 1), 
('Implementacja API', 'normalny', 'Stworzenie endpointów REST', 2), 
('Testy jednostkowe', 'niski', 'Napisanie testów dla modułu logowania', 3);


CREATE TABLE IF NOT EXISTS projekt (
    id_projektu INT AUTO_INCREMENT PRIMARY KEY,
    nazwa_projektu VARCHAR(150) NOT NULL,
    data_rozpoczecia DATE NOT NULL,
    data_zakonczenia DATE
);

ALTER TABLE projekt ADD COLUMN menadzer_projektu INT;
ALTER TABLE projekt ADD CONSTRAINT fk_projekt_pracownik 
    FOREIGN KEY (menadzer_projektu) REFERENCES pracownik(id_pracownika);
    
    
 INSERT INTO projekt (nazwa_projektu, data_rozpoczecia, data_zakonczenia, menadzer_projektu) VALUES
('System CRM', '2025-01-01', '2025-06-30', 1),
('Aplikacja Mobilna', '2025-02-15', NULL, 2);   


ALTER TABLE zadanie ADD COLUMN projekt INT;
ALTER TABLE zadanie ADD CONSTRAINT fk_zadanie_projekt 
    FOREIGN KEY (projekt) REFERENCES projekt(id_projektu) ON DELETE CASCADE;

UPDATE zadanie SET projekt = 1 WHERE id_zadania IN (1, 2);
UPDATE zadanie SET projekt = 2 WHERE id_zadania = 3;

CREATE TABLE status (
    id_statusu INT AUTO_INCREMENT PRIMARY KEY,
    nazwa_statusu VARCHAR(20) NOT NULL




INSERT INTO status (nazwa_statusu) VALUES
('Nowe'),
('W toku'),
('Zakończone');

CREATE TABLE zadanie_has_status (
    id_zdarzenia INT AUTO_INCREMENT PRIMARY KEY,
    id_zadania INT NOT NULL,
    id_statusu INT NOT NULL,
    data_zdarzenia DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_zadania) REFERENCES zadanie(id_zadania) ON DELETE CASCADE,
    FOREIGN KEY (id_statusu) REFERENCES status(id_statusu)
    
INSERT INTO zadanie_has_status (id_zadania, id_statusu) VALUES
(1, 1),
(2, 2),
(3, 3);

DELETE FROM projekt WHERE id_projektu = 1;

ALTER TABLE zadanie DROP FOREIGN KEY fk_zadanie_sprint;
ALTER TABLE zadanie DROP COLUMN sprint;
DROP TABLE sprint;\

ALTER TABLE projekt DROP FOREIGN KEY fk_projekt_pracownik;

ALTER TABLE zadanie DROP FOREIGN KEY zadanie_ibfk_1;

ALTER TABLE pracownik MODIFY id_pracownika INT;

ALTER TABLE pracownik DROP PRIMARY KEY;

ALTER TABLE pracownik MODIFY id_pracownika INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE zadanie ADD CONSTRAINT zadanie_ibfk_1 

    FOREIGN KEY (pracownik) REFERENCES pracownik(id_pracownika) ON DELETE SET NULL;
    
    ALTER TABLE projekt ADD CONSTRAINT fk_projekt_pracownik 
    
    FOREIGN KEY (menadzer_projektu) REFERENCES pracownik(id_pracownika);
    
    
ALTER TABLE zadanie ADD COLUMN godziny_szacowane INT DEFAULT 8;

UPDATE zadanie SET godziny_szacowane = 4 WHERE id_zadania = 1;

UPDATE zadanie SET godziny_szacowane = 12 WHERE id_zadania = 2;

UPDATE zadanie SET godziny_szacowane = 16 WHERE id_zadania = 3;

ALTER TABLE zadanie ALTER COLUMN godziny_szacowane SET DEFAULT 6;

INSERT INTO zadanie (nazwa_zadania, priorytet, opis) VALUES 

('Zadanie testowe domyślne', 'normalny', 'Sprawdzenie wartości domyślnej');

SELECT * FROM zadanie WHERE nazwa_zadania = 'Zadanie testowe domyślne';

DELETE FROM zadanie WHERE nazwa_zadania = 'Zadanie testowe domyślne';

ALTER TABLE projekt ADD COLUMN opis_kratki VARCHAR(50);

ALTER TABLE projekt MODIFY COLUMN opis_kratki VARCHAR(200);

UPDATE projekt SET opis_kratki = 'MVP' WHERE id_projektu = 1;

UPDATE projekt SET opis_kratki = 'pilne wdrożenie' WHERE id_projektu = 2;

ALTER TABLE projekt DROP COLUMN opis_kratki;

ALTER TABLE zadanie DROP FOREIGN KEY fk_zadanie_projekt;
ALTER TABLE zadanie ADD CONSTRAINT fk_zadanie_projekt 

    FOREIGN KEY (projekt) REFERENCES projekt(id_projektu) ON DELETE SET NULL;
    
    DELETE FROM projekt WHERE id_projektu = 2;
    
    SELECT id_zadania, nazwa_zadania, projekt FROM zadanie;
    
    
    
    
    
    
    
CREATE TABLE CLIENT AS SELECT * FROM company_2025.CLIENT;

CREATE TABLE `ORDER` AS SELECT * FROM company_2025.ORDER;

CREATE TABLE EMPLOYEE AS SELECT * FROM company_2025.EMPLOYEE;
SELECT * FROM `ORDER`;
SELECT * FROM `ORDER` 
WHERE ORDER_STATUS = 5;
SELECT ORDER_ID, ORDER_STATUS 
FROM `ORDER` 
WHERE CLIENT_ID IN (1, 3, 5);

SELECT * FROM EMPLOYEE 
WHERE imie = 'Agnieszka' AND zarobki = 3900;

SELECT * FROM EMPLOYEE 
WHERE zarobki BETWEEN 5000 AND 7000;

SELECT * FROM CLIENT 
WHERE nazwa_skrocona LIKE '%eco%' AND IS_COMPANY = 1;

SELECT * FROM `ORDER` 
WHERE MONTH(ORDER_DATE) IN (6, 7);

SELECT * FROM CLIENT 
WHERE TAX_IDENTIFIER IS NOT NULL 
ORDER BY SHORT_NAME ASC;

SELECT * FROM EMPLOYEE 
ORDER BY BIRTH_DATE ASC 
LIMIT 5;

SELECT DISTINCT FIRST_NAME FROM EMPLOYEE;

SELECT CONCAT(FIRST_NAME, ' - ', LAST_NAME) AS pracownik 
FROM EMPLOYEE 
WHERE LAST_NAME LIKE 'Ko%';

SELECT LAST_NAME, SALARY 
FROM EMPLOYEE 
WHERE YEAR(HIRE_DATE) BETWEEN 2010 AND 2014;

SELECT 
    SALARY AS pensja, 
    SALARY * 0.75 AS pensja_netto, 
    SALARY * 0.25 AS kwota_podatku 
FROM EMPLOYEE;

SELECT * FROM CLIENT 
WHERE TAX_IDENTIFIER IS NULL;

SELECT SHORT_NAME 
FROM CLIENT 
WHERE SHORT_NAME LIKE 'K%' OR SHORT_NAME LIKE '%ski' 
ORDER BY SHORT_NAME DESC;











