drop database instituto;
create database instituto;
use instituto;

CREATE TABLE PROFESORADO
( Codigo INT PRIMARY KEY, 
  Nombre CHAR(30), 
  Apellidos CHAR(30), 
  DNI CHAR(10), 
  Especialidad CHAR(20),
  Fecha_Nac DATE,
  Antiguedad INT
);  

CREATE TABLE CURSOS
( Codigo INT PRIMARY KEY, 
  Nombre CHAR(20), 
  Cod_Profe INT, 
  Max_Alumn INT, 
  Fecha_Inic DATE, 
  Fecha_Fin DATE, 
  Num_Horas INT,
  FOREIGN KEY (Cod_Profe) REFERENCES PROFESORADO(Codigo)
);
                    
CREATE TABLE ALUMNADO_NUEVO
( Nombre CHAR(30), 
  Apellidos CHAR(30), 
  Sexo CHAR(1), 
  Fecha_Nac DATE
);
              
CREATE TABLE ALUMNADO
( Codigo INT AUTO_INCREMENT PRIMARY KEY, 
  Nombre CHAR(30), 
  Apellidos CHAR(30), 
  Sexo CHAR(1), 
  Fecha_Nac DATE, 
  Cod_Curso INT,
  FOREIGN KEY (Cod_Curso) REFERENCES CURSOS(Codigo)
);
              

INSERT INTO CURSOS (Codigo, Nombre, Max_Alumn, Fecha_Inic, Fecha_Fin, Num_Horas) VALUES 
(1, 'Curso 1', 30, '2011-01-01', '2011-12-31', 100);
INSERT INTO CURSOS (Codigo, Nombre, Max_Alumn, Fecha_Inic, Fecha_Fin, Num_Horas) VALUES 
(2, 'Curso 2', 30, '2011-01-01', '2011-12-31', 100);
INSERT INTO CURSOS (Codigo, Nombre, Max_Alumn, Fecha_Inic, Fecha_Fin, Num_Horas) VALUES 
(3, 'Curso 3', 30, '2011-01-01', '2011-12-31', 100);
INSERT INTO CURSOS (Codigo, Nombre, Max_Alumn, Fecha_Inic, Fecha_Fin, Num_Horas) VALUES 
(4, 'Curso 4', 30, '2011-01-01', '2011-12-31', 100);
INSERT INTO CURSOS (Codigo, Nombre, Max_Alumn, Fecha_Inic, Fecha_Fin, Num_Horas) VALUES 
(5, 'Curso 5', 30, '2011-01-01', '2011-12-31', 100);
INSERT INTO CURSOS (Codigo, Nombre, Max_Alumn, Fecha_Inic, Fecha_Fin, Num_Horas) VALUES 
(6, 'Curso 6', 30, '2011-01-01', '2011-12-31', 100);
   
    
    
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MANUELA','SUAREZ IBAÑEZ','M','1990-06-30',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MILAGROSA','DIAZ PEREZ','M','1984-10-28',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JOSE','CRESPO DE HERMOSO','H','1993-03-02',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ANTONIO JESUS','MARTIN BOLLO','H','1999-11-04',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('BARBARA','PELAEZ VALENCIA','M','1967-08-27',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JUAN PEDRO','GALVE GONZALEZ','H','1991-11-10',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MARIA ISABEL','PEREZ GUILLEN','M','1962-11-14',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('PATRICIA','ROMAN GOMEZ','M','1979-04-26',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('DAVID','TAPIA SOLANS','H','1980-06-05',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MARIA','FERREIRO SANTOS','M','1960-01-29',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JAVIER','LAMA DEL REY','H','1977-02-26',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ALEJANDRA','CALDERON VALDIVIA','M','1960-11-16',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ANA DOLORES','ESCUDERO ENCISO','M','1975-09-07',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JUAN CARLOS','RODRIGUEZ PADILLA','H','1963-11-15',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('CECILIO','SASTRE GONZALEZ','H','1969-11-23',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JUAN','MARTINEZ SANCHEZ','H','1974-10-23',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MARIA','LAFUENTE FERNANDEZ','M','1986-11-21',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MANUELA','MARTINEZ ALBA','M','1962-11-26',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ROSA NIEVES','SANCHEZ CANO','M','1979-12-12',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('BELEN','RAMOS ANGUITA','M','1967-12-30',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JULIAN','GARCIA ZABALA','H','1963-01-04',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('DIEGO JESUS','CANO SALVADOR','H','1970-05-18',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JOSE IGNACIO','HARO FANECA','H','1981-05-08',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JOSEFA','CASTELLANOS DIEZ','M','1998-05-01',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('BEATRIZ','RUBIO BERMEJO','M','1970-04-29',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JAVIER','CASTRO GOMEZ','H','1967-08-20',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('DAVID','GAY GARCIA DEL VALLE','H','1989-07-22',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('DAVID','TOCADOS GARCIA','H','1961-01-18',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ELISA ISABEL','BRUNO CALVO','M','1998-05-13',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('DIANA','GUILLAMON POSADA','M','1980-04-29',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('DAVID','RANILLA URRUTIA','H','1964-11-22',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JAVIER','LUENGO HERRERO','H','1963-04-22',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('DAVID','VALENCIA MEDINA','H','1981-03-27',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('RAFAEL','DIAZ LAMA','H','1979-06-01',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('CAROLINA','RIVAS MENDIA','M','1974-07-30',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JOSE MANUEL','GARCIA ZAPICO','H','1963-03-03',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MIGUEL','IBARROLA DIEZ','H','1985-08-12',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ENCARNACION','ASENJO HERNANDO','M','1962-04-03',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('FRANCISCO','CALVO BONO','H','1974-06-17',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JOSE ANTONIO','CALVO RODRIGUEZ','H','1989-05-04',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ANTONIA','MORENO RAYA','M','1976-08-04',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JOSE MARIA','FUENTEMILLA ALBERT','H','1979-12-27',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('BELEN','PORTERO GRACIA','M','1991-10-28',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('LUIS ANTONIO','SUAREZ GARCIA','H','1997-10-24',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('FRANCISCO ANTONIO','BAUTISTA LAMENCA','H','1992-09-09',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('SILVIA','PEÑA CASTAN','M','1977-07-20',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('CARMEN','KAAMOUCHI VICENTE','M','1990-05-31',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MARIA','LASTRA MOLINA','M','1961-09-29',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ROCIO EMILIA','IZQUIERDO BELTRAN','M','1981-04-01',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('OSCAR','DIEZ NAVARRO','H','1972-06-17',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JULIAN ANDRES','MORALES RIERA','H','1998-12-31',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MUJERES','ALCALA PEREZ','M','1970-10-11',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JOSE ANTONIO','GONZALEZ ROY','H','1965-06-19',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JOSEFA','GOMEZ EGIDO','M','1998-09-27',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MYRIAM','MORALES ISAC','M','1984-09-15',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('EDURNE','MARTINEZ LASTRA','M','1976-01-25',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JUAN JOSE','RIVAS RAMON','H','1994-05-01',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('DANIEL JOSE','BLANCO IZQUIERDO','H','1982-02-05',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MIRIAN','MONTERO LAMENCA','M','1972-05-06',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MARIA PAZ','BERTIZ SARMIENTO','M','1997-04-01',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('EMILIO','MORILLO RAMON','H','1966-09-05',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ENRIQUE','FERNANDEZ DIEZ','H','1972-10-06',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ANA TERESA','CASADO CRESPO','M','1971-01-13',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JOSE IGNACIO','MARTIN BERDUN','H','1987-08-18',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('DAVID','PADILLA ORTEGA','H','1960-08-29',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MIGUEL','GARCIA LARRETA','H','1982-02-04',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('LUIS MIGUEL','NAVARRO URRUTIA','H','1969-04-20',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('NURIA','AMOSTEGUI LUZURIAGA','M','1973-10-25',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ANA MARIA','SANDE LAMENCA','M','1999-10-31',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('LEON JOSE','SARMIENTO RIVAS','H','1969-04-11',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('VICTOR','GARCIA GARCÍA','H','1999-12-29',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('NATALIA','TIMON ECHEPARE','M','1986-01-19',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MELANIE','CAMPOY GOMEZ','M','1967-02-24',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('RAMIRO','LLOBREGAT ALONSO','H','1984-05-14',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JULIAN','JIMENO DIEZ','H','1976-02-27',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ISABEL','SORIANO MATAMOROS','M','1995-07-07',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MIGUEL','SANCHEZ SANCHEZ','H','1998-02-06',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('NOEMI','BERRUEZO REQUENA','M','1973-11-25',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('IVAN ANGEL DE LA','GARCIA RUBIO','H','1979-03-26',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('LUTGARDA','GOÑI TIMON','M','1974-10-17',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MARIA JESUS','RECOVER AGUILERA','M','1984-03-20',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MARIA SOLEDAD','MORILLAS GUILLEN','M','1975-04-30',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JUAN MANUEL','MARTIN ALEJANO','H','1980-09-16',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MARIA DEL MAR','CASTRO CRUZ','M','1977-11-08',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MARIA ISABEL','ECHAGUE GONZALEZ','M','1998-03-30',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('JUAN','TALEGON CORTES','H','1966-07-12',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('MIGUEL','ARAGUAS DE LA TORRE','H','1998-08-12',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('DAVID','ALONSO GIMENEZ','H','1995-09-02',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('NICOLAS','BLANCO GONZALEZ','H','1992-03-08',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ALBERTO','VEGA GARCIA','H','1976-08-29',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('EVA MARIA','FENOY ORDOÑEZ','M','1989-12-04',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ANA M.','GUERRERO LANZA','M','1963-11-05',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ANA MARIA','FERREIRO DIEZ','M','1999-07-01',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ARTURO','REVIRIEGO CERVANTES','H','1964-08-02',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('ALEJANDRO','CANO MORALES','H','1960-05-13',1);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('AZUCENA','BERENGUEL ROY','M','1998-05-27',4);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('PAZ DE','GARRALDA ARIAS','M','1972-09-06',3);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('PABLO CESAR','URBISTONDO GONZALEZ','H','1991-02-12',2);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('OSCAR','MARTIN GALINDO','H','1992-08-03',5);
INSERT INTO ALUMNADO (Nombre,Apellidos,Sexo,Fecha_Nac,Cod_Curso) VALUES 
('LUIS','MOLINA TAGARRO','H','1996-01-16',4);


INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('MARIA','GOMEZ ANDRES','M','1985-05-04');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('JOSE MANUEL','PADILLA VEGAS','H','1999-05-19');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('RICARDO','MARQUINA HERNANDO','H','1982-02-20');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('MIGUEL','DIAZ FABRE','H','1985-04-17');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('LUIS MIGUEL','AGURRUZA RODRIGUEZ','H','1983-04-25');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('NICOLAS','LOBATO BARRANCO','H','1961-06-25');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('MIGUEL','BURGOS ZAPICO','H','1986-04-13');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('JOSE JESUS','VALDIVIESO JIMENEZ','H','1985-12-23');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('ANA MARIA','BEAMONTE GOMEZ','M','1968-07-25');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('MARIA','LOPEZ CARREÑO','M','1963-11-18');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('MARIA DEL MAR','ASENSIO SEGURA','M','1984-05-21');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('ROSA NIEVES','LARRAÑETA LAZARO','M','1976-06-10');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('ELENA','DAZA FANECA','M','1960-09-18');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('GEMA','PASTOR ADELL','M','1983-02-13');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('MARIA CARMEN','CHECA CANO','M','1960-08-11');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('JOSE ANTONIO','GRACIA GONZALEZ','H','1962-11-28');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('AMALIA','GIL PER','M','1965-01-10');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('VICTOR','RAMON GARCIA','H','1991-08-24');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('ESPERANZA VICTORIA','PANIZO DEL AGUILA','M','1972-12-07');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('ANTONIO','ALONSO SORIANO','H','1985-06-15');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('JAVIER','BOTAZ HERNÁNDEZ','H','1999-03-31');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('FRANCISCO','CUTILLAS HERNANDEZ','H','1982-03-30');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('EDUARDO','LOPEZ RODRIGUEZ','H','1964-11-20');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('ADOLFO','LOPEZ EL AAKROUTI','H','1987-10-16');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('MARIA ROSA','MORA BAUTISTA','M','1969-04-20');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('GONZALO','IBAÑEZ PALENCIA','H','1965-12-21');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('ANA M.','DIEZ IZQUIERDO','M','1976-10-07');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('ALICIA MARIA','DIAZ GUERRERO','M','1968-08-27');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('MONTSERRAT','VELA SASTRE','M','1980-01-29');
INSERT INTO ALUMNADO_NUEVO (Nombre,Apellidos,Sexo,Fecha_Nac) VALUES 
('LUIS','BERMEJO GARCIA','H','1984-11-07');