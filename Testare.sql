-- selectez toate persoanele care au functia gardian si afisez toate informatiile despre ei 
SELECT * FROM Angajati WHERE (functie='gardian'); 

--selectez toti angajatii din tura 2 (apare de 2 ori deoarece este responsabil cu 2 etaje
SELECT Angajati.nume_angajat, Angajati.prenume_angajat, Ture.tura_angajat
    FROM Angajati, Ture WHERE Ture.tura_angajat=2 
        AND Angajati.id_angajat=Ture.Angajati_id_angajat;
        

-- angajati ce pazesc etajul 1 (in doua ture)
SELECT Angajati.nume_angajat, Angajati.prenume_angajat, Celule.etaj
    FROM Angajati, Celule, Ture WHERE Celule.etaj=1 
        AND Angajati.id_angajat=Ture.Angajati_id_angajat 
            AND Celule.id_celula=Ture.Celule_id_celula;
        
-- ce detinut sta intr-o anumita celula
SELECT  Detinuti.nume, Detinuti.prenume,Detinuti_celule.Celule_id_celula
    FROM Detinuti, Detinuti_celule, Celule WHERE Detinuti_Celule.Celule_id_celula=8
        AND Detinuti.id_detinut=Detinuti_celule.Detinuti_id_detinut
            AND Celule.id_celula=Detinuti_celule.Celule_id_celula;
        
-- ce detinuti sunt incarcerati pentru furt 
SELECT Detinuti.nume, Detinuti.prenume, Fapte.nume FROM Detinuti, Fapte, Relation_10
    WHERE Detinuti.id_detinut=Relation_10.Detinuti_id_detinut 
        AND Fapte.id_fapta=Relation_10.Fapte_id_fapta 
            AND Fapte.nume='furt';
            
--data incarcerarii de la fiecare detinut
SELECT Detinuti.nume, Detinuti.prenume, Detinuti.cnp, Fise.data_incarcerarii
    FROM Detinuti, Fise WHERE Detinuti.id_detinut=Fise.Detinuti_id_detinut;

--vedem nr de contact ale angajatilor
SELECT Angajati.nume_angajat, Angajati.prenume_angajat, Detalii_Angajat.telefon_angajat
    FROM Angajati, Detalii_Angajat
        WHERE Angajati.id_angajat=Detalii_Angajat.Angajati_id_angajat;


--eroare datorata constrangerii data de nr telefon
insert into Detalii_Angajat values( 'Iasi, std. Olari, nr. 5', '02235942', 'aurelmunteanu@gmail.com',
    (SELECT id_angajat from Angajati WHERE (cnp=26802032153625)));

--eroare datorata constrangerii generate de cnp
insert into Angajati values(null, 'Antoci', 'Gabriel',256625458,'gardian');

--eroare datorata constrangerii email-ului
insert into Detalii_Angajat values( 'Iasi, std. Olari, nr. 5', '0786201235', 'aurelmunteanu',
    (SELECT id_angajat from Angajati WHERE (cnp=26802032153625)));
    
--eroare datorata constrangerii legate de nume
insert into Detinuti  values(null,'@@', 'Laurentiu', 18906098452635, 'Iasi, std. Cetatuia, nr. 10');

--eroare datorata constrangerii legate de prenume
insert into Detinuti  values(null,'Nastase', '!!', 18906098452635, 'Iasi, std. Cetatuia, nr. 10');

--eroare datorata unicitatii cnp-ului
insert into Angajati values(null, 'Amariei', 'Nicoleta', 68502184529873,  'medic');

--eroare datorata datei de inceput fiind mai mare decat data de sfarsit
insert into Detinuti_celule values((SELECT id_celula FROM Celule WHERE (etaj=6)),
    TO_DATE('05.03.2016','dd.mm.yyyy'), TO_DATE('05.03.2015','dd.mm.yyyy'),(SELECT id_detinut FROM Detinuti WHERE (cnp=18003125208764)));    

--eroare datoara angajatului avand deja o tura in acea zi
insert into Ture values(2,TO_DATE('01.12.2020','dd.mm.yyyy'),(SELECT id_angajat from Angajati where (cnp=17605193690136)),
    (SELECT id_celula FROM Celule where (etaj=2)));

--stergand un angajat, se vor sterge prin trigger si toate turele acestuia si datele angajatului
SELECT * FROM TURE WHERE ANGAJATI_ID_ANGAJAT = 2;
SELECT * FROM DETALII_ANGAJAT WHERE ANGAJATI_ID_ANGAJAT = 2;
DELETE FROM ANGAJATI WHERE ID_ANGAJAT = 2;
SELECT * FROM TURE WHERE ANGAJATI_ID_ANGAJAT = 2;
SELECT * FROM DETALII_ANGAJAT WHERE ANGAJATI_ID_ANGAJAT = 2;

--testare package procedura creeaza_detinut
BEGIN
    DETINUTI_PKG.CREEAZA_DETINUT('ROXANICA','SCUMPICA','29911261212121','PE CANAPEA');
END;

-- testare package functie salar angajat pe tura 3
-- medicii & gardienii au salar 150, inrijitorii 50
-- tura 3 se plateste dublu
-- id = 4 (gardian), are odata tura 1 si odata tura 3 => 150+300
SELECT DETINUTI_PKG.SALARIU_ANGAJAT(4, '01-NOV-20') FROM DUAL;
-- id = 5 (ingrijitor), are odata tura 1 si odata tura 3 => 50+100
SELECT DETINUTI_PKG.SALARIU_ANGAJAT(5, '01-NOV-20') FROM DUAL;

-- testare package functie identifica luna
-- ajuta pentru identificarea unica a unei luni, (MMYYYY). Apelata in alte functii
SELECT DETINUTI_PKG.IDENTIFICA_LUNA(SYSDATE) FROM DUAL;