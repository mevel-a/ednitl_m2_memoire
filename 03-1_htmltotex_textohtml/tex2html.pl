#Adrien Mével, M2 EdNitl à l'université de Lille, réalisé le 31/08/2023 pour projet de recherche sur Pour un novueau roman encadré par Mme de Cahlonge et M. Marchal
use strict;
use warnings;
use utf8;
use open ':std', ':locale'; #debug UTF8 voir bookmark firefox
use open ':encoding(UTF-8)'; #debug UTF8 voir bookmark firefox

#création variables et ouvertures de fichier pour écriture
open (TEX,"../03-1_htmltotex_textohtml/input.tex");
binmode(TEX, ":utf8");

open (HTML, ">../03-1_htmltotex_textohtml/output.html");#pour le texte complet
binmode(HTML, ":utf8");

my $txt="";
#Lecture du tex et conversion vers html de quelques éléments clefs
while (my $line=<TEX>){
	chop $line;
#chevrons vers entité pour éviter d'être parsés comme html
	#need to be first pour éviter les bugs
	$line=~s/</&lt;/g;
	$line=~s/>/&gt;/g;

#commande persos
	$line=~s/\\punr\{?\}?/<span clas="STDitalic">Pour un nouveau roman<\/span> /g,
	$line=~s/\\robbe\{?\}?/Alain Robbe-Grillet /g,
	$line=~s/\\go/« /g;
	$line=~s/\\gf/ »/g;
	$line=~s/\\qql//g;
	$line=~s/\\galia/Galia <span class="STDsc">Yanoshevsky<\/span>/g;
	$line=~s/\\fullgalia/<span class="STDsc">Yanoshevsky<\/span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats<\/span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. /g;
	$line=~s/\\gege/<span class="STDsc">Genette<\/span> Gérard, « Vertige fixé », \\textit\{Figures I\}, Paris, Éditions du seuil, coll.~«~points essai~», 2014[1966], p.~/g;
	$line=~s/\\inte/\\footnote\{\\textsc\{Boschetti\}~Anna, \\textsc\{Sapiro\}~Gisèle (dir.~), «~La recomposition de l'espace intellectuel en Europe après 1945~», Paris, La Découverte, \\textit\{L'Espace intellectuel en Europe\}, 2009, p.~147-182<br \/>En ligne~: \\href\{https:\/\/doi.org\/10.3917\/dec.sapir.2009.01.0147\}\{https:\/\/doi.org\/10.3917\/dec.sapir.2009.01.0147\}\}/g;
	$line=~s/\\riri/\\textsc\{Ricardou\}~Jean, \\textit\{Le Nouveau Roman suivi de Les Raisons de l'ensemble\}, Paris, Éditions du Seuil, coll.~«~Points~», 1990 [1973]/g;
	$line=~s/\\mila/\\textsc\{Milat\}~Christian, «~Sartre et Robbe-Grillet, ou les chemins de l'écriture~», Paris, \\textit\{Revue d'Histoire littéraire de la France\}, Janvier-Février, 2002, p.~/g;

#mise en forme courant selon punr.css
	$line=~s/\\textit\{/<span clas="STDitalic">/g;
	$line=~s/\\textsc\{/<span clas="STDsc">/g;
	$line=~s/\\superscript\{/<span clas="STDexposant">/g;
	$line=~s/\\begin\{itemize\}/<ul>/g;
	$line=~s/\\end\{itemize\}/<\/ul>/g;
	$line=~s/\\begin\{enumerate\}/<ol>/g;
	$line=~s/\\end\{enumerate\}/<\/ol>/g;
	$line=~s/\\item/<li>/g;
	$line=~s/\\NoAutoSpaceBeforeFDP//g;
	$line=~s/\\begin\{verbatim\}/<span class="STDgray" style="font-family:courier,monospace;">/g;
	$line=~s/\\end\{verbatim\}/<\/span>/g;
	$line=~s/\\vspace\*\{3cm\}/<div class="separ"\/>/g;
	$line=~s/\\newpage/<!--SAUT DE PAGE-->/g;
#citations longues
	$line=~s/\\begin\{quote\}/<p class="STDquote">/g;
	$line=~s/\\end\{quote\}/<\/p>/g;
#Saut de ligne = much much XPerimental
#	$line=~s/\n\n/<br \/>/g;
#insécable
	$line=~s/~/ /g;
#image
	$line=~s/\\begin\{figure\}[H]/<div class="STDimg">/g;
	$line=~s/\\centering//g;
	$line=~s/\\includegraphics[scale=0.3]\{img\/(\w+)\}/<img src="img\/$1"\/>/g;
	$line=~s/\\caption\{(\w+)\}/<p class="STDimgCaption">$1<\/p>/g;
	$line=~s/\\end\{figure\}//g;
	# $line=~s/\//g;
	# $line=~s///g;

#footnotes-->infobullle
	$line=~s/\s(.+)\\footnoteB?\{(.*)\}/ <span class="STDnote">$1<span class="STDnoteinfo">$2<\/span><\/span>/g;
	$line=~s/\s(.+)\\footnote\{(.*)\}/ <span class="STDnote">$1<span class="STDnoteinfo">$2<\/span><\/span>/g;


#titraille
	$line=~s/\\section\{(.+)\}/<h2>$1<\/h2>/g;
	$line=~s/\\subsection\{(.+)\}/<h3>$1<\/h3>/g;
	$line=~s/\\subsubsection\{(.+)\}/<h4>$1<\/h4>/g;
	$line=~s/\\addcontentsline\{toc\}\{section\}\{(.+)\}/<h2>$1<\/h2>/g;
	$line=~s/\\addcontentsline\{toc\}\{subsection\}\{(.+)\}/<h3>$1<\/h3>/g;
	$line=~s/\\addcontentsline\{toc\}\{subsubsection\}\{(.+)\}/<h4>$1<\/h4>/g;



#ancres et liens
	$line=~s/\\ref\{(.+)\}/<a href="#$1">ici<\/a>/g;
	$line=~s/\\label\{(.+)\}/<a id="$1"\/>/g;
	$line=~s/\\href\{(.+)\}\{.+\}/<a href="$1">$1<\/a>/g;
	$line=~s/\\hyperlink\{(.+)\}\{.+\}/<a href="$1">$1<\/a>/g;




#need to rester à la fin pour compléter et non effacer les remplacements précédents
	$line=~s/\}/<\/span>/g;
	#sert à refermer tous les spans qui sont ouvert mais pas refermés


#récupération texte complet, stockage dans une variable	
	$txt = $txt.$line."\n";
}

close (TEX);
print HTML "$txt\n";
close (HTML);