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
				<li><a href="{$db_link}">Illustration de la base de données</a></li>
				<li><a href="{$tl_link}">Chronologie</a></li>
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
				</div>
			</div>
		</header>
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
										<xsl:apply-templates mode="corpus"/>
									</article>
									<section class="extract_section">
										<xsl:apply-templates mode="extract" select="//TEI[not(@xml:id='punr')]//body"/>
									</section>
								</div>
							</xsl:when>
							<xsl:when test="$content='home'">
								<article>
									<xsl:apply-templates select="//publicationStmt[1]"/>
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
			<xsl:apply-templates/>
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
	<xsl:template match="pb[ancestor::TEI/@xml:id='punr']">
		<a id="{concat('page_',@n)}"/>
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
		<span class="ref"><xsl:apply-templates/></span>
	</xsl:template>
	<xsl:template mode="corpus" match="quote">
		<xsl:choose>
			<xsl:when test="@type='epigraph'">
				<div class="epigraph" onclick="displayExtract('{@corresp}','{@ana}','{@cert}');">
						<xsl:apply-templates mode="corpus" select="p"/>
					<p class="epigraph_ref">
						<xsl:apply-templates mode="corpus" select="ref"/>
					</p>
				</div>
				
			</xsl:when>
			<xsl:otherwise>
				<span class="quote" onclick="displayExtract('{@corresp}','{@ana}','{@cert}');"><xsl:apply-templates/></span>
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
	
	
	
	
	
	
<!--	Les GAP 0.6em sont écarts normaux entre certains <p>
	GAP 3.7 au-dessus des titres de chapitres
	GAP 0.5 + 2.7 sont sous les titres de chapitres
	y a aussi 0.5 + 3.5 sous chapitre et .3.7 au-dessus
	y a pas de gap particulier pour les notions périmées
	
	
	le seul truc intéressant c'est les 0.6
	sous les @type="epigraph" 0.8 ou 0.9
	
	
	les titres de chapitre sont espacés n'imp.-->
	
	
</xsl:stylesheet>