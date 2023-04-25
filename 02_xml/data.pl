#Adrien Mével, M2 EdNitl à l'université de Lille, réalisé le 25/04/2023 pour projet de recherche sur Pour un novueau roman encadré par Mme de Cahlonge et M. Marchal

use strict;
use warnings;
use utf8;
use open ':std', ':locale'; #debug UTF8 voir bookmark firefox
use open ':encoding(UTF-8)'; #debug UTF8 voir bookmark firefox

#création variables et ouvertures de fichier pour écriture
open (XMLdummy,">../02_xml/data_name.txt");
binmode(XMLdummy, "utf8");
open (XML, "../02_xml/punr_textecomplet.xml");
binmode(XML, "utf8");

# à raffiner pour finaliser encodage des œuvres citées etc.
# découpage par mot pour pas choper qu'un seul par ligne + de stopwords ?
my @stopword = ('Ma','Et','Selon','Mais','Il','Elle','Je','Nous','Ref','Tout','Depuis','Enfin','Plus','Aussi','Ce','Cette','Ce','Dieu','La','Le','GAP','DÉBUT','FIN','De','Dans','Ainsi','Plus','Dire','Quant','Quand','TEI','Desc','Header','UTF','Pour','Stmt','Ils','Les','Cependant','Pourquoi','Comment','Alors','Puisqu','En','On','Bien','Une','Un','Pourtant','Tandis');


while (my $line=<XML>){
	chop $line;
	if ($line=~/([A-Z]\w+)/g){
			if ($1 ~~ @stopword){}

		# foreach my $stopword (@stopword){
			# if($1 eq $stopword){}
			else{print XMLdummy "$1\n";}
		# }
	}
}
close (XML);


close (XMLdummy);