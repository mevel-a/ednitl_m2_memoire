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
		$line=~s/<\?xml.*<body class=\"pagechap\" id=\"(page\d+)\">/\n<!--DÉBUT CHAPITRE-->\n<section class=\"pagechap\" id=\"$1\">/;
		$line=~s/<\/body><\/html/<\/section>\n<!--FIN CHAPITRE-->\n/;
		$txt = $txt.$line."\n";#récupération texte complet, stockage dans une variable
	}
	close (CORPUS);
}
print TEXTE "$txt<\/tei>";
close (TEXTE);