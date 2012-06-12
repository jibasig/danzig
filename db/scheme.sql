DROP Table If Exists groups CASCADE;
DROP SEQUENCE If Exists group_id_seq;
CREATE SEQUENCE group_id_seq;

CREATE Table groups
(
id int UNIQUE,
name varchar(255) NOT NULL,
info varchar(255),
icon varchar(255),
PRIMARY KEY(id)
);

ALTER TABLE groups
    ALTER COLUMN id
        SET DEFAULT NEXTVAL('group_id_seq');


DROP Table If Exists teams CASCADE;
DROP SEQUENCE If Exists team_id_seq;
CREATE SEQUENCE team_id_seq;
CREATE TABLE teams
(
id int UNIQUE,
name varchar(255) NOT NULL,
info varchar(255),
icon varchar(255),
fk_group int references groups(id),
PRIMARY KEY (id)
);

ALTER TABLE teams
    ALTER COLUMN id
        SET DEFAULT NEXTVAL('team_id_seq');


DROP Table If Exists countries CASCADE;
DROP SEQUENCE If Exists country_id_seq;
CREATE SEQUENCE country_id_seq;
CREATE TABLE countries
(
id int UNIQUE,
name varchar(255),
PRIMARY KEY (id)
);

ALTER TABLE countries
    ALTER COLUMN id
        SET DEFAULT NEXTVAL('country_id_seq');




DROP Table If Exists stadiums CASCADE;
DROP SEQUENCE If Exists stadium_id_seq;
CREATE SEQUENCE stadium_id_seq;
CREATE TABLE stadiums
(
id int UNIQUE,
name varchar(255),
city varchar(255),
fk_country int references countries(id),
longitude int,
latitude int,
capacity int,
PRIMARY KEY (id)
);

ALTER TABLE stadiums
    ALTER COLUMN id
        SET DEFAULT NEXTVAL('stadium_id_seq');



DROP Table If Exists matches CASCADE;
DROP SEQUENCE If Exists match_id_seq;
CREATE SEQUENCE match_id_seq;
CREATE TABLE matches
(
id int UNIQUE,
fk_team1 int references teams(id),
fk_team2 int references teams(id),
fk_stadium int references stadiums(id),
goals1 int,
goals2 int,
info varchar(255),
PRIMARY KEY (id)
);

ALTER TABLE matches
    ALTER COLUMN id
        SET DEFAULT NEXTVAL('match_id_seq');


INSERT into groups(name, info, icon) VALUES ('A', 'group A', 'http://google.de');
INSERT into groups(name, info, icon) VALUES ('B', 'group B', 'http://google.de');
INSERT into groups(name, info, icon) VALUES ('C', 'group C', 'http://google.de');
INSERT into groups(name, info, icon) VALUES ('D', 'group D', 'http://google.de');

INSERT into teams(name, fk_group) VALUES ('Polen', 1);
INSERT into teams(name, fk_group) VALUES ('Griechenland', 1);
INSERT into teams(name, fk_group) VALUES ('Russland', 1);
INSERT into teams(name, fk_group) VALUES ('Tschechien', 1);

INSERT into teams(name, fk_group) VALUES ('Niederlande', 2);
INSERT into teams(name, fk_group) VALUES ('Daenemark', 2);
INSERT into teams(name, fk_group) VALUES ('Deutschland', 2);
INSERT into teams(name, fk_group) VALUES ('Portugal', 2);

INSERT into teams(name, fk_group) VALUES ('Spanien', 3);
INSERT into teams(name, fk_group) VALUES ('Italien', 3);
INSERT into teams(name, fk_group) VALUES ('Irland', 3);
INSERT into teams(name, fk_group) VALUES ('Kroatien', 3);

INSERT into teams(name, fk_group) VALUES ('Frankreich', 4);
INSERT into teams(name, fk_group) VALUES ('England', 4);
INSERT into teams(name, fk_group) VALUES ('Ukraine', 4);
INSERT into teams(name, fk_group) VALUES ('Schweden', 4);


INSERT into countries(name) VALUES ('Polen');
INSERT into countries(name) VALUES ('Ukraine');

INSERT into stadiums(name, city, fk_country) VALUES ('PGE Arena', 'Danzig', 1);
INSERT into stadiums(name, city, fk_country) VALUES ('Städtisches Stadion', 'Posen', 1);
INSERT into stadiums(name, city, fk_country) VALUES ('Städtisches Stadion', 'Breslau', 1);
INSERT into stadiums(name, city, fk_country) VALUES ('Nationalstadion', 'Warschau', 1);
INSERT into stadiums(name, city, fk_country) VALUES ('Olympiastadion', 'Kiew', 2);
INSERT into stadiums(name, city, fk_country) VALUES ('Arena Lwiw', 'Lwiw', 2);
INSERT into stadiums(name, city, fk_country) VALUES ('Metalist Stadion', 'Charkiw', 2);
INSERT into stadiums(name, city, fk_country) VALUES ('Donbass Arena', 'Donezk', 2);




INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (1,2,4);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (3,4,3);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (2,4,3);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (1,3,4);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (2,3,4);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (4,1,3);

INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (5,6,7);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (7,8,6);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (6,8,6);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (5,7,7);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (8,5,7);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (6,7,6);

INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (9,10,1);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (11,12,2);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (10,12,2);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (9,11,1);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (12,9,1);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (10,11,2);

INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (13,14,8);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (15,16,5);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (15,13,8);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (16,14,5);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (14,15,8);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (16,13,5);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (1,2,4);
INSERT into matches(fk_team1, fk_team2, fk_stadium) VALUES (1,2,4);
