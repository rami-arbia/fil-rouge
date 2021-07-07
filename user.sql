CREATE USER 'visiteur'@'localhost'
CREATE USER 'client'@'localhost'
CREATE USER 'gestion'@'localhost'
CREATE USER 'admin'@'localhost'

GRANT select
ON PRODUIT
TO 'visiteur'@'localhost';

GRANT select
ON village_green
TO 'client'@'localhost';

GRANT insert, update
ON COMMANDE, CLIENT
TO 'client'@'localhost';

GRANT select, insert, update
ON village_green 
TO 'gestion'@'localhost';

GRANT select, insert, update, create, delete
ON village_green
TO 'admin'@'localhost';