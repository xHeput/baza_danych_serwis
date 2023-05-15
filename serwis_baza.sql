CREATE  OR REPLACE DATABASE serwis;
use serwis;


CREATE OR REPLACE TABLE klient(
    id_klienta INT AUTO_INCREMENT,
    zglaszajacy VARCHAR(50) NULL,
    email VARCHAR(30) NOT NULL,
    telefon VARCHAR(15) NOT NULL,
    miejscowość VARCHAR(25) NOT NULL,
    kod VARCHAR(6) NOT NULL,
        PRIMARY KEY(id_klienta)
)
Engine=InnoDB DEFAULT charset="utf8";       


CREATE OR REPLACE TABLE konto(
    id_konta INT AUTO_INCREMENT,
    Login VARCHAR(20) NOT NULL,
    Password VARCHAR(35) NOT NULL,
        PRIMARY KEY(id_konta),
        id_klienta INT NOT NULL,
                        CONSTRAINT konto_id_klienta_fk
                        FOREIGN KEY (id_klienta)
                        REFERENCES klient(id_klienta)

)
Engine=InnoDB DEFAULT charset="utf8";  

CREATE OR REPLACE TABLE zgloszenie(
    id_zgloszenia INT AUTO_INCREMENT,
    opis_usterki TINYTEXT NOT NULL,
    data_zgloszenia DATE NOT NULL,
    data_odbioru DATE NOT NULL,
        PRIMARY KEY(id_zgloszenia),
        id_klienta INT NOT NULL,
                        CONSTRAINT zgloszenie_id_klienta_fk
                        FOREIGN KEY(id_klienta)
                        REFERENCES klient(id_klienta),
        id_pracownika INT NOT NULL,
                            CONSTRAINT zgloszenie_id_pracownika_fk
                            FOREIGN KEY(id_pracownika)
                            REFERENCES pracownik(id_pracownika),
        id_kart_serwisowej INT NOT NULL,
                                CONSTRAINT zgloszenie_id_kart_serwisowej_fk
                                FOREIGN KEY(id_kart_serwisowej)
                                REFERENCES kart_serwisowa(id_kart_serwisowej)
)
Engine=InnoDB DEFAULT charset="utf8";                       
                            
                                
CREATE OR REPLACE TABLE pracownik(
    id_pracownika INT AUTO_INCREMENT,
    imie VARCHAR(30) NOT NULL,
    nazwisko VARCHAR(40) NOT NULL,
    specjalizacja ENUM('Elektronik', 'ElektroMechanik', 'Mechanik', 'Informatyk', 'Marketing', 'Sprzedaż', 'Syn') NOT NULL,
    telefon VARCHAR(15) NOT NULL,
    email VARCHAR(30) NOT NULL,
        PRIMARY KEY(id_pracownika),
        id_oddzialu INT NOT NULL,
                        CONSTRAINT pracownik_id_oddzialu_fk
                        FOREIGN KEY(id_oddzialu)
                        REFERENCES oddzial(id_oddzialu)

)
Engine=InnoDB DEFAULT charset="utf8";  

CREATE OR REPLACE TABLE oddzial(
    id_oddzialu INT AUTO_INCREMENT,
    nazwa VARCHAR(30) NOT NULL,
    miejscowość VARCHAR(25) NOT NULL,
    ulica VARCHAR(40) NOT NULL,
    nr_domu VARCHAR(6) NOT NULL,
    nr_lokalu VARCHAR(5) NULL,
    telefon VARCHAR(15) NOT NULL,
    email VARCHAR(30) NOT NULL,
    web VARCHAR(25),
         PRIMARY KEY(id_oddzialu)
)
Engine=InnoDB DEFAULT charset="utf8";   
CREATE OR REPLACE TABLE kart_serwisowa(
    id_kart_serwisowej INT AUTO_INCREMENT,
    marka VARCHAR(15) NOT NULL,
    model VARCHAR(30) NOT NULL,
    kat_urzadzenia ENUM('AGD', 'RTV', 'PC') NOT NULL,
        PRIMARY KEY(id_kart_serwisowej)
                        

)
CREATE OR REPLACE TABLE kart_napraw(
    id_kart_napraw INT AUTO_INCREMENT,
    nazwa_czynnosci VARCHAR(25) NOT NULL,
    cena DECIMAL(9,2) NOT NULL,
        PRIMARY KEY(id_kart_napraw),
            id_zgloszenia INT NOT NULL,
                        CONSTRAINT kart_napraw_id_zgloszenia_fk
                        FOREIGN KEY(id_zgloszenia)
                        REFERENCES zgloszenie(id_zgloszenia)
)

Engine=InnoDB DEFAULT charset="utf8";
    CREATE INDEX idx1 ON pracownik(nazwisko)


   
    
    /*INSERT INTO  pracownik() VALUES(NULL,'Jan','Kowalski','53426153861','M','Wydział inżynieryjny','2016-01-15',NULL,'997-997-997', 6547.65);
    INSERT INTO  pracownik() VALUES(NULL,'Maciej','Niemiec','67538656747','M','Szlachta nie pracuje','2015-09-22',NULL,'999-999-999', 9999.99);
    INSERT INTO  pracownik() VALUES(NULL,'Mateusz','Rup','01110967484','M','System edukacji i tak go przeznaczył na straty','2001-09-11',NULL,'543-231-341', 9999.99);*/


id_pracownika INT NOT NULL,
                        CONSTRAINT oddzial_id_pracownika_fk
                        FOREIGN KEY(id_pracownika)
                        REFERENCES pracownik(id_pracownika)