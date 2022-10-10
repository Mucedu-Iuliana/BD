insert into Angajati values(null, 'Ciobanu', 'Natalia', 68502184529873,  'gardian');
insert into Angajati values(null,'Popescu','Andrei', 17605193690136,'medic');
insert into Angajati values(null,'Iliescu','Alex', 16812126394215,'gardian');
insert into Angajati values(null,'Popa','Matei', 16502412368750,'gardian');
insert into Angajati values(null,'Grigoras','Alexandra',29808254174521, 'ingrijitoare');
insert into Angajati values(null, 'Munteanu', 'Aurel',26802032153625,'gardian');



insert into Detalii_Angajat values( 'Iasi, std. Olari, nr. 5', '0723594682', 'nataliaciobanu@gmail.com',
    (SELECT id_angajat from Angajati WHERE (cnp=68502184529873)));
insert into Detalii_Angajat values( 'Brasov, std.Sforii, nr. 1','0767123028','popescua@yahoo.com',
    (SELECT id_angajat from Angajati WHERE (cnp=17605193690136)));
insert into Detalii_Angajat values( 'Iasi, std. Gradinari, nr 13', '0770615374', 'alexalex@outlook.com',
    (SELECT id_angajat from Angajati WHERE (cnp=16812126394215)));
insert into Detalii_Angajat values( 'Iasi,aleea Pacurari  nr. 7', '0774335784', 'popapopa@gmail.com',
    (SELECT id_angajat from Angajati WHERE (cnp=16502412368750)));
insert into Detalii_Angajat values( 'Iasi, std. Olari, nr. 5', '0723594682', 'alexandra.grigoras89@gmail.com',
    (SELECT id_angajat from Angajati WHERE (cnp=29808254174521)));



insert into Fise values(null,TO_DATE(TO_DATE('10.10.2014','dd.mm.yyyy'),'dd.mm.yyyy'), 
   (SELECT id_detinut from Detinuti WHERE (cnp=17903110123654)));
insert into Fise values(null,TO_DATE(TO_DATE('24.08.2015','dd.mm.yyyy'),'dd.mm.yyyy'),
   (SELECT id_detinut from Detinuti WHERE (cnp=15609127423659)));
insert into Fise values(null,TO_DATE(TO_DATE(TO_DATE('05.03.2016','dd.mm.yyyy'),'dd.mm.yyyy'),'dd.mm.yyyy'),
   (SELECT id_detinut from Detinuti WHERE (cnp=18003125208764)));
insert into Fise values(null,TO_DATE(TO_DATE(TO_DATE('02.01.2017','dd.mm.yyyy'),'dd.mm.yyyy'),'dd.mm.yyyy'), 
   (SELECT id_detinut from Detinuti WHERE (cnp=16904107510369)));
insert into Fise values(null,TO_DATE(TO_DATE('06.05.2018','dd.mm.yyyy'),'dd.mm.yyyy'), 
   (SELECT id_detinut from Detinuti WHERE (cnp=18706065299963)));
insert into Fise values(null,TO_DATE(TO_DATE('08.04.2019','dd.mm.yyyy'),'dd.mm.yyyy'), 
   (SELECT id_detinut from Detinuti WHERE (cnp=18706026203254)));
insert into Fise values(null,TO_DATE(TO_DATE('24.11.2020','dd.mm.yyyy'),'dd.mm.yyyy'),
   (SELECT id_detinut from Detinuti WHERE (cnp=17309281745203)));



insert into Fapte  values(null, 'furt', 3);
insert into Fapte values(null,'furt calificat', 5);
insert into Fapte values(null,'crima',10);
insert into Fapte values(null,'abuz in serviciu', 7);
insert into Fapte values(null,'violenta',4);
insert into Fapte values(null,'piraterie',2);
insert into Fapte values(null,'viol', 6);


insert into Detinuti  values(null,'Cioaca', 'Cristian', 17903110123654, 'Iasi, std. Cetatuia, nr. 10');
insert into Detinuti  values(null,'Rusu', 'Mitica',15609127423659,'Botosani, sat Copalau');
insert into Detinuti  values(null,'Pop','Dumitru',18003125208764, 'Iasi, str. Petre Tutea, nr. 2');
insert into Detinuti  values(null,'Stoica','Constantin', 16904107510369,'Iasi, std. Clopotari, nr. 9');    
insert into Detinuti  values(null,'Apetrei','Viorel',18706065299963, 'Iasi, str. Voinicilor, nr. 18');
insert into Detinuti  values(null,'Avasilicai','Marcel',18706026203254, 'Iasi, str. Baltii, nr. 17');
insert into Detinuti values (null,'Minciuc','Antonio',17309281745203, 'Iasi, sat Voinesti');




insert into Relation_10 values((SELECT id_fapta FROM Fapte WHERE (nume='furt')),
    ( SELECT id_detinut FROM Detinuti WHERE (cnp=17903110123654)));
insert into Relation_10 values ((SELECT id_fapta FROM Fapte WHERE (nume='crima')),
    (SELECT id_detinut FROM Detinuti WHERE (cnp=17903110123654)));    
insert into Relation_10 values((SELECT id_fapta FROM Fapte WHERE (nume='viol')),
    (SELECT id_detinut FROM Detinuti WHERE (cnp=15609127423659)));  
insert into Relation_10 values((SELECT id_fapta FROM Fapte WHERE (nume='piraterie')),
    (SELECT id_detinut FROM Detinuti WHERE (cnp=18003125208764))); 
insert into Relation_10 values((SELECT id_fapta FROM Fapte WHERE (nume='violenta')),
    (SELECT id_detinut FROM Detinuti WHERE (cnp=18003125208764)));
insert into Relation_10 values((SELECT id_fapta FROM Fapte WHERE (nume='abuz in serviciu')),
    (SELECT id_detinut FROM Detinuti WHERE (cnp=16904107510369)));
insert into Relation_10 values((SELECT id_fapta FROM Fapte WHERE (nume='furt')),
    (SELECT id_detinut FROM Detinuti WHERE (cnp=17309281745203)));
insert into Relation_10 values((SELECT id_fapta FROM Fapte WHERE (nume='viol')),
    (SELECT id_detinut FROM Detinuti WHERE (cnp=18706065299963)));
insert into Relation_10 values((SELECT id_fapta FROM Fapte WHERE (nume='piraterie')),
    (SELECT id_detinut FROM Detinuti WHERE (cnp=18706026203254)));



insert into Celule values(null, 2,0);
insert into Celule values(null, 4,1);
insert into Celule values(null, 4,2);
insert into Celule values(null, 2,3);
insert into Celule values(null, 2,4);
insert into Celule values(null, 4,5);
insert into Celule values(null, 4,6);



insert into Detinuti_celule values((SELECT id_celula FROM Celule WHERE (etaj=0)),
    TO_DATE('10.10.1999','dd.mm.yyyy'), TO_DATE('10.10.2027','dd.mm.yyyy'), (SELECT id_detinut FROM Detinuti WHERE (cnp=17903110123654))); 
insert into Detinuti_celule values((SELECT id_celula FROM Celule WHERE (etaj=1)),
    TO_DATE('24.08.2015','dd.mm.yyyy'), TO_DATE('24.08.2021','dd.mm.yyyy'), (SELECT id_detinut FROM Detinuti WHERE (cnp=15609127423659)));   
insert into Detinuti_celule values((SELECT id_celula FROM Celule WHERE (etaj=2)),
    TO_DATE('02.01.2017','dd.mm.yyyy'), TO_DATE('02.01.2024','dd.mm.yyyy'),(SELECT id_detinut FROM Detinuti WHERE (cnp=16904107510369))); 
insert into Detinuti_celule values((SELECT id_celula FROM Celule WHERE (etaj=3)),
    TO_DATE('08.04.2019','dd.mm.yyyy'), TO_DATE('08.04.2025','dd.mm.yyyy'), (SELECT id_detinut FROM Detinuti WHERE (cnp=18706065299963)));  
insert into Detinuti_celule values((SELECT id_celula FROM Celule WHERE (etaj=4)),
    TO_DATE('24.11.2020','dd.mm.yyyy'), TO_DATE('24.08.2022','dd.mm.yyyy'),(SELECT id_detinut FROM Detinuti WHERE (cnp=18706026203254)));   
insert into Detinuti_celule values((SELECT id_celula FROM Celule WHERE (etaj=5)),
    TO_DATE('06.05.2018','dd.mm.yyyy'), TO_DATE('24.08.2021','dd.mm.yyyy'),(SELECT id_detinut FROM Detinuti WHERE (cnp=17309281745203)));  
insert into Detinuti_celule values((SELECT id_celula FROM Celule WHERE (etaj=6)),
    TO_DATE('05.03.2016','dd.mm.yyyy'), TO_DATE('05.03.2022','dd.mm.yyyy'),(SELECT id_detinut FROM Detinuti WHERE (cnp=18003125208764)));    

       
insert into Ture values(1,TO_DATE('01.11.2020','dd.mm.yyyy'),(SELECT id_angajat from Angajati where (cnp=68502184529873)),
    (SELECT id_celula FROM Celule where (etaj=1)));
insert into Ture values(1,TO_DATE('01.11.2020','dd.mm.yyyy'),(SELECT id_angajat from Angajati where (cnp=16812126394215)),
    (SELECT id_celula FROM Celule where (etaj=2))); 
insert into Ture values(1,TO_DATE('01.11.2020','dd.mm.yyyy'),(SELECT id_angajat from Angajati where (cnp=16502412368750)),
    (SELECT id_celula FROM Celule where (etaj=3)));   
insert into Ture values(2,TO_DATE('01.11.2020','dd.mm.yyyy'),(SELECT id_angajat from Angajati where (cnp=17605193690136)),
    (SELECT id_celula FROM Celule where (etaj=1)));
insert into Ture values(2,TO_DATE('01.12.2020','dd.mm.yyyy'),(SELECT id_angajat from Angajati where (cnp=17605193690136)),
    (SELECT id_celula FROM Celule where (etaj=2)));
insert into Ture values(3,TO_DATE('02.11.2020','dd.mm.yyyy'),(SELECT id_angajat from Angajati where (cnp=16502412368750)),
    (SELECT id_celula FROM Celule where (etaj=2)));
insert into Ture values(1,TO_DATE('01.11.2020','dd.mm.yyyy'),(SELECT id_angajat from Angajati where (cnp=29808254174521)),
    (SELECT id_celula FROM Celule where (etaj=2)));
insert into Ture values(3,TO_DATE('02.11.2020','dd.mm.yyyy'),(SELECT id_angajat from Angajati where (cnp=29808254174521)),
    (SELECT id_celula FROM Celule where (etaj=2)));
    
    
    
select * from Angajati;
select * from Detalii_Angajat;
select * from Fise;
select * from Fapte;
select * from Detinuti;
select * from Relation_10;
select * FROM Celule;
select * FROM Detinuti_celule;
select * FROM Ture;
    
        
        
    