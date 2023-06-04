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

my @correction=('Name','Fictions','La Conscience de Zeno','Michael Kohlhaas','Le Procès','Schönberg Arnold','Clouard Henri','Balzac Honoré','Dostoïevski Fedor','Faulkner William','Kafka Franz','Beckett Samuel','Sartre Jean-Paul','Ehrenburg Ilya','Jdanov Andreï','Barthes Roland','Mauriac François','Rousseaux André','Musset (de) Alphonse','Hugo Victor','Pascal Blaise','Paulhan Jean','Roussel Raymond','Joyce James','Bousquet Joë','Sade (de) Donatien Alphonse François','Proust Marcel','Breton André','Heidegger Martin','Pinget Robert','Robbe-Grillet Alain','Simon Claude','Flaubert Gustave','Claudel Paul','Camus Albert','Zola Émile','caratères','La Nausée','L\'Étranger','Voyage au bout de la nuit','Le Père Goriot','Qu\'est-ce que la littérature','L\'Ère du soupçon','Le Vallon','Situations I','Le Parti pris des choses','Le Sentiment tragique de la vie','Le Chateau des Pyrénées','Locus Solus','Les Frères Karamazov','Moby Dick','Molloy','Le Meneur de lune','Murphy','Malone meurt','L\'Innomable','En attendant Godot','[Oh les beaux jours!]','Mahu ou le matériaux','Le Renard et la Boussole','L’Ingénieux Hidalgo Don Quichotte de la Manche','La Chartreuse de Parme','Le Médecin de campagne','L\'Immortelle','L\'Année dernière à Marienbad','La Jalousie','Le Voyeur','Le Chiendent','Loin de Rueil','Journal','Le Château','école du regard','Roman objectif','le cœur romantique de choses','être là [dasein]','Balzac [selon Barthes]','bon sens','Tragédie','effet de réel','critiques de Les Gommes','critiques de Le Voyeur','éloges dans la presse','éloges dans les revues','réactions aux articles dans l\'express','reproche des révolutionnaires les plus zélés','un de nos plus célèbres dictionnaires encyclopédiques','réalisme socialiste','jeune écrivan d\'aujourd\'hui','la plupart de nos romanciers contemporains','les plus sérieux essayistes','quelques esprits engagés dans des recherches comparables','certains matérialistes','on [les critiques]','dessin satirique russe','roman noir','École de minuit','[antonomase]','littérature de laboratoire','Russie et ses républiques [URSS]','humanisme','valeurs de la chrétienté','fées des contes','la Nature','Œdipe (mythe)','[république moderne]','[romantisme]','[altérité]','objet','surréalisme','réactions à L\'Immortelle','interprétations de L\'Année dernière à Marienbad','classiques','naturalisme','les engagés','la critique soviétique','la critique bourgeoise','la critique académique','critiques de La Jalousie','rationalisme des siècles passés','les prétendus descendants de Kafka','art décadent','extrême droite','extrême gauche','concours Lépine','Académie Française');
# name = case 0 du tableau
while (my $line=<TXTin>){
	chop $line;
	$line=~s/(\d+)/$correction[$1]/g;
		$txt=$txt.$line."\n";

}
print TXTout $txt;
close (TXTin);
close (TXTout);