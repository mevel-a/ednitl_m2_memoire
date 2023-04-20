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




# script qui teste file

if($file=="08"){
	#si ni l'un ni l'autre pas de prb
	#test la présence de quote /quote
		if($line=~/<quote>(.*)<\/quote>/){}
		else{

	#si quote mais pas \quote alors  ==> ajout /quote
		if($line=~/<quote>(.*)<\/p>$/){
			if($line=~/<\/quote>/){}
			else{
				$line=~s/<\/p>$/<\/quote><\/p>/;
			}
		}
	#si pas quote mais \quote alors ==> ajout quote
		if($line=~/^<p>(.*)<\/quote>/){
			if($line=~/<quote>/){}
			else{
				$line=~s/^<p>/<quote><p>/;
			}
			
		}
	}
}



#méthode bourrine mais suffisante : 
if($file=="08"){
	$line=~s/yeux !\.\.\.<\/p>/yeux !\.\.\.<\/quote><\/p>/;
	$line=~s/autour de votre ombre\.<\/p>/autour de votre ombre\.<\/quote><\/p>/;
	$line=~s/qui était à corrompre\.<\/p>/qui était à corrompre.<\/quote><\/p>/;
	$line=~s/<p>– Hélas ! qu’ai-je incarné de plus que l’accident/<p><quote>– Hélas ! qu’ai-je incarné de plus que l’accident/;
	$line=~s/<p>– Ainsi, après avoir été jeté dans ton lit d’infirme,\ntu as vu ta vie venir à toi \?<\/p>/<p><quote>– Ainsi, après avoir été jeté dans ton lit d’infirme,\ntu as vu ta vie venir à toi \?<\/quote><\/p>/;
	$line=~s/mémoire\.\.\.<\/p>/mémoire...<\/quote><\/p>/;
	$line=~s/bureau un homme se raconte qu’il avait rêvé la démarche que, vraiment, il accomplit\.<\/p/bureau un homme se raconte qu’il avait rêvé la démarche que, vraiment, il accomplit.<\/quote><\/p/;
	$line=~s/mort\.<\/p>/mort\.<\/quote><\/p>/;
	# $line=~s///;
	# $line=~s///;
	# $line=~s///;
	# $line=~s///;
	# $line=~s///;

}