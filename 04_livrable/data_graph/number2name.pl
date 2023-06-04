#Adrien Mével, M2 EdNitl à l'université de Lille, réalisé le 28/03/2023 pour projet de recherche sur Pour un novueau roman encadré par Mme de Cahlonge et M. Marchal

use strict;
use warnings;
use utf8;
use open ':std', ':locale'; #debug UTF8 voir bookmark firefox
use open ':encoding(UTF-8)'; #debug UTF8 voir bookmark firefox

open (TXTout,">data_rectif.txt");
binmode(TXTout, ":utf8");
open (TXTin,"data.txt");
binmode(TXTin, ":utf8");
my $txt='';
while (my $line=<TXTin>){
	chop $line;
	$line=~s/10/Un roman qui s'invente lui-même/g;
	$line=~s/11/Nouveau roman, homme nouveau/g;
	$line=~s/12/Temps et descriptions dans le récit d'aujourd'hui/g;
	$line=~s/13/Du réalisme à la réalité/g;
	$line=~s/1/À quoi servent les théories/g;
	$line=~s/2/Une voie pour le roman futur/g;
	$line=~s/3/Sur quelques notions périmées/g;
	$line=~s/4/Nature, humanisme, tragédie/g;
	$line=~s/5/Éléments d'une anthologie moderne/g;
	$line=~s/6/Énigmes et transparence chez Raymond Roussel/g;
	$line=~s/7/La conscience malade de Zeno/g;
	$line=~s/8/Joë Bousquet le rêveur/g;
	$line=~s/9/Samuel Beckett, ou la présence sur la scène/g;
	$txt=$txt.$line."\n";

}
print TXTout $txt;
close (TXTin);
close (TXTout);





