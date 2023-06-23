<!-- <ref Charles X type = author, à dégager ? -->

+ ref multiple ou 1 seul pour "borges écrit fiction" ?
choisit de baliser les deux pour + précis
auteur = ref œuvre = quote
	+ @cRef des œuvres = nomauteur_titre
	+ @ana
		+ blame = 0
		+ indifférent = 1*
		+ eloge = 2
		+ ambigue = 3
	+@cert
		+ 0, citation explicite
		+ 1, mention
		+ 2, mention ambiguë
		+ 3, emprunt non déclaré fortement suggéré
		+ 4, emprunt ou mention non déclaré(e) non suggéré(e) reconstitué(e)

+ humaniste/me get ref type=concept cref=philo_humanisme
+ Tragédie get ref (mais pas tous) cRef=litt_tragedie


- quote type="gloss_adv" corresp="toDefine" cert="3" ana="0"
- ref type="revue" ana="1" cert="1"

+ L'immortelle, l'étranger, l'année dernière à Marienbad DONE (not @)
+ les termes qui rentrent ensuite dans l'index des termes que ARG prête aux vilains critiques qui disent du mal de son livre sont à identifiés avec un @??? ou un @corresp commun. (absent de la DB)
<!-- IL FAUT AJOUTER DES <AB/> AUTOUR DES <W/> CAR LES MOTS SEULS SERVENT À RIEN + LE MÊME TERME IE «VRAI» EST EMPLOYÉ DANS LES DEUX -->


+ EXCLUS "caractère" de ch03 des <quote/>
+ AJOUTER UN @type="fakecit" pour les citations vraisemblablement inventés où ARG joue au romancier et prête des propos ridicule à ces détracteurs (supposés)
+ Pour les citation du genre glossaire adversaire
	+ <quote type="gloss_adv" corresp="toDefine" cert="2" ana="0">« grand public »</quote>
	+ il faudra ajouter des NBP en infobulle


+ ajouter une fonction pour afficher les pb si utilisateurs clique dessus



+ l'essayiste de renom qui a écrit le cœur romantique des choses on avait son nom qqpart il a disparu, à ajouter en Cref ==> les cRef si présent et non "toDefine" sont affichés et traités avec des translate()