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
my $txt="";

my @correction=('Node Type','œuvre','œuvre','œuvre','œuvre','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','auteur','concept','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','œuvre','concept','concept','concept','concept','concept','concept','concept','concept','articles','articles','articles','articles','articles','articles','œuvre','courant artistique','auteur','entité collective','entité collective','entité collective','entité collective','entité collective','œuvre','genre','concept','concept','concept','concept','concept','concept','concept','concept','concept','concept','courant artistique','concept','concept','courant littéraire','articles','articles','courant artistique','courant artistique','entité collective','entité collective','entité collective','entité collective','articles','concept','entité collective','concept','entité collective','entité collective','institution','institution');
# name = case 0 du tableau
while (my $line=<TXTin>){
	chop $line;
	$line=~s/(\d+)/$correction[$1]/g;
		$txt=$txt.$line."\n";

}
print TXTout $txt;
close (TXTin);
close (TXTout);