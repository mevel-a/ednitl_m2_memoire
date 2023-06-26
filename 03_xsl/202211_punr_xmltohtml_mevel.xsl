<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xpath-default-namespace="http://www.tei-c.org/ns/1.0"
	exclude-result-prefixes="xs math xd"
	version="3.0">
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Nov 27, 2022</xd:p>
			<xd:p><xd:b>Author:</xd:b> eXu</xd:p>
			<xd:p>Conçu par Adrien Mével, étudiant en M2 EdNitl à l'Université de Lille dans le cadre d'un travail de recherche (mémoire) sous la direction de Mme Florence de Chalonge pour le versant scientifique et M. Mathieu Marchal pour le versant technique.</xd:p>
			<xd:p>xsl produisant une édition critique et numérique de Pour un nouveau roman d'Alain Robbe-Grillet.</xd:p>
		</xd:desc>
	</xd:doc>
	
	
<!--	initialisation-->
	<xsl:output method="html" indent="1" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01//EN" />
	<xsl:strip-space elements="*"/>
	
	
<!--	Déclaration de variables pour les adresses des pages constituées-->
	<xsl:variable name="basename" select="'../04_livrable/website/punr/'"/>
	<xsl:variable name="home" select="concat($basename,'home.html')"/>
	
	<xsl:variable name="index" select="concat($basename,'index.html')"/>
	<xsl:variable name="index_link" select="'index.html'"/>
	
	<xsl:variable name="bib" select="concat($basename,'bibliography.html')"/>
	<xsl:variable name="bib_link" select="'bibliography.html'"/>
	
	<xsl:variable name="presentation" select="concat($basename,'presentation.html')"/>
	<xsl:variable name="presentation_link" select="'presentation.html'"/>
	
	<xsl:variable name="tl" select="concat($basename,'timeline.html')"/>
	<xsl:variable name="tl_link" select="'timeline.html'"/>
	
	<xsl:variable name="db" select="concat($basename,'database.html')"/>
	<xsl:variable name="db_link" select="'database.html'"/>
	
	<!--	<xsl:variable name=""/>-->
<!--	<xsl:variable name="" select="''"/>-->
	
	
	
<!--	template pour HEAD, métadonnées title et links-->
	<xsl:template name="head">
		<xsl:param name="title"/>
		<head>
			<title><xsl:value-of select="concat('Pour un nouveau roman, ', $title)"/></title>
			<link rel="stylesheet" type="text/css" href="punr_style.css"/>
			<link rel="icon" type="image/jpg" href=""/>
			<script src="script.js"/>
			
			<meta charset="utf-8"/>
			<meta name="author" content="adrien mevel, mathieu marchal, florence de chalonge, alain robbe-grillet"/>
			<meta name="description" content="digital critical edition of pour un nouveau roman by alain robbe-grillet fist published in 1963 this word has been realised as student project"/>
			<meta name="keywords" content="critical, edition, digital, robbe-grillet, litterature, french, 1963, nouveau roman, alain robbe-grillet, pour un nouveau roman, xxe siecle, xx, french theory"/>
		</head>
	</xsl:template>
<!--	template pour NAV-->
	<xsl:template name="nav">
		<nav class="nav_top">
			<ul>
				<li><a href="home.html">Accueil</a></li>
				<li><a href="{$presentation_link}">Présentation de l'œuvre</a></li>
				<li style="width:200px; height:100px; padding-top:9px;flex-shrink: 0;">Corpus
					<ol class="chapter_nav">
						<xsl:for-each select="//TEI[@xml:id='punr']//div[@type='pagechap']">
							<li><a href="{concat('punr_',@xml:id,'.html')}"><!--<xsl:value-of select="descendant::head[1]"/>--><xsl:apply-templates select="head" mode="nav"/></a></li>
							<!--							VA CHOPER DATE en plus à dégager-->
						</xsl:for-each>
					</ol>
				</li>
				<li style="width:200px; height:100px; padding-top:9px;flex-shrink: 0;">Commentaires thématiques
					<ol class="chapter_nav" style="list-style:none;">
						<li><a href="{$db_link}">Illustration de la base de données</a></li>
						<li><a href="{$tl_link}">Chronologie</a></li>
						<li><a href="{$index_link}">Index des notions adverses et des expressions préférées</a></li>
					</ol>
				</li>
				
				<!--<li><a href="{}"></a></li>
				<li><a href="{}"></a></li>
				<li><a href="{}"></a></li>
				<li><a href="{}"></a></li>-->
				
			</ul>
		</nav>
	</xsl:template>
	<xsl:template mode="nav" match="date"/>
	<xsl:template mode="nav" match="head">
		<xsl:apply-templates mode="nav"/>
	</xsl:template>
<!--	tempalte pour FOOTER-->
	<xsl:template name="footer">
		<footer>
			<a href="https://www.univ-lille.fr/" target="blanck"><img src="img/logo_u_lille.png" alt="logo université de lille"/></a>
		</footer>
	</xsl:template>
<!--	template pour HEADER-->
	<xsl:template name="header">
		<header id="top">
			<h1><span class="STD_italic">Pour un nouveau roman</span><br /><span class="h1_subtitle">Édition critque et numérique</span></h1>
			<div class="header_div">
				<xsl:call-template name="nav"/>
				<div class="legals">
	<!--				github need link-->
					<a href="https://github.com/mevel-a/ednitl_m2_memoire" target="blanck" style="grid-column:1;">
						<img src="img/GitHub-Mark-32px.png"/>
					</a>
					<a rel="license" href="http://creativecommons.org/licenses/by/4.0/" target="blanck" style="grid-column:2;"><img alt="Licence Creative Commons" src="https://creativecommons.org/images/chooser/chooser_cc.png"/></a>
					<a rel="license" href="http://creativecommons.org/licenses/by/4.0/" target="blanck" style="grid-column:3;"><img alt="Licence Creative Commons" src="https://creativecommons.org/images/chooser/chooser_by.png"/></a>
					<a href="files/punr.xml" download="" style="grid-column:3; grid-row:2;"><img src="img/logo_xml.png" alt="XML"/></a>
					<button class="darkbutton" onclick="darkmode();" style="grid-column:1; grid-row:2;"><img src="img/sun_icon.png" class="sun"/></button>
				</div>
			</div>
		</header>
		<div class="STDtop"><a href="#top">&lt;</a></div>
	</xsl:template>
	
	<xsl:template name="articlenav">
		<xsl:param name="content"/>
<!--			Quatre valeurs possibles ?
			0 = quedall
			1= h3+h4
			2=h3+h4+a
			3=a-->
		<xsl:choose>
			<xsl:when test="contains($content,'ch')">
				<div class="articlenavs">
					<h5>Au sein de cet article</h5>
					<button class="darkbutton" onclick="displayPb();">Afficher les pages</button>
				<xsl:if test="$content='ch03'or$content='ch11'">
					
						<h6>Sous-sections</h6>
						<ul id="articlenav">
							<!--id inutile conservé pour historique reasons-->
							<xsl:apply-templates mode="article_nav" select="head[not(@type='subsection_head')]"/>
						</ul>
				</xsl:if>
					<!--<h6>Structure argumentative</h6>
			<ol>
				<xsl:apply-templates select="milestone[ancestor::TEI[@xml:id='punr']]"/>
<!-\-				TO BE IMPLEMENTED LATER-\->
			</ol>-->
				</div>
			</xsl:when>
			<!--<xsl:when test="$content='ch03'or'ch11'">
				
			</xsl:when>-->
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
		
	</xsl:template>
	
	<xsl:template mode="article_nav" match="head[ancestor::div[not(@type='subsection')]]">
		<xsl:param name="section" select="ancestor::div[@type='pagechap']/@xml:id"/>
		<xsl:param name="head4nav">
			<xsl:choose>
				<xsl:when test="date">
					<xsl:value-of select="substring-before(.,date)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<li><a href="{concat('#',generate-id())}"><xsl:value-of select="$head4nav"/></a></li>
				<xsl:if test="following::div[@type='subsection']">
					<ol>
						<xsl:apply-templates mode="article_nav" select="following::head[ancestor::div[@type='subsection']][ancestor::div[@xml:id=$section]]"/>
					</ol>
				</xsl:if>
	</xsl:template>
	<xsl:template mode="article_nav" match="head[ancestor::div[@type='subsection']]">
		<li><a href="{concat('#',generate-id())}"><xsl:apply-templates/></a></li>
	</xsl:template>
	<xsl:template mode="article_nav" match="date|pb"/>

	
	<xsl:template name="body">
		<xsl:param name="doc"/><!--le nom du fichier généré-->
		<xsl:param name="content"/>
			
		<!--via des CHOOSES j'appelle le contenu de chacune des pages selon la valeur de cette variable-->
		<xsl:param name="title"/><!--le titre de la page-->
		<xsl:result-document href="{$doc}">
			<html>
				<xsl:call-template name="head">
					<xsl:with-param name="title" select="$title"/><!-- tentative de variable en cascade -->
				</xsl:call-template>
				<body onload="initialise()">
<!--Lance les scripts ENVOYER EN PARAMETRE DES TRUCS ¨POUR G2RER QUELLE VERSION DE LA NAV-->
					
					<xsl:call-template name="header"/>
					<xsl:if test="contains($content,'ch')">
						<div class="ch_nav">
							<xsl:choose>
								<xsl:when test="$content='ch13'">
									<a class="preceding" href="{concat('punr_',preceding::div[1][@type='pagechap']/@xml:id,'.html')}">&lt;</a>
									<!--<div class="following"><a href="{concat('punr_',following::div[1][@type='pagechap']/@xml:id,'.html')}">&gt;</a></div>-->
								</xsl:when>
								<xsl:when test="$content='ch01'">
									<!--<div class="preceding"><a href="{concat('punr_',preceding::div[1][@type='pagechap']/@xml:id,'.html')}">&lt;</a></div>-->
									<a class="following" href="{concat('punr_',following::div[1][@type='pagechap']/@xml:id,'.html')}">&gt;</a>
								</xsl:when>
								<xsl:when test="contains($content,'ch')">
									<a class="preceding" href="{concat('punr_',preceding-sibling::div[@type='pagechap'][1]/@xml:id,'.html')}">&lt;</a>
									<a class="following" href="{concat('punr_',following::div[1][@type='pagechap']/@xml:id,'.html')}">&gt;</a>
								</xsl:when>
							</xsl:choose>
						</div>
					</xsl:if>
<!--					ICI la nav au sein de la page-->
					<!--<nav class="articlenav">
						<ol id="articlenav">
							
						</ol>
					</nav>-->
						<xsl:choose>
							<xsl:when test="contains($content,'ch')">
								<div class="corpus">
									<xsl:call-template name="articlenav"><xsl:with-param name="content" select="$content"/></xsl:call-template>
									<article>
										<details>
											<summary>Introduction</summary>
											<xsl:choose>
												<xsl:when test="$content='ch01'">
													<p>Premier texte du recueil, cet article est identifiée par Galia <span class="STDsc">Yanoshevsky</span> comme une réécriture augmentée des articles « Il écrit comme Stendhal » publié le 25 octobre 1955 dans <span class="STDitalic">L'Express</span> et « La littérature, aujourd'hui - VI » publié dans le numéro 14 de <span class="STDitalic">Tel Quel</span> en 1963. Outre sa fonction de seuil et d'introduction aux écrits théoriques qui suivent ce texte place les jalons de la rhétorique de Robbe-Grillet.</p>
													
													<p>Se plaignant de la récéption de ses œuvres puis des articles publiés dans <span class="STDitalic">L'Express</span> qui sont depuis devenus le présent recueil, Robbe-Grillet se positionne comme tenant du bon sens : il n'est pas un théoricien par vocation mais par réaction. Il ne s'agit pas tant de produire une nouvelle théorie que d'« éclair[er] davantage les éléments qui avaient été les plus négligés par les critiques, ou les plus distordus », combattre les « mythes du XIXe siècle » et de « tente[r] de préciser quelques contours ». Ce faisant Robbe-Grillet se place en moderne (hériter d'une tradition vivante qu'il commence d'esquisser ici) en opposition aux tenants d'une tradition « immobile, figée » voire « nuisible ». Contre les critiques, contre Sartre, Robbe-Grillet défend (non pas « un ») mais l'« exercice problématique de la littérature » qui constitue, avec le rejet d'une écriture traditionaliste décriée comme relevant d'un pastiche éculée et avec la condamnation d'une critique psychologisante, le premier jalon théorique de l'ouvrage et une véritable définition du rôle de la littérature complétée au fil du recueil.</p>
													
													<p>Notons enfin une technique usuelle chez Robbe-Grillet consistant à vider l'argumentation en limitant autant que possible la portée de ces écrits théoriques, si l'on aurait tord de considérer que Robbe-Grillet s'autorise ici à se contredire, il est juste de constater qu'il prend soin de se dégager un espace entre sa pratique littéraire et sa pratique théorique dans lequel le lecteur devrait l'autoriser à rafiner sa pensée, la préciser et sans rien renier du cheminement lui-même, en retrancher quelques passages.</p>
												</xsl:when>
												<xsl:when test="$content='ch02'">
													<p>Initialement publié en 1956 dans le numéros 43 de la<span class="STDitalic"> Nouvelle Revue Française</span> et enrichi des articles « Réalisme et révolution » et « Pour un réalisme de la présence » publié dans <span class="STDitalic">L'Express</span> en janvier 1955 et en janvier 1956 respectivement, cet article constitue sans doute l'une des charges les plus violentes adressés aux contemporains de Robbe-Grillet au sein du recueil.</p>
													<p>Plus encore c'est sans doute dans ce texte que l'on mesure l'habileté (ou la mauvaise foi) de Robbe-Grillet en sa capacité à se mettre à la place de ses adversaires, qui dès lors ne peuvent que sembler des adversaires supposés, imaginaires, les personnages d'un roman.</p>
													<p>L'auteur se montre à leur égard tantôt moqueur « Mais tous avouent, sans voir là rien d'anormal, que leurs préoccupations d'écrivains datent de plusieurs siècles », compréhensif « Comment feraient-elles [les choses] pour changer ? Vers quoi iraient-elles ? » enfin pédagogue « Or le monde n'est ni signifiant ni absurde. Il est, tout simplement. ».</p>
													<!--<p>Cette variété de ton, si elle sert la démonstration, doit aussi être perçue comme les traces de l'assemblage qui produisit l'article en cette forme. [justifier voir GALIA]</p>-->											<p>Au service de la démonstration cette variété de ton est la reprise d'éléments argumentatifs déjà développés semblent des traces de l'assemblage des différents articles de presses.</p>
													<p>Au demeurant, le glissement à un ton plus théorique que polémique sert aussi l'économie globale du recueil. Par son titre et son sujet apparent : l'avenir du roman, cet article semble programmatique. Loin de délivrer des propos abstraits sur l'avenir du roman, ce texte s'avère être un état des lieux de la littérature contemporaine, tenant deux pants de la littérature contemporaine, les héritiers de Balzac, du côté des consommateurs, de ceux qui croit au « cœur » humain éternel et de la littérature telle qu'elle est, en opposition à la littérature telle qu'elle pourrait être, les littérature acceptant le risque de jouïr pleinement de leur liberté d'écrivain pour écrire une littérature plus proche de la réalité.</p>
													<p>Est introduit dans ce chapitre surtout un hiatus entre l'importance de ces deux littératures et leur degré de contemporanéité. Alors que la littérature dominnante repose au mieux sur des idées de plusieurs siècle, au pire proprement délirante (le « coeur romantique des choses ») ; une littérature consciente du temps présent et de sa responsabilité à résister contre « [l']appropriation systématique » a toute les difficultés à exister.</p>
													<p>Si ce texte semble dérouler toutes les raisons psychologiques (chez les lecteurs, les auteurs, les critiques) etc. qui empêche à cette littérature nouvelle de prendre la place qui lui est dûe, c'est bien un paradoxe qu'expose Robbe-Grillet invitant le lecteur à se positionner pour ce langage littérautre qui « déjà change ».</p>
												</xsl:when>
												<xsl:when test="$content='ch03'">
													<p>Issu de cinq publications entre octobre et novembre 1957 dans le magazine <span class="STDitalic">France Observateur</span> (« Écrire pour son temps »,« Il n'y a pas "d'avant-garde" »,« La mort du personnage »,« Un joli talent de conteur »,« La forme et le contenu ») et deux publications dans <span class="STDitalic">L'Express</span> en décembre 1955 et février 1956 « Littérature engagée, littérature réactionnaire »,« Le réalisme socialiste est bourgeois », cet article plus qu'une charge envers la littérature de son temps s'attaque à la conception même que l'on se fait de la littérature s'en prenant aux termes employés pour en parler.</p>
														<p>Commençant par développer le sens de ces termes tels que la critique les emploie, Robbe-Grillet s'ingénie à en démontrer l'inanité en s'appuyant sur des exemples qui constitue en creux une filiation dont le dernier né n'est autre que le Nouveau Roman.</p>
													<p>Si le texte s'emploie à démontrer que ces concepts sont « périmés », ce n'est pas seulement du fait d'un besoin de variété dans la production littéraire mais bien que les temps ont changé. Certaines certitudes se sont évanouies, outre les notions des critiques académiques, c'est peut-être une attitude face au monde teintée de métaphysique, de romantisme ou de positivisme, qui est ici rejettée. Plus qu'une vision nouvelle de ce que sont l'art et les œuvres, « De quelques notions périmées » nous dit : la modernité c'est de ne plus croire. Cette non-croyance, ou plutôt ce soupçon, se pose non seulement sur les théories mais également sur leurs vecteurs : la forme.</p>
												</xsl:when>
												<xsl:when test="$content='ch04'"><p>Initialement publié en octobre 1958 dans le numéro 70 de la <span class="STDitalic">Nouvelle Revue Française</span>, ce passage nous paraît être le plus existentialiste de <span class="STDitalic">Pour un nouveau roman</span>. Si existentialiste que la philosophie de Sartre et l'absurde de Camus semblent des fétiches, du moins des œuvres qui ne prennent pas acte de ce qu'elles énoncent.</p>
													<p>À lire ces pages, il semble que l'existentialisme prenant acte d'un monde dépourvu de sens n'a pas su se défaire de la métaphysique, entraînant un hiatus irrémédiable entre l'homme et le monde, dû à son incapacité à se défaire d'outils qu'il sait défectueux. Ce hiatus, Robbe-Grillet à la suite de Barthes propose de l'appeler « la Tragédie ».</p>
													<p>Lorsque l'on cessera de chercher l'homme partout on pourra peut-être s'intéresser aux phénomènes, nous dit en substance Robbe-Grillet s'attelant à donner au lecteur les clefs de la littérature qu'il est en train de produire, nous sommes presque devant un manuel, du moins des recommandations techniques pour une forme débarassée de la tragédie, aux yeux de Robbe-Grillet, elle aussi périmée.</p></xsl:when>
												<xsl:when test="$content='ch05'">
													<p>Les écrits théorique s'interrompent et s'intercalent un texte inédit ayant vocation de seuil. Aux récriminations contre une littérature périmées, aux recommendations techniques succèdent les cas pratiques : nous sommes invités à lire la modernité à travers les lectures de Robbe-Grillet.</p>
													<p>À la filiation prestigieuse (car constituée de classique relativement éloignés de son époque) se surimpose une filiation à la fois plus contemporaine, esquissant une voie pour la littérature. Si l'on ne pourrait affirmer avec certitude que Robbe-grillet défend l'idée d'un progrès en art, on observe du moins une gradation dans l'ordre de ces chroniques : plutôt que d'être insérées dans leur ordre de publication ces critiques sont organisés de la plus éloignée à la plus proche de la modernité.</p>
													<p>À travers ces critiques, Robbe-Grillet défend deux pendants de la modernité : des techniques ld'écriture, mais aussi une certaine attitude qu'il préconise à l'endroit des œuvres littéraire. Que devrait-on lire ? Comment devrait-on lire ? À ces questions ce court texte propose un début de réponse.</p>
												</xsl:when>
												<xsl:when test="$content='ch06'"><p>Publiée en décembre 1963 dans la revue <span class="STDitalic">Critique</span>, cette analyse du style de Raymond Roussel semble partir du constat que Raymond Roussel écrit « mal » c'est-à-dire qu'il ne répond pas aux habitudes de la réception. En effet, il ne s'agit pas d'une littérature du secret, ni même du dévoilement mais une littérature d'un imaginaire loufoque décrit avec la banalité de ce qui n'est que pour être. En cela ce cas pratique est à la fois une démonstration de la modernité selon Robbe-Grillet mais également de l'incapacité du discours de la critique contemporaine à rendre compte du fait littéraire, même relativement ancien.</p></xsl:when>
												<xsl:when test="$content='ch07'"></xsl:when>
												<xsl:when test="$content='ch08'"></xsl:when>
												<xsl:when test="$content='ch09'"></xsl:when>
												<xsl:when test="$content='ch10'"><p>Dans cet article, initialement paru dans <span class="STDitalic">Critique</span> en janvier 1954, Robbe-Grillet fait la critique de deux romans de Robert Pinget (auteur rattaché au nouveau roamn) <span class="STDitalic">Mahu ou le matériau</span> et <span class="STDitalic">Le Renard et la boussole</span> paru en 1952 et 1953. Robbe-Grillet s'y emploie à résumer l'intrigue autant que faire ce peut (le terme même d'« intrigue » semble ici inaproprié). Ce résumé vaut commentaire tant l'explicitation des détours de ces œuvres ne peut être que le récit d'une écriture.</p>
													<p>Si, comme l'ensemble des critiques au sein de Pour un nouveau roman, le texte semble une digression dans l'économie de la démonstration, cette digression elle-même puisqu'elle est assemblée au recueil vaut d'emblée aux yeux du lecteur illustration des thèses.</p>
													<p>Que nous démontre la lecture de Pinget que nous livre Robbe-Grillet ? Robbe-Grillet ne tire aucune conclusion dans cet article, cependant la relative inanité de l'exercice auquel il se livre ici, dénouer le fil de l'aventure, semble la meilleure incarnation possible des thèses exposées dans « De quelques notions périmées » : son analyse du personnage de Renard, le récit insaisissable se veulent les preuves que le discours habituel de la critique n'a pas prise sur les œuvres du nouveau roman<!-- (et peut-être Robbe-Grillet non plus)-->. Enfin il convient de souligner que l'article souvre sur l'assertion initiale déplorant le fait que les œuvres de Pinget passe inaperçu. Outre le fait que cette affirmation semble corroborer les propos que Robbe-Grillet tient également dans « Une voie pour le roman futur »<!--, il n'est sans doute pas anodin que l'éditeur Robbe-Grillet publie à propos de Pinget publié chez Minuit.-->.</p></xsl:when>
												<xsl:when test="$content='ch11'"></xsl:when>
												<xsl:when test="$content='ch12'"></xsl:when>
												<xsl:when test="$content='ch13'"></xsl:when>
											</xsl:choose>
										</details>
										<div class="smallgap"/>
										<xsl:apply-templates mode="corpus"/>
									</article>
									<section class="extract_section">
										<xsl:apply-templates mode="extract" select="//TEI[not(@xml:id='punr')]//body"/>
									</section>
								</div>
							</xsl:when>
							<xsl:when test="$content='home'">
								<article class="comment">
									<section>
										<p>Ce site est une édition critique et numérique de <span class="STDitalic">Pour un nouveau roman</span> publié en 1963 par Alain Robbe-Grillet réalisée par Adrien Mével étudiant de Master 2 Lettres modernes « Éditions Numériques et Imprimées de Textes Littéraires », année universitaire 2022-2023, dans le cadre d'un travail de recherche encadré par Mme Florence <span class="STDsc">de Chalonge</span> et M. Matthieu <span class="STDsc">Marchal</span>.</p>
										<p>Produite à partir d'un encodage xml-tei, cette édition a l'ambition de replacer l'œuvre dans son contexte et ses cotextes, questionnant l'objet éditorial lui-même (<span class="STDitalic">Pour un nouveau roman</span> est un reccueil d'articles précédemment publié dans divers journaux et revues réunis) et la représentation que cette œuvre véhicule de la tradition littéraire et de son environnement critique et littéraire contemporain.</p>
									</section>
									<section>
										<h3>La version juin 2023 contient :</h3>
										<ul>
											<li>l'ensemble du texte</li>
											<li>l'architecture du site qui sera amené à être enrichi</li>
											<li>la possibilité de faire apparaître ou non les numéros de page au sein du texte (le bouton est sur la gauche)</li>
											<li>les éléments &lt;ref&gt; (soit les références) signalés par une infobulle jusqu'à la section <a href="punr_ch05.html">« Éléments d'une anthologie moderne »</a>.</li>
											<li>les éléments &lt;w&gt; (soit les termes des index thématiques) encodés jusqu'à la section <a href="punr_ch05.html">« Éléments d'une anthologie moderne »</a>.</li>
											<li>les éléments &lt;quote&gt; (soit les citations) repérés sur l'ensemble du recueil et les élémnents &lt;quote&gt; issus des œuvres de Robert Pinget de la section <a href="punr_ch10.html">« Un roman qui s'invente lui-même »</a> en contexte.</li>
											<li>une <a href="{$db_link}">illustration de la base de données</a> proche de sa version définitive.
											<ul><li>La page est un peu longue à charger et nécessite (contrairement aux autres) d'être connecté à internet.</li></ul></li>
											<li>des introductions, qui seront amenées à être complétées, voire remaniées aux articles : 
											<ul>
												<li><a href="punr_ch01.html">« À quoi servent les théories »</a></li>
												<li><a href="punr_ch02.html">« Une voie pour le roman futur »</a></li>
												<li><a href="punr_ch03.html">«Sur quelques notions périmées  »</a></li>
												<li><a href="punr_ch04.html">« Nature, humanisme, tragédie »</a></li>
												<li><a href="punr_ch05.html">« Éléments d’une anthologie moderne »</a></li>
												<li><a href="punr_ch10.html">« Un roman qui s'invente lui-même »</a></li>
											</ul></li>
											<li>une première version des <a href="{$index_link}">index des notions adverses et des expressions préférées</a></li>
											<!--<li></li>
											<li></li>-->
										</ul>
										<h3>Y sera ajouté :</h3>
										<ul>
											<li>les contextes des citations des œuvres de Sartre</li>
											<li>une chronologie et d'autres commentaires thématiques</li>
											<li>l'index des notions, en contexte plutôt que seule</li>
											<li>les éléments &lt;ref&gt; pleinement encodés sur l'ensemble du recueil</li>
											<li>des notes explicatives, en infobulles</li>
											<li>une navigation par "élément rhétorique" au sein des articles</li>
											<li>une bibliographie</li>
										</ul>
									</section>
								</article>
							</xsl:when>
							<xsl:when test="$content='pres'">
<!--								LA PR2SENTATION DE L4OEUVRE-->
							</xsl:when>
							<xsl:when test="$content='db'">
								<iframe width="100%" src="https://graphcommons.com/graphs/2ffc7c8c-3d1b-4814-966b-593b1c206f3c" height="1000px" style="overflow:auto;"></iframe>
							</xsl:when>
							<xsl:when test="$content='tl'">
<!--							TIMELINE GOES HERE-->
							</xsl:when>
							<xsl:when test="$content='index'">
								<article class="index">
									<section class="intro"><p></p></section>
<!--									<div class="separ"/>-->
									<section class="index bad">
										<h2>Index des notions adverses</h2>
										<ul>
											<xsl:apply-templates select="//w[@type='0']" mode="adv_index"/>
										</ul>
									</section>
									<section class="index">
										<h2>Index des expressions préférées</h2>
										<ul>
											<xsl:apply-templates select="//w[@type='1']" mode="pref_index"/>
										</ul>
									</section>
								</article>
							</xsl:when>
						</xsl:choose>
					<xsl:if test="contains($content,'ch')">
						<div class="ch_nav">
							<xsl:choose>
								<xsl:when test="$content='ch13'">
									<a class="preceding" href="{concat('punr_',preceding::div[1][@type='pagechap']/@xml:id,'.html')}">&lt;</a>
									<!--<div class="following"><a href="{concat('punr_',following::div[1][@type='pagechap']/@xml:id,'.html')}">&gt;</a></div>-->
								</xsl:when>
								<xsl:when test="$content='ch01'">
									<!--<div class="preceding"><a href="{concat('punr_',preceding::div[1][@type='pagechap']/@xml:id,'.html')}">&lt;</a></div>-->
									<a class="following" href="{concat('punr_',following::div[1][@type='pagechap']/@xml:id,'.html')}">&gt;</a>
								</xsl:when>
								<xsl:when test="contains($content,'ch')">
									<a class="preceding" href="{concat('punr_',preceding-sibling::div[@type='pagechap'][1]/@xml:id,'.html')}">&lt;</a>
									<a class="following" href="{concat('punr_',following::div[1][@type='pagechap']/@xml:id,'.html')}">&gt;</a>
								</xsl:when>
							</xsl:choose>
						</div>
					</xsl:if>
					<xsl:call-template name="footer"/>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	
	
	
	<!--	début des choses sérieuses : template matchant racine et générant la création des différentes pages selon des patrons enchaînés, du moins c'est l'idée.-->
	
	<xsl:template match="/">
<!--Appel des pages, une par chapitre-->
		<xsl:for-each select="//div[ancestor::TEI/@xml:id='punr'][@type='pagechap']">
			<xsl:call-template name="body">
				<xsl:with-param name="doc" select="concat($basename,'punr_',@xml:id,'.html')"/>
				<xsl:with-param name="title" select="@xml:id"/>
				<xsl:with-param name="content" select="@xml:id"/>
			</xsl:call-template>
		</xsl:for-each>
<!--Appel de HOME-->
		<xsl:call-template name="body">
			<xsl:with-param select="$home" name="doc"/>
			<xsl:with-param name="title" select="'accueil'"/>
			<xsl:with-param name="content" select="'home'"/>
		</xsl:call-template>
		<xsl:call-template name="body">
			<xsl:with-param select="$presentation" name="doc"/>
			<xsl:with-param select="'présentation de lœuvre'" name="title"/>
			<xsl:with-param select="'pres'" name="content"/>
		</xsl:call-template>
		<xsl:call-template name="body">
			<xsl:with-param select="$db" name="doc"/>
			<xsl:with-param name="title" select="'illustration de la base de données'"/>
			<xsl:with-param name="content" select="'db'"/>
		</xsl:call-template>
		<xsl:call-template name="body">
			<xsl:with-param name="doc" select="$tl"/>
			<xsl:with-param name="title" select="'chronologie'"/>
			<xsl:with-param name="content" select="'tl'"/>
		</xsl:call-template>
		<xsl:call-template name="body">
			<xsl:with-param name="doc" select="$index"/>
			<xsl:with-param name="title" select="'index'"/>
			<xsl:with-param name="content" select="'index'"/>
		</xsl:call-template>
		<xsl:call-template name="body">
			<xsl:with-param name="doc" select="$bib"/>
			<xsl:with-param name="title" select="'bibliographie'"/>
			<xsl:with-param name="content" select="'bib'"/>
		</xsl:call-template>
		<xsl:call-template name="body">
			<xsl:with-param name="doc" select="$index"/>
			<xsl:with-param name="title" select="'Index'"/>
			<xsl:with-param name="content" select="'index'"/>
		</xsl:call-template>
		<!--<xsl:call-template name="body">
			<xsl:with-param name="doc" select="$"/>
			<xsl:with-param name="title" select="'index'"/>
			<xsl:with-param name="content" select="'index'"/>
		</xsl:call-template>-->
		
		
<!--		Appel des pages 
			about
			commentaires
			db
			etc-->
	</xsl:template>
	
<!--	Index des notions adverses-->
	<xsl:template match="w[@type='0']" mode="adv_index">
		<xsl:param name="ch" select="ancestor::div[@type='pagechap']/@xml:id"/>
		<xsl:param name="pn" select="preceding::pb[1]/@n"/>
		<li><xsl:apply-templates/><span class="STDgray"> ; [<a target="blanck" href="{concat('punr_',$ch,'.html#page_',$pn)}"><xsl:value-of select="preceding::pb[1]/@n"/></a>]</span></li>
	</xsl:template>
<!--	Index des formulées préférées-->
	<xsl:template match="w[@type='1']" mode="pref_index">
		<xsl:param name="ch" select="ancestor::div[@type='pagechap']/@xml:id"/>
		<xsl:param name="pn" select="preceding::pb[1]/@n"/>
		<li><xsl:apply-templates/><span class="STDgray"> ; [<a target="blanck" href="{concat('punr_',$ch,'.html#page_',$pn)}"><xsl:value-of select="preceding::pb[1]/@n"/></a>]</span></li>
	</xsl:template>
	
	
<!--	MODE CORPUS, gère mise en forme du corpus
	le faire sauter si on peut ?-->
	
	<xsl:template match="hi" mode="corpus">
		<xsl:variable name="class">
			<xsl:if test="@rend='exposant'">STDexposant</xsl:if>
			<xsl:if test="@rend='italic'">STDitalic</xsl:if>
			<xsl:if test="@rend='small_caps'">STDsc</xsl:if>
<!--			<xsl:if test="@rend='italic'">STDitalic</xsl:if>-->
<!--			<xsl:if test="@rend='italic'">STDitalic</xsl:if>-->
		</xsl:variable>
		<span class="{$class}">
			<xsl:apply-templates mode="corpus"/>
		</span>
	</xsl:template>
	<xsl:template match="p" mode="corpus">
		<p>
			<xsl:if test="not(preceding-sibling::p)and(not(ancestor::quote[@type='epigraph']))and(not(ancestor::div[@type='subsection']))"><xsl:attribute name="class">first</xsl:attribute></xsl:if>
			<!--<xsl:if test="ancestor::div[@type='subsection']and()"></xsl:if>-->
			<xsl:apply-templates mode="corpus"/>
		</p>
	</xsl:template>
	<xsl:template match="head" mode="corpus">
		<xsl:choose>
			<xsl:when test="@type='subsection_head'">
				<xsl:choose>
					<xsl:when test="not(ancestor::div[@type='subsection'])">
						<h3 id="{generate-id()}"><xsl:apply-templates mode="corpus"/></h3>
					</xsl:when>
					<xsl:otherwise>
						<h4 id="{generate-id()}"><xsl:apply-templates mode="corpus"/></h4>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<h3 id="{generate-id()}"><xsl:apply-templates mode="corpus"/></h3>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="date[ancestor::head]" mode="corpus">
		<br /><span class="STDsmall">(<xsl:apply-templates/>)</span>
	</xsl:template>
	<xsl:template match="pb[ancestor::TEI[@xml:id='punr']]" mode="corpus">
		<span id="{concat('page_',@n)}" class="STDgray STDsmall pb">[<xsl:value-of select="@n"/>]</span>
	</xsl:template>
	<!--<xsl:template match="pb[ancestor::TEI/not(@xml:id='punr')]">
		<span class="STDsmall STDgray"></span>
	</xsl:template>-->
	<xsl:template match="div[ancestor::TEI/@xml:id='punr'][@type='subsection']" mode="corpus">
		<!--		mode="corpus"-->
		
		<div id="{@xml:id}" type="{@type}">
			<xsl:apply-templates mode="corpus"/>
		</div>
		
<!--		À l'origine de la génération des != pages du site ? -->
<!--		<section> ????-->
	</xsl:template>
<!--	quote, ref
	3 mai 2023,non testé, fout juste de la couleur pour être vu-->
	<xsl:template mode="corpus" match="ref">
		<xsl:param name="type" select="@type"/>
		<xsl:param name="cert">
			<xsl:choose>
				<xsl:when test="@cert='0'">citation explicite</xsl:when>
				<xsl:when test="@cert='1'">mention</xsl:when>
				<xsl:when test="@cert='2'">mention ambiguë</xsl:when>
				<xsl:when test="@cert='3'">emprunt non déclaré fortement suggéré</xsl:when>
				<xsl:when test="@cert='4'">emprunt ou mention non déclaré(e) non suggéré(e) reconstitué(e)</xsl:when>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="ana">
			<xsl:choose>
				<xsl:when test="@ana='0'">blâme</xsl:when>
				<xsl:when test="@ana='1'">indifférent</xsl:when>
				<xsl:when test="@ana='2'">éloge</xsl:when>
				<xsl:when test="@ana='3'">ambiguë</xsl:when>
			</xsl:choose>
		</xsl:param>
		<span class="ref"><xsl:apply-templates/><span class="refinfo"><xsl:value-of select="@type"/>, <span class="Ref{@cert}"><xsl:value-of select="$cert"/></span>, <span class="Axi{@ana}"><xsl:value-of select="$ana"/></span>.</span></span>
	</xsl:template>
	<xsl:template mode="corpus" match="quote"><!--patron gérant les éléments "citation"-->
		<xsl:choose>
			<xsl:when test="@type='epigraph'"><!--s'il s'agit d'un épigraphe, l'xsl insère l'appelle de la fonction javascript avec ses paramètres -->
				<div class="epigraph" onclick="displayExtract('{@corresp}','{@ana}','{@cert}',1);">
						<xsl:apply-templates mode="corpus" select="p"/>
					<p class="epigraph_ref">
						<xsl:apply-templates mode="corpus" select="ref"/>
					</p>
				</div>
			</xsl:when>
			<xsl:when test="contains(@corresp,' ')"><!--si l'attribut corresp contient un espace, c'est-à-dire si la référence renvoie à plusieurs passages-->
				<span class="quote"><!-- l'élément est créé ainsi qu'un premier attribut appelant la fonction avec en paramètre l'identifiant du premier passage concerné -->
					<xsl:attribute name="onclick">displayExtract('<xsl:value-of select="substring-before(@corresp,' ')"/>','<xsl:value-of select="@ana"/>','<xsl:value-of select="@cert"/>',1);<xsl:call-template name="correspAffect"><xsl:with-param select="substring-after(@corresp,' ')" name="corresp"/></xsl:call-template><!--dans la même valeur d'attribut on appelle un autre patron qui gèrera les identifiants aux autres passages (l. 414)--></xsl:attribute>
					<xsl:apply-templates/>
				</span>
			</xsl:when>
			<xsl:otherwise><!--si la référence ne renvoie qu'à un seul passage, version simple :-->
				<span class="quote" onclick="displayExtract('{@corresp}','{@ana}','{@cert}',1);"><xsl:apply-templates/></span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="correspAffect">
		<xsl:param name="corresp"/><!--ce template reçoit en paramètre la fin de l'attribut @corresp pour la traiter. Notons que ce template s'auto-appelle et boucle jusqu'à ce que la condition d'arrêt soit rempli-->
		<xsl:choose>
			<xsl:when test="contains($corresp,' ')"><!--Condition d'arrêt : "s'il y a un espace dans le contenu à traiter"
			génère la suite de l'attribut, soit un appel à la même fonction javascript mais en changeant un paramètre : on récupère le contenu avant l'espace-->
				<xsl:attribute name="onclick">displayExtract('<xsl:value-of select="substring-before($corresp,' ')"/>','<xsl:value-of select="@ana"/>','<xsl:value-of select="@cert"/>',0);<xsl:call-template name="correspAffect"><xsl:with-param select="substring-after($corresp,' ')" name="corresp"/></xsl:call-template><!--appel récursif, avec le contenu après l'espace --></xsl:attribute>
			</xsl:when>
			<xsl:otherwise><!--Dernière itération, lorsqu'il n'y a plus d'espace dans notre paramètre, il n'y a plus qu'un appel à la fonction displayExtract() à produire-->
				<xsl:attribute name="onclick">displayExtract('<xsl:value-of select="$corresp"/>','<xsl:value-of select="@ana"/>','<xsl:value-of select="@cert"/>',0);</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="comment()" mode="corpus">
		<xsl:choose>
			<xsl:when test=".='GAP HERE 0.6em'">
				<!--				ressemble à espace de callage mais bon..-->
				<div class="smallgap"/>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	
	
<!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI-->
	<!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI-->
	<!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI--><!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI--><!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI--><!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI-->
	<!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI--><!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI--><!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI--><!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI-->
	
	<xsl:template match="pb[not(ancestor::TEI[@xml:id='punr'])]">
<!--		ajout numéro de page des citations.-->
		<span class="STDsmall STDgray"><xsl:text>[</xsl:text><xsl:value-of select="@n"/><xsl:text>] </xsl:text></span>
	</xsl:template>
	<xsl:template match="div[not(ancestor::TEI[@xml:id='punr'])]" mode="extract">
		<div id="{@xml:id}" class="extractHide">
			<div class="extract_close" onclick="closeExtract()">X</div>
			<xsl:apply-templates mode="extract"/>
			<p class="editor"><span class="STDitalic"><xsl:value-of select="ancestor::TEI/teiHeader/fileDesc/titleStmt/title[1]"/></span> <xsl:value-of select="preceding::sourceDesc[1]/p"/></p>
		</div>
	</xsl:template>
	<xsl:template match="p[not(ancestor::TEI[@xml:id='punr'])]" mode="extract">
		<p><xsl:if test="@resp='editor'"><xsl:attribute name="class" select="'editor'"/></xsl:if>
			<xsl:apply-templates/></p>
	</xsl:template>
	
<!--	solution posssible pour +ieurs corresp : 
	un template sur l'appel de script, qui va boucler (via foreach ou appel récursif (condition d'arrêt = notcontainswhitespace (attention ressemble à truc qui bugg sur xsl)) sur corresp en divisant avec un substring-befire et substring after qui se retrouve tous dans nouvel appel du script-->
	
	
	
	
	
	
<!--	Les GAP 0.6em sont écarts normaux entre certains <p>
	GAP 3.7 au-dessus des titres de chapitres
	GAP 0.5 + 2.7 sont sous les titres de chapitres
	y a aussi 0.5 + 3.5 sous chapitre et .3.7 au-dessus
	y a pas de gap particulier pour les notions périmées
	
	
	le seul truc intéressant c'est les 0.6
	sous les @type="epigraph" 0.8 ou 0.9
	
	
	les titres de chapitre sont espacés n'imp.-->
	
	
</xsl:stylesheet>