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
			<xd:p>Conçu par Adrien Mével, étudiant en M2 EdNitl à L'unirsité de Lille dans le cadre d'un travail de recherche (mémoire) sous la direction de Mme Florence de Chalonge pour le versant scientifique et M. Mathieu Marchal pour le versant technique.</xd:p>
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
	<xsl:variable name="bib" select="concat($basename,'bibliography.html')"/>

<!--	<xsl:variable name="" select="''"/>-->
	
	
	
<!--	template pour HEAD, métadonnées title et links-->
	<xsl:template name="head">
		<xsl:param name="title"/>
		<head>
			<title><xsl:value-of select="concat('Pour un nouveau roman, ', $title)"/></title>
			<link rel="stylesheet" type="text/css" href="punr_style.css"/>
			<link rel="icon" type="image/jpg" href=""/>
			<meta charset="utf-8"/>
			<meta name="author" content="adrien mevel, mathieu marchal, florence de chalonge, alain robbe-grillet"/>
			<meta name="description" content="digital critical edition of pour un nouveau roman by alain robbe-grillet fist published in 1963 this word has been realised as student project"/>
			<meta name="keywords" content="critical, edition, digital, robbe-grillet, litterature, french, 1963, nouveau roman, alain robbe-grillet, pour un nouveau roman, xxe siecle, xx, franch theory"/>
			<link rel="javascript" src="punr_script.js"/>
				
		</head>
	</xsl:template>
<!--	template pour NAV-->
	<xsl:template name="nav">
		<nav class="nav_top">
			<ul>
				<li><a href="home.html">Accueil</a></li>
				<li><a href=""></a></li>
				<li><a href=""></a></li>
				<li>
					<ol class="chapter_nav">
						<xsl:for-each select="//TEI[@xml:id='punr']//div[@type='pagechap']">
							<li><a href="{concat('punr_',@xml:id,'.html')}"><xsl:value-of select="descendant::head[1]"/></a></li>
<!--							VA CHOPER DATE en plus à dégager-->
						</xsl:for-each>
					</ol>
				</li>
			</ul>
		</nav>
	</xsl:template>
<!--	tempalte pour FOOTER-->
	<xsl:template name="footer">
		<footer>
			<a href="https://www.univ-lille.fr/" target="blanck"><img src="img/logo_u_lille.png" alt="logo université de lille"/>"</a>
		</footer>
	</xsl:template>
<!--	template pour HEADER-->
	<xsl:template name="header">
		<header id="top">
			<h1>Pour un nouveau roman</h1>
			<xsl:call-template name="nav"/>
			<div class="legals">
<!--				github need link-->
				<a href="" target="blanck">
					<img src="img/GitHub-Mark-32px.png"/>
				</a>
				<a rel="license" href="http://creativecommons.org/licenses/by/4.0/" target="blanck"><img alt="Licence Creative Commons" src="https://creativecommons.org/images/chooser/chooser_cc.png"/></a>
				<a rel="license" href="http://creativecommons.org/licenses/by/4.0/" target="blanck"><img alt="Licence Creative Commons" src="https://creativecommons.org/images/chooser/chooser_by.png"/></a>
				
			</div>
		</header>
	</xsl:template>
	
	
	
	
	

	
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
				<body>
					<xsl:call-template name="header"/>
						<xsl:choose>
							<xsl:when test="$content='ch13'">
								<div class="preceding"><a href="{concat('punr_',preceding::div[1][@type='pagechap']/@xml:id,'.html')}">&lt;</a></div>
								<!--<div class="following"><a href="{concat('punr_',following::div[1][@type='pagechap']/@xml:id,'.html')}">&gt;</a></div>-->
							</xsl:when>
							<xsl:when test="$content='ch01'">
								<!--<div class="preceding"><a href="{concat('punr_',preceding::div[1][@type='pagechap']/@xml:id,'.html')}">&lt;</a></div>-->
								<div class="following"><a href="{concat('punr_',following::div[1][@type='pagechap']/@xml:id,'.html')}">&gt;</a></div>
							</xsl:when>
							<xsl:when test="contains($content,'ch')">
								<div class="preceding"><a href="{concat('punr_',preceding-sibling::div[@type='pagechap'][1]/@xml:id,'.html')}">&lt;</a></div>
								<div class="following"><a href="{concat('punr_',following::div[1][@type='pagechap']/@xml:id,'.html')}">&gt;</a></div>
							</xsl:when>
						</xsl:choose>
					
						<xsl:choose>
							<xsl:when test="contains($content,'ch')">
								<article>
									<xsl:apply-templates mode="corpus"/>
								</article>
							</xsl:when>
							<xsl:when test="$content='home'">
								<article>
									<xsl:apply-templates select="//publicationStmt[1]"/>
								</article>
							</xsl:when>
						</xsl:choose>
					
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
			<xsl:apply-templates mode="corpus"/>
		</p>
	</xsl:template>
	<xsl:template match="head" mode="corpus">
		<xsl:choose>
			<xsl:when test="@type='subsection_head'">
				<h4><xsl:apply-templates mode="corpus"/></h4>
			</xsl:when>
			<xsl:otherwise>
				<h3><xsl:apply-templates mode="corpus"/></h3>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="date[ancestor::head]" mode="corpus">
		<br /><span class="STDsmall">(<xsl:apply-templates/>)</span>
	</xsl:template>
	<xsl:template match="pb[ancestor::TEI/@xml:id='punr']">
		<a id="{concat('page_',@n)}"/>
	</xsl:template>
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
		<span style="color:#0f0;"><xsl:apply-templates/></span>
	</xsl:template>
	<xsl:template mode="corpus" match="quote">
		<span style="color:#f00;"><xsl:apply-templates/></span>
	</xsl:template>
	
	
	
	<xsl:template match="p[not(ancestor::TEI[@xml:id='punr'])]">
		<p><xsl:apply-templates/></p>
	</xsl:template>
</xsl:stylesheet>