TRUNCATE TABLE "action" CASCADE;
TRUNCATE TABLE "match" CASCADE;
TRUNCATE TABLE joueur CASCADE;
TRUNCATE TABLE equipe CASCADE;
TRUNCATE TABLE saison CASCADE;
TRUNCATE TABLE type_action CASCADE;
ALTER SEQUENCE id_equipe_seq RESTART WITH 1;
ALTER SEQUENCE joueur_id_seq RESTART WITH 1;
ALTER SEQUENCE match_id_seq RESTART WITH 1;
ALTER SEQUENCE saison_id_seq RESTART WITH 1;
ALTER SEQUENCE type_action_id_seq RESTART WITH 1;
ALTER SEQUENCE action_id_seq RESTART WITH 1;




INSERT INTO equipe (nom,"image") VALUES
  ('Los Angeles Lakers','equipe1'),
  ('Golden State Warriors','equipe2'),
  ('Brooklyn Nets','equipe3');

-- Players for Los Angeles Lakers (id_equipe = 1)
INSERT INTO joueur (id_equipe, nom, numero,"image") VALUES
  (1, 'LeBron James', 23,'joueur1'),
  (1, 'Anthony Davis', 3,'joueur2'),
  (1, 'Russell Westbrook', 0,'joueur3');

-- Players for Golden State Warriors (id_equipe = 2)
INSERT INTO joueur (id_equipe, nom, numero,"image") VALUES
  (2, 'Stephen Curry', 30,'joueur4'),
  (2, 'Klay Thompson', 11,'joueur5'),
  (2, 'Draymond Green', 23,'joueur6');

-- Players for Brooklyn Nets (id_equipe = 3)
INSERT INTO joueur (id_equipe, nom, numero,"image") VALUES
  (3, 'Kevin Durant', 7,'joueur7'),
  (3, 'Kyrie Irving', 11,'joueur8'),
  (3, 'James Harden', 13,'joueur9');
  

INSERT INTO saison (annee_debut, annee_fin) VALUES (2022, 2023);

INSERT INTO type_action (nom, reference) VALUES
  ('point par match', 'ppm'),
  ('rebond par match', 'rpm'),
  ('passe decisive par match', 'pdpm'),
  ('minute par match', 'mpm'),
  ('efficacite', 'eff'),
  ('tir 2 points', 'fg%'),
  ('tir 3 points', '3p%'),
  ('lance-front', '%lf');

-- Assuming you have valid IDs for teams, seasons, and matches
INSERT INTO "match" (id, "date", id_equipea, id_equipeb, id_saison, nom) VALUES
  (1, '2023-01-15', 1, 2, 1, 'Lakers vs. Warriors'),
  (2, '2023-02-05', 1, 3, 1, 'Nets vs. Heat'),
  (3, '2023-03-10', 2, 3, 1, 'Bulls vs. Lakers');

INSERT INTO "action" (id_joueur, id_match, id_type_action, valeur) VALUES
  (1, 1, 1, 28),   
  (1, 1, 2, 13),   
  (1, 1, 3, 9),  
  (1, 1, 4, 33),   
  (1, 1, 5, 0.75),
  (1, 1, 6, 5),

  (2, 1, 1, 25),   
  (2, 1, 2, 11),   
  (2, 1, 3, 12),  
  (2, 1, 4, 38),   
  (2, 1, 5, 0.68),
  (2, 1, 6, 8),

  (3, 1, 1, 20),   
  (3, 1, 2, 10),   
  (3, 1, 3, 8),  
  (3, 1, 4, 40),   
  (3, 1, 5, 0.80),
  (3, 1, 6, 6),

  (4, 1, 1, 18),   
  (4, 1, 2, 9),   
  (4, 1, 3, 11),  
  (4, 1, 4, 35),   
  (4, 1, 5, 0.70),
  (4, 1, 6, 5),

  (5, 1, 1, 30),   
  (5, 1, 2, 15),   
  (5, 1, 3, 7),  
  (5, 1, 4, 32),   
  (5, 1, 5, 0.65),
  (5, 1, 6, 4),

  (6, 1, 1, 22),   
  (6, 1, 2, 14),   
  (6, 1, 3, 6),  
  (6, 1, 4, 37),   
  (6, 1, 5, 0.72),
  (6, 1, 6, 5);

INSERT INTO "action" (id_joueur, id_match, id_type_action, valeur) VALUES
  (1, 1, 7, 6),   -- 7th action for player 1 (number of 2-pointers)
  (1, 1, 8, 3),   -- 8th action for player 1 (number of 3-pointers)

  (2, 1, 7, 4),   -- 7th action for player 2 (number of 2-pointers)
  (2, 1, 8, 2),   -- 8th action for player 2 (number of 3-pointers)

  (3, 1, 7, 5),   -- 7th action for player 3 (number of 2-pointers)
  (3, 1, 8, 1),   -- 8th action for player 3 (number of 3-pointers)

  (4, 1, 7, 4),   -- 7th action for player 4 (number of 2-pointers)
  (4, 1, 8, 2),   -- 8th action for player 4 (number of 3-pointers)

  (5, 1, 7, 3),   -- 7th action for player 5 (number of 2-pointers)
  (5, 1, 8, 1),   -- 8th action for player 5 (number of 3-pointers)

  (6, 1, 7, 6),   -- 7th action for player 6 (number of 2-pointers)
  (6, 1, 8, 3);   -- 8th action for player 6 (number of 3-pointers)

INSERT INTO "action" (id_joueur, id_match, id_type_action, valeur) VALUES
  (1, 2, 1, 25),   
  (1, 2, 2, 13),   
  (1, 2, 3, 11),  
  (1, 2, 4, 34),   
  (1, 2, 5, 0.68),
  (1, 2, 6, 8),

  (2, 2, 1, 23),   
  (2, 2, 2, 14),   
  (2, 2, 3, 12),  
  (2, 2, 4, 38),   
  (2, 2, 5, 0.75),
  (2, 2, 6, 5),

  (3, 2, 1, 18),   
  (3, 2, 2, 10),   
  (3, 2, 3, 8),  
  (3, 2, 4, 40),   
  (3, 2, 5, 0.80),
  (3, 2, 6, 6),

  (7, 2, 1, 22),   
  (7, 2, 2, 11),   
  (7, 2, 3, 9),  
  (7, 2, 4, 33),   
  (7, 2, 5, 0.72),
  (7, 2, 6, 5),

  (8, 2, 1, 20),   
  (8, 2, 2, 12),   
  (8, 2, 3, 7),  
  (8, 2, 4, 32),   
  (8, 2, 5, 0.65),
  (8, 2, 6, 5),

  (9, 2, 1, 30),   
  (9, 2, 2, 15),   
  (9, 2, 3, 10),  
  (9, 2, 4, 36),   
  (9, 2, 5, 0.72),
  (9, 2, 6, 5);

INSERT INTO "action" (id_joueur, id_match, id_type_action, valeur) VALUES
  (1, 2, 7, 5),   -- 7th action for player 1 (number of 2-pointers)
  (1, 2, 8, 3),   -- 8th action for player 1 (number of 3-pointers)

  (2, 2, 7, 4),   -- 7th action for player 2 (number of 2-pointers)
  (2, 2, 8, 2),   -- 8th action for player 2 (number of 3-pointers)

  (3, 2, 7, 3),   -- 7th action for player 3 (number of 2-pointers)
  (3, 2, 8, 1),   -- 8th action for player 3 (number of 3-pointers)

  (7, 2, 7, 6),   -- 7th action for player 7 (number of 2-pointers)
  (7, 2, 8, 3),   -- 8th action for player 7 (number of 3-pointers)

  (8, 2, 7, 5),   -- 7th action for player 8 (number of 2-pointers)
  (8, 2, 8, 2),   -- 8th action for player 8 (number of 3-pointers)

  (9, 2, 7, 4),   -- 7th action for player 9 (number of 2-pointers)
  (9, 2, 8, 2);   -- 8th action for player 9 (number of 3-pointers)



INSERT INTO "action" (id_joueur, id_match, id_type_action, valeur) VALUES
  (4, 3, 1, 26),   
  (4, 3, 2, 14),   
  (4, 3, 3, 11),  
  (4, 3, 4, 32),   
  (4, 3, 5, 0.68),
  (4, 3, 6, 8),

  (5, 3, 1, 24),   
  (5, 3, 2, 13),   
  (5, 3, 3, 10),  
  (5, 3, 4, 38),   
  (5, 3, 5, 0.75),
  (5, 3, 6, 5),

  (6, 3, 1, 19),   
  (6, 3, 2, 11),   
  (6, 3, 3, 9),  
  (6, 3, 4, 40),   
  (6, 3, 5, 0.80),
  (6, 3, 6, 6),

  (7, 3, 1, 23),   
  (7, 3, 2, 12),   
  (7, 3, 3, 8),  
  (7, 3, 4, 33),   
  (7, 3, 5, 0.72),
  (7, 3, 6, 5),

  (8, 3, 1, 21),   
  (8, 3, 2, 10),   
  (8, 3, 3, 7),  
  (8, 3, 4, 34),   
  (8, 3, 5, 0.65),
  (8, 3, 6, 7),

  (9, 3, 1, 29),   
  (9, 3, 2, 15),   
  (9, 3, 3, 12),  
  (9, 3, 4, 36),   
  (9, 3, 5, 0.72),
  (9, 3, 6, 5);

INSERT INTO "action" (id_joueur, id_match, id_type_action, valeur) VALUES
  (4, 3, 7, 5),   -- 7th action for player 4 (number of 2-pointers)
  (4, 3, 8, 3),   -- 8th action for player 4 (number of 3-pointers)

  (5, 3, 7, 4),   -- 7th action for player 5 (number of 2-pointers)
  (5, 3, 8, 2),   -- 8th action for player 5 (number of 3-pointers)

  (6, 3, 7, 3),   -- 7th action for player 6 (number of 2-pointers)
  (6, 3, 8, 1),   -- 8th action for player 6 (number of 3-pointers)

  (7, 3, 7, 6),   -- 7th action for player 7 (number of 2-pointers)
  (7, 3, 8, 3),   -- 8th action for player 7 (number of 3-pointers)

  (8, 3, 7, 5),   -- 7th action for player 8 (number of 2-pointers)
  (8, 3, 8, 2),   -- 8th action for player 8 (number of 3-pointers)

  (9, 3, 7, 4),   -- 7th action for player 9 (number of 2-pointers)
  (9, 3, 8, 2);   -- 8th action for player 9 (number of 3-pointers)

create or replace view v_stat 

SELECT
  id_joueur,
  AVG(CASE WHEN ta.reference = 'ppm' THEN a.valeur END) AS "ppm",
  AVG(CASE WHEN ta.reference = 'rpm' THEN a.valeur END) AS "rpm",
  AVG(CASE WHEN ta.reference = 'pdpm' THEN a.valeur END) AS "pdpm",
  AVG(CASE WHEN ta.reference = 'mpm' THEN a.valeur END) AS "mpm",
  AVG(CASE WHEN ta.reference = 'eff' THEN a.valeur END) AS "eff",
  AVG(CASE WHEN ta.reference = 'fg%' THEN a.valeur END) AS "fg%",
  AVG(CASE WHEN ta.reference = '3p%' THEN a.valeur END) AS "3p%",
  AVG(CASE WHEN ta.reference = '%lf' THEN a.valeur END) AS "%lf"
FROM "action" a
JOIN type_action ta ON a.id_type_action = ta.id
where id_joueur in (select j.id from joueur j join equipe e on j.id_equipe=e.id where e.id=2)
GROUP BY id_joueur
ORDER BY "ppm" desc;

create or replace view equipe_mj as
SELECT id_equipe, COUNT(DISTINCT m.id) AS match_count
FROM (
    SELECT id_equipea AS id_equipe FROM "match"
    UNION ALL
    SELECT id_equipeb AS id_equipe FROM "match"
) AS teams
LEFT JOIN "match" m ON teams.id_equipe = m.id_equipea OR teams.id_equipe = m.id_equipeb
GROUP BY id_equipe
ORDER BY id_equipe;

create or replace view joueur_mj as
SELECT j.id AS id_joueur, COUNT(DISTINCT a.id_match) AS match_count
FROM joueur j
LEFT JOIN action a ON j.id = a.id_joueur
GROUP BY j.id;


create view stat_joueur_static as 
select jmj.id_joueur,j.nom as nom_joueur,j.image as image_joueur,emj.id_equipe,e.nom as nom_equipe,emj.match_count as nombre_match_equipe,jmj.match_count as nombre_match_joueur from joueur_mj jmj join joueur j on j.id=jmj.id_joueur join equipe e on e.id=j.id_equipe join equipe_mj emj on emj.id_equipe=e.id;

