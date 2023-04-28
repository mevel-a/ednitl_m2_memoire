#Adrien Mével, M2 EdNitl à l'université de Lille, réalisé le 25/04/2023 pour projet de recherche sur Pour un novueau roman encadré par Mme de Cahlonge et M. Marchal

use strict;
use warnings;
use utf8;
use open ':std', ':locale'; #debug UTF8 voir bookmark firefox
use open ':encoding(UTF-8)'; #debug UTF8 voir bookmark firefox

#création variables et ouvertures de fichier pour écriture
open (XMLdummy,">../02_xml/data_name.txt");
binmode(XMLdummy, "utf8");
open (XML, "../02_xml/punr_text_complet_autobalise.xml");
binmode(XML, "utf8");

# à raffiner pour finaliser encodage des œuvres citées etc.
# découpage par mot pour pas choper qu'un seul par ligne + de stopwords ?
my @stopword = ('Ma','Nature','AxiologicStatus','Encodage','Lorsqu','Corpus','Et','Selon','Mais','Il','Elle','Je','Nous','Ref','Tout','Depuis','Enfin','Plus','Aussi','Ce','Cette','Ce','Dieu','La','Le','GAP','DÉBUT','FIN','De','Dans','Ainsi','Plus','Dire','Quant','Quand','TEI','Desc','Header','UTF','Pour','Stmt','Ils','Les','Cependant','Pourquoi','Comment','Alors','Puisqu','En','On','Bien','Une','Un','Pourtant','Tandis','ToDefine','Master','Some','Title','Si','Que','Quelle','Quel','Est','Que','Define','Adrien','Mével','Florence','Chalonge','Matthieu','Marchal','Numériques','Imprimées','Textes','Littéraires','Université','Lille','Alain','Robbe','Grillet','Information','Publication','HERE','CHAPITRE','Ici','Non','Ces','Loin','Cela','Toute','Car','Maintenant','Or','Parmi','Parfois','Car','Même','Autour','Désormais','Voilà','Puisque','Son','Car','Aucune','Certes','Au');
my $pb='';

while (my $line=<XML>){
	chop $line;
	if($line=~/<pb n=\"(\d+)\"\/>/){$pb=$1;}
	my @words= split(/\W+/,$line);
	foreach my $word (@words){
		if ($word=~/([A-Z]\w+)/g){
			if ($1 ~~ @stopword){}
			else{print XMLdummy "$1\t\t\t$pb\n";}	
		}
	}
}
close (XML);


close (XMLdummy);