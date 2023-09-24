# Contenu du répertoire

Ce repertoire contient le travail effectué par Adrien Mével, étudiant en Master 2 Éditions numériques et imprimées de textes littéraires à l'Université de Lille, sous la direction de Mme Florence de Chalonge et M. Matthieu Marchal.

Ce travail mené sur une année consistait en la réalisation d'une édition critique et numérique de *Pour un nouveau roman* publié en 1963 par Alain Robbe-Grillet.

On y trouvera :
- les rendus théoriques (scories inluded)
	- mémoire scientifique
		- notons que les liens hypertextes censées renvoyé d'une page à une autre ne fonctionnent que si la cible du lien est au sein de la page. Il suffisait (si ma mémoire ne me fait défaut) d'ajouter dans le texte de l'xsl les variables "$biblio_link" (par exemple) entre après le « # » des adresses cibles pour les rendre fonctionnel. Mais ici encore big f.
	- rapport technique
		- de fait les liens d'une section à l'autre y fonctionnent
		- on y trouve les captures d'écran etc en plus grand que dans le rapport technique final, mal cadrée (big f again)
	- le site dans sa version finale (ne pas méprendre ce « finale » pour « terminée »)
	- le texte de Robbe Grillet en moins, ce qui, il est vrai ruine un peu le principe, mais il va sans dire que n'ayant les droit sur les écrits de Robbe-Grillet, seuls de courts extraits ont été conservés afin de montrer les fonctionnalités de l'interface de consultation constituée.
- les transformations xsl, et scripts perl qui permirent de constituer le fichier d'encodage puis sa version numérique
- les transformations et scripts (relativement fonctionnels mais en alpha pour le reste de l'éternité (ou durée équivalente)) permettant de passer de .tex à .html et inversement (selon la css associée au site).
- un bilio en xml et transfo xsl composée puis corrigée en deux urgences différentes. L'intérêt de cette transformation est d'incarner à peu près à la perfection tout ce qu'il ne faut pas faire en xsl.

Outre l'incomplétude nécessaire au site pour pouvoir être distribué, notons que nombre des éléments présentés ici ne sont pas terminés. Ce repertoire se veut davantage une illustration de possibilités et des exemples pouvant servir d'inspiration (si besoin est) qu'un produit fini.

## État des lieux 2023 09
Outre mes propres productions ne subsistent que des extraits de « Nature humanisme tragédie » (pour montrer choix d'encodage des epigraphes et quote de Sartre) et « Un roman qui s'invente lui-même » pour montrer les fonctionnalités de l'interface de lecture toutes ensembles. À noter : l'étape argumentative présente sur ce segment a été ajoutée pour illustrer la fonctionalité.

Les index autogénérés sont les seules pages du site qui ont été générées grâce au véritable xml d'encodage (encore une fois : absent de la présente archive). Tout le reste a été conçu sur l'xml dit « public ». Comme quoi : « \[Quelques droits\] vous manque\[nt\] et tout est dépeuplé ».