CREATE TABLE SOUSRUBRIQUE(
   sousrub_id INT,
   sousrub_nom VARCHAR(50) NOT NULL,
   sousrub_desc VARCHAR(50) NOT NULL,
   PRIMARY KEY(sousrub_id)
);

CREATE TABLE PRODUIT(
   pro_id INT,
   pro_nomdim CHAR(50) NOT NULL,
   pro_nom VARCHAR(255) NOT NULL,
   pro_img VARCHAR(255) NOT NULL,
   pro_qte INT NOT NULL,
   pro_prixht DECIMAL(15,2) NOT NULL,
   pro_qteale INT NOT NULL,
   sousrub_id INT NOT NULL,
   PRIMARY KEY(pro_id),
   FOREIGN KEY(sousrub_id) REFERENCES SOUSRUBRIQUE(sousrub_id)
);

CREATE TABLE COMMERCIAUX(
   commerc_id INT,
   commerc_nom VARCHAR(50) NOT NULL,
   commerc_prenom VARCHAR(50) NOT NULL,
   commerc_tel VARCHAR(14) NOT NULL,
   commerc_mail VARCHAR(50) NOT NULL,
   PRIMARY KEY(commerc_id)
);

CREATE TABLE FOURNISSEUR(
   fourn_id INT,
   fourn_nom VARCHAR(50) NOT NULL,
   fourn_rue VARCHAR(50) NOT NULL,
   fourn_cp INT NOT NULL,
   fourn_ville VARCHAR(50) NOT NULL,
   fourn_tel CHAR(14) NOT NULL,
   fourn_lastname_cntct VARCHAR(50) NOT NULL,
   fourn_firstname_cntct VARCHAR(50) NOT NULL,
   PRIMARY KEY(fourn_id)
);

CREATE TABLE RUBRIQUE(
   rub_id INT,
   rub_nom VARCHAR(50) NOT NULL,
   rub_desc VARCHAR(50) NOT NULL,
   PRIMARY KEY(rub_id)
);

CREATE TABLE CLIENT(
   cli_id INT,
   cli_nom VARCHAR(50) NOT NULL,
   cli_rue VARCHAR(50) NOT NULL,
   client_ville VARCHAR(50) NOT NULL,
   cli_cp INT NOT NULL,
   cli_tel VARCHAR(14) NOT NULL,
   cli_mail VARCHAR(50) NOT NULL,
   cli_type CHAR(50) NOT NULL,
   cli_siret CHAR(50) NOT NULL,
   commerc_id INT NOT NULL,
   PRIMARY KEY(cli_id),
   FOREIGN KEY(commerc_id) REFERENCES COMMERCIAUX(commerc_id)
);

CREATE TABLE COMMANDE(
   com_id INT,
   com_date DATETIME NOT NULL,
   com_reduc INT NOT NULL,
   com_prix_tot DECIMAL(15,2) NOT NULL,
   com_date_regle DATE NOT NULL,
   com_date_facture DATE NOT NULL,
   com_livraison_cp VARCHAR(5) NOT NULL,
   com_livraison_rue VARCHAR(50) NOT NULL,
   com_livraison_ville CHAR(50) NOT NULL,
   com_facture_rue VARCHAR(50) NOT NULL,
   com_facture_ville VARCHAR(50) NOT NULL,
   com_facture_cp CHAR(5) NOT NULL,
   com_etat VARCHAR(10) NOT NULL,
   cli_id INT NOT NULL,
   PRIMARY KEY(com_id),
   FOREIGN KEY(cli_id) REFERENCES CLIENT(cli_id)
);

CREATE TABLE LIVRAISON(
   liv_id INT,
   liv_num_bon INT NOT NULL,
   liv_date DATE NOT NULL,
   liv_etat VARCHAR(10) NOT NULL,
   com_id INT NOT NULL,
   PRIMARY KEY(liv_id),
   FOREIGN KEY(com_id) REFERENCES COMMANDE(com_id)
);

CREATE TABLE appartient(
   sousrub_id INT,
   rub_id INT,
   PRIMARY KEY(sousrub_id, rub_id),
   FOREIGN KEY(sousrub_id) REFERENCES SOUSRUBRIQUE(sousrub_id),
   FOREIGN KEY(rub_id) REFERENCES RUBRIQUE(rub_id)
);

CREATE TABLE compose_de(
   pro_id INT,
   com_id INT,
   compose_de_id INT NOT NULL,
   compose_de_commande_id INT NOT NULL,
   compose_de_produit_id INT NOT NULL,
   compose_de_qtite_commande INT NOT NULL,
   comepose_de_prix_vente DECIMAL(15,2) NOT NULL,
   PRIMARY KEY(pro_id, com_id),
   FOREIGN KEY(pro_id) REFERENCES PRODUIT(pro_id),
   FOREIGN KEY(com_id) REFERENCES COMMANDE(com_id)
);

CREATE TABLE contient(
   pro_id INT,
   liv_id INT,
   contient_liv_id INT NOT NULL,
   contient_pro_id INT NOT NULL,
   contient_qte_liv INT NOT NULL,
   PRIMARY KEY(pro_id, liv_id),
   FOREIGN KEY(pro_id) REFERENCES PRODUIT(pro_id),
   FOREIGN KEY(liv_id) REFERENCES LIVRAISON(liv_id)
);

CREATE TABLE approvisionner(
   pro_id INT,
   fourn_id INT,
   appro_id INT NOT NULL,
   appro_fourn_id INT NOT NULL,
   appro_pro_id INT NOT NULL,
   appro_prix_achat INT NOT NULL,
   appro_date_com DATE NOT NULL,
   appro_date_livr DATE NOT NULL,
   appro_qte INT NOT NULL,
   PRIMARY KEY(pro_id, fourn_id),
   FOREIGN KEY(pro_id) REFERENCES PRODUIT(pro_id),
   FOREIGN KEY(fourn_id) REFERENCES FOURNISSEUR(fourn_id)
);
