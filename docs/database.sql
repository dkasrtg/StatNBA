CREATE SCHEMA IF NOT EXISTS "public";

CREATE SEQUENCE action_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE equipe_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE joueur_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE match_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE saison_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE type_action_id_seq AS integer START WITH 1 INCREMENT BY 1;

CREATE  TABLE equipe ( 
	id                   integer DEFAULT nextval('equipe_id_seq'::regclass) NOT NULL  ,
	nom                  varchar(255)    ,
	CONSTRAINT equipe_pkey PRIMARY KEY ( id )
 );

CREATE  TABLE joueur ( 
	id                   integer DEFAULT nextval('joueur_id_seq'::regclass) NOT NULL  ,
	id_equipe            integer    ,
	nom                  varchar(255)    ,
	numero               integer    ,
	CONSTRAINT joueur_pkey PRIMARY KEY ( id ),
	CONSTRAINT fk_joueur_equipe FOREIGN KEY ( id_equipe ) REFERENCES equipe( id ) ON DELETE CASCADE ON UPDATE CASCADE 
 );

CREATE  TABLE saison ( 
	id                   integer DEFAULT nextval('saison_id_seq'::regclass) NOT NULL  ,
	annee_debut          integer    ,
	annee_fin            integer    ,
	CONSTRAINT saison_pkey PRIMARY KEY ( id )
 );

CREATE  TABLE type_action ( 
	id                   integer DEFAULT nextval('type_action_id_seq'::regclass) NOT NULL  ,
	nom                  varchar(255)    ,
	reference            varchar(255)    ,
	CONSTRAINT type_action_pkey PRIMARY KEY ( id )
 );

CREATE  TABLE "match" ( 
	id                   integer DEFAULT nextval('match_id_seq'::regclass) NOT NULL  ,
	"date"               date    ,
	id_equipea           integer    ,
	id_equipeb           integer    ,
	id_saison            integer    ,
	nom                  varchar(255)    ,
	CONSTRAINT match_pkey PRIMARY KEY ( id ),
	CONSTRAINT fk_match_saison FOREIGN KEY ( id_saison ) REFERENCES saison( id ) ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_match_equipe FOREIGN KEY ( id_equipeb ) REFERENCES equipe( id ) ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_match_equipe_0 FOREIGN KEY ( id_equipea ) REFERENCES equipe( id ) ON DELETE CASCADE ON UPDATE CASCADE 
 );

CREATE  TABLE "action" ( 
	id                   integer DEFAULT nextval('action_id_seq'::regclass) NOT NULL  ,
	id_joueur            integer    ,
	id_match             integer    ,
	id_type_action       integer    ,
	valeur               double precision    ,
	CONSTRAINT action_pkey PRIMARY KEY ( id ),
	CONSTRAINT fk_action_joueur FOREIGN KEY ( id_joueur ) REFERENCES joueur( id ) ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_action_match FOREIGN KEY ( id_match ) REFERENCES "match"( id ) ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_action_type_action FOREIGN KEY ( id_type_action ) REFERENCES type_action( id ) ON DELETE CASCADE ON UPDATE CASCADE 
 );

CREATE OR REPLACE VIEW equipe_mj AS SELECT teams.id_equipe,     count(DISTINCT m.id) AS match_count    FROM (( SELECT match.id_equipea AS id_equipe            FROM match         UNION ALL          SELECT match.id_equipeb AS id_equipe            FROM match) teams      LEFT JOIN match m ON (((teams.id_equipe = m.id_equipea) OR (teams.id_equipe = m.id_equipeb))))   GROUP BY teams.id_equipe   ORDER BY teams.id_equipe;
 SELECT teams.id_equipe,
    count(DISTINCT m.id) AS match_count
   FROM (( SELECT match.id_equipea AS id_equipe
           FROM match
        UNION ALL
         SELECT match.id_equipeb AS id_equipe
           FROM match) teams
     LEFT JOIN match m ON (((teams.id_equipe = m.id_equipea) OR (teams.id_equipe = m.id_equipeb))))
  GROUP BY teams.id_equipe
  ORDER BY teams.id_equipe;

CREATE OR REPLACE VIEW joueur_mj AS SELECT j.id AS id_joueur,     count(DISTINCT a.id_match) AS match_count    FROM (joueur j      LEFT JOIN action a ON ((j.id = a.id_joueur)))   GROUP BY j.id;
 SELECT j.id AS id_joueur,
    count(DISTINCT a.id_match) AS match_count
   FROM (joueur j
     LEFT JOIN action a ON ((j.id = a.id_joueur)))
  GROUP BY j.id;

CREATE OR REPLACE VIEW stat_joueur_static AS SELECT jmj.id_joueur,     j.nom AS nom_joueur,     emj.id_equipe,     e.nom AS nom_equipe,     emj.match_count AS nombre_match_equipe,     jmj.match_count AS nombre_match_joueur    FROM (((joueur_mj jmj      JOIN joueur j ON ((j.id = jmj.id_joueur)))      JOIN equipe e ON ((e.id = j.id_equipe)))      JOIN equipe_mj emj ON ((emj.id_equipe = e.id)));
 SELECT jmj.id_joueur,
    j.nom AS nom_joueur,
    emj.id_equipe,
    e.nom AS nom_equipe,
    emj.match_count AS nombre_match_equipe,
    jmj.match_count AS nombre_match_joueur
   FROM (((joueur_mj jmj
     JOIN joueur j ON ((j.id = jmj.id_joueur)))
     JOIN equipe e ON ((e.id = j.id_equipe)))
     JOIN equipe_mj emj ON ((emj.id_equipe = e.id)));

INSERT INTO equipe( id, nom ) VALUES ( 1, 'Los Angeles Lakers');
INSERT INTO equipe( id, nom ) VALUES ( 2, 'Golden State Warriors');
INSERT INTO equipe( id, nom ) VALUES ( 3, 'Brooklyn Nets');
INSERT INTO joueur( id, id_equipe, nom, numero ) VALUES ( 1, 1, 'LeBron James', 23);
INSERT INTO joueur( id, id_equipe, nom, numero ) VALUES ( 2, 1, 'Anthony Davis', 3);
INSERT INTO joueur( id, id_equipe, nom, numero ) VALUES ( 3, 1, 'Russell Westbrook', 0);
INSERT INTO joueur( id, id_equipe, nom, numero ) VALUES ( 4, 2, 'Stephen Curry', 30);
INSERT INTO joueur( id, id_equipe, nom, numero ) VALUES ( 5, 2, 'Klay Thompson', 11);
INSERT INTO joueur( id, id_equipe, nom, numero ) VALUES ( 6, 2, 'Draymond Green', 23);
INSERT INTO joueur( id, id_equipe, nom, numero ) VALUES ( 7, 3, 'Kevin Durant', 7);
INSERT INTO joueur( id, id_equipe, nom, numero ) VALUES ( 8, 3, 'Kyrie Irving', 11);
INSERT INTO joueur( id, id_equipe, nom, numero ) VALUES ( 9, 3, 'James Harden', 13);
INSERT INTO saison( id, annee_debut, annee_fin ) VALUES ( 1, 2022, 2023);
INSERT INTO type_action( id, nom, reference ) VALUES ( 1, 'point par match', 'ppm');
INSERT INTO type_action( id, nom, reference ) VALUES ( 2, 'rebond par match', 'rpm');
INSERT INTO type_action( id, nom, reference ) VALUES ( 3, 'passe decisive par match', 'pdpm');
INSERT INTO type_action( id, nom, reference ) VALUES ( 4, 'minute par match', 'mpm');
INSERT INTO type_action( id, nom, reference ) VALUES ( 5, 'efficacite', 'eff');
INSERT INTO type_action( id, nom, reference ) VALUES ( 6, 'tir 2 points', 'fg%');
INSERT INTO type_action( id, nom, reference ) VALUES ( 7, 'tir 3 points', '3p%');
INSERT INTO type_action( id, nom, reference ) VALUES ( 8, 'lance-front', '%lf');
INSERT INTO "match"( id, "date", id_equipea, id_equipeb, id_saison, nom ) VALUES ( 1, '2023-01-15', 1, 2, 1, 'Lakers vs. Warriors');
INSERT INTO "match"( id, "date", id_equipea, id_equipeb, id_saison, nom ) VALUES ( 2, '2023-02-05', 1, 3, 1, 'Nets vs. Heat');
INSERT INTO "match"( id, "date", id_equipea, id_equipeb, id_saison, nom ) VALUES ( 3, '2023-03-10', 2, 3, 1, 'Bulls vs. Lakers');
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 1, 1, 1, 1, 28.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 2, 1, 1, 2, 13.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 3, 1, 1, 3, 9.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 4, 1, 1, 4, 33.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 5, 1, 1, 5, 0.75);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 6, 1, 1, 6, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 7, 2, 1, 1, 25.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 8, 2, 1, 2, 11.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 9, 2, 1, 3, 12.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 10, 2, 1, 4, 38.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 11, 2, 1, 5, 0.68);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 12, 2, 1, 6, 8.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 13, 3, 1, 1, 20.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 14, 3, 1, 2, 10.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 15, 3, 1, 3, 8.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 16, 3, 1, 4, 40.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 17, 3, 1, 5, 0.8);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 18, 3, 1, 6, 6.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 19, 4, 1, 1, 18.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 20, 4, 1, 2, 9.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 21, 4, 1, 3, 11.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 22, 4, 1, 4, 35.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 23, 4, 1, 5, 0.7);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 24, 4, 1, 6, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 25, 5, 1, 1, 30.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 26, 5, 1, 2, 15.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 27, 5, 1, 3, 7.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 28, 5, 1, 4, 32.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 29, 5, 1, 5, 0.65);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 30, 5, 1, 6, 4.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 31, 6, 1, 1, 22.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 32, 6, 1, 2, 14.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 33, 6, 1, 3, 6.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 34, 6, 1, 4, 37.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 35, 6, 1, 5, 0.72);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 36, 6, 1, 6, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 37, 1, 1, 7, 6.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 38, 1, 1, 8, 3.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 39, 2, 1, 7, 4.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 40, 2, 1, 8, 2.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 41, 3, 1, 7, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 42, 3, 1, 8, 1.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 43, 4, 1, 7, 4.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 44, 4, 1, 8, 2.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 45, 5, 1, 7, 3.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 46, 5, 1, 8, 1.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 47, 6, 1, 7, 6.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 48, 6, 1, 8, 3.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 49, 1, 2, 1, 25.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 50, 1, 2, 2, 13.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 51, 1, 2, 3, 11.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 52, 1, 2, 4, 34.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 53, 1, 2, 5, 0.68);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 54, 1, 2, 6, 8.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 55, 2, 2, 1, 23.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 56, 2, 2, 2, 14.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 57, 2, 2, 3, 12.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 58, 2, 2, 4, 38.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 59, 2, 2, 5, 0.75);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 60, 2, 2, 6, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 61, 3, 2, 1, 18.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 62, 3, 2, 2, 10.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 63, 3, 2, 3, 8.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 64, 3, 2, 4, 40.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 65, 3, 2, 5, 0.8);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 66, 3, 2, 6, 6.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 67, 7, 2, 1, 22.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 68, 7, 2, 2, 11.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 69, 7, 2, 3, 9.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 70, 7, 2, 4, 33.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 71, 7, 2, 5, 0.72);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 72, 7, 2, 6, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 73, 8, 2, 1, 20.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 74, 8, 2, 2, 12.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 75, 8, 2, 3, 7.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 76, 8, 2, 4, 32.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 77, 8, 2, 5, 0.65);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 78, 8, 2, 6, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 79, 9, 2, 1, 30.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 80, 9, 2, 2, 15.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 81, 9, 2, 3, 10.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 82, 9, 2, 4, 36.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 83, 9, 2, 5, 0.72);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 84, 9, 2, 6, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 85, 1, 2, 7, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 86, 1, 2, 8, 3.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 87, 2, 2, 7, 4.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 88, 2, 2, 8, 2.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 89, 3, 2, 7, 3.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 90, 3, 2, 8, 1.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 91, 7, 2, 7, 6.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 92, 7, 2, 8, 3.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 93, 8, 2, 7, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 94, 8, 2, 8, 2.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 95, 9, 2, 7, 4.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 96, 9, 2, 8, 2.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 97, 4, 3, 1, 26.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 98, 4, 3, 2, 14.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 99, 4, 3, 3, 11.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 100, 4, 3, 4, 32.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 101, 4, 3, 5, 0.68);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 102, 4, 3, 6, 8.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 103, 5, 3, 1, 24.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 104, 5, 3, 2, 13.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 105, 5, 3, 3, 10.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 106, 5, 3, 4, 38.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 107, 5, 3, 5, 0.75);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 108, 5, 3, 6, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 109, 6, 3, 1, 19.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 110, 6, 3, 2, 11.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 111, 6, 3, 3, 9.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 112, 6, 3, 4, 40.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 113, 6, 3, 5, 0.8);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 114, 6, 3, 6, 6.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 115, 7, 3, 1, 23.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 116, 7, 3, 2, 12.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 117, 7, 3, 3, 8.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 118, 7, 3, 4, 33.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 119, 7, 3, 5, 0.72);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 120, 7, 3, 6, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 121, 8, 3, 1, 21.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 122, 8, 3, 2, 10.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 123, 8, 3, 3, 7.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 124, 8, 3, 4, 34.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 125, 8, 3, 5, 0.65);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 126, 8, 3, 6, 7.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 127, 9, 3, 1, 29.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 128, 9, 3, 2, 15.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 129, 9, 3, 3, 12.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 130, 9, 3, 4, 36.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 131, 9, 3, 5, 0.72);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 132, 9, 3, 6, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 133, 4, 3, 7, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 134, 4, 3, 8, 3.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 135, 5, 3, 7, 4.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 136, 5, 3, 8, 2.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 137, 6, 3, 7, 3.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 138, 6, 3, 8, 1.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 139, 7, 3, 7, 6.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 140, 7, 3, 8, 3.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 141, 8, 3, 7, 5.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 142, 8, 3, 8, 2.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 143, 9, 3, 7, 4.0);
INSERT INTO "action"( id, id_joueur, id_match, id_type_action, valeur ) VALUES ( 144, 9, 3, 8, 2.0);
