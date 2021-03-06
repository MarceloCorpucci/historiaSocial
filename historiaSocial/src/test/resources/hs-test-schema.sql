/*
Database: historiaSocial
Schema: <DEFAULT>
Objects: TABLES
*/


CREATE TYPE TEXT AS VARCHAR(1000000);

CREATE TABLE conviviente ( 
	persona_id  	integer NOT NULL,
	apellido    	varchar(255) NULL,
	convive     	bit(1) NULL,
	edad        	int NULL,
	educacion   	varchar(255) NULL,
	estadoCivil 	varchar(255) NULL,
	ingresos    	varchar(255) NULL,
	nacionalidad	varchar(255) NULL,
	nombres     	varchar(255) NULL,
	obraSocial  	varchar(255) NULL,
	ocupacion   	varchar(255) NULL,
	razonSocial 	varchar(255) NULL,
	vinculo     	varchar(255) NULL,
	nro         	varchar(255) NULL 
	);
CREATE TABLE convivientePaciente ( 
	paciente_id	integer NOT NULL,
	persona_id 	integer NOT NULL 
	);
CREATE TABLE domicilio ( 
	id          	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	barrio      	varchar(255) NULL,
	calle       	varchar(255) NULL,
	calleX      	varchar(255) NULL,
	calleY      	varchar(255) NULL,
	departamento	varchar(255) NULL,
	numero      	varchar(255) NULL,
	piso        	varchar(255) NULL 
	);
CREATE TABLE especialidad ( 
	id          	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	especialidad	varchar(255) NULL 
	);
CREATE TABLE hibernate_sequences ( 
	sequence_name         	varchar(255) NULL,
	sequence_next_hi_value	int NULL 
	);
CREATE TABLE historiaClinica ( 
	id         	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	diagnostico	varchar(255) NULL,
	numero     	int NULL,
	sala       	varchar(255) NULL,
	paciente_fk	integer NULL 
	);
CREATE TABLE historiaSocial_instituciones ( 
	historiaSocial_Id	integer NOT NULL,
	institucion_Id   	integer NOT NULL 
	);
CREATE TABLE historiaSocial_profesionales ( 
	profesional_Id   	integer NOT NULL,
	historiaSocial_Id	integer NOT NULL 
	);
CREATE TABLE historiaSocial ( 
	id                      	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	fechaICServicioSocial   	date NULL,
	fechaIngreso            	date NULL,
	fechaInicio             	date NULL,
	motivoIntervencionSocial	text NULL,
	otrosProfesinalesInterv 	text NULL,
	institucion_id          	integer NULL,
	profesional_fk          	integer NULL 
	);
CREATE TABLE institucion ( 
	id                 	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	detail             	varchar(255) NULL,
	email              	varchar(255) NULL,
	nombre             	varchar(255) NULL,
	telefono           	varchar(255) NULL,
	location_id        	integer NULL,
	responsible_id     	integer NULL,
	institution_type_id	integer NULL 
	);
CREATE TABLE institution_responsible ( 
	id          	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	email       	varchar(255) NULL,
	lastname    	varchar(255) NULL,
	name        	varchar(255) NULL,
	phoneNumbers	varchar(255) NULL,
	profesion   	varchar(255) NULL 
	);
CREATE TABLE institution_type ( 
	id  	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	name	varchar(255) NULL 
	);
CREATE TABLE location ( 
	id       	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	city     	varchar(255) NULL,
	district 	varchar(255) NULL,
	latitude 	double NULL,
	longitude	double NULL,
	number   	varchar(255) NULL,
	province 	varchar(255) NULL,
	street   	varchar(255) NULL 
	);
CREATE TABLE paciente ( 
	paciente_id      	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	apellidos        	varchar(255) NULL,
	celular          	varchar(255) NULL,
	documento        	varchar(255) NULL,
	fechaNacimiento  	date NULL,
	habilitado       	bit(1) NULL,
	lugarDeNacimiento	varchar(255) NULL,
	nombres          	varchar(255) NULL,
	sexo             	varchar(255) NULL,
	telefono         	varchar(255) NULL,
	domicilio_id     	integer NULL,
	historiaSocial_id	integer NULL,
	location_id      	integer NULL,
	vivienda_id      	integer NULL 
	);
CREATE TABLE persona ( 
	persona_id  	integer NOT NULL,
	apellido    	varchar(255) NULL,
	convive     	bit(1) NULL,
	edad        	int NULL,
	educacion   	varchar(255) NULL,
	estadoCivil 	varchar(255) NULL,
	ingresos    	varchar(255) NULL,
	nacionalidad	varchar(255) NULL,
	nombres     	varchar(255) NULL,
	obraSocial  	varchar(255) NULL,
	ocupacion   	varchar(255) NULL,
	razonSocial 	varchar(255) NULL,
	vinculo     	varchar(255) NULL 
	);
CREATE TABLE practica ( 
	id                    	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	detalle               	text NULL,
	diagnostico           	text NULL,
	fechaCarga            	date NULL,
	fechaPractica         	date NULL,
	habilitado            	bit(1) NULL,
	profesionalPractica_fk	integer NULL,
	tipoPractica_id       	integer NULL,
	tipoProblematica_id   	integer NULL,
	tratamiento_fk        	integer NULL 
	);
CREATE TABLE profesional_especialidad ( 
	profesional_id   	integer NOT NULL,
	especialidades_id	integer NOT NULL 
	);
CREATE TABLE profesional ( 
	id         	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	apellido   	varchar(255) NULL,
	esDirector 	bit(1) NULL,
	habilitado 	bit(1) NULL,
	matricula  	varchar(255) NULL,
	nombre     	varchar(255) NULL,
	pass       	varchar(255) NULL,
	user       	varchar(255) NULL,
	Servicio_fk	integer NULL 
	);
CREATE TABLE servicio ( 
	id      	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	servicio	varchar(255) NULL 
	);
CREATE TABLE tipoDePractica ( 
	id         	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	codigo     	varchar(255) NULL,
	descripcion	varchar(255) NULL,
	duracion   	varchar(255) NULL 
	);
CREATE TABLE tipoDeProblematica ( 
	id         	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	codigo     	varchar(255) NULL,
	descripcion	varchar(255) NULL 
	);
CREATE TABLE tratamiento ( 
	id                      	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	fechaAlta               	date NULL,
	fechaIngreso            	date NULL,
	motivo                  	varchar(255) NULL,
	historiaSocial_fk       	integer NULL,
	tratamiento_historico_id	integer NULL 
	);
CREATE TABLE vivienda ( 
	id       	integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	estado   	varchar(255) NULL,
	propiedad	varchar(255) NULL,
	tipo     	varchar(255) NULL 
	);

CREATE INDEX FK95794393AC93F85D
	ON convivientePaciente(persona_id);
CREATE INDEX FK95794393C615336D
	ON convivientePaciente(paciente_id);
CREATE INDEX FKE13F415CC6153317
	ON historiaClinica(paciente_fk);
CREATE INDEX FK5A27B8823642E4E7
	ON historiaSocial_instituciones(institucion_Id);
CREATE INDEX FK5A27B8828CB2E2AD
	ON historiaSocial_instituciones(historiaSocial_Id);
CREATE INDEX FK2FE909258CB2E2AD
	ON historiaSocial_profesionales(historiaSocial_Id);
CREATE INDEX FK2FE9092526BEC607
	ON historiaSocial_profesionales(profesional_Id);
CREATE INDEX FKAF1C362A26BEC5B1
	ON historiaSocial(profesional_fk);
CREATE INDEX FKAF1C362A3642E4E7
	ON historiaSocial(institucion_id);
CREATE INDEX FK3521EB69E4D89CED
	ON institucion(location_id);
CREATE INDEX FK3521EB692A35EB18
	ON institucion(institution_type_id);
CREATE INDEX FK3521EB697D58BB35
	ON institucion(responsible_id);
CREATE INDEX FK2CA71371E4D89CED
	ON paciente(location_id);
CREATE INDEX FK2CA713711CD2D98D
	ON paciente(vivienda_id);
CREATE INDEX FK2CA7137135EFE2A7
	ON paciente(domicilio_id);
CREATE INDEX FK2CA713718CB2E2AD
	ON paciente(historiaSocial_id);
CREATE INDEX FKAC398137BF5B8DAE
	ON practica(tipoPractica_id);
CREATE INDEX FKAC3981371499B731
	ON practica(tratamiento_fk);
CREATE INDEX FKAC398137EE5DB11A
	ON practica(profesionalPractica_fk);
CREATE INDEX FKAC398137D9A13AEE
	ON practica(tipoProblematica_id);
CREATE INDEX FK9DB3C5C5D7D84F5F
	ON profesional_especialidad(especialidades_id);
CREATE INDEX FK9DB3C5C526BEC607
	ON profesional_especialidad(profesional_id);
CREATE INDEX FK433508CC3225FCF7
	ON profesional(Servicio_fk);
CREATE INDEX FK4B7FABD08CB2E257
	ON tratamiento(historiaSocial_fk);
CREATE INDEX FK4B7FABD077772B16
	ON tratamiento(tratamiento_historico_id);
ALTER TABLE conviviente
	ADD PRIMARY KEY (persona_id);
ALTER TABLE convivientePaciente
	ADD PRIMARY KEY (paciente_id, persona_id);
ALTER TABLE domicilio
	ADD PRIMARY KEY (id);
ALTER TABLE especialidad
	ADD PRIMARY KEY (id);
ALTER TABLE historiaClinica
	ADD PRIMARY KEY (id);
ALTER TABLE historiaSocial
	ADD PRIMARY KEY (id);
ALTER TABLE institucion
	ADD PRIMARY KEY (id);
ALTER TABLE institution_responsible
	ADD PRIMARY KEY (id);
ALTER TABLE institution_type
	ADD PRIMARY KEY (id);
ALTER TABLE location
	ADD PRIMARY KEY (id);
ALTER TABLE paciente
	ADD PRIMARY KEY (paciente_id);
ALTER TABLE persona
	ADD PRIMARY KEY (persona_id);
ALTER TABLE practica
	ADD PRIMARY KEY (id);
ALTER TABLE profesional
	ADD PRIMARY KEY (id);
ALTER TABLE servicio
	ADD PRIMARY KEY (id);
ALTER TABLE tipoDePractica
	ADD PRIMARY KEY (id);
ALTER TABLE tipoDeProblematica
	ADD PRIMARY KEY (id);
ALTER TABLE tratamiento
	ADD PRIMARY KEY (id);
ALTER TABLE vivienda
	ADD PRIMARY KEY (id);
ALTER TABLE convivientePaciente
	ADD CONSTRAINT FK95794393C615336D
	FOREIGN KEY(paciente_id)
	REFERENCES paciente(paciente_id);
ALTER TABLE convivientePaciente
	ADD CONSTRAINT FK95794393AC93F85D
	FOREIGN KEY(persona_id)
	REFERENCES conviviente(persona_id);
ALTER TABLE historiaClinica
	ADD CONSTRAINT FKE13F415CC6153317
	FOREIGN KEY(paciente_fk)
	REFERENCES paciente(paciente_id);
ALTER TABLE historiaSocial_instituciones
	ADD CONSTRAINT FK5A27B8828CB2E2AD
	FOREIGN KEY(historiaSocial_Id)
	REFERENCES historiaSocial(id);
ALTER TABLE historiaSocial_instituciones
	ADD CONSTRAINT FK5A27B8823642E4E7
	FOREIGN KEY(institucion_Id)
	REFERENCES institucion(id);
ALTER TABLE historiaSocial_profesionales
	ADD CONSTRAINT FK2FE909258CB2E2AD
	FOREIGN KEY(historiaSocial_Id)
	REFERENCES historiaSocial(id);
ALTER TABLE historiaSocial_profesionales
	ADD CONSTRAINT FK2FE9092526BEC607
	FOREIGN KEY(profesional_Id)
	REFERENCES profesional(id);
ALTER TABLE historiaSocial
	ADD CONSTRAINT FKAF1C362A3642E4E7
	FOREIGN KEY(institucion_id)
	REFERENCES institucion(id);
ALTER TABLE historiaSocial
	ADD CONSTRAINT FKAF1C362A26BEC5B1
	FOREIGN KEY(profesional_fk)
	REFERENCES profesional(id);
ALTER TABLE institucion
	ADD CONSTRAINT FK3521EB69E4D89CED
	FOREIGN KEY(location_id)
	REFERENCES location(id);
ALTER TABLE institucion
	ADD CONSTRAINT FK3521EB697D58BB35
	FOREIGN KEY(responsible_id)
	REFERENCES institution_responsible(id);
ALTER TABLE institucion
	ADD CONSTRAINT FK3521EB692A35EB18
	FOREIGN KEY(institution_type_id)
	REFERENCES institution_type(id);
ALTER TABLE paciente
	ADD CONSTRAINT FK2CA71371E4D89CED
	FOREIGN KEY(location_id)
	REFERENCES location(id);
ALTER TABLE paciente
	ADD CONSTRAINT FK2CA713718CB2E2AD
	FOREIGN KEY(historiaSocial_id)
	REFERENCES historiaSocial(id);
ALTER TABLE paciente
	ADD CONSTRAINT FK2CA7137135EFE2A7
	FOREIGN KEY(domicilio_id)
	REFERENCES domicilio(id);
ALTER TABLE paciente
	ADD CONSTRAINT FK2CA713711CD2D98D
	FOREIGN KEY(vivienda_id)
	REFERENCES vivienda(id);
ALTER TABLE practica
	ADD CONSTRAINT FKAC398137EE5DB11A
	FOREIGN KEY(profesionalPractica_fk)
	REFERENCES profesional(id);
ALTER TABLE practica
	ADD CONSTRAINT FKAC398137D9A13AEE
	FOREIGN KEY(tipoProblematica_id)
	REFERENCES tipoDeProblematica(id);
ALTER TABLE practica
	ADD CONSTRAINT FKAC398137BF5B8DAE
	FOREIGN KEY(tipoPractica_id)
	REFERENCES tipoDePractica(id);
ALTER TABLE practica
	ADD CONSTRAINT FKAC3981371499B731
	FOREIGN KEY(tratamiento_fk)
	REFERENCES tratamiento(id);
ALTER TABLE profesional_especialidad
	ADD CONSTRAINT FK9DB3C5C5D7D84F5F
	FOREIGN KEY(especialidades_id)
	REFERENCES especialidad(id);
ALTER TABLE profesional_especialidad
	ADD CONSTRAINT FK9DB3C5C526BEC607
	FOREIGN KEY(profesional_id)
	REFERENCES profesional(id);
ALTER TABLE profesional
	ADD CONSTRAINT FK433508CC3225FCF7
	FOREIGN KEY(Servicio_fk)
	REFERENCES servicio(id);
ALTER TABLE tratamiento
	ADD CONSTRAINT FK4B7FABD08CB2E257
	FOREIGN KEY(historiaSocial_fk)
	REFERENCES historiaSocial(id);
ALTER TABLE tratamiento
	ADD CONSTRAINT FK4B7FABD077772B16
	FOREIGN KEY(tratamiento_historico_id)
	REFERENCES historiaSocial(id);