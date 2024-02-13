

#creamos la base de datos para el modelo multidimensional
CREATE DATABASE dwmovies_netflix;

##usamos la base de datos creada
USE dwmovies_netflix;


/*creamos la tabla de dimMovie*/
CREATE TABLE DimMovie (
	idMovie VARCHAR(8) PRIMARY KEY,
    title VARCHAR (100),
    releaseMovie DATE
);


/*creamos la tabla de dimGender*/
CREATE TABLE DimGender (
	idGender INTEGER PRIMARY KEY,
    gender VARCHAR (100)
);

/*creamos la tabla de dimParticipant*/
CREATE TABLE dimParticipant (
	idParticipant VARCHAR(8) PRIMARY KEY,
    nameParticipant VARCHAR (50),
    roleParticipant VARCHAR (50)
);

CREATE TABLE dimAwardParticipan(
  idaward int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idParticipant varchar(8) DEFAULT NULL,
  Award varchar(100) DEFAULT NULL
) ;

##podemos añadir una base de datos de location, para ver de donde se vio la pelicula
# USER (idAccount, Location (latitudee,longitude), watchTime)



/*creamos la tabla de FactVentas*/
CREATE TABLE FactWatchs (

	idMovie VARCHAR(8),
    idGender INTEGER,
    idParticipant VARCHAR(8),
    idaward INT,
    
    /* CREANDO LAS REALACIONES*/
    CONSTRAINT fk_factwatchs_movie FOREIGN KEY (idMovie) REFERENCES DimMovie (idMovie),
	CONSTRAINT fk_factwatchs_gender FOREIGN KEY (idGender) REFERENCES DimGender (idGender),
	CONSTRAINT fk_factwatchs_participant FOREIGN KEY (idParticipant) REFERENCES dimParticipant (idParticipant),
    CONSTRAINT fk_factwatchs_AwardParticipan FOREIGN KEY (idaward) REFERENCES dimAwardParticipan (idaward)
);














