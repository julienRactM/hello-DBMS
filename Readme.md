Projet SQL - Ract-Mugnerot Julien B3-IA
Il sera honnêtement plus intéressant pour le correcteur de suivre la correction sur le fichier World SQL qui contient images et une présentation plus élégante du code SQL


Veille scientifique


A. Qu’est ce qu’une donnée ? Sous quelle forme peut-elle se présenter ?
Une donnée, c'est une information stockée dans un ordinateur, elle peut prendre la forme de texte, des chiffres, de vidéos, des images, des fichiers etc …


B. Donnez et expliquez les critères de mesure de qualité des données.
Les critères de mesure de qualité des données sont la précision, la fiabilité et l’exploitabilité.
Il est important de pouvoir accéder à des informations pertinentes rapidement sans nécessiter une modification de la structure de la donnée à chaque requête.
Les données doivent être fiable, il faut donc s’assurer de leur provenance, de leur véracité, et préserver leur intégrité.
Les données doivent également être complètes, idéalement depuis leur récolte mais l’absence de données dans certaines colonnes peut également être interprété par l’analyste et comblé par différentes solutions comme une classification binaire, l’utilisation de moyenne etc …
Il ne faut cependant pas abuser de ces méthodes pour éviter de dénaturer la donnée et admettre qu’elle est inexploitable si les informations manquent.


C. Définissez et comparez les notions de Data Lake, Data Warehouse et Lake House. Illustrez les différences à l’aide de schémas.
Les notions de Data Lake, Data Warehouse et Lake House sont des architectures de stockage et de gestion de données.
Un Data Lake est une infrastructure de stockage qui permet de stocker des données brutes dans leur format natif, sans structure prédéfinie.
Un Data Warehouse est une base de données centralisée et structurée conçue pour stocker des données provenant de différentes sources après avoir exécuté sur elles des tâches ETL (Extract, Transform, Load).
Un Lake House est une approche hybride qui combine les avantages des deux notions précédentes, avec l’organisation propre au Data Lake et la structure adaptée aux tâches d’ETL.

 

D. Donnez une définition et des exemples de systèmes de gestion de bases de données avec des illustrations.
Les SGBD sont des logiciels destinés au stockage, et à la gestion des données de manières structurée.
Ils facilitent leur manipulation et leur mise à jour.
Mysql, Oracle Database et MongoDB comptent parmi les SGBD les plus connus.
 

E. Qu’est-ce qu’une base de données relationnelle ? Qu’est-ce qu’une base de données non relationnelle ? Donnez la différence entre les deux avec des exemples d’applications.
Une base de données relationnelle est normalement composée de plusieurs tables indirectement reliées entre elles par l’utilisation de clé étrangère, colonne de la table contenant des identifiants que l’on retrouve dans la clé primaire d’une autre table. Toutes les tables de base de données ont par défaut une clé primaire qui permet par le biais de requêtes SQL de créer une table temporaire où extraire de nouvelles données composés d’informations provenant des deux tables.
Ex pour une base de données relationnelle : pour une société de location de vélos pourrait comprendre des tables distinctes pour les clients, les vélos, les locations, détails du fournisseur, etc. Les relations entre ces tables permettre par exemple d’étudier les taux de locations des différents vélos proposés selon l’âge ou le sexe du client sans avoir besoin de faire appel aux détails du fournisseur de vélos, ce qui pourrait engendrer des coûts supplémentaires.

Avec une base de données non relationnelle (NoSql), les fiches techniques de chaque modèle de vélo seront difficilement représentables sur la même base de données que les informations concernant les locations de vélos. 
Une base de données non relationnelle pourrait en revanche être utilisée pour stocker des informations sur les itinéraires de balades à proximité. Elle pourrait utiliser un modèle de document où chaque document représente un itinéraire avec des champs flexibles, on pourrait imaginer stocker un fichier contenant le chant des oiseaux recensés à proximité de chaque parcours, ce qui serait impossible dans une base de données relationnelle. 
Les projets sont parfois commencés en NoSql avant que leur structure ne soit figée sur une architecture de base de données relationnelle.



F. Définissez les notions de clé étrangère et clé primaire.
La clé primaire identifie de manière unique chaque enregistrement dans une table, tandis que la clé étrangère établit une relation entre les tables en faisant référence à la clé primaire d'une autre table.


G. Quelles sont les propriétés ACID ?
Les propriétés ACID sont un ensemble de caractéristiques qui garantissent la fiabilité des transactions dans une base de données relationnelle.
Atomicity : Opération indivisible des transactions.
Consistency: préserve la cohérence de la requête.
Isolation : Chaque transaction n’interfère pas d’autres possibles transactions simultanées 
Durabilité : Persistance des modifications en cas de panne du système


H. Définissez les méthodes Merise et UML. Quelles sont leur utilité dans le monde de l’informatique ? Donnez des cas précis d’utilisation avec des schémas.
Merise : 
Méthodologie de développement et de gestion de projet informatique, elle suggère une gestion de données en 3 niveaux, conceptuel, logique et physique.
Peut être utilisé comme système de gestion RH dans le cadre des informations relatives aux employés sur un schéma MCD avec des entités type Employé, Département, Salaire etc …
UML :
C’est un langage de modélisation standardisé utilisé pour représenter visuellement la structure, le comportement, et les interactions des systèmes logiciels.
UML peut être utilisé pour modéliser le système d'une application de messagerie instantanée. Un diagramme UML pourrait montrer l'interaction entre les utilisateurs, les messages envoyés, et le transfert de messages.


I. Définissez le langage SQL. Donnez les commandes les plus utilisées de ce langage et les différentes jointures qu’il est possible de faire.
SQL est un langage de programmation conçu pour la gestion et la manipulation de bases de données relationnelles.
Les commandes les plus utilisées comprennent SELECT et FROM dont l’usage est impératif pour les requêtes de prélèvement de la donnée, ainsi que Insert, Delete pour modifier ou supprimer des données. Puis dans les commandes SELECT ont retrouve très fréquemment les commandes WHERE, GROUP BY, HAVING et ORDER BY qui permettent de conditionner, d’agréger ou de restructurer la donnée lors de requête d’extraction de la donnée.

Pour les jointures, les options sont l’INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN. Cette dernière est moins utilisé dans la mesure où elles apporte le plus souvent trop d’information superflue à la requête SQL. Left & Right sont l’inverse l’une de l’autre et la logique humaine tend plus vers la requête Left qui est donc bien plus utilisé et est un outil très puissant. Inner Join renvoie uniquement les lignes où une correspondance est trouvée entre les colonnes des deux tables jointes.
