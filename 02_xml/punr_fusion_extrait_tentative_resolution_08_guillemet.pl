if($file=="08"){
# traitement du chapitre 08 sur joë bousquet, l'usage des guillemts d'ARG ne permet pas balisage automatique aisé. d'où teste + avancé ici :
	# 		4 cas de figure
	# + le paragraphe contient « et »
			$line=~s/« (.*) »/<!--DOUBLE--><quote>« $1<\/quote><!--DOUBLE-->/g;
	# + le paragraphe seul « premier signe du paragraphe
			$line=~s/« (.*)[^»]<\/p>/<quote>« $1<\/quote><!--AJOUT FIN CITATION ICI--><\/p>/g;

	# + le paragraphe seul » dernier signe
			$line=~s/<p>[^«](.*) »/<p><!--AJOUT DÉBUT CITATION ICI--><quote>$1 »<\/quote>/g;

	# + le paragraphe contient plusieurs « »

			# début citation marche pas, fin citation est pas mal mais c'est pas un saut de ligne mais </p> sans doute
			# $line=~s/ »/ »<\/quote>/g;
			# $line=~s/« /<quote>« /g;
			# on est bien emmerdé : la suppression de la variante normale évite double <quote> mais ne permet plus de baliser les occurences normales
		}else{
			#dans tous les autres cas gestion normal guillemets = quote. Affinage sur la nature des guillemets viendra après vérif xsl etc...
			$line=~s/« /<quote>« /g;
			$line=~s/ »/ »<\/quote>/g;
		}