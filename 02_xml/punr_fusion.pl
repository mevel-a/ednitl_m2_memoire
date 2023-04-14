#Adrien Mével, M2 EdNitl à l'université de Lille, réalisé le 28/03/2023 pour projet de recherche sur Pour un novueau roman encadré par Mme de Cahlonge et M. Marchal

use strict;
use warnings;
use utf8;
use open ':std', ':locale'; #debug UTF8 voir bookmark firefox
use open ':encoding(UTF-8)'; #debug UTF8 voir bookmark firefox

#création variables et ouvertures de fichier pour écriture
my $txt = '<tei>';
open (TEXTE, ">html_originaux/punr_textecomplet.xml");#pour le texte complet
binmode(TEXTE, ":utf8");
my $file=1;

#OUVERTURE DE PLUSIEURS FICHIERS
for ($file=1; $file<14; $file=$file+1){
	if($file<10){$file="0$file";}
	open(CORPUS, "html_originaux/chap0".$file.".html");
	binmode(CORPUS, ":utf8");
	while(my $line=<CORPUS>){
		chop $line;

		$line=~s/<\?xml.*<body class=\"pagechap\" id=\"(page\d+)\"><div>/\n<!--DÉBUT CHAPITRE-->\n<section class=\"pagechap\" id=\"$1\">/g;
		$line=~s/<\/body><\/html/<\/section>\n<!--FIN CHAPITRE-->\n/g;
		$line=~s/<div class=\"real_spc\" style=\"font-size: (\d\.\dem)\"> <\/div>/\n<!--GAP HERE $1-->\n/g;
		$line=~s/<a id=\"(pg_)(\d+)\" \/>/<pb n=\"$2\"\/>/g;
		$line=~s/<i>/<hi rend=\"italic\">/g;
		$line=~s/<\/i>/<\/hi>/g;
		$line=~s/<p class=\"txt\"><span>/\n<p>/g;
		$line=~s/<h1 class=\"tit_right\">/<title>/g;
		$line=~s/<\/h1>/<\/title>/g;
		$line=~s/<b>/<hi rend=\"bold\">/g;
		$line=~s/<\/b>/<\/hi>/g;
		$line=~s/<p class=\"txt_right\"><span>/\n<p rend=\"txt_right\">/g;
		# $line=~s/<\/p><\/blockquote>/<\/ref>\n<\/cit>/g;
		$line=~s/<p class=\"txt_center cit_ref cit_aut\"><span>(.*)\n?<\/span>\n?<\/p>\n?<\/blockquote>/\n<ref>$1<\/ref>\n<\/cit>/g;
		$line=~s/<\/span><\/p>/<\/p>\n/g;
		$line=~s/<\/div>//g;
		$line=~s/<div class=\"tit_part_l0 tit_right\">/<!--début bloc titre-->/g;
		$line=~s/<small>/<hi rend=\"small_caps\">/g;
		$line=~s/<\/small>/<\/hi>/g;
		$line=~s/<sup>/<hi rend=\"exposant\">/g;
		$line=~s/<\/sup>/<\/hi>/g;
		$line=~s/<h2 class=\"tit_right\"><span>/<title type=\"subsection_title\">/g;
		$line=~s/<\/span><\/h2>/<\/title>/g;
		$line=~s/<blockquote class=\"epigraphe\">/\n<cit type="epigraph">\n/g;
		$line=~s/B<hi rend="small_caps">ARTHES<\/hi>/<hi rend="small_caps">Barthes<\/hi>/g;
		$line=~s/<div class=\"tit_chap_l0 tit_right\">/<!--début bloc titre anthologie-->/;
		$line=~s/<h2 class=\"tit_right\">/<title type=\"subsection_title\">/g;
		$line=~s/<\/h2>/<\/title>/g;
		$line=~s/<div (id=\"tit\d+)\" class=\"tit_sect_l0 tit_right\">/<!--début bloc titre sous-section : $1-->/g;
		# $line=~s///g;
		# $line=~s///g;
		# $line=~s///g;
		# $line=~s///g;
		# $line=~s///g;
		# $line=~s///g;
		$line=~s/« /<quote>« /g;
		$line=~s/ »/ »<\/quote>/g;
		# et les citations de bousquet (file==08) sur plusieurs paragraphes entraînent encodage non valide Devra être régler par autre script ou tester sans arrêt les sauts de ligne dans cette partie ci
		
		# Roussel, Beckett etc tous les auteurs et autres peuvent être encodé auto
		#<element type="ttNature" key="" 
		#si @type=citation xml:id="generate-id()"
			#la diff entre citation et mention se fait au niveau de l'élément ?
		#si @type!=produire affichage xml:id="@key"
		# à caser : mAxiologicStatus,mReferenceStatus
		$txt = $txt.$line."\n";#récupération texte complet, stockage dans une variable
	}
	close (CORPUS);
}
print TEXTE "$txt<\/tei>";
close (TEXTE);