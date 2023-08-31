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
			<xd:p>Conçu par Adrien Mével, étudiant en M2 EdNitl à l'Université de Lille dans le cadre d'un travail de recherche (mémoire) sous la direction de Mme Florence de Chalonge pour le versant scientifique et M. Mathieu Marchal pour +le versant technique.</xd:p>
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
	<xsl:variable name="index0" select="concat($basename,'index0.html')"/>
	<xsl:variable name="index0_link" select="'index0.html'"/>
	
	<xsl:variable name="bib" select="concat($basename,'bibliography.html')"/>
	<xsl:variable name="bib_link" select="'bibliography.html'"/>
	
	<xsl:variable name="presentation" select="concat($basename,'presentation.html')"/>
	<xsl:variable name="presentation_link" select="'presentation.html'"/>
	
	<!--<xsl:variable name="tl" select="concat($basename,'timeline.html')"/>
	<xsl:variable name="tl_link" select="'timeline.html'"/>-->
	
	<xsl:variable name="db" select="concat($basename,'database.html')"/>
	<xsl:variable name="db_link" select="'database.html'"/>

	<xsl:variable name="uni" select="concat($basename,'uni.html')"/>
	<xsl:variable name="uni_link" select="'uni.html'"/>
	
	<xsl:variable name="disp" select="concat($basename,'disp.html')"/>
	<xsl:variable name="disp_link" select="'disp.html'"/>
	
	<xsl:variable name="polemos" select="concat($basename,'polemos.html')"/>
	<xsl:variable name="polemos_link" select="'polemos.html'"/>
	
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
<!--						<li><a href="{$db_c_link}">Commentaire de la base de données</a></li>-->
						<li><a href="{$disp_link}">Un texte disparate</a></li>
						<li><a href="{$uni_link}">L'unicité des articles</a></li>
<!--						<li><a href="{$_link}"></a></li>-->
<!--						<li><a href="{$_link}"></a></li>-->
<!--						<li><a href="{$_link}"></a></li>-->
<!--						<li><a href="{$_link}"></a></li>-->
						<li><a href="{$polemos_link}">Un style polémique : des adversaires</a></li>
<!--						<li><a href="{$tl_link}">Chronologie</a></li>-->
						<li><a href="{$index0_link}">Index des notions adverses </a></li>
						<li><a href="{$index_link}">Index des expressions privilégiées</a></li>
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
					<button class="darkbutton" onclick="displayRef();">Afficher les références</button>
					<button class="darkbutton" onclick="displayQuote();">Afficher les citations</button>
					<button class="darkbutton" onclick="displayMilestone();">Afficher les étapes argumentatives</button>
<!--					<button class="darkbutton" onclick="displayMilestone();">Afficher les bornes argumentatives</button>-->
					<xsl:if test="$content='ch03'or$content='ch11'">
						<h6>Sous-sections</h6>
						<ul id="articlenav">
							<!--id inutile conservé pour historique reasons-->
							<xsl:apply-templates mode="article_nav" select="head[not(@type='subsection_head')]"/>
						</ul>
					</xsl:if>
					<xsl:if test="contains($content,'ch')">
						<h6>Structure argumentative</h6>
						<ul id="rhetonav">
							<xsl:apply-templates mode="rhetoNav" select="//div[@xml:id=$content]//milestone"/>
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
	<xsl:template mode="rhetoNav" match="milestone">
		<xsl:variable select="@xml:id" name="id"/>
		<li><a href="{concat('#',$id)}"><xsl:call-template name="rhetoAffect"><xsl:with-param select="@type" name="nature"></xsl:with-param></xsl:call-template></a></li>
	</xsl:template>
	<xsl:template name="rhetoAffect">
		<xsl:param name="nature"/>
		<xsl:param name="nature_transforme">
			<xsl:choose>
				<xsl:when test="contains($nature,'10')">Dixième </xsl:when>
				<xsl:when test="contains($nature,'1')">Première </xsl:when>
				<xsl:when test="contains($nature,'2')">Deuxième </xsl:when>
				<xsl:when test="contains($nature,'3')">Troisième </xsl:when>
				<xsl:when test="contains($nature,'4')">Quatrième </xsl:when>
				<xsl:when test="contains($nature,'5')">Cinquième </xsl:when>
				<xsl:when test="contains($nature,'6')">Sixième </xsl:when>
				<xsl:when test="contains($nature,'7')">Septième </xsl:when>
				<xsl:when test="contains($nature,'8')">Huitième </xsl:when>
				<xsl:when test="contains($nature,'9')">Neuvième </xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="contains($nature,'refutation')">réfutation</xsl:when>
				<xsl:when test="contains($nature,'exposition')">exposition</xsl:when>
				<xsl:when test="contains($nature,'concession')">concession</xsl:when>
				<xsl:when test="contains($nature,'conclusion')">conclusion</xsl:when>
			</xsl:choose>
		</xsl:param>
		<xsl:value-of select="$nature_transforme"/>
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
												<xsl:when test="$content='ch07'"><p>Cette critique est parue initialement dans le numéro 19, juillet 1954 de la<span class="STDitalic">Nouvelle Revue Française</span>.</p>
													<p>Présenté dans les premières lignes comme s'il s'agissait d'un roman classique au sens auquel l'entend Robbe-Grillet (une narration, un protagoniste, presque des épisodes, etc.), <span class="STDitalic">La Conscience de Zeno</span> se révèle un exemple de roman moderne.</p>
													<p>Et si les thèses esthétiques de Robbe-Grillet n'y sont jamais détaillées ou même explicitement mentionnées, le lecteur attentif en décèle les indices. Le roman d'Italo Svevo traite du monde perçu depuis la conscience du protagoniste, c'est-à-dire de la conscience elle-même. L'œuvre se présente comme un journal non chronologique, donc plus proche d'un livre à part entière du fait de ce travail sur le temps, écrit à porpos de et par le protagoniste qui traite de son objet, lui-même sa conscience mais également du moyen pour la saisir, l'écriture elle-même. Robbe-Grillet invite à s'intéresser à la situation d'énonciation de l'ouvrage, devenu un roman du soupçon, posant la question : « Qui parle ? »</p></xsl:when>
												<xsl:when test="$content='ch08'"><p>Cette critique est la reprise d'une critique publiée pour la première fois dans le numéro 77, octobre 1954 de la revue <span class="STDitalic">Critique</span>.</p>
													<p>À travers l'évocation de l'œuvre de Joë Bousquet, Robbe-Grillet illustre sa thèse sur la création littérature. La création littéraire n'est pas le fait d'une restitution, mais bien d'une création. Les objets ne sont pas symboles ou symptomes d'une profondeur inaccessible. Notons à ce propos que Robbe-Grillet cite un passage de Bousquet qui rapproche cette thèse de Roussel et du roman policier (page 108). Et s'il n'y a pas de profondeur, la signification existe mais toujours comme un « sous-produit » (p. 109) des choses elle-même qui n'y participe en aucun cas.</p>
													<p>Bousquet est pour Robbe-Grillet l'exemple d'une littérature défaite de mysticisme, une illustration de la phénoménologie en littérature, défaite de métaphysique et surtout de tragédie : si <span class="STDitalic">Le Meneur de lune</span> est pour Robbe-Grillet l'expression du hiatus entre le monde et l'homme, cela semble l'occasion d'une célébration et non d'une plainte.</p></xsl:when>
												<xsl:when test="$content='ch09'"><p>Constitué de deux critiques sur Beckett « Samuel Beckett, Auteur dramatique » et « Samuel Becket ou la présence sur la scène », respectivement parus dans les numéros 69 (février 1953) et 189 (février 1963) de <span class="STDitalic">Critique</span>, cet article confirme la gradation qu'on observe de critique en critique : des précurseurs de la modernité on passe ici à ce que Robbe-Grillet considère être la modernité.</p>
													<p>Lorsque Robbe-Grillet traite Beckett et <span class="STDitalic">a fortiori</span> à la parution du recueil, son théâtre est largement reconnu. Dès lors s'agit-il pour Robbe-Grillet de chercher la continuité d'une œuvre, sa direction pour les rattacher au projet du nouveau roman. Qui voit Robbe-Grillet ? Une lecture d'Heidegger qui coïncide avec ses thèses esthétiques, une contagion, un amenuisement progressif des choses, mais aussi un reflet de la condition humaine défait de tragédie et de métaphysique triste. Robbe-Grillet dépeint ici un théâtre neuf où le spectateur, loin de « "pens[er]" ferme » est stimulé tout au long de la représentation.</p></xsl:when>
												<xsl:when test="$content='ch10'"><p>Dans cet article, initialement paru dans <span class="STDitalic">Critique</span> en janvier 1954, Robbe-Grillet fait la critique de deux romans de Robert Pinget (auteur rattaché au nouveau roamn) <span class="STDitalic">Mahu ou le matériau</span> et <span class="STDitalic">Le Renard et la boussole</span> paru en 1952 et 1953. Robbe-Grillet s'y emploie à résumer l'intrigue autant que faire ce peut (le terme même d'« intrigue » semble ici inaproprié). Ce résumé vaut commentaire tant l'explicitation des détours de ces œuvres ne peut être que le récit d'une écriture.</p>
													<p>Si, comme l'ensemble des critiques au sein de Pour un nouveau roman, le texte semble une digression dans l'économie de la démonstration, cette digression elle-même puisqu'elle est assemblée au recueil vaut d'emblée aux yeux du lecteur illustration des thèses.</p>
													<p>Que nous démontre la lecture de Pinget que nous livre Robbe-Grillet ? Robbe-Grillet ne tire aucune conclusion dans cet article, cependant la relative inanité de l'exercice auquel il se livre ici, dénouer le fil de l'aventure, semble la meilleure incarnation possible des thèses exposées dans « De quelques notions périmées » : son analyse du personnage de Renard, le récit insaisissable se veulent les preuves que le discours habituel de la critique n'a pas prise sur les œuvres du nouveau roman<!-- (et peut-être Robbe-Grillet non plus)-->. Enfin il convient de souligner que l'article souvre sur l'assertion initiale déplorant le fait que les œuvres de Pinget passe inaperçu. Outre le fait que cette affirmation semble corroborer les propos que Robbe-Grillet tient également dans « Une voie pour le roman futur »<!--, il n'est sans doute pas anodin que l'éditeur Robbe-Grillet publie à propos de Pinget publié chez Minuit.-->.</p></xsl:when>
												<xsl:when test="$content='ch11'"><p>Bilan et relance de ce qui a été exposé dans le recueil, de ce qui a été écrit dans la presse « Nouveau roman, homme nouveau » initialement paru en 1961 dans le numéro 68 de la revue spécialisée <span class="STDitalic">Revue de Paris</span> s'affirme comme une lutte pas à pas, une subversion, « un contre pied » contre la <span class="STDitalic">doxa</span> fautive.</p>
													<p>Robbe-Grillet rétablit (c'est-à-dire qu'il prescrit) la juste lecture du nouveau roman et de ses grands principes. Ce texte est sans doute le plus offensif, du moins le plus clairement sur une structure antagonistique vis-à-vis d'adversaires non désignés mais en lesquels on reconnaît <span class="STDitalic">Qu'est-ce que la littérature ?</span> de Sartre allant jusqu'à en reprendre la lettre « Le seul engagement possible, pour l'écrivain, c'est la littérature » (p. 152 chez Robbe-Grillet pour en proposer des contradictions frontales présentées comme des nuances ou des nuances présentées comme des contradictions frontales.</p></xsl:when>
												<xsl:when test="$content='ch12'"><p>« Temps et description dans le récit d'aujourdhui » est en partie issue de la réécriture de « Comment mesurer l'inventeur des mesures ? » initialement publié dans <span class="STDitalic">L'Express</span> en juin 1963.</p>
													<p>Contrairement à l'usage du recueil l'article s'ouvre sur une concession faite au critique : il est difficile de penser la nouveauté. Aussi, Robbe-Grillet se propose t-il ici de leurs venir en aide en soumettant quelques théories liées à la technique de cette littérature nouvelle : prenant le contre-pied de la critique qui rapproche le nouveau roman du cinéma, Robbe-Grillet s'emploie à démontrer l'intéret des nouvelles techniques mises en œuvre dans la description et le traitement du temps. C'est encore une fois de l'histoire dont il est question, et du rapport qu'entretient le lecteur avec la narration.</p></xsl:when>
												<xsl:when test="$content='ch13'">	<p>Continuant sur la lancé des articles plus théoriques que polémiques « Du réalisme à la réalité » est issue de quatre sources :</p>
													<ul>
														<li>« La Littérature aujourd'hui – <span class="STDsmallcaps">vi</span> », l'entretien de <span class="STDitalic">Tel Quel</span> publié en 1963</li>
														<li>« Monsieur personne répond….Pour un ‘‘nouveau roman’’ », publié en 1963 dans <span class="STDitalic">Le Figaro Littéraire</span></li>
														<li>« Réalisme et révolution », premier article publié en janvier 1955 de la série de chroniques de <span class="STDitalic">L'Express</span>.</li>
														<li>« Pour un réalisme de la présence », issu de la même série publié en janvier 1956.</li>
													</ul>
													<p>De par sa place et son ton, cet article se présente comme une conclusion. Robbe-Grillet y traite du sens sinon de la direction de la littérature, partant d'une affirmation énoncé avec l'évidence d'un constat : il n'y a de littérature que du réel et c'est précisèment ce souci de la réalité qui explique la succession des courants et des écoles littéraire et artistiques. Deux raisons sont brièvement esquissées : les modes qui passent et le monde qui change. Mais la raison principale développée par Robbe-Grillet est la l'épuisement des formes qui se figent et devient convention. L'art véritable ne peut être que création et au nom d'une littérature plus réaliste Robbe-Grillet esquisse les contours d'un changement de paradigme :l'invention n'est plus dissimulée mais bien exposée.</p>
													<p>Prenons garde de ne pas mésinterpréter l'expression « servir à quelque chose ». La valeur de la littérature n'est pas dans son inutilité, mais dans son incapacité à servir les idéologues(comprendre : les engagés, les critiques, tous réactionnaires selon Robbe-Grillet) car le propre de la création réellement nouvelle est qu'elle subvertie toujours au nom d'une forme et d'un sens défaits de l'habitude et de la paresse.</p></xsl:when>
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
										<h3>La version septembre 2023 contient :</h3>
										<ul>
											<li>l'ensemble du texte</li>
<!--											<li>l'architecture du site qui sera amené à être enrichie</li>-->
											<li>la possibilité de faire apparaître les références, les citations, les sauts rhétoriques et les numéros de page <span class="STDitalic">via</span> des boutons sur la gauche de l'écran</li>
<!--											<li>la possibilité de faire apparaître ou non les numéros de page au sein du texte (le bouton est sur la gauche)</li>-->
											<li>les éléments &lt;ref&gt; (soit les références) signalés par une infobulle jusqu'à la section sur l'ensemble du texte.</li>
											<li>les éléments &lt;w&gt; (soit les termes des index thématiques) encodés jusqu'à la section sur l'ensemble du texte.</li>
											<li>les éléments &lt;quote&gt; (soit les citations) repérés sur l'ensemble du recueil et les élémnents &lt;quote&gt; issus des œuvres de Robert Pinget de la section <a href="punr_ch10.html">« Un roman qui s'invente lui-même »</a> en contexte.</li>
											<li>les contextes des citations des œuvres de Sartre</li>
											<li>une <a href="{$db_link}">illustration de la base de données</a>.
											<ul><li>La page est un peu longue à charger et nécessite (contrairement aux autres) d'être connecté à internet.</li></ul></li>
											<li>des introductionspour chacun des articles :</li>
											<li>Un <a href="{$index_link}">index des expressions privilégiées</a></li>
											<li>Un <a href="{$index0_link}">Index des notions adverses</a></li>
											<!--<li></li>
											<li></li>-->
										</ul>
										<!--<h3>Y sera ajouté :</h3>
										<ul>
											
<!-\-											<li>une chronologie et d'autres commentaires thématiques-\->
											<ul>
												<li>commentaire vis à vis de Sartre, l'esthétique d'ARG</li>
												<li>sur les index, commentaire des termes non retenus etc...</li>
												<li>la rhétorique d'ARG</li>
											</ul></li>
											<!-\-<li>les éléments &lt;ref&gt; pleinement encodés sur l'ensemble du recueil</li>-\->
											<li>des notes explicatives, en infobulles</li>
											<li>une navigation par "élément rhétorique" au sein des articles</li>
											<li>une bibliographie</li>
										</ul>-->
									</section>
								</article>
							</xsl:when>
							<xsl:when test="$content='pres'">
<!--								LA PR2SENTATION DE L4OEUVRE-->
								<h2>Introduction</h2>
								<p>Constitué par un regroupement de textes publiés au fil des années selon des modalités différentes (tantôt dans des revues spécialisées tantôt dans des journaux généralistes) pour des projets (polémiques ou théoriques) particuliers, <span class="STDitalic">Pour un nouveau roman</span>  est une œuvre composite. Il est constitué de critiques d'ouvrages, pas toujours contemporains, de textes de théorie littéraire voire de métaphysique ou de phénoménologie ; cet ouvrage dont on ne perçoit pas toujours l'unité est pourtant loin d'un recueil dans lequel chaque article pourrait se lire indépendamment des autres, réunis par commodité plus que nécessité en un livre unique permettant au grand public de s'approprier les nouveautés de la recherche. En effet quelques fils directeurs traversent et animent les textes : on y trouve des références spécifiques, témoignages d'une époque littéraire, un style polémique, une pensée somme toute entière et constituée ; l'œuvre tient par un effort, au demeurant moindre et <span class="STDitalic">a posteriori</span>, d'unification via l'insertion de seuils et les réécritures partielles.</p>
								<p>Des récriminations contre « les critiques » à un air du temps phénoménologique, critique de la métaphysique classique en passant par une certaine vision du bon-sens, l'œuvre qui se présente comme n'étant pas une théorie du roman semble pourtant (re)tracer une voie à la littérature de son époque. <span class="STDitalic">Pour un nouveau roman</span> , qu'est-ce ? Les propos épars d'un relativement jeune auteur tentant d'occuper le terrain et de promouvoir ses textes ? Un moment de Robbe-Grillet ? Une époque de l'histoire littéraire ? Un livret de recommandations (aux publics, aux critiques, aux auteurs) ? Ou bel et bien une doctrine littéraire ?</p>
								<p>Si le texte peut être lu comme tout cela à la fois, cela tient sans doute à la complexité d'une pensée faite de recoins. Tentant de maintenir un équilibre délicat entre légitimation par la tradition et refus d'une autre tradition, entre l'affirmation de ce qu'il ne faudrait pas écrire et le refus de délivrer les consignes de la nouvelle école, <span class="STDitalic">Pour un nouveau roman</span>  réfute et emprunte (explicitement ou non) aux modèles et aux adversaires que son auteur s'est choisis. L'habileté tenant à un art consommé de l'ironie et du sous-entendu permettant d'emprunter à ceux-là même que l'on entend discréditer.</p>
								<p>Déclarant la pleine liberté de l'auteur tout en assénant qu'il ne faudrait plus écrire comme ceci ou comme cela, quelle unité <span class="STDitalic">Pour un nouveau roman</span>  ? Nous pensons que la pleine compréhension de la manière dont diverses lectures s'imbriquent en un recueil tient à la tenue des fils polémiques et théoriques qui sous-tendent l'ensemble.</p>
							</xsl:when>
							<xsl:when test="$content='db'">
								
								<iframe width="100%" src="https://graphcommons.com/graphs/2ffc7c8c-3d1b-4814-966b-593b1c206f3c" height="1000px" style="overflow:auto;"></iframe>
							</xsl:when>
							<!--<xsl:when test="$content='tl'">
<!-\-							TIMELINE GOES HERE-\->
							</xsl:when>-->
							<xsl:when test="$content='polemos'">
								<article class="comment">
								<h2>Un style polémique</h2>
								
								<p>Choisir d'écrire dans des quotidiens grand public ou même la presse spécialisée pour défendre son œuvre au nom de positions esthétiques n'est pas un choix anodin <span class="STDitalic">a fortiori</span> lorsque ce choix se fait dans un environnement relativement hostile. Alain Robbe-Grillet  assume pleinement d'entrer dans l'arène et d'y livrer une lutte sans merci pour imposer un nouveau langage critique, du moins acquérir une certaine reconnaissance. Le recueil conserve le ton des articles et donne aux attaques et récriminations une relative cohérence.</p>
								
								<h3>Des adversaires désignés ?</h3>
								<p>De par sa portée polémique, <span class="STDitalic">Pour un nouveau roman</span>  se désigne des adversaires. Parmi lesquels on trouve les critiques généralement non nommés (à quelques exceptions près) et désignés par une expression « les critiques » : ils sont les adversaires privilégiés et assimilés aux porteurs d'une <span class="STDitalic">doxa</span> à laquelle le texte s'oppose. Leurs propos réels ou supposés sont mis en valeur tout au long du texte et constituent l'un des points saillants que notre édition entend mettre en évidence (voir <a href="#gloss">ici</a>). Outre l'usage du discours indirect libre, de la citation (réelle ou fictive) on distingue l'usage de la périphrase pour désigner sans nommer, englober sans nuance les thèses adverses au sein de groupes dont les contours sont à la fois assez lâches pour se permettre une contestation facile et assez serrés pour permettre des charges précises.</p>
								
								
								<h4>L'intérêt du sous-entendu</h4>
								<p>Si l'on distingue quelques individualités nommées ou suggérées (voir <span class="STDitalic">infra</span>), les adversaires de Robbe-Grillet ne sont généralement pas nommés directement mais toujours désignés par des périphrases, telles page 29 « nos bons critiques » page 34 « les gens sérieux » ou des tournures impersonnelles page 33 « On louera seulement le romancier » ou page 16 « Il ne semble guère raisonnable ». Nous pensons qu'il s'agit là d'un choix délibéré.</p>
								
								<p class="STDquote">
									D'autres critiques qui se montrent négatifs par rapport à son projet,
									comme François Mauriac et André Rousseaux, par exemple, se voient
									accorder une place d’honneur dans le recueil. Certains, comme Jean-
									René Huguenin, n’y figurent qu’implicitement, fournissant toutefois à
									Robbe-Grillet un cadre polémique dans lequel il peut avancer ses
									thèses en réagissant à leurs remarques, et parfois même en les inventant,
									quand elles ne sont pas exprimées en toutes lettres\footnote{<span class="STDitalic">Op. cit.</span>, p. 75.</p>
								
								<p>Jean-René Huguenin mais aussi Jean Guéhenno sont deux auteurs qui prirent position publiquement contre le nouveau roman, comme le rapporte Galia <span class="STDsc">Yanoshevsky</span> \footnote{<span class="STDitalic">Op. cit.</span>, p. 137 le premier dans <span class="STDitalic">Le Figaro Littéraire</span>\footnote{Jean <span class="STDsc">Guéhenno</span>, « Le roman de Monsieur Personne »,<span class="STDitalic"> Le Figaro Littéraire</span>, 28 Nov.-4 déc. 1963, le second dans la revue <span class="STDitalic">Arts</span>\footnote{Jean-René <span class="STDsc">Huguenin</span>, « Le nouveau roman : une mode qui passe », <span class="STDitalic">Arts</span>, n° 836, 27 sept.-3 oct. 1961., pourquoi sont-ils épargnés alors que Mauriac et Rousseaux sont tous deux cités page 55 ?</p>
								
								<p>On aurait sans doute tort de penser qu'il s'agit là d'un procédé pour éviter de se faire de nouveaux ennemis, puisque ces deux auteurs se sont ouvertement positionnés contre le nouveau roman et que deux auteurs bien plus connus, eux, le sont. C'est que <span class="STDitalic">Pour un nouveau roman</span> , ne s'adresse pas à ces critiques et peut-être même pas au lecteur de la presse spécialisée mais à un lectorat plus large qui suit de loin, voire pas du tout, les polémiques littéraires. Le recueil bien que moins diffusé qu'un titre comme <span class="STDitalic">L'Express</span> s'adresse à un public plus large et possiblement à une époque éloignée de ces débats.</p>
								
								<p>En évitant de citer explicitement ses adversaires moins connus, Alain Robbe-Grillet  leur témoigne un relatif mépris : ils ne méritent pas d'être cités mais seulement d'être rejetés au sein d'une entité collective « les critiques » reflet de la <span class="STDitalic">doxa</span>, qui, par définition, ne sert qu'à être mise en échec par la démonstration du grand auteur (voir <a href="#rhétoChemin">ici</a>). Ainsi, les nuances de la pensée des adversaires, auxquels on peut dès lors prêter les propos que l'on souhaite (puisqu'il n'y a plus d'auteur identifié, nul n'est accusé à tort), sont gommées dans une masse informe et caricaturale qu'il est aisé pour Alain Robbe-Grillet  de critiquer voire de moquer.</p>
								
								<p>Mais surtout ce renvoi à une entité collective permet, et c'est là l'enjeu principal d'un manifeste, de se constituer un public qui partage la même défiance à l'égard du champ littéraire hostile aux néo-romanciers, en s'attachant tous les déçus ou les lassés de la littérature contemporaine de laquelle Alain Robbe-Grillet  entend se distinguer. Se constitue aux yeux du lecteur un bloc monolithique à la fois rétrograde « Mais tous avouent, sans voir là rien d’anormal, que leurs préoccupations d’écrivains datent de plusieurs siècles » (page 17) ; dominant, en témoigne l'adjonction des termes « la plupart [des critiques, des auteurs] » p. 17 p. 33 ou encore « académiques » p. 35 p. 86 ; et leurs thèses objet de moquerie de l'auteur, tel le « cœur romantique des choses » page 23 (et plus généralement une grande partie des termes placés entre guillemet recensés dans notre index des notions adverses (voir : <a href="#gloss">ici</a>)). Par là, le lecteur est invité à épouser les thèses de <span class="STDitalic">Pour un nouveau roman</span>  par dégoût pour les propos prêtés à ces « critiques traditionnels ».</p>
								<h4>Les critiques : tenants d'un ordre littéraire rétrograde</h4>
								
								
								<p>Les adversaires principaux du recueil sont « les critiques », qui constituent davantage un groupe informe qu'un regroupement d'individus clairement définis. L'expression (au singulier ou au pluriel) revient à de nombreuses reprises, parfois accompagnée des qualificatifs « traditionnels\footnote{<span class="STDitalic">Op. cit.</span>, p. 29, p. 31 p. 162 », « académiques\footnote{<span class="STDitalic">Op. cit.</span>, p. 36, p. 87, p. 174, p. 183 » ou même « bourgeoise\footnote{<span class="STDitalic">Op. cit.</span>, p. 47, p. 174 ». Si ces termes, en particulier « académiques » permettent à tout lecteur d'imaginer les caractéristiques de cet adversaire, les propos prêtés à cette entité et aux (rares) individus cités qui lui sont rattachés permettent d'en préciser les contours. En effet, comme l'indique Galia <span class="STDsc">Yanoshevsky</span> , les propos de la critique et leurs attaques font l'objet d'une réécriture commentant la page 56 de <span class="STDitalic">Pour un nouveau roman</span> ,</p>
								<p class="STDquote">
									Que des écrivains aussi différents que François Mauriac et André Rousseaux, par exemple, s’accordassent à dénoncer dans la description exclusive des « surfaces » une mutilation gratuite, un aveuglement de jeune révolté, une sorte de désespoir stérile qui conduisait à la destruction de l’art, cela paraissait néanmoins dans l’ordre.
								</p>
								<p>Galia <span class="STDsc">Yanoshevsky</span>  observe :</p>
								<p class="STDquote">
									La paraphrase est plutôt fictive dans la mesure où elle ne reflète pas la véritable critique de Rousseaux et de Mauriac (les adjectifs mentionnés ci-dessus ne figurent pas dans leurs articles respectifs). C’est-à-dire qu’il met dans la bouche de ses critiques des termes hyperboliques\footnote{<span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 116</p>
								<p>Qu'est-ce qui constitue ce groupe ? Tout ce qui s'oppose à la modernité du roman :</p>
								<ul>
									<li> « un vocabulaire » qui trahit un système\footnote{<span class="STDitalic">Op. cit.</span>, p. 29 constitué de « notions périmées » et qualifié page 30 de « mots magiques ».</li>
										<li> un attachement immodéré et coupable au personnage\footnote{<span class="STDitalic">Op. cit.</span>, p. 31, à l'histoire\footnote{<span class="STDitalic">Op. cit.</span>, p. 34, à l'opposition entre le fond et à la forme\footnote{<span class="STDitalic">Op. cit.</span>, p. 47, le premier prenant le pas sur la seconde sous la forme de l'engagement\footnote{<span class="STDitalic">Op. cit.</span>, p. 39.</li>
											<li> une aversion pour le « formalisme\footnote{<span class="STDitalic">Op. cit.</span>, p. 49 ».</li>
												<li> une méconception sur l'humanisme qui le confond avec la métaphysique
													<p class="STDquote">
														Condamner, au nom de l’humain, le roman qui met en scène un tel homme, c’est donc adopter le point de vue <span class="STDitalic">humaniste</span>, selon lequel il ne suffit pas de montrer l’homme là où il est : il faut encore proclamer que l’homme est partout. Sous prétexte que l’homme ne peut prendre du monde qu’une connaissance subjective, l’humanisme décide de choisir l’homme comme justification de tout. Véritable pont d’âme jeté entre l’homme et les choses, le regard de l’humanisme est avant tout le gage d’une solidarité\footnote{<span class="STDitalic">Op. cit.</span>, p. 59.</p> </li>
								</ul>
								
								<p>En somme, les critiques sont naïfs page 31 Alain Robbe-Grillet  ironise « Un personnage, tout le monde sait ce que le mot signifie. Ce n’est pas un <span class="STDitalic">il</span> quelconque, anonyme et translucide, simple sujet de l’action exprimée par le verbe » avant de décrire le personnage balzacien. Observons que la non-définition proposée du personnage en plus d'être un résumé du personnage type dans le Nouveau Roman (bel et bien effective rendant donc l'argumentaire supposé des critiques caduque), pourrait aussi bien être la description du personnage en tant qu'instance textuelle, en quelque sorte plus sérieuse que la description du personnage balzacien qui semble dès lors une peinture naïve de la théorie littéraire. <br />Les adversaires de Robbe-Grillet sont si souvent invoqués comme source d'un propos auquel il s'oppose que toute pensée contre laquelle se dresse Alain Robbe-Grillet  semble constituer, sauf indication contraire, l'une des thèses de « la critique ». Ainsi si la tournure impersonnelle domine dans quelques passages de « Nouveau Roman, homme nouveau », il ne fait aucun doute que cet impersonnel rétrograde est synonyme de « les critiques » :</p>
								<p class="STDquote">
									L'erreur est de croire que le « vrai roman » s’est figé une fois pour toutes, à l’époque balzacienne, en des règles strictes et définitives [...]. La construction de nos livres n’est d’ailleurs déroutante que si l’on s’acharne à y rechercher la trace d’éléments qui ont en fait disparu [...]\footnote{<span class="STDitalic">Op. cit.</span>, p. 146</p>
									<p class="STDquote">Comme il n’y avait pas, dans nos livres, de « personnages » au sens traditionnel du mot, on en a conclu, un peu hâtivement, qu’on n’y rencontrait pas d’hommes du tout. C’était bien mal les lire.\footnote{<span class="STDitalic">Op. cit.</span>, p. 147</p>
								
								<p>On peut tout de même parmi « les critiques » pris comme un bloc faire des recoupements et identifier quelques auteurs parfois cités.<br />	On identifie Mauriac et Rousseaux cités page 56 ; mais aussi Émile Henriot. Après l'attribution du prix des critiques au roman <span class="STDitalic">Le Voyeur</span>, Émile Henriot académicien, écrit dans <span class="STDitalic">Le Monde</span> :</p>
								<p class="STDquote">
									Le voyeur de M. Robbe-Grillet n'alléchera personne sans le décevoir : c'est seulement un type indécis, incertain, peut-être secret ou qui ne comprend rien non plus à son affaire\footnote{<span class="STDsc">Henriot</span> Émile, « Le prix des critiques "Le Voyeur", d'Alain Robbe-Grillet », Paris, <span class="STDitalic">Le Monde</span>, 15 juin 1955, [En ligne : <a href="https://www.lemonde.fr/archives/article/1955/06/15/le-prix-des-critiques-le-voyeur-d-alain-robbe-grillet_1958094_1819218.html">https://www.lemonde.fr/archives/article/1955/06/15/le-prix-des-critiques-le-voyeur-d-alain-robbe-grillet_1958094_1819218.html</a>
								</p>
								<p>Et s'il semble bien que les reproches qu'Émile Henriot a fait à Alain Robbe-Grillet  ont pu nourrir l'œuvre, il n'est jamais cité. On peut cependant inférer que des reproches tels que </p>
								
								<p class="STDquote">
									En, voici le procédé de M. Alain Robbe-Grillet  : il va et vient dans son récit, avance, recule, change de lieu, ne tient aucun compte du temps. On est à telle heure et tant de minutes, et trois pages ou dix lignes plus loin on est revenu en arrière, et tout est mêlé comme dans l'esprit inquiet de Mathias, l'énigmatique voyageur marchand de montres-bracelet, assassin possible\footnote{<span class="STDitalic">Op. cit.</span>, p. <span class="STDsc">Henriot</span> Émile, « Le prix des critiques "Le Voyeur", d'Alain Robbe-Grillet », Paris, <span class="STDitalic">Le Monde</span>, 15 juin 1955, [En ligne : <a href="https://www.lemonde.fr/archives/article/1955/06/15/le-prix-des-critiques-le-voyeur-d-alain-robbe-grillet_1958094_1819218.html">https://www.lemonde.fr/archives/article/1955/06/15/le-prix-des-critiques-le-voyeur-d-alain-robbe-grillet_1958094_1819218.html</a>.
								</p>
								<p>inspirent peut-être certains passages :</p>
								<p class="STDquote">
									Tandis que, dans le récit moderne, on dirait que le temps se trouve coupé de sa temporalité. Il ne coule plus\footnote{<span class="STDitalic">Op. cit.</span>, p. 168.
								</p>
								<p>Plus sûrement, Émile Henriot n'est pas tout à fait incapable de lire et la description qu'il fait de <span class="STDitalic">Le Voyeur</span> pour le dénigrer est la même que Robbe-Grillet (ou n'importe quel lecteur compétent) dresserait pour en faire l'éloge. Dès lors il semble contre productif de citer Émile Henriot explicitement, s'il faut lui donner en partie raison, la peinture des critiques académiques en imbéciles perd de sa force. Cependant la récurrence des attaques contre l'Académie Française pourrait être interprétée comme un reste de présence d'Émile Henriot au sein du recueil : on peut supposer qu'une aversion peut-être nourrie par des positions de fait antithétiques n'a pu qu'être accentuée par la prise de position d'Émile Henriot, au moment où Alain Robbe-Grillet  accédait à un semblant de reconnaissance. Notamment ce passage qui suit l'explication du traitement du temps dans <span class="STDitalic">La Jalousie</span> : « Et cela non pas dans le but stupide de dérouter l'Académie\footnote{<span class="STDitalic">Op. cit.</span>, p. 167 ».</p>
								
								<p>D'après Galia <span class="STDsc">Yanoshevsky</span> une même mention implicite fortement suggérée peut être inférée à l'endroit d'Alain Bosquet qui « fait de Robbe-Grillet un cas de figure négatif de l’écriture d’avant-garde\footnote{<span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 105 » dans un article paru dans la revue <span class="STDitalic">Preuves</span>\footnote{<span class="STDsc">Bosquet</span> Alain, « Roman d’avant-garde et antiroman », <span class="STDitalic">Preuves</span>, n° 79, septembre 1957, p. 79-86. C'est ce critique qu'il faut reconnaître au début du troisième article « Sur quelques notions périmées » page 30 :</p>
								<p class="STDquote">
									Dès qu'un écrivain renonce aux formules usées pour tenter de forger sa propre écriture, il se voit aussitôt coller l'étiquette : "avant-garde". [...] le lecteur, averti par un clin d'œil, pense aussitôt à quelques jeunes gens hirsutes qui s'en vont, le sourire en coin, placer des pétards sous les fauteuils de l'Académie, dans le seul but de faire du bruit ou d'épater les bourgeois.
								</p>
								
								<p>Sont explicitement cités trois autres critiques : Henri Clouard un académicien cité (une citation extraite d'une publication qui n'a pas pu être identifiée) pour être ridiculisé dans la suite directe de l'extrait précédemment cité, François Mauriac et André Rousseaux dont les articles parus dans <span class="STDitalic">Le Figaro Littéraire</span>\footnote{<span class="STDsc">Rousseaux</span> André, « Les Surfaces d’Alain Robbe-Grillet », <span class="STDitalic">Le Figaro littéraire</span>, 13 avril 1957, p. 2 et <span class="STDsc">Mauriac</span> François, « Technique du cageot », <span class="STDitalic">Le Figaro littéraire</span>, 28 juillet 1956, p. 1-3. sont, d'après Galia <span class="STDsc">Yanoshevsky</span>  exagérés pour être mieux réfutés\footnote{<span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 116. </p>
								
								
								<h4>Les « réalistes socialistes »</h4>
								<a id="engages"></a>
								<p>Écrits dans les années 1950-60, <span class="STDitalic">Pour un nouveau roman</span>  se moque des bourgeois et accuse ses adversaires de « réalisme socialisme », soit d'appartenir à un art d'état communiste censé faire advenir mais surtout accompagner la dictature du prolétariat. L'accusation est quelque peu hyperbolique et, ici encore, le fait de ne pas donner de noms permet de brasser large sans risquer d'être à son tour attaqué. Cependant Robbe-Grillet semble prêt à concéder au mouvement quelque intérêt :</p>
								<p class="STDquote">
									Tout cependant n’était pas a priori condamnable dans cette théorie soviétique dite du « réalisme socialiste ». En littérature, par exemple, ne s’agissait-il pas aussi de réagir contre une accumulation de fausse philosophie qui avait fini par tout envahir, de la poésie au roman ? S’opposant aux allégories métaphysiques, luttant aussi bien contre les arrière-mondes abstraits que celles-ci supposent que contre le délire verbal sans objet ou le vague sentimentalisme des passions, le réalisme socialiste pouvait avoir une saine influence.</p>
									
									<p class="STDquote">Ici n’ont plus cours les idéologies trompeuses et les mythes. La littérature expose simplement la situation de l’homme et de l’univers avec lequel il est aux prises. En même temps que les « valeurs » terrestres de la société bourgeoise ont disparu les recours magiques, religieux ou philosophiques à tout « au-delà » spirituel de notre monde visible. Les thèmes, devenus à la mode, du désespoir et de l’absurde sont dénoncés comme des alibis trop faciles. Ainsi Ilya Ehrenburg ne craignait-il pas d’écrire au lendemain de la guerre : « L’angoisse est un vice bourgeois. Nous, nous reconstruisons\footnote{<span class="STDitalic">Op. cit.</span>, p. 44. »</p>
								<p>La promesse de destitution de la profondeur et des vieux mythes donc des postulats philosophiques proches de ceux Robbe-Grillet au nom d'une esthétique neuve car défaite de vices rétrogrades a de quoi séduire Alain Robbe-Grillet  ; cependant le passage au conditionnel dans le paragraphe suivant consacre le passage à une subtile ironie et anticipe le rejet en bloc page 45 : « Quel progrès y a-t-il si, pour échapper au dédoublement des apparences et des essences, on tombe dans un manichéisme du bien et du mal ? ».</p>
								
								<p>S'il ne se penche que sur <span class="STDitalic">Pour un nouveau roman</span> , le lecteur ne sait pas tellement ce qui constitue la doctrine des réalistes socialistes, Alain Robbe-Grillet  en appelle à des représentations partagées au nom d'une connivence développée sur les attaques contre ce groupe et les critiques bourgeois. Cependant les reproches que le texte fait aux réalistes socialistes permet au lecteur de concevoir, non seulement les torts des réalistes socialistes (portée explicite du passage) mais aussi les thèses qu'ils défendent (portée implicite) :</p>
								<p class="STDquote">
									Or, du point de vue de la littérature, les vérités économiques, les théories marxistes sur la plus-value et l’usurpation sont aussi des arrière-mondes. Si les romans progressistes ne doivent avoir de réalité que par rapport à ces explications fonctionnelles du monde visible, préparées d’avance, éprouvées, reconnues, on voit mal quel pourrait être leur pouvoir de découverte ou d’invention ; et, surtout, ce ne serait une fois de plus qu’une nouvelle façon de refuser au monde sa qualité la plus sûre : le simple fait qu’il est là\footnote{<span class="STDitalic">Op. cit.</span>, p. 45-46.
								</p>
								<p>Mais il y a plus, au fil du texte se révèle une homologie structurelle entre les engagés et les réalistes socialistes. À la sous-section %suivante
								« La forme et le contenu », le terme « engagé » disparaît au profit de « partisans du réalisme socialiste » (page 47), « serviteurs de Jdanov » (page 48), la fusion des deux groupes est définitivement consommée page 50 « les romans "engagés" qui se prétendent révolutionnaires », par un zeugme, Robbe-Grillet reproche une littérature rétrograde (de par sa pauvreté formelle) aux engagés tout en faisant signe vers une littérature censée soutenir la révolution. Par ailleurs, l'argument ne manque pas d'intérêt : </p>
								<p class="STDquote">
									Il est dès lors normal que l’accusation de « formalisme » soit l’une des plus graves dans la bouche de nos censeurs des deux bords. Cette fois encore, malgré qu’ils en aient, c’est une décision systématique sur le roman que le mot révèle ; et, cette fois encore, sous son air naturel, le système cache les pires abstractions – pour ne pas dire les pires absurdités. On peut en outre y déceler un certain mépris de la littérature, implicite, mais flagrant, qui étonne autant venant de ses défenseurs officiels – les conservateurs de l’art et de la tradition – que de ceux qui ont fait de la culture des masses leur cheval de bataille favori.
									
									Qu’entendent-ils au juste par formalisme ? La chose est claire : ce serait un souci trop marqué de la forme – et, dans le cas précis, de la technique romanesque – aux dépens de l’histoire et de sa signification.
								</p>
								<p>puisque les « partisans du réalisme socialiste » et les « critiques bourgeois les plus endurcis » considèrent la littérature par les mêmes outils (distinguant forme et fond), ce sont les mêmes et il n'est plus utile de les distinguer. Et, une fois les critiques bourgeois et les réalistes socialistes déclarés similaires, on voit mal comment les engagés seraient épargnés, en témoigne la page 40 :</p>
								<p class="STDquote">
									Le roman à thèse est même rapidement devenu un genre honni entre tous... On l’a pourtant vu, il y a quelques années, renaître à gauche sous de nouveaux habits : « l’engagement » ; et c’est aussi, à l’Est et avec des couleurs plus naïves, le « réalisme socialiste ».
								</p>
								
								<p>Écrivant au fil de la pensée, du moins le laissant entendre, l'écriture de Robbe-Grillet s'embarrasse de peu de concessions, par exemple page 46, le résumé aux airs de concession qu'il fait de l'engagement Sartrien évoque le réalisme socialisme et toute concession faite à l'un servira à dénigrer l'autre :</p>
								<p class="STDquote">
									Que reste-t-il alors de l’engagement ? Sartre, qui avait vu le danger de cette littérature moralisatrice, avait prêché pour une littérature <span class="STDitalic">morale</span>, qui prétendait seulement éveiller des consciences politiques en posant les problèmes de notre société, mais qui aurait échappé à l’esprit de propagande en rétablissant le lecteur dans sa liberté. L’expérience a montré que c’était là encore une utopie : dès qu’apparaît le souci de signifier quelque chose (quelque chose d’extérieur à l’art) la littérature commence à reculer, à disparaître.
								</p>
								
								
								
								<p>Les adversaires nommés ou désignés de manière si précise que l'implicite s'expose en procédé rhétorique, semblent constituer des <span class="STDitalic">exempla</span> de groupes adversaires. Ainsi Sartre dont l'éloge nuancé pour <span class="STDitalic">La Nausée</span> semble <span class="STDitalic">exemplum</span> du groupe « socialistes révolutionnaires ». En effet Robbe-Grillet au fond ne s'embarrasse pas de distinction entre « les engagés » et « les réalistes socialistes », ainsi lit-on page 40 à propos de la notion périmée d'engagement :</p>
								<p class="STDquote">
									On l’a pourtant vu, il y a quelques années, renaître à gauche sous de nouveaux habits : « l’engagement » ; et c’est aussi, à l’Est et avec des couleurs plus naïves, le « réalisme socialiste ».
								</p>
							<p>	Exemple type des références à l'engagement dans <span class="STDitalic">Pour un nouveau roman</span>  renvoyant de manière implicite à l'ouvrage de Sartre <span class="STDitalic">Qu'est-ce que la littérature</span>\footnote{<span class="STDsc">Sartre</span> Jean-Paul, <span class="STDitalic">Qu'est-ce que la littérature</span>, Paris, Gallimard, coll. « folio essais », 2008 [1948] paru en 1948 (ou à la série d'articles du même nom publié de février à juillet 1947 dans <span class="STDitalic">Les Temps modernes</span> (voir : <a href="#vsSartre">ici</a>), le raccourci nous paraît manifeste. Sartre pour se défendre de ses détracteurs qui lui reprochent « d'engager » la littérature, prend appui sur le sens commun, « N'a-t-on pas coutume à tous les jeunes gens qui se proposent d'écrire cette question de principe : "Avez-vous quelque chose à dire ?"\footnote{<span class="STDsc">Sartre</span> Jean-Paul, <span class="STDitalic">Qu'est-ce que la littérature</span>, Paris, Gallimard, coll. « folio essais », 2008 [1948], p. 27 » pour conclure « Il faut bien, de leur [les critiques] aveu même, que l'écrivain parle de quelque chose\footnote{<span class="STDsc">Sartre</span> Jean-Paul, <span class="STDitalic">Qu'est-ce que la littérature</span>, Paris, Gallimard, coll. « folio essais », 2008 [1948], p. 32 ». Sartre affirme la prééminence du fond sur la forme pour justifier la nécessité pour l'écrivain de s'engager, c'est précisément en jouant sur cet argument non explicité que Robbe-Grillet reproche aux deux groupes page 47 :</p>
								<p class="STDquote">
									Une chose devrait troubler les partisans du réalisme socialiste, c'est la parfaite ressemblance de leurs arguments, de leur vocabulaire, de leurs valeurs, avec ceux des critiques bourgeois les plus endurcis. Par exemple lorsqu'il s'agit de séparer la "forme" d'un roman de son "contenu", c'est-à-dire d'opposer l'<span class="STDitalic">écriture</span> (choix des mots et leur ordonnance, emploi des temps grammaticaux et des personnes, structure du récit, etc.) à l'anecdote qu'elle sert à rapporter (événements, actions des personnages, motivations de celles-ci, morale qui s'en dégage).
								</p>
								<p>Alain Robbe-Grillet  ici consacre le fait que les réalistes socialistes sont bourgeois et démontre que son opposition principale aux uns et aux autres est le souci de la recherche formelle.</p>
								</article>
							</xsl:when>
							<xsl:when test="$content='uni'">
								<article class="comment">
									<h2>Des articles aux thèmes cohérents</h2>
									<div class="separ"/>
										<h3>Offrir un corpus théorique au Nouveau Roman</h3>
									<p>La mise en recueil de ses articles révèle un projet : constituer le mouvement Nouveau Roman autour d'un ensemble théorique. Comme le signale Galia <span class="STDsc">Yanoshevsky</span> , les références à Sarraute et Barthes sont la plupart du temps implicites, même volontairement effacées lors de la mise en recueil pour mettre en valeur la portée manifestaire du recueil<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 74-75</span></span> : la théorie du Nouveau Roman sera signée Robbe-Grillet. Il semble en effet que toutes les théories ayant nourri celles de Robbe-Grillet se trouvent absorbées pour n'en former plus qu'une, relativement cohérente.</p>
										<p>Citons quelques exemples de ces réécritures qui effacent les dettes de Robbe-Grillet, voire constituent des plagiats identifiés par Galia <span class="STDsc">Yanoshevsky</span>  et Bruce <span class="STDsc">Morissette</span>.</p>
									<p>Galia <span class="STDsc">Yanoshevsky</span>  remarque la disparition d'un épigraphe non sourcé issu de <span class="STDitalic">L'Ère du soupçon</span> au début de l'article « De quelques notions périmées »<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 95</span></span> :</p>
										<p class="STDquote">
											le roman que seul l'attachement obstiné à des techniques périmées fait passer pour un art mineur<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Sarraute</span> Nathalie, <span class="STDitalic">L'Ère du soupçon</span>, Paris, Gallimard, coll. « folio essai », p. 77-78</span></span></p>
									<p>L'article est d'ailleurs truffé de très nettes dettes à <span class="STDitalic">L'Ère du soupçon</span>, telle la page 31 « C’est même là qu’elle [la critique] reconnaît le "vrai" romancier : "il crée des personnages"... » échos de « ils [les critiques] ont beau distribuer sans compter les éloges à ceux qui savent encore, comme Balzac ou Flaubert, "camper" un héros de roman et ajouter une "inoubliable figure" aux figures inoubliables dont ont peuplé notre univers tant de maîtres illustres<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Sarraute</span> Nathalie, <span class="STDitalic">L'Ère du soupçon</span>, Paris, Gallimard, coll. « folio essai », p. 59</span></span> » et à la page suivante l'expression « "vrai romancier" ». Si le ton général des deux essais diffèrent quelque peu : Sarraute établit des constats sur un ton bien moins polémique. Robbe-Grillet ne rapproche jamais Balzac de Flaubert (mais parfois Dostoïevski<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 31</span></span>. Jusqu'à l'usage des guillemets pour marquer une distance critique et ironique vis-à-vis des discours prêtés à la critique, les emprunts sont frappants.</p>
										
										<p>De même la définition du personnage balzacien par Robbe-Grillet aux pages 31-32,</p>
										<p class="STDquote">
											Un personnage doit avoir un nom propre, double si possible : nom de famille et prénom. Il doit avoir des parents, une hérédité. Il doit avoir une profession. S’il a des biens, cela n’en vaudra que mieux. Enfin il doit posséder un « caractère », un visage qui le reflète, un passé qui a modelé celui-ci et celui-là. Son caractère dicte ses actions, le fait réagir de façon déterminée à chaque événement. Son caractère permet au lecteur de le juger, de l’aimer, de le haïr. C’est grâce à ce caractère qu’il léguera un jour son nom à un type humain, qui attendait, dirait-on, la consécration de ce baptême.
										</p>
										<p>semble une réécriture de Sarraute :</p>
										<p class="STDquote">Il [le personnage] était très richement pourvu, comblé de biens de toute sorte, entouré de soins minutieux ; rien ne lui manquait, depuis les boucles d'argent de sa culotte jusqu'à la loupe veinée au bout de son nez. Il a, peu à peu, tout perdu : ses ancêtres, sa maison soigneusement bâtie, bourrée de la cave au grenier d'objets de toute espèce, jusqu'aux plus menus colifichets, ses propriétés et ses titre de rente, ses vêtements, son corps, son visage, et, surtout, ce bien précieux entre tous, son caractère, qui n'appartenait qu'à lui, et souvent jusqu'à son nom<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Sarraute</span> Nathalie, <span class="STDitalic">L'Ère du soupçon</span>, Paris, Gallimard, coll. « folio essai », p. 61</span></span>.</p>
										
									<p>Galia <span class="STDsc">Yanoshevsky</span>  observe également l'absence du compte rendu « Le réalisme, la psychologie et l’avenir du roman<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Robbe-Grillet</span> Alain, « Le réalisme, la psychologie et l’avenir du roman », <span class="STDitalic">Critique</span>, n° 111-112, août-septembre 1956, p. 695-701</span></span> » traitant de l'essai de Sarraute<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 96</span></span> puis paraphrase ce que Robbe-Grillet dira de cette absence : « Dans l’acte fondateur du recueil, Robbe-Grillet ne peut pas se permettre d’étaler les différences d’opinion qui se font jour au sein du mouvement naissant<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 98</span></span> », en effet Sarraute et Robbe-Grillet partagent des constats mais sans doute pas les solutions. Lorsque la première souhaite une littérature au plus près de la psychologie, le second souhaite une littérature des surfaces.<br />À propos des emprunts à Barthes, Galia <span class="STDsc">Yanoshevsky</span>  écrit :</p>
										<p class="STDquote">
											l’essai « Pour un nouveau roman » est entièrement fondé sur l’article « Littérature objective<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Barthes</span> Roland, « Littérature objective », Critique vol. <span class="STDsc">xv</span>, n° 86-87, juillet-août 1954, p. 581-591.</span></span> » (1954) où Barthes analyse <span class="STDitalic">La Jalousie</span> et <span class="STDitalic">Le Voyeur</span>. Non seulement Robbe-Grillet y reprend les vocables qui caractérisent le discours de Barthes, mais il emprunte également les idées et les concepts de celui-ci<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 98</span></span>.</p>
										<p>Parmi lesquels, elle cite page 99</p>
										<p class="STDquote">
											Des expressions comme « des mots à caractère viscéral, analogique ou incantatoire », « le cœur romantique des choses », ou encore l’usage de la métaphore des fouilles archéologiques
										</p>
										
										<p>Réunissant les principaux propos théoriques sur le Nouveau Romain au sein de ses écrits, Robbe-Grillet impose son recueil comme un manifeste, hétérogène certes, mais d'un seul bloc et lui même comme le chef de file du mouvement.</p>
										
										<p>Nous pensons également que si Robbe-Grillet procède à l'effacement de certaines sources primaires pour profiter pleinement de l'autorité que lui confère le recueil et de la notoriété qu'il a acquis dans l'arène médiatique, le fait que les référents ne soient effacés qu'au moment de la mise en recueil, dit peut-être quelque chose de la gestation de <span class="STDitalic">Pour un nouveau roman</span>. En effet les articles les plus inspirés de Sarraute sont aussi les plus anciens : Robbe-Grillet n'est alors le chef de file d'aucune école mais un auteur qui défend sa pratique. La portée manifestaire, qu'acquièrent plus tard ses articles aux yeux du public et de la critique, n'est pas prévue initialement mais s'impose à l'auteur au fil des années. Dès lors, le gommage des références positives, pourrait être en plus d'une appropriation, un choix formel : cela encourage l'unité du recueil davantage clôt sur lui-même, se suffisant à lui-même, et ce, d'autant plus que la pensée de Robbe-Grillet émerge d'une nécessité inscrite dans son temps et non en laboratoire. Ainsi Robbe-Grillet se défendrait de produire une littérature de laboratoire tel à la page 145 : « nous, au contraire, qu’on accuse d’être des théoriciens, nous ne savons pas ce que doit être un roman, un vrai roman ; nous savons seulement que le roman d’aujourd’hui sera ce que nous le ferons ».</p>
										<p>Par ailleurs, ces dettes théoriques ou esthétiques même si elles sont en partie gommées, dénotent une littérature avant-gardiste en cela que ces référents techniques et esthétiques sont immédiatement contemporains et s'opposent à une vulgate datée convoquée sur le mode polémique ou parfois ironique :</p>
										<p class="STDquote">
											On connaissait le théâtre d’idées. C’était un sain exercice d’intelligence, qui avait son public (bien qu’il y soit fait parfois bon marché des situations et de la progression dramatique). On s’y ennuyait un peu, mais on y « pensait » ferme, dans la salle comme sur la scène<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 126</span></span>.</p>
										<p>Le calembour (s'ennuyer ferme) nous paraît faire référence à la théorie des trois publics du théâtre de Victor Hugo :</p>
										<p class="STDquote">
											la foule est tellement amoureuse de l'action qu'au besoin elle fait bon marché des caractères et des passions. Les femmes, que l'action intéresse d'ailleurs, sont si absorbées par les développements de la passion, qu'elles se préoccupent peu du dessin des caractères ; quant aux penseurs, ils ont un tel goût de voir des caractères, c'est-à-dire des hommes, vivre la scène, que, tout en accueillant volontiers la passion comme incident naturel dans l'œuvre dramatique, ils en viennent presque à y être importunés par l'action. Cela tient à ce que la foule demande surtout au théâtre des sensations ; la femme, des émotions ; le penseur, des méditations. Tous veulent un plaisir ; mais ceux-ci, le plaisir des yeux ; celles-là, le plaisir du cœur ; les derniers, le plaisir de l'esprit<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Hugo</span> Victor, <span class="STDitalic">Ruy Blas</span>, Paris, Le Livre de proche, 2009 [1839], p. 15-16</span></span>.</p>
										<p>Sans doute voit-on là un éventuel référent des critiques académiques ou de tous ceux dont « les préoccupations d’écrivains datent de plusieurs siècles<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 18</span></span> ». Par opposition à Robbe-Grillet dont les références théoriques sont contemporaines, voire même inspirées de sa seule pratique et du bon sens (voir <span class="STDitalic">infra</span> : <a href="#bonsens">ici</a>), les adversaires de Robbe-Grillet ont des préoccupations datées et pratiquent un théâtre trop intellectuel où l'on s'ennuie. Ce « théâtre d'idées » pourrait au demeurant être celui de Sartre qui a déjà créé la plupart de ses pièces lorsque paraît l'article sur Beckett dont est extrait ce passage.</p>
										
										
										
										<h3>Une filiation au nouveau roman</h3>
										<a id="filiation"></a>
										<p>À la recherche d'une légitimité refusée par les critiques traditionnels, Robbe-Grillet s'emploie à fonder une lecture de la tradition littéraire. Il y aurait d'un côté Balzac et une tradition dont la nature exacte n'est jamais caractérisée par autre chose que son rejet du Nouveau Roman et de l'autre une quête ancienne de la modernité, qui serait le propre de la valeur littéraire.</p>
										<p>Sans doute, point crucial de l'œuvre : donner plus qu'une légitimité au Nouveau Roman, une nécessité : le Nouveau Roman est l'aboutissement d'évolutions anciennes, soit l'avenir du roman des années 1950. En effet, semble effleurer le texte la possibilité d'un progrès en art, du moins un sens à l'histoire littéraire.</p>
									<p>L'ordre dans lequel les « éléments d'une anthologie moderne » sont composés, nous paraît à ce titre éclairant. Les critiques n'y sont en effet pas organisées en fonction de l'ordre de publication des articles originaux mais bien allant du moins au plus moderne. Une gradation semble sous-entendue même au lecteur néophyte par l'éloignement de deux relatifs inconnus datés (Raymond Roussel et Joë Bousquet) et le célèbre contemporain (Samuel Beckett). La lecture de ces chroniques ne vient pas démentir cette impression. Le premier article dit de Raymond Roussel qu'il est « parmi les ancêtres directs du roman moderne<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 88-89</span></span> », qu'il « n’a rien à dire et il le dit mal<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 88</span></span> », le dernier n'a pas besoin de préciser que Robert Pinget, publié chez Minuit depuis 1956, déconstruit le romanesque. On remarquera, à raison, que le dénigrement de Raymond Roussel constitue davantage une concession faite à la critique (soit une nouvelle attaque à son encontre) : le fait de n'avoir rien à dire fait clairement référence à Sartre<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Sartre</span> Jean-Paul, <span class="STDitalic">Qu'est-ce que la littérature</span>, Paris, Gallimard, coll. « folio essais », 2008 [1948], p. 32</span></span> et le « bien » est, l'une des expressions favorites des critiques, rejetée par Robbe-Grillet<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 29 « talent de conteur », p. 51 « Untel a quelque chose à dire et il le dit bien »</span></span> ; cependant ce n'est vrai que de la première itération<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 87, à propos de n'avoir rien à dire et p. 88 sur le fait d'écrire mal</span></span>, la concession est ensuite réitérée sans mention d'une origine tierce (guillemets ou discours indirect libre) marquant, selon nous, le fait qu'elle est entérinée.</p>
									<p>Une telle concession s'observe également dans l'article suivant traitant de Joë Bousquet, cette fois-ci, sans même le recours à la médiation d'une <span class="STDitalic">doxa</span> à laquelle il faudrait répondre :</p>
										<p class="STDquote">
											Même sans lui tenir rigueur de l’emploi fréquent du mot « âme » là où le mot <span class="STDitalic">imagination</span> conviendrait certes plus clairement à son propos, nous ne pouvons réprimer notre agacement devant l’espèce de mysticisme (d’ailleurs hérétique) qui baigne toute la pensée de Bousquet. Plus grave qu’un vocabulaire suspect (« âme », « salut », etc.), il y a chez lui cette tentative de <span class="STDitalic">récupération</span> <span class="STDitalic">globale</span> de l’univers par l’esprit humain. L’idée de <span class="STDitalic">totalité</span> mène toujours plus ou moins directement à celle de vérité absolue, c’est-à-dire supérieure, donc bientôt à l’idée de Dieu<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 117</span></span>.
										</p>
										
										<p>Ces réserves s'évanouissent à mesure que l'on progresse dans l'anthologie dont le ton devient de plus en plus dithyrambique. Plus généralement, mais particulièrement dans les éléments de l'anthologie moderne, une évolution où nulle place n'est laissée au regret se fait sentir dans la lecture de l'histoire littéraire que propose Robbe-Grillet.</p>
										
										<p>Nous pensons donc pouvoir établir une typologie des auteurs cités comme précurseurs de la modernité ou eux-même modernes. Cette classification entend formaliser sommairement une filiation qui, si elle n'est pas tout à fait implicite, n'est jamais énoncée comme telle avec tant de clarté. Nous pensons mettre en valeur ici une axiologie structurante de la pensée de <span class="STDitalic">Pour un nouveau roman</span> , tenue par le style et l'agencement rhétorique du recueil.</p>
										
										<h4>Les précurseurs illustres</h4>
										<p>Il y aurait les précurseurs illustres qui ne sont que peu commentés mais convoqués afin de donner une légitimité au Nouveau Roman. On y trouve des grands noms de la littérature internationale : Kafka, Flaubert, Proust, Dostoïevski, Faulkner et Joyce ; maintes fois cités séparément ou associés tout au long du recueil et tous réunis page 146, voire même désignés à la page suivante par la formule « Kafka, Faulkner et tous les autres » marquant la proximité supposée du lecteur avec ce regroupement.</p>
										
									<p>À l'exception de Flaubert et de Proust, il est frappant de n'y trouver que des auteurs non francophones, notamment anglophones. Les auteurs anglophones semblant au demeurant un trope chez les nouveaux romanciers, comme en témoigne un entretien de Claude Simon réalisé en 1988<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Simon</span> Claude et <span class="STDsc">Veinstein</span> Alain, <span class="STDitalic">La nuit sur un plateau</span>, France culture, émission du 8 février 1988 [En ligne : <a href="https://www.radiofrance.fr/franceculture/podcasts/les-nuits-de-france-culture/claude-simon-j-ai-appris-a-ecrire-dans-joyce-et-dans-faulkner-6832681">https://www.radiofrance.fr/franceculture/podcasts/les-nuits-de-france-culture/claude-simon-j-ai-appris-a-ecrire-dans-joyce-et-dans-faulkner-6832681</a></span></span>.</p>
										
										<p>Si Alain Robbe-Grillet  se permet d'utiliser Dostoïevski comme élément comparant péjoratif à la page 31 (on lui reproche d'avoir créé, comme Balzac le père Goriot, des personnages inoubliables), tous sont convoqués pour mettre en valeur une modernité naissant qui va en s'affirmant toujours plus.</p>
										
									<p>Enfin, si l'usage de Kafka et Dostoïevski n'est pas sans rappeler l'article « De Kafka à Dostoïevski » issu de <span class="STDitalic">L'Ère du soupçon</span><span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Sarraute</span> Nathalie, <span class="STDitalic">L'Ère du soupçon</span>, Paris, Gallimard, coll. « folio essais », 2019 [1956], p. 15-55</span></span>, notons qu'alors que Nathalie Sarraute tenait un discours théorique sur la proximité de ces deux auteurs présentés par les critiques de son époque comme étant les figures de deux arts romanesques opposés ; Alain Robbe-Grillet , lui, ne se sert de ces référents que comme d'autorités sous lesquelles placer ses propres apports théoriques.</p>
										
										<p>C'est là, l'enjeu : se réclamer d'un héritage glorieux dont le lecteur perçoit l'homogénéïté sans se risquer à le contredire afin de conférer à ses propres écrits une légitimité incontestable.</p>
										
										<h4>Les précurseurs relativement méconnus</h4>
										<p>Il s'agit de Raymond Roussel, Joë Bousquet, Italo Svevo ; trois auteurs à propos desquels Robbe-Grillet a écrit des comptes-rendus intégrés au recueil. Nettement moins illustres, mais loin d'être tout à fait inconnus ces trois auteurs semblent servir à justifier l'assertion selon laquelle, les recherches formelles du Nouveau Roman seraient à considérer avec circonspection, voire mépris.</p>
										<p>Notons l'inversion produite par la mise en recueil : ces critiques étant généralement parmi les premiers écrits publics de Alain Robbe-Grillet , elles contribuèrent à installer sa stature d'écrivain, grâce à laquelle, une fois le recueil constitué, il semble mettre à portée du grand public des auteurs connus mais encore considérés comme aussi illustres que Kafka ou Dostoïevski.</p>
									<h4>Les modernes</h4>
										<p>Catégorie qui paraît la plus difficile à délimiter clairement tant Robbe-Grillet emploie volontiers l'expression « roman moderne<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 32, p. 36, p. 38, p. 89</span></span> » sans jamais mentionner d'auteurs contemporains qu'il y rattacherait. Plus encore que les autres, cette catégorie doit être investie par le lecteur afin qu'il dégage lui-même, les auteurs ou les œuvres citées qui semblent devoir y être rattachés.</p>
										<p>Gardons à l'esprit que ses catégories et particulièrement celle-ci, n'étant pas clairement définies mais seulement mentionnées de manière allusive laisse au lecteur le soin d'effectuer les recoupements. L'exercice est d'autant plus difficile que les plus clairement identifiées comme étant « des grandes œuvres contemporaines<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 32</span></span> » : <span class="STDitalic">La Nausée</span>, <span class="STDitalic">L'Étranger</span>, Beckett, Faulkner, <span class="STDitalic">Le Château</span> et <span class="STDitalic">Voyage au bout de la nuit</span>, sont réunies à ce stade du texte pour ne plus être mentionnées (le <span class="STDitalic">Voyage</span>) ou âprement critiquées (<span class="STDitalic">La Nausée</span>, <span class="STDitalic">L'Étranger</span>). L'appel régulier à Beckett est ici frappant : il fait l'objet d'une critique très élogieuse et est souvent convoqué comme le signe d'un changement d'époque. Cela semble faire de lui plus qu'un contemporain, un contemporain illustre : Beckett est alors un auteur connu et reconnu dont nul ne remettra en cause la modernité. Si l'on pourrait dire de Pinget qu'il est montré comme tout aussi moderne (si ce n'est plus d'après l'ordre des critiques), sa notoriété n'égalant pas celle de Beckett, Alain Robbe-Grillet  se garde de le mentionner. En quête de légitimité, Alain Robbe-Grillet  semble appliquer à ses contemporains le traitement que lui réserve (selon lui) la critique : un « demi-silence<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 7</span></span> ». Le fait que le Nouveau Roman n'ait jamais été (et plus encore à ses débuts) un groupe clairement constitué explique sans doute en partie la difficulté de citer des contemporains si proches dont les travaux empruntent parfois des directions tout à fait différentes. Le point commun des modernes est une définition négative, pour des formes nouvelles mais surtout contre une forme traditionnelle :</p>
										<p class="STDquote">
											« ceux qui cherchent de nouvelles formes romanesques, capables d’exprimer (ou de créer) de nouvelles relations entre l’homme et le monde, tous ceux qui sont décidés à inventer le roman, c’est-à-dire à inventer l’homme. Ils savent, ceux-là, que la répétition systématique des formes du passé est non seulement absurde et vaine, mais qu’elle peut même devenir nuisible : en nous fermant les yeux sur notre situation réelle dans le monde présent, elle nous empêche en fin de compte de construire le monde et l’homme de demain<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 9-10</span></span>. »</p>
									<p>C'est pourquoi Sartre et Camus pourtant cités parmi les grands auteurs contemporains sont également rejetés hors de la modernité au sein de l'article « Nature, humanisme, tragédie » car ils ne vont pas assez loin dans le rejet des formes anciennes. Ainsi lit-on pages 70-71 que <span class="STDitalic">L'Étranger</span> « n’est-il pas écrit dans un langage aussi <span class="STDitalic">lavé</span> que les premières pages peuvent le laisser croire » et citant Sartre<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Sartre</span> Jean-Paul, <span class="STDitalic">Situations I</span>, Paris, Gallimard, coll. « folio essais », [1947], 2020</span></span> « il pense que Camus, "infidèle à son principe, fait de la poésie". Ne peut-on pas dire, plutôt, que ces métaphores sont justement l’explication du livre ? Camus ne refuse pas l’anthropomorphisme, il s’en sert avec économie et subtilité, pour lui donner plus de poids ». Puis s'attaquant à <span class="STDitalic">La Nausée</span>, Alain Robbe-Grillet  va s'employer à en soulever toutes les fautes stylistiques qui en font un ouvrage de la tragédie et de la profondeur : « Tout se passe donc comme si Sartre – qui ne peut pourtant pas être accusé d’essentialisme – avait, dans ce livre du moins, porté à leur plus haut degré les idées de nature et de tragédie. Une fois de plus, lutter contre ces idées n’a fait d’abord que leur conférer des forces nouvelles<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 76</span></span> ».Là est l'erreur de Camus et de Sartre, ils ne sont pas assez défaits des formes classiques : Robbe-Grillet relève les adjectifs viscéraux employés par Sartre ou Camus, souligne l'analogie comme seul mode de description envisagé par le narrateur<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 75</span></span>, dit de <span class="STDitalic">L'Étranger</span> qu'il n'est pas assez « lavé ». Ces fautes sont à considérer comme des erreurs stylistiques : on est là, dans l'antithèse exacte de ce que Robbe-Grillet considère, devoir être la voie du roman futur :</p>
										
										<p class="STDquote">
											Refuser notre prétendue « nature » et le vocabulaire qui en perpétue le mythe, poser les objets comme purement extérieurs et superficiels [...]. Aussi rien ne doit-il être négligé dans l’entreprise de nettoyage. En y regardant de plus près, on s’aperçoit que les analogies anthropocentristes (mentales ou viscérales) ne doivent pas être mises seules en cause. Toutes les analogies sont aussi dangereuses<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 64</span></span>.
										</p>
										
										<p class="STDquote">
											C’est donc tout le langage littéraire qui devrait changer, qui déjà change. Nous constatons, de jour en jour, la répugnance croissante des plus conscients devant le mot à caractère viscéral, analogique ou incantatoire. Cependant que l’adjectif optique, descriptif, celui qui se contente de mesurer, de situer, de limiter, de définir, montre probablement le chemin difficile d’un nouvel art romanesque<span class="STDnote">*<span class="STDnoteinfo"><span class="STDitalic">Op. cit.</span>, p. 27</span></span>.
										</p>
									<p>Il semblerait que parmi les modernes il faille surtout considérer Alain Robbe-Grillet  : définissant les critères de la modernité à partir de ses œuvres et selon son style, le moindre écart éloigne de fait, l'auteur de la modernité. Il convient ici de ne pas perdre de vue que cet effet vient également de la nature des textes intégrés au recueil : ces écrits théoriques servent d'abord à défendre les œuvres de son auteur et à les rendre accessibles au large public. Cela explique également pourquoi Claude Simon est, lui, mentionné explicitement comme un auteur aussi moderne que Robbe-Grillet dans « Nouveau roman, homme nouveau » paru en 1961. Ce texte, dont les considérations esthétiques sont bien plus générales que les précédents, est plus tardif et tente d'instaurer le collectif du Nouveau Roman.</p>
										<p>Fait méritant commentaire : parmi les grandes œuvres contemporaines sont mentionnés deux auteurs (Faulkner et Kafka) pourtant leurs écrits sont maintes fois identifiés comme étant des œuvres du passé, proche, mais du passé. Nous pensons que cela illustre la double détermination des catégories selon les postulats de l'œuvre : une théorie diachronique de l'évolution des formes littéraires et une théorie esthétique tendant vers la synchronie. Ainsi les auteurs début <span class="STDsc">xx</span><span class="STDexposant">e</span> peuvent être rattachés à un passé proche, tout en étant convoqués comme membre du contemporain. De ces deux postulats, il faut bien saisir que le second prime sur le premier : d'où l'exclusion si frontale des existentialistes et l'inclusion d'auteurs relativement anciens au sein de l'ensemble contemporain. La littérature du passé, notamment la tradition, semble selon Robbe-Grillet devoir être lue avec les outils du présent et au besoin, réévaluée.</p>
										<p>Notons encore une fois l'absence de Nathalie Sarraute. Sont-ce ici les désaccords sur la modernité littéraire à venir (déjà abordés <span class="STDitalic">supra</span>) ou le besoin d'effacer de trop importantes dettes théoriques ?</p>
										<p>De manière générale nous observons que plus les référents sont lointains et/ou illustres moins ils sont cités ; plus les référents sont contemporains, moins ils sont mentionnés et si quelques-uns sont très cités c'est qu'ils sont critiquables. Il semble que chez Robbe-Grillet pour faire partie des modernes irréprochables, il vaille mieux être mort. À cette attitude, nous voyons plusieurs explications :</p>
										<ul>
											<li> Robbe-Grillet ne souhaite pas qu'un autre moderne lui fasse de l'ombre.</li>
												<li> Vanter l'écriture d'un contemporain, c'est se risquer à se dédire le jour où l'on (soi-même ou le public auquel on s'adresse) le trouvera, finalement, moins moderne.</li>
													<li> Les publications originales s'apparentent davantage à des billets d'humeurs défendant la littérature de Robbe-Grillet selon des principes esthétiques généraux, avant de définir un groupe autour de ces principes dont Robbe-Grillet est l'exemple le plus proche de son auteur.</li>
														<li> En quête de légitimité, il paraît plus efficace de se réclamer d'anciens illustres que de contemporains inconnus (du moins, pas encore illustres).</li>
										</ul>
										
								</article>
							</xsl:when>
							<xsl:when test="$content='disp'">
								<article class="comment">
								<h2>La mise en recueil d'articles disparates</h2>
								<p>Le recueil <span class="STDitalic">Pour un nouveau roman</span>  est une collection de plusieurs articles publiés dans des journaux et des revues aux profils divers, allant du quotidien national <span class="STDitalic">L'Express</span> à la revue spécialisée <span class="STDitalic">Critique</span>. Le travail d'identification des sources primaires des articles et de la mise en recueil ayant déjà été mené par Mme Galia <span class="STDsc">Yanoshevsky</span> <span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les Discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006</span></span>, cette section du présent travail reprend pour la majeure partie les observations de Galia <span class="STDsc">Yanoshevsky</span> .</p>
								<p class="STDquote">
									L’ensemble des essais manifeste un développement qui se donne comme un palimpseste, tout en exposant graduellement le programme qu’il propose pour le Nouveau Roman. L’effet de palimpseste est produit par la répétition des mêmes thèmes – profondeur et surfaces, descriptions et notions périmées tels le personnage et l’intrigue – chaque fois traités sous différents angles<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 87</span></span>.</p>
							<p>	Le recueil est constitué de treize articles parmi lesquels cinq sont en réalité des critiques d'œuvres, dont la portée théorique plus générale n'est explicitée que par la mise en recueil elle-même.</p>
								<p>Au moment de la publication de <span class="STDitalic">Pour un nouveau roman</span> , Alain Robbe-Grillet  est un auteur connu du public : ses chroniques dans des journaux grand public (<span class="STDitalic">L'Express</span> dès 1955, <span class="STDitalic">Le Figaro</span> en 1962 et en 1963 en réponse à un critique du journal, <span class="STDitalic">France Observateur</span> tout au long de l'année 1957) donnent à Robbe-Grillet une stature aux yeux du public<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 77</span></span> que la publication du recueil consacre définitivement. Encore aujourd'hui, le nom de Robbe-Grillet est synonyme de « chef de file du nouveau roman ».</p>
								
								<p>Bruce Morissette<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Morissette</span> Bruce, <span class="STDitalic">Les Romans de Robbe-Grillet</span>, Paris, Éditions de Minuit, 1971 [1963]</span></span> souligne que les premières théories de Robbe-Grillet sont publiées dans les essais critiques qu'il publie dans la revue <span class="STDitalic">Critique</span> et <span class="STDitalic">Nouvelle Revue Française</span> dès 1953. Ces cinq critiques (un sixième texte de ce sous-ensemble en constitue une introduction rédigée pour le recueil), en plus de servir à donner une filiation au mouvement du Nouveau Roman, servent également la constitution d'un public, d'une communauté de sens et de références. Lisant ces critiques, le lecteur chausse en quelque sorte les lunettes de Robbe-Grillet. Par ailleurs, ce détour par la critique sert la mise en scène d'une pensée qui ne se veut pas purement théorique et une mise en perspective de cette pensée : elle dépasse très largement les seules œuvres de Robbe-Grillet et permet de saisir des enjeux esthétiques contemporains aux origines plus anciennes. Enfin, le recueil, devenant par l'adjonction de ses critiques un texte ouvertement composite, paraît traiter de sujets d'autant plus riches et vastes que son contenu formel en est hétérogène.</p>
								<p>Les critiques intégrées à <span class="STDitalic">Pour un nouveau roman</span>  sont identifiées par Galia <span class="STDsc">Yanoshevsky</span>  :</p>
								<ul>
									<li> « Samuel Beckett, Auteur dramatique », <span class="STDitalic">Critique</span>, n° 69, février 1953, p. 108-114</li>
										<li> « Joë Bousquet le rêveur », <span class="STDitalic">Critique</span>, n° 77, octobre 1953, p. 819-829</li>
											<li> «Un roman qui s'invente lui-même »,<span class="STDitalic">Critique</span>, n° 80, janvier 1954, p. 82-88</li>
												<li> « La conscience malade de Zeno », <span class="STDitalic">Nouvelle Revue Française</span>, n° 19, juillet 1954, p. 138-141</li>
													<li> « Samuel Beckett ou la présence sur la scène », <span class="STDitalic">Critique</span>, n° 189, février 1963, p. 108-114</li>
														<li> « Énigmes et transparences chez Raymond Roussel », <span class="STDitalic">Critique</span>, n° 199, décembre 1963, p. 1027-1033</li>
								</ul>
								
								
								
								<p>C'est après la publication de son deuxième roman <span class="STDitalic">Le Voyeur</span><span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Robbe-Grillet</span> Alain,<span class="STDitalic">Le Voyeur</span>, Paris, Éditions des Minuit, 1955</span></span> couronné du prix des critiques et surtout de ce que les Éditions de Minuit appelèrent « la querelle du voyeur », qu'Alain Robbe-Grillet  commence à publier dans <span class="STDitalic">L'Express</span> des articles aux visées proprement théoriques dans la série de neuf chroniques intitulées « Littérature aujourd'hui ». D'après Bruce Morissette, cette controverse lancée par Émile Henriot dans <span class="STDitalic">Le Monde</span><span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Henriot</span> Émile, « Le prix des critiques "<span class="STDitalic">Le Voyeur</span>", d'Alain Robbe-Grillet, <span class="STDitalic">Le Monde</span>,15 juin 1955</span></span> marque le début des colloques, articles et analyses du phénomène « Nouveau Roman ». Au sein de l'arène médiatique, Robbe-Grillet expose ses vues sur la littérature et s'expose lui-même en tant que progressiste opposé, entre autre, aux Académiciens (dont Émile Henriot fait partie). Galia <span class="STDsc">Yanoshevsky</span>  identifie ces neuf articles<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 77</span></span> :</p>
								<ul>
									<li> « Réalisme et révolution », 3 janv. 1955, p. 15.</li>
									<li> « Il écrit comme Stendhal », 25 oct. 1955, p. 8.</li>
									<li> « Pourquoi la mort du roman ? », 8 nov. 1955, p. 8.</li>
									<li> « L’écrivain lui aussi doit être intelligent », 22 nov. 1955, p. 10.</li>
									<li> « Les Français lisent trop », <span class="STDitalic">L’Express</span>, 6 déc. 1955, p. 11.</li>
									<li> « Littérature engagée, littérature réactionnaire », 20 déc. 1955, p. 11.</li>
									<li> « Pour un réalisme de la présence », 17 janv. 1956.</li>
																<li> « Kafka discrédité par ses descendants », 31 janv. 1956, p. 11.</li>
																	<li> « Le réalisme socialiste est bourgeois », 21 févr. 1956, p. 11.</li>
								</ul>
								<p>parmi lesquels seuls « Réalisme et révolution », « Il écrit comme Stendhal », « Littérature engagée, littérature réactionnaire », « Pour un réalisme de la présence » et « Le réalisme socialiste est bourgeois » sont intégrés à <span class="STDitalic">Pour un nouveau roman</span> . Concernant cette série d'articles, Galia <span class="STDsc">Yanoshevsky</span>  note qu'elle contient déjà le ton polémique s'attaquant aux autres littératures et l'appel à un renouveau de la littérature par la fondation d'un « nouveau réalisme »<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 80</span></span>. Toujours dans sa thèse, Galia <span class="STDsc">Yanoshevsky</span>  résume les thèses de l'ensemble des articles. À la lecture de ces résumés, il nous paraît légitime de penser que certains articles n'ont pas été retenus car leur finalité fut jugée redondante :</p>
								<ul>
									<li> « Pourquoi la mort du roman ? » dénonce l'idée selon laquelle le roman serait en train de disparaître. Une nouvelle définition de ce qui constitue le réalisme suffirait pour permettre au roman de se renouveler et donc de survivre. En plus d'être l'un des fils directeurs du recueil, cette affirmation est étayée en détail dans l'article « Du réalisme à la réalité » (issu d'une publication du <span class="STDitalic">Figaro</span><span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Robbe-Grillet</span> Alain, « Monsieur personne répond... Pour un "nouveau roman" », Paris, <span class="STDitalic">Le Figaro Littéraire</span>, 5-11 décembre 1963, p. 1-26</span></span>, deux articles de <span class="STDitalic">L'Express</span><span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Robbe-Grillet</span> Alain, « Réalisme et révolution », Paris, <span class="STDitalic">L'Express</span>, 3 janvier 1955, p. 15 et « Pour un réalisme de la présence », Paris, <span class="STDitalic">L'Express</span>, 17 janvier 1956, p. 11</span></span> et l'entretien de <span class="STDitalic">Tel Quel</span><span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Robbe-Grillet</span> Alain, « La Littérature aujourd'hui – <span class="STDsc">vi</span> », n° 14, été 1963, p. 39-45</span></span>).</li>
										<li> « L’écrivain lui aussi doit être intelligent » s'attaque au <span class="STDitalic">topos</span> selon lequel ce serait l'« alcoolisme, le malheur, la passion mystique, la folie » des écrivains qui seraient à l'origine des chefs d'œuvre. Alain Robbe-Grillet  défend dès le premier texte du recueil final le droit de l'écrivain à écrire et théoriser en conscience.</li>
											<li> « Les Français lisent trop » se veut la définition d'un public au Nouveau Roman et discute la difficulté à proposer des innovations en littérature. Ce sont là les enjeux du recueil achevé régulièrement abordés, notamment dans « Temps et description dans le roman d'aujourd'hui ».</li>
												<li> « Kafka discrédité par ses descendants » s'attaque à une lecture métaphysique de Kafka (selon laquelle ses romans laisseraient entrevoir un « au-delà inaccessible »). Si <span class="STDitalic">Pour un nouveau roman</span>  fait l'impasse sur une quelconque analyse de Kafka, les références multiples à Kafka tout au long du recueil, en tant que précurseur, suffisent à imposer comme une évidence le fait que ses écrits participeraient des théories esthétiques de Robbe-Grillet.</li>
								</ul>
								
								<p>Une seconde série d'articles est publiée au cours de l'année 1957 dans la rubrique « La vie des lettres, Littérature d’aujourd’hui » de l'hebdomadaire <span class="STDitalic">France Observateur</span> :</p>
								<ul>
									<li> « Écrire pour son temps », n° 387, 10 oct. 1957, p. 17.</li>
										<li> « Il n’y a pas "d’avant-garde" », n° 388, 17 oct. 1957, p. 19.</li>
											<li> « La mort du personnage », n° 389, 24 oct. 1957, p. 20.</li>
												<li> « Un joli talent de conteur… » n° 390, 31 oct. 1957, p. 19.</li>
													<li> « La forme et le contenu », n° 392, 14 nov. 1957, p. 19.</li>
								</ul>
								<p>Identifiés par Galia <span class="STDsc">Yanoshevsky</span> , tous ces articles sont à l'origine de l'article le plus proche des thèses de Nathalie Sarraute<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Sarraute</span> Nathalie, <span class="STDitalic">L'Ère du soupçon</span>, Paris, Gallimard, coll. « folio essais », 2019 [1956]</span></span> intitulé « De quelques notions périmées ». Ces articles sont marqués par une opposition vis-à-vis de la critique, du moins des termes qu'elle emploie, qualifiés de « lieux communs » dans « Il n’y a pas "d’avant-garde" ».</p>								
		<p>						Enfin <span class="STDitalic">Pour un nouveau roman</span>  est également constitué d'articles de revues, au ton moins polémique et occupant au sein du recueil des places importantes (le premier et les derniers articles du versant plus théorique de <span class="STDitalic">Pour un nouveau roman</span> ). Ces articles « entérin[ent] les conceptions développées dans les journaux<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 84</span></span> » et consacrent le passage « d’un romancier et critique débutant et controversé, à l’expression théorique de l’écrivain qui participe activement aux polémiques littéraires de son époque, et affronte les figures principales de la scène littéraire dominante<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 84</span></span> ». Quatre articles publiés dans des revues spécialisées sont intégrés à <span class="STDitalic">Pour un nouveau roman</span>  :</p>
								<ul>
									<li> « Une voie pour le roman futur », <span class="STDitalic">Nouvelle Revue Française</span>, n° 43, juillet 1956, p. 77-84.</li>
										<li> « Nature, Humanisme, Tragédie », <span class="STDitalic">Nouvelle Revue Française</span>, n° 70, octobre 1958, p. 580-603.</li>
											<li> « Nouveau Roman, homme nouveau », <span class="STDitalic">Revue de Paris</span>, n° 68, septembre 1961, p. 115-121.</li>
												<li> « La Littérature aujourd'hui – VI », <span class="STDitalic">Tel Quel</span>, n° 14, été 1963, p. 39-45. Il s'agit du sixième entretien d'une série d'<span class="STDitalic">interviews</span> sur la situation de la littérature, Robbe-Grillet y est alors convoqué en tant que chef de file déclaré du Nouveau Roman<span class="STDnote">*<span class="STDnoteinfo"><span class="STDsc">Yanoshevsky</span> Galia, <span class="STDitalic">Les discours du Nouveau Roman : Essais, entretiens, débats</span>, Villeneuve d'Ascq, Presses universitaires du Septentrion, 2006, p. 88</span></span>.</li>
								</ul>
								</article>
							</xsl:when>
							<xsl:when test="$content='index0'">
								<article class="index">
									<section class="intro">
										<h2>Introduction à l'index des notions adverses</h2>
										<p></p>
										<details><summary>Méthode d'encodage</summary>
											<p>Les expressions devant figurer dans ces index sont encodées en tant que &lt;term/&gt;, « terme (considéré technique) »au sein d'éléments &lt;span&gt; « passage lié à une interprétation », munis d'attributs @type dont les valeurs « 0 » ou « 1 » orientent grâce à la transformation XSL, le mot vers l'index des concepts adverses ou des expressions privilégiées, respectivement. Les éléments &lt;span&gt; englobe l"expression et son contexte permettant de l'expliciter (en effet la recension des adjectifs « vrai » ou « difficile »  seuls serait de peu d'intérêt), l'expression encodée en &lt;term&gt; est ensuite mise en valeur via css, en rouge ou vert pour les notions adverses ou les expressions privilégiées respectivement.</p>
											<p>Dans une version précédente soumise à évaluation nous nous proposions d'encoder ces éléments avec le couple &lt;w/&gt; « <span class="STDitalic">word</span> » et &lt;ab/&gt; « <span class="STDitalic">arbitrary segment</span> ». Cette solution a finalement était rejetée car elle n'était pas valide en xml-tei. Aussi, nous sommes-nous orientés vers des éléments plus spécifiques : employant des chercher/remplacer pour remplacer tous les élémnents &lt;w/&gt; déjà placés en élément &lt;term/&gt;.<br />Enfin, notre transformation xsl de balisage semi-automatique, légèrement modifiée nous permit de faire remonter l'attribut @type placé sur les éléments &lt;w&gt; sur les éléments &lt;span&gt;.</p></details>
										<h3>Des dichotomies structurantes</h3>
										
										<p>Ces techniques qui servent l'argumentation sont sous-tendues et mises en mouvement par un jeu d'oppositions frontales : et si à chaque proposition des adversaires, il n'y a pas toujours une réponse terme à terme ; le lecteur décèle une axiologie sous-jacente qui organise (peut-être plus qu'elle ne résulte de) l'ensemble de la démonstration. Cette axiologie est d'autant plus perceptible que les termes qui la composent sont clairement identifiés.</p>
										
										<p>Au sein de <span class="STDitalic">Pour un nouveau roman</span>   les termes qui constituent selon Robbe-Grillet le débat sont l'objet même du débat. Ainsi s'ouvre « Sur quelques notions périmées » à la page 29 :</p>
										<p class="STDquote">
											La critique traditionnelle a son vocabulaire. Bien qu’elle se défende beaucoup de porter sur la littérature des jugements systématiques (prétendant, au contraire, aimer librement telle ou telle œuvre d’après des critères « naturels » : le bon sens, le cœur, etc.), il suffit de lire avec un peu d’attention ses analyses pour voir aussitôt paraître un réseau de mots-clefs, trahissant bel et bien un système.
											
											Mais nous sommes tellement habitués à entendre parler de « personnage », d’« atmosphère », de « forme » et de « contenu », de « message », du « talent de conteur » des « vrais romanciers », qu’il nous faut un effort pour nous dégager de cette toile d’araignée et pour comprendre qu’elle représente une idée sur le roman (idée toute faite, que chacun admet sans discussion, donc idée morte), et point du tout cette prétendue « nature » du roman en quoi l’on voudrait nous faire croire.
										</p>
										<p>Il s'agit également pour Robbe-Grillet de faire accepter à ses adversaires, ou plutôt à ses lecteurs, le fait que ce sont bien les termes qui sont en débat : que « personnage » et « histoire » ne sont pas des évidences. Leur emploi ainsi mis en valeur, le signe est mis en valeur et son emploi impropre souligné par l'argumentaire, comme à la page 48 :</p>
										<p class="STDquote">
											Il est dès lors normal que l'accusation de « formalisme » soit l'une des plus graves dans la bouche de nos censeurs des deux bords.
										</p>
										
										<p>Explicité dans la lettre du texte, le procédé est avant tout explicité par des choix stylistiques qui relèvent de la typographie. De manière quasi-systématique, les notions adverses qui se superposent souvent efficacement aux notions périmées, sont encadrées de guillemets, alors que des expressions privilégiées par Robbe-Grillet sont mises en valeur par l'italique.</p>
										
										<p>Ce procédé est courant et s'inscrit dans les conventions habituelles des essais, mais chez Robbe-Grillet cet usage prend une place prépondérante et structure l'ensemble du recueil. Nous nous sommes efforcés au sein de notre édition numérique de produire un inventaire sous la forme de deux index de ces notions adverses et expressions privilégiées (reproduits en annexe <span class="STDitalic">infra</span> voir : <a href="#gloss">ici</a>).</p>
										
										<p>Notons que l'appréciation « privilégiées » porte bien sur la formulation et non le contenu sémantique : « Aussi le livre n’est-il pas écrit dans un langage [...]. Seuls, en effet, les objets déjà chargés d’un contenu humain flagrant sont neutralisés, avec soin, et <span class="STDitalic">pour des raisons morales</span> » page 69, n'est pas privilégié le fait de choisir son style pour des raisons morales mais bien le propos de Robbe-Grillet sur le style de <span class="STDitalic">L'Étranger</span>, et ce, peu importe le statut axiologique de ce style au sein de <span class="STDitalic">Pour un nouveau roman</span> .</p>
										
										<p>Précisons que tous les termes entre guillemets ne sont pas nécessairement considérés comme l'une de ces « notions adverses ». Les guillemets marquent également les citations extraites d'ouvrages ou de propos fictifs prêtés à des personnages invoqués pour les besoins de l'argumentation (voir <span class="STDitalic">supra</span> : <a href="#histoireDispute">ici</a>). Cependant les notions adverses, mise entre guillemets se superposent bel et bien à des citations, bien qu'il ne fasse aucun doute qu'il s'agit là du propos de l'auteur. Ce dernier insiste sur sa répugnance à les employer et se dégage de la responsabilité de cette partie de l'énoncé.</p>
										
										<p>Les uns étant l'exact opposé des autres : les expressions privilégiées sont des signifiants mis en valeur pour leur qualité indépendamment de l'approbation ou non de l'auteur sur leur signifié ; les notions adverses sont des signifiants dénigrés au nom d'une relation fautive entre ce signifiant et son signifié (on ne devrait pas dire « l'humain » ou « l'inhumain\footnote{<span class="STDitalic">Op. cit.</span>, p.  56-58 » car le propos est faux).</p>
										
										
										<p>Il n'en va pas tout à fait de même pour les termes en italique. En effet, si l'intuition d'origine avait pour origine les mises en valeurs typographiques de certains termes, mis entre guillemets sans être des citations ou mis en italique, il semblait évident que tous les termes entre guillemets ne méritaient pas d'être intégrés en tant que « notions adverses » et tous les termes en italiques en « expressions privilégiées » ; certains étaient des citations, d'autres un simple procédé d'emphase.</p>
										
										<p>Or, à bien y regarder les expressions privilégiées n'étaient-elles pas toutes des effets d'emphase ? Ne voit-on pas plutôt Robbe-Grillet insister sur telle ou telle formulation par opposition à une autre explicitement mentionnée ou non ? 
										</p>
										
										<p>C'est en tout cas ce qui nous est apparu après un examen minutieux. En effet, les expressions privilégiées loin de revêtir l'évidence de concepts nettement définis sont davantage des adjectifs qui changent le sens des termes qui les entourent et font signe vers les concepts d'une philosophie, du moins d'une esthétique qui se définit surtout par son opposition à la métaphysique éculée contre laquelle Robbe-Grillet engage son texte. Ainsi les articles indéfinis « <span class="STDitalic">des</span> questions, et <span class="STDitalic">des</span> réponses » page 64, l'adjectif « vrai » pages 24 et 162 (3 fois) et les multiples occurrences du verbe « être » souvent accompagnées de l'adverbe « là » (pages 20, 21, 177), expressions privilégiées contenant une assertion positive sont-ils parmi les termes les plus courants de la langue française et, seuls, difficilement rattachables à telle ou telle théorie esthétique, si ce n'est à une insistance sur l'immanence opposée à la métaphysique prêtée aux adversaires de Alain Robbe-Grillet . Sans doute la relative banalité des termes mis en avant par la typographie sert-elle la démonstration : l'acceptation difficilement contestable de l'immanence des choses  se trouve aussi dans ce choix typographique qui sert à démontrer avec force que l'évidence, c'est-à-dire le bon sens, est du côté de Robbe-Grillet.</p>
										
										
										
										
										
										<p>De même si les oppositions ne sont pas systématiques (un terme en italique ne répond pas toujours à une expression entre guillemets) le jeu d'opposition est suffisamment soutenu tout au long du recueil pour jouer sur l'implicite et laisser au lecteur le soin d'investir les dichotomies, les faisant siennes au passage. Ainsi l'emploi de l'expression « <span class="STDitalic">vraie</span> ville\footnote{<span class="STDitalic">Op. cit.</span>, p. 163 » pour désigner Istanbul dans <span class="STDitalic">L'Immortelle</span> induit <span class="STDitalic">via</span> le détour implicite par l'expression antithétique « une <span class="STDitalic">fausse</span> ville », le dénigrement du commentaire des critiques sur la représentation qui en est faite, tant il paraît ridicule qu'Istanbul serait une <span class="STDitalic">fausse</span> ville, <span class="STDitalic">a fortiori</span> dans une œuvre cinématographique.</p>
										
										
										<p>Enfin rappelons que le débat sur les termes semble l'un des enjeux (sinon le seul) du recueil. Ces expressions privilégiées contre des notions adverses induisent un positionnement esthétique profondément inscrit dans son époque, contre Sartre (alors même qu'il reprend certain de ses termes) et pour une mesure de la valeur littéraire en fonction de l'écart qu'une œuvre creuse entre ses principes et ceux de l'habitude.</p>
										<!--<h3>Méthode d'encodage</h3>
										<p></p>-->
									</section>
									<!--									<div class="separ"/>-->
									<section class="index bad">
										<h2>Index des notions adverses</h2>
										<ul>
											<!--											<xsl:apply-templates select="//term[@type='0']" mode="adv_index"/>-->
											<xsl:apply-templates select="//span[@type='0']" mode="adv_index"/>
										</ul>
									</section>
									<!--<section class="index">
										<h2>Index des expressions privilégiées</h2>
										<ul>
											<!-\-											<xsl:apply-templates select="//term[@type='1']" mode="pref_index"/>-\->
											<xsl:apply-templates select="//span[@type='1']" mode="pref_index"/>
										</ul>
									</section>-->
								</article>
							</xsl:when>
							<xsl:when test="$content='index'">
								<article class="index">
									<section class="intro">
										<h2>Introduction à l'index des expressions privilégiées</h2>
										<p></p>
										<details><summary>Méthode d'encodage</summary>
											<p>Les expressions devant figurer dans ces index sont encodées en tant que &lt;term/&gt;, « terme (considéré technique) »au sein d'éléments &lt;span&gt; « passage lié à une interprétation », munis d'attributs @type dont les valeurs « 0 » ou « 1 » orientent grâce à la transformation XSL, le mot vers l'index des concepts adverses ou des expressions privilégiées, respectivement. Les éléments &lt;span&gt; englobe l"expression et son contexte permettant de l'expliciter (en effet la recension des adjectifs « vrai » ou « difficile »  seuls serait de peu d'intérêt), l'expression encodée en &lt;term&gt; est ensuite mise en valeur via css, en rouge ou vert pour les notions adverses ou les expressions privilégiées respectivement.</p>
											<p>Dans une version précédente soumise à évaluation nous nous proposions d'encoder ces éléments avec le couple &lt;w/&gt; « <span class="STDitalic">word</span> » et &lt;ab/&gt; « <span class="STDitalic">arbitrary segment</span> ». Cette solution a finalement était rejetée car elle n'était pas valide en xml-tei. Aussi, nous sommes-nous orientés vers des éléments plus spécifiques : employant des chercher/remplacer pour remplacer tous les élémnents &lt;w/&gt; déjà placés en élément &lt;term/&gt;.<br />Enfin, notre transformation xsl de balisage semi-automatique, légèrement modifiée nous permit de faire remonter l'attribut @type placé sur les éléments &lt;w&gt; sur les éléments &lt;span&gt;.</p></details>
										<h3>Des dichotomies structurantes</h3>
										
										<p>Ces techniques qui servent l'argumentation sont sous-tendues et mises en mouvement par un jeu d'oppositions frontales : et si à chaque proposition des adversaires, il n'y a pas toujours une réponse terme à terme ; le lecteur décèle une axiologie sous-jacente qui organise (peut-être plus qu'elle ne résulte de) l'ensemble de la démonstration. Cette axiologie est d'autant plus perceptible que les termes qui la composent sont clairement identifiés.</p>
										
										<p>Au sein de <span class="STDitalic">Pour un nouveau roman</span>   les termes qui constituent selon Robbe-Grillet le débat sont l'objet même du débat. Ainsi s'ouvre « Sur quelques notions périmées » à la page 29 :</p>
										<p class="STDquote">
											La critique traditionnelle a son vocabulaire. Bien qu’elle se défende beaucoup de porter sur la littérature des jugements systématiques (prétendant, au contraire, aimer librement telle ou telle œuvre d’après des critères « naturels » : le bon sens, le cœur, etc.), il suffit de lire avec un peu d’attention ses analyses pour voir aussitôt paraître un réseau de mots-clefs, trahissant bel et bien un système.
											
											Mais nous sommes tellement habitués à entendre parler de « personnage », d’« atmosphère », de « forme » et de « contenu », de « message », du « talent de conteur » des « vrais romanciers », qu’il nous faut un effort pour nous dégager de cette toile d’araignée et pour comprendre qu’elle représente une idée sur le roman (idée toute faite, que chacun admet sans discussion, donc idée morte), et point du tout cette prétendue « nature » du roman en quoi l’on voudrait nous faire croire.
										</p>
										<p>Il s'agit également pour Robbe-Grillet de faire accepter à ses adversaires, ou plutôt à ses lecteurs, le fait que ce sont bien les termes qui sont en débat : que « personnage » et « histoire » ne sont pas des évidences. Leur emploi ainsi mis en valeur, le signe est mis en valeur et son emploi impropre souligné par l'argumentaire, comme à la page 48 :</p>
										<p class="STDquote">
											Il est dès lors normal que l'accusation de « formalisme » soit l'une des plus graves dans la bouche de nos censeurs des deux bords.
										</p>
										
										<p>Explicité dans la lettre du texte, le procédé est avant tout explicité par des choix stylistiques qui relèvent de la typographie. De manière quasi-systématique, les notions adverses qui se superposent souvent efficacement aux notions périmées, sont encadrées de guillemets, alors que des expressions privilégiées par Robbe-Grillet sont mises en valeur par l'italique.</p>
										
										<p>Ce procédé est courant et s'inscrit dans les conventions habituelles des essais, mais chez Robbe-Grillet cet usage prend une place prépondérante et structure l'ensemble du recueil. Nous nous sommes efforcés au sein de notre édition numérique de produire un inventaire sous la forme de deux index de ces notions adverses et expressions privilégiées (reproduits en annexe <span class="STDitalic">infra</span> voir : <a href="#gloss">ici</a>).</p>
										
										<p>Notons que l'appréciation « privilégiées » porte bien sur la formulation et non le contenu sémantique : « Aussi le livre n’est-il pas écrit dans un langage [...]. Seuls, en effet, les objets déjà chargés d’un contenu humain flagrant sont neutralisés, avec soin, et <span class="STDitalic">pour des raisons morales</span> » page 69, n'est pas privilégié le fait de choisir son style pour des raisons morales mais bien le propos de Robbe-Grillet sur le style de <span class="STDitalic">L'Étranger</span>, et ce, peu importe le statut axiologique de ce style au sein de <span class="STDitalic">Pour un nouveau roman</span> .</p>
										
										<p>Précisons que tous les termes entre guillemets ne sont pas nécessairement considérés comme l'une de ces « notions adverses ». Les guillemets marquent également les citations extraites d'ouvrages ou de propos fictifs prêtés à des personnages invoqués pour les besoins de l'argumentation (voir <span class="STDitalic">supra</span> : <a href="#histoireDispute">ici</a>). Cependant les notions adverses, mise entre guillemets se superposent bel et bien à des citations, bien qu'il ne fasse aucun doute qu'il s'agit là du propos de l'auteur. Ce dernier insiste sur sa répugnance à les employer et se dégage de la responsabilité de cette partie de l'énoncé.</p>
										
										<p>Les uns étant l'exact opposé des autres : les expressions privilégiées sont des signifiants mis en valeur pour leur qualité indépendamment de l'approbation ou non de l'auteur sur leur signifié ; les notions adverses sont des signifiants dénigrés au nom d'une relation fautive entre ce signifiant et son signifié (on ne devrait pas dire « l'humain » ou « l'inhumain\footnote{<span class="STDitalic">Op. cit.</span>, p.  56-58 » car le propos est faux).</p>
										
										
										<p>Il n'en va pas tout à fait de même pour les termes en italique. En effet, si l'intuition d'origine avait pour origine les mises en valeurs typographiques de certains termes, mis entre guillemets sans être des citations ou mis en italique, il semblait évident que tous les termes entre guillemets ne méritaient pas d'être intégrés en tant que « notions adverses » et tous les termes en italiques en « expressions privilégiées » ; certains étaient des citations, d'autres un simple procédé d'emphase.</p>
										
										<p>Or, à bien y regarder les expressions privilégiées n'étaient-elles pas toutes des effets d'emphase ? Ne voit-on pas plutôt Robbe-Grillet insister sur telle ou telle formulation par opposition à une autre explicitement mentionnée ou non ? 
										</p>
										
										<p>C'est en tout cas ce qui nous est apparu après un examen minutieux. En effet, les expressions privilégiées loin de revêtir l'évidence de concepts nettement définis sont davantage des adjectifs qui changent le sens des termes qui les entourent et font signe vers les concepts d'une philosophie, du moins d'une esthétique qui se définit surtout par son opposition à la métaphysique éculée contre laquelle Robbe-Grillet engage son texte. Ainsi les articles indéfinis « <span class="STDitalic">des</span> questions, et <span class="STDitalic">des</span> réponses » page 64, l'adjectif « vrai » pages 24 et 162 (3 fois) et les multiples occurrences du verbe « être » souvent accompagnées de l'adverbe « là » (pages 20, 21, 177), expressions privilégiées contenant une assertion positive sont-ils parmi les termes les plus courants de la langue française et, seuls, difficilement rattachables à telle ou telle théorie esthétique, si ce n'est à une insistance sur l'immanence opposée à la métaphysique prêtée aux adversaires de Alain Robbe-Grillet . Sans doute la relative banalité des termes mis en avant par la typographie sert-elle la démonstration : l'acceptation difficilement contestable de l'immanence des choses  se trouve aussi dans ce choix typographique qui sert à démontrer avec force que l'évidence, c'est-à-dire le bon sens, est du côté de Robbe-Grillet.</p>
										
										
										
										
										
										<p>De même si les oppositions ne sont pas systématiques (un terme en italique ne répond pas toujours à une expression entre guillemets) le jeu d'opposition est suffisamment soutenu tout au long du recueil pour jouer sur l'implicite et laisser au lecteur le soin d'investir les dichotomies, les faisant siennes au passage. Ainsi l'emploi de l'expression « <span class="STDitalic">vraie</span> ville\footnote{<span class="STDitalic">Op. cit.</span>, p. 163 » pour désigner Istanbul dans <span class="STDitalic">L'Immortelle</span> induit <span class="STDitalic">via</span> le détour implicite par l'expression antithétique « une <span class="STDitalic">fausse</span> ville », le dénigrement du commentaire des critiques sur la représentation qui en est faite, tant il paraît ridicule qu'Istanbul serait une <span class="STDitalic">fausse</span> ville, <span class="STDitalic">a fortiori</span> dans une œuvre cinématographique.</p>
										
										
										<p>Enfin rappelons que le débat sur les termes semble l'un des enjeux (sinon le seul) du recueil. Ces expressions privilégiées contre des notions adverses induisent un positionnement esthétique profondément inscrit dans son époque, contre Sartre (alors même qu'il reprend certain de ses termes) et pour une mesure de la valeur littéraire en fonction de l'écart qu'une œuvre creuse entre ses principes et ceux de l'habitude.</p>
										<!--<h3>Méthode d'encodage</h3>
										<p></p>-->
									</section>
<!--									<div class="separ"/>-->
									<!--<section class="index bad">
										<h2>Index des notions adverses</h2>
										<ul>
<!-\-											<xsl:apply-templates select="//term[@type='0']" mode="adv_index"/>-\->
											<xsl:apply-templates select="//span[@type='0']" mode="adv_index"/>
										</ul>
									</section>-->
									<section class="index">
										<h2>Index des expressions privilégiées</h2>
										<ul>
<!--											<xsl:apply-templates select="//term[@type='1']" mode="pref_index"/>-->
											<xsl:apply-templates select="//span[@type='1']" mode="pref_index"/>
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
		<!--<xsl:call-template name="body">
			<xsl:with-param name="doc" select="$tl"/>
			<xsl:with-param name="title" select="'chronologie'"/>
			<xsl:with-param name="content" select="'tl'"/>
		</xsl:call-template>-->
		<xsl:call-template name="body">
			<xsl:with-param name="doc" select="$index"/>
			<xsl:with-param name="title" select="'index des expressions privilégiées'"/>
			<xsl:with-param name="content" select="'index'"/>
		</xsl:call-template>
		<xsl:call-template name="body">
			<xsl:with-param name="doc" select="$bib"/>
			<xsl:with-param name="title" select="'bibliographie'"/>
			<xsl:with-param name="content" select="'bib'"/>
		</xsl:call-template>
		<xsl:call-template name="body">
			<xsl:with-param name="doc" select="$index0"/>
			<xsl:with-param name="title" select="'Index des notions adverses'"/>
			<xsl:with-param name="content" select="'index0'"/>
		</xsl:call-template>
		<xsl:call-template name="body">
			<xsl:with-param name="doc" select="$disp"/>
			<xsl:with-param name="title" select="'Un texte disparate'"/>
			<xsl:with-param name="content" select="'disp'"/>
		</xsl:call-template>
		<xsl:call-template name="body">
			<xsl:with-param name="doc" select="$uni"/>
			<xsl:with-param name="title" select="'Unicité des articles'"/>
			<xsl:with-param name="content" select="'uni'"></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="body">
			<xsl:with-param name="doc" select="$polemos"/>
			<xsl:with-param name="title" select="'Un style polémique : des adversaires'"/>
			<xsl:with-param name="content" select="'polemos'"></xsl:with-param>
		</xsl:call-template>
		<!--<xsl:call-template name="body">
			<xsl:with-param name="doc" select=""/>
			<xsl:with-param name="title" select="''"/>
			<xsl:with-param name="content" select="''"></xsl:with-param>
		</xsl:call-template>-->
		<!--<xsl:call-template name="body">
			<xsl:with-param name="doc" select=""/>
			<xsl:with-param name="title" select="''"/>
			<xsl:with-param name="content" select="''"></xsl:with-param>
		</xsl:call-template>-->
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
	<!--<xsl:template match="term[@type='0']" mode="adv_index">
		<xsl:param name="ch" select="ancestor::div[@type='pagechap']/@xml:id"/>
		<xsl:param name="pn" select="preceding::pb[1]/@n"/>
		<li><xsl:apply-templates/><span class="STDgray"> ; [<a target="blanck" href="{concat('punr_',$ch,'.html#page_',$pn)}"><xsl:value-of select="preceding::pb[1]/@n"/></a>]</span></li>
	</xsl:template>
	
	
<!-\-	Index des formulées préférées-\->
	<xsl:template match="term[@type='1']" mode="pref_index">
		<xsl:param name="ch" select="ancestor::div[@type='pagechap']/@xml:id"/>
		<xsl:param name="pn" select="preceding::pb[1]/@n"/>
		<li><xsl:apply-templates/><span class="STDgray"> ; [<a target="blanck" href="{concat('punr_',$ch,'.html#page_',$pn)}"><xsl:value-of select="preceding::pb[1]/@n"/></a>]</span></li>
	</xsl:template>-->
	
	
	
<!--	LES DEUX INDEX DES FORMULES ETC. EN V2 AVEC <AB/>-->
	<xsl:template match="span[@type='0']" mode="adv_index">
		<xsl:param name="ch" select="ancestor::div[@type='pagechap']/@xml:id"/>
		<xsl:param name="pn" select="preceding::pb[1]/@n"/>
		<li><xsl:apply-templates mode="adv_index"/><span class="STDgray"> ; [<a target="blanck" href="{concat('punr_',$ch,'.html#page_',$pn)}"><xsl:value-of select="preceding::pb[1]/@n"/></a>]</span></li>
	</xsl:template>
	<xsl:template match="span[@type='1']" mode="pref_index">
		<xsl:param name="ch" select="ancestor::div[@type='pagechap']/@xml:id"/>
		<xsl:param name="pn" select="preceding::pb[1]/@n"/>
		<li><xsl:apply-templates mode="pref_index"/><span class="STDgray"> ; [<a target="blanck" href="{concat('punr_',$ch,'.html#page_',$pn)}"><xsl:value-of select="preceding::pb[1]/@n"/></a>]</span></li>
	</xsl:template>
	<xsl:template match="hi" mode="pref_index">
		<xsl:variable name="class">
			<xsl:if test="@rend='exposant'">STDexposant</xsl:if>
			<xsl:if test="@rend='italic'">STDitalic</xsl:if>
			<xsl:if test="@rend='small_caps'">STDsc</xsl:if>
			<!--			<xsl:if test="@rend='italic'">STDitalic</xsl:if>-->
			<!--			<xsl:if test="@rend='italic'">STDitalic</xsl:if>-->
		</xsl:variable>
		<span class="{$class}">
			<xsl:apply-templates mode="pref_index"/>
		</span>
	</xsl:template>
	<xsl:template match="term" mode="pref_index">
		<span class="Axi2"><xsl:apply-templates mode="pref_index"/></span>
	</xsl:template>
	<xsl:template match="term" mode="adv_index">
		<span class="Axi0"><xsl:apply-templates mode="adv_index"/></span>
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
	
	
<!--	NOTES ajout du 230709-->
	<xsl:template match="span[descendant::note]" mode="corpus">
		<span class="note"><xsl:apply-templates mode="corpus"/></span>
	</xsl:template>
	
<!--	MILESTONE AJOUT DU 230703-->
	<xsl:template match="milestone" mode="corpus">
		<a id="{@xml:id}" class="{local-name()}"/>
<!--		+ un autre attribut qui contient ce que JS récupère en paramètre mais on sait pas encore lequel et that's suck. Ou alors @id != généré auto et c'est @id qui fait double emploi en servant à reconstitué une string ==> js traite la string et ça c'est relou ++-->
	</xsl:template>
<!--	FIN FIN AJOUT DU 230703-->
	
	
<!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI-->
	<!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI-->
	<!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI--><!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI--><!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI--><!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI-->
	<!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI--><!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI--><!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI--><!--	LES EXTRAITS CITÉS SONT GÉRÉS ICI-->
	
	<xsl:template match="pb[not(ancestor::TEI[@xml:id='punr'])]" mode="extract">
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
			<xsl:apply-templates mode="extract"/></p>
	</xsl:template>
	<xsl:template match="hi[not(ancestor::TEI[@xml:id='punr'])]" mode="extract">
		<xsl:variable name="class">
			<xsl:if test="@rend='exposant'">STDexposant</xsl:if>
			<xsl:if test="@rend='italic'">STDitalic</xsl:if>
			<xsl:if test="@rend='small_caps'">STDsc</xsl:if>
			<!--			<xsl:if test="@rend='italic'">STDitalic</xsl:if>-->
			<!--			<xsl:if test="@rend='italic'">STDitalic</xsl:if>-->
		</xsl:variable>
		<span class="{$class}">
			<xsl:apply-templates mode="extract"/>
		</span>
	</xsl:template>
	<xsl:template match="span[descendant::note]" mode="extract">
		<span class="note"><xsl:apply-templates mode="extract"/></span>
	</xsl:template>
	
	
	<xsl:template match="note[not(ancestor::TEI[@xml:id='punr'])]" mode="extract">
		<span class="noteinfo"><xsl:apply-templates mode="extract"/></span>
	</xsl:template>

	
	
	
	
	
<!--	Les GAP 0.6em sont écarts normaux entre certains <p>
	GAP 3.7 au-dessus des titres de chapitres
	GAP 0.5 + 2.7 sont sous les titres de chapitres
	y a aussi 0.5 + 3.5 sous chapitre et .3.7 au-dessus
	y a pas de gap particulier pour les notions périmées
	
	
	le seul truc intéressant c'est les 0.6
	sous les @type="epigraph" 0.8 ou 0.9
	
	
	les titres de chapitre sont espacés n'imp.-->
	
	
</xsl:stylesheet>