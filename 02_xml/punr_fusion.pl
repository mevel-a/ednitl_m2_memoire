#Adrien Mével, M2 EdNitl à l'université de Lille, réalisé le 28/03/2023 pour projet de recherche sur Pour un novueau roman encadré par Mme de Cahlonge et M. Marchal

use strict;
use warnings;
use utf8;
use open ':std', ':locale'; #debug UTF8 voir bookmark firefox
use open ':encoding(UTF-8)'; #debug UTF8 voir bookmark firefox

#création variables et ouvertures de fichier pour écriture
open (XMLdummy,"../02_xml/xml_corpus_dummy.txt");
binmode(XMLdummy, ":utf8");
my $XMLdummy="<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
while (my $line=<XMLdummy>){
	chop $line;
	$XMLdummy="$XMLdummy\n"."$line";
}
close (XMLdummy);

my $txt = "$XMLdummy".">\n";
open (TEXTE, ">punr_textecomplet.xml");#pour le texte complet
binmode(TEXTE, ":utf8");
my $file=1;



#OUVERTURE DE PLUSIEURS FICHIERS
for ($file=1; $file<14; $file=$file+1){
	if($file<10){$file="0$file";}
	open(CORPUS, "html_originaux/chap0".$file.".html");
	binmode(CORPUS, ":utf8");
	while(my $line=<CORPUS>){
		chop $line;

		$line=~s/<\?xml.*<body class=\"pagechap\" id=\"(page\d+)\"><div>/<!--DÉBUT CHAPITRE-->\n<section type=\"pagechap\" xml:id=\"$1\">/g;
		if($file=="03"){
			# débug fin de la dernière sous-section "notions périmés"
		$line=~s/<\/body><\/html/<\/section><\/section><!--FIN CHAPITRE-->/g;
		}
		if($file=="11"){
			# débug fin de la dernière sous-section "homme nouveau"
		$line=~s/<\/body><\/html/<\/section><\/section><!--FIN CHAPITRE-->/g;

		}
		$line=~s/<\/body><\/html/<\/section><!--FIN CHAPITRE-->/g;
		$line=~s/<div class=\"real_spc\" style=\"font-size: (\d\.\dem)\"> <\/div>/\n<!--GAP HERE $1-->\n/g;
		$line=~s/<a id=\"(pg_)(\d+)\" \/>/<pb n=\"$2\"\/>/g;
		$line=~s/<i>/<hi rend=\"italic\">/g;
		$line=~s/<\/i>/<\/hi>/g;
		$line=~s/<p class=\"txt\"><span>/\n<p>/g;
		$line=~s/<h1 class=\"tit_right\">/<head>/g;
		$line=~s/<\/h1>/<\/head>/g;
		$line=~s/<b>/<hi rend=\"bold\">/g;
		$line=~s/<\/b>/<\/hi>/g;
		$line=~s/<p class=\"txt_right\"><span>/\n<p rend=\"txt_right\">/g;
		# $line=~s/<\/p><\/blockquote>/<\/ref>\n<\/cit>/g;
		$line=~s/<p class=\"txt_center cit_ref cit_aut\"><span>(.*)\n?<\/span>\n?<\/p>\n?<\/blockquote>/\n<ref>$1<\/ref>\n<\/quote>/g;
		$line=~s/<\/span><\/p>/<\/p>/g;
		$line=~s/<\/div>//g;
		$line=~s/<div class=\"tit_part_l0 tit_right\">/<!--début bloc titre-->/g;
		$line=~s/<small>/<hi rend=\"small_caps\">/g;
		$line=~s/<\/small>/<\/hi>/g;
		$line=~s/<sup>/<hi rend=\"exposant\">/g;
		$line=~s/<\/sup>/<\/hi>/g;
		$line=~s/<h2 class=\"tit_right\"><span>/<head type=\"subsection_head\">/g;
		$line=~s/<\/span><\/h2>/<\/head>/g;
		$line=~s/<blockquote class=\"epigraphe\">/\n<quote type="epigraph">\n/g;
		$line=~s/B<hi rend="small_caps">ARTHES<\/hi>/<hi rend="small_caps">Barthes<\/hi>/g;
		$line=~s/<div class=\"tit_chap_l0 tit_right\">/<!--début bloc titre anthologie-->/;
		$line=~s/<h2 class=\"tit_right\">/<head type=\"subsection_head\">/g;
		$line=~s/<\/h2>/<\/head>/g;
		# ajout de sous-section "notions périmés", traitement unique de la première pour ne pas refermer un <div> en trop
		$line=~s/<div (id=\"tit8)\" class=\"tit_sect_l0 tit_right\">/<!--début bloc titre sous-section : $1--><div type=\"subsection\" xml:$1\">/g;
		$line=~s/<div (id=\"tit\d+)\" class=\"tit_sect_l0 tit_right\">/<\/div><!--début bloc titre sous-section : $1--><div type=\"subsection\" xml:$1\">/g;
		$line=~s/<section /<div /g;
		$line=~s/<\/section>/<\/div>/g;
		# suppression caractère vide dû à l'ouverture des fichiers via perl ?
		$line=~s/﻿//g;
		# $line=~s///g;
		# $line=~s///g;
		# $line=~s///g;
		$line=~s/« /<quote>« /g;
		$line=~s/ »/ »<\/quote>/g;
		# et les citations de bousquet (file==08) sur plusieurs paragraphes entraînent encodage non valide Devra être régler par autre script ou tester sans arrêt les sauts de ligne dans cette partie ci
		#méthode bourrine mais suffisante : 
		$line=~s/<hi rend=\"bold\">(.*)<\/hi>/$1/g;
		$line=~s/<head><hi rend=\"bold\"><pb n=\"154\"\/>Temps et description dans le récit/<head><pb n=\"154\"\/>Temps et description dans le récit/;
		$line=~s/d’aujourd’hui<\/hi><\/head>/d’aujourd’hui<\/head>/;



		if($file=="11"){
			# $line=~s/<p class=\"txt_right\"><hi rend=\"italic\">Le seul engagement possible, pour l’écrivain, c’est la/<div type=\"subsection\">\n<head type=\"subsection_head\"><hi rend=\"italic\">Le seul engagement possible, pour l’écrivain, c’est la/g;
			$line=~s/<p class=\"txt_right\"><hi rend=\"italic\">Le Nouveau Roman n’est pas une théorie,/<div type=\"subsection\">\n<head type=\"subsection_head\"><hi rend=\"italic\">Le Nouveau Roman n’est pas une théorie,/g;
			$line=~s/<p class=\"txt_right\"><hi/<\/div><div type=\"subsection\">\n<head type=\"subsection_head\"><hi/g;
			$line=~s/(Le Nouveau Roman ne vise qu’à une subjectivité totale\.)<\/hi><\/p>/$1<\/hi><\/head>/;
			$line=~s/(situation dans le monde\.)<\/hi><\/p>/$1<\/hi><\/head>/;
			$line=~s/(évolution constante du genre romanesque\.)<\/hi><\/p>/$1<\/hi><\/head>/;
			$line=~s/(c’est une recherche\.)<\/hi><\/p>/$1<\/hi><\/head>/;
			$line=~s/(littérature\.)<\/hi><\/p>/$1<\/hi><\/head>/;
			$line=~s/(bonne foi\.)<\/hi><\/p>/$1<\/hi><\/head>/;
			$line=~s/(toute faite\.)<\/hi><\/p>/$1<\/hi><\/head>/;
			# $line=~s/(\.)<\/p>/$1<\/head>/;
			# $line=~s/(\.)<\/p>/$1<\/head>/;

		}
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
# quote @corresp="toDefine" @cert="mReferenceStatus" @ana="mAxiologicStatus" @type="ttNature"
	#si @type="citation" @corresp, sinon pas de @corresp

# ref @type="ttNature" @cRef="nom_prenom"	
	#dans l'XSL fouttre un lower-case(@cRef)

# CORRIGER ENSUITE @cRef AVEC XSL LOWER-CASE ET TRANSLATE(SANS ACCENTS)
	# + corriger les id avec chercher/remplacer : idToDefine\d

	$line=~s/(Samuel) (Beckett)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;
	$line=~s/ (Beckett)/ <ref type=\"author\" cRef=\"$1_samuel\">$1<\/ref>/g;
	# $line=~s/(Roussel)/ $1/g;
	$line=~s/(Raymond) (Roussel)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;
	$line=~s/ (Roussel)/ <ref type=\"author\" cRef=\"$1_raymond\">$1<\/ref>/g;
	$line=~s/(Jean-Paul) (Sartre)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;
	$line=~s/ (Sartre)/ <ref type=\"author\" cRef=\"$1_jean-paul\">$1<\/ref>/g;
	$line=~s/(Robert) (Pinget)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;
	$line=~s/ (Pinget)/ <ref type=\"author\" cRef=\"$1_robert\">$1<\/ref>/g;
	$line=~s/(Marguerite) (Duras)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;
	$line=~s/ (Duras)/<ref type=\"author\" cRef=\"$1_marguerite\">$1<\/ref>/g;
	$line=~s/(William) (Faulkner)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;
	$line=~s/ (Faulkner)/ <ref type=\"author\" cRef=\"$1_william\">$1<\/ref>/g;
	# $line=~s/(Franz) (Kafka)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;
	$line=~s/(Kafka)/<ref type=\"author\" cRef=\"$1_franz\">$1<\/ref>/g;
	# $line=~s/(Gustave) (Flaubert)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;
	$line=~s/(Flaubert)/<ref type=\"author\" cRef=\"$1_gustave\">$1<\/ref>/g;
	$line=~s/(Marcel) (Proust)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;
	$line=~s/ (Proust)/ <ref type=\"author\" cRef=\"$1_marcel\">$1<\/ref>/g;
	$line=~s/(Proust) /<ref type=\"author\" cRef=\"$1_marcel\">$1<\/ref> /g;
	# $line=~s/(Gustave) (Flaubert)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	# $line=~s/ (Flaubert)/ <ref type=\"author\" cRef=\"$1_gustave\">$1<\/ref>/g;
	$line=~s/ (Stendhal)/ <ref type=\"author\" cRef=\"$1\">$1<\/ref>/g;
	$line=~s/ (Schönberg)/ <ref type=\"author\" cRef=\"$1_arnold\">$1<\/ref>/g;
	$line=~s/(Henri) (Clouard)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/ (Clouard)/ <ref type=\"author\" cRef=\"$1_henri\">$1<\/ref>/g;
	$line=~s/ (Dostoïevski)/ <ref type=\"author\" cRef=\"$1_fedor\">$1<\/ref>/g;
	$line=~s/ (Dostoïevsky)/ <ref type=\"author\" cRef=\"dostoïevski_fedor\">$1<\/ref>/g;
	$line=~s/(Nathalie) (Sarraute)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/ (Sarraute)/ <ref type=\"author\" cRef=\"$1_nathalie\">$1<\/ref>/g;
	$line=~s/(Balzac)/<ref type=\"author\" cRef=\"$1_honore\">$1<\/ref>/g;
	$line=~s/(Albert) (Camus)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/ (Camus)/ <ref type=\"author\" cRef=\"$1_albert\">$1<\/ref>/g;
	$line=~s/(Ilya) (Ehrenburg)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	# $line=~s/ (Ehrenburg)/ <ref type=\"author\" cRef=\"$1_ilya\">$1<\/ref>/g;
	$line=~s/(François) (Mauriac)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/ (Mauriac)/ <ref type=\"author\" cRef=\"$1_françois\">$1<\/ref>/g;
	$line=~s/(André) (Rousseaux)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	# $line=~s/(Gustave) (Flaubert)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	# $line=~s/ (Flaubert)/ <ref type=\"author\" cRef=\"$1_gustave\">$1<\/ref>/g;
	$line=~s/(James) (Joyce)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/ (Joyce)/ <ref type=\"author\" cRef=\"$1_james\">$1<\/ref>/g;
	$line=~s/(Jean) (Paulhan)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/ (Paulhan)/ <ref type=\"author\" cRef=\"$1_jean\">$1<\/ref>/g;
	$line=~s/(Francis) (Ponge)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/ (Ponge)/ <ref type=\"author\" cRef=\"$1_francis\">$1<\/ref>/g;
	$line=~s/ (Unamuno)/ <ref type=\"author\" cRef=\"de_$1_miguel\">$1<\/ref>/g;
	$line=~s/(Italo) (Svevo)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/ (Svevo)/ <ref type=\"author\" cRef=\"$1_italo\">$1<\/ref>/g;
	# $line=~s/(Gustave) (Flaubert)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	# $line=~s/ (Flaubert)/ <ref type=\"author\" cRef=\"$1_gustave\">$1<\/ref>/g;
	$line=~s/(André) (Breton)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/ (Breton)/ <ref type=\"author\" cRef=\"$1_andré\">$1<\/ref>/g;
	$line=~s/(Paul) (Claudel)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/(Claudel)/<ref type=\"author\" cRef=\"$1_paul\">$1<\/ref>/g;
	$line=~s/(Émile) (Zola)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/(Raymond) (Queneau)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/ (Queneau)/ <ref type=\"author\" cRef=\"$1_raymond\">$1<\/ref>/g;
	$line=~s/(Charles) (X)/<ref type=\"author\" cRef=\"$1_$2\">$1 $2<\/ref>/g;	
	$line=~s/(Cervantès)/<ref type=\"author\" cRef=\"$1\">$1<\/ref>/g;
	$line=~s/(Beethoven)/<ref type=\"author\" cRef=\"$1_ludwig\">$1<\/ref>/g;
	$line=~s/(Delacroix)/<ref type=\"author\" cRef=\"$1_eugene\">$1<\/ref>/g;
	$line=~s/(J\.-L\.) (Borgès)/ <ref type=\"author\" cRef=\"$2_jorge_luis\">$1 $2<\/ref>/g;
	$line=~s/(Académie)/ <ref type=\"collective_entity\" cRef=\"$1_française\">$1<\/ref>/g;
	$line=~s/(Lukacs)/<ref type=\"author\" cRef=\"$1_georg\">$1<\/ref>/g;
	$line=~s/(Jdanov)/ <ref type=\"ToDefine\" cRef=\"$1\">$1<\/ref>/g;
	$line=~s/(Gide)/<ref type=\"author\" cRef=\"$1_andre\">$1<\/ref>/g;
	$line=~s/(Staline)/<ref type=\"ToDefine\" cRef=\"$1_joseph\">$1<\/ref>/g;
	$line=~s/(Pascal)/<ref type=\"author\" cRef=\"$1\">$1<\/ref>/g;
	$line=~s/(Sade)/<ref type=\"author\" cRef=\"$1_marquis\">$1<\/ref>/g;
	$line=~s/(Lewis) (Carroll)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/(Claude) (Simon)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/ (Simon)/ <ref type=\"author\" cRef=\"$1_claude\">$1<\/ref>/g;
	$line=~s/(Alfred) (Jarry)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/ (Jarry)/ <ref type=\"author\" cRef=\"$1_alfred\">$1<\/ref>/g;
	$line=~s/(Alain) (Resnais)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/ (Resnais)/ <ref type=\"author\" cRef=\"$1_alain\">$1<\/ref>/g;
	$line=~s/(Descartes)/<ref type=\"author\" cRef=\"$1\">$1<\/ref>/g;
	$line=~s/(Joë) (Bousquet)/<ref type=\"author\" cRef=\"$2_$1\">$1 $2<\/ref>/g;	
	$line=~s/ (Bousquet)/ <ref type=\"author\" cRef=\"$1_joe\">$1<\/ref>/g;
	$line=~s/(Heidegger)/ <ref type=\"author\" cRef=\"$1_martin\">$1<\/ref>/g;

# madame de La Fayette
	$line=~s/(madame) (de) (La) (Fayette)/<ref type=\"author\" cRef=\"$3_$4_$1_$2\">$1 $2 $3 $4<\/ref>/g;	


	$line=~s/(Hamm)/<quote>$1<\/quote>/g;
	$line=~s/(Clov)/<quote>$1<\/quote>/g;
	$line=~s/(Murphy)/<quote>$1<\/quote>/g;
	$line=~s/(Gogo)/<quote>$1<\/quote>/g;
	$line=~s/(Pozzo)/<quote>$1<\/quote>/g;
	$line=~s/(Lucky)/<quote>$1<\/quote>/g;
	$line=~s/(Didi)/<quote>$1<\/quote>/g;
	$line=~s/(Molloy)/<quote>$1<\/quote>/g;
	$line=~s/(Malone)/<quote>$1<\/quote>/g;
	$line=~s/(Mahood)/<quote>$1<\/quote>/g;
	$line=~s/(Worm)/<quote>$1<\/quote>/g;
	# $line=~s/()/<quote>$1<\/quote>/g;
	# $line=~s/()/<quote>$1<\/quote>/g;


#Balisage de Nature en tant que concept ici, pour éviter de l'oublier (ne sera pas affiché par script data.pl)
	$line=~s/(Nature)/<ref type="concept" cRef="philo_$1">$1<\/ref>/g;
	#prefixée philo par sécurité
#corrections diverses :
	$line=~s/(<hi rend=\"small_caps\">)(XX)(<\/hi>)/$1xx$3/g;
	$line=~s/(<hi rend=\"small_caps\">)(XIX)(<\/hi>)/$1xix$3/g;



# id des références à établir, si citation = incluse ou non

	# $line=~s/ (Rousseaux)/ <ref type=\"author\" cRef=\"$1_andré\">$1<\/ref>/g;


	
	#balisages des deux <refs> des épigraphes
	$line=~s/<ref>Roland <hi rend=\"small_caps\">Barthes<\/hi>\.<\/ref>/<ref type=\"author\" cRef=\"barthes_roland\">Roland <hi rend=\"small_caps\">Barthes<\/hi>\.<\/ref>/;
	$line=~s/<ref>J\. B\.<\/ref>/<ref type=\"author\" cRef=\"bousquet_joe\">J. B.<\/ref>/;

#ref type="article"/œuvre

		
		$txt = $txt.$line."\n";#récupération texte complet, stockage dans une variable
	}
	close (CORPUS);
}
print TEXTE "$txt\n<\/body>\n<\/text>\n<\/TEI>\n<\/teiCorpus>";
close (TEXTE);