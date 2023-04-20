<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xpath-default-namespace="http://www.tei-c.org/ns/1.0"
	exclude-result-prefixes="xs xd tei"
	version="2.0">
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Apr 12, 2023</xd:p>
			<xd:p><xd:b>Author:</xd:b> Adrien Mével</xd:p>
			<xd:p>Feuille de style servant au contrôle des résultats du balisage automatique du premier fichier d'encodage de Pour un nouveau roman dans le cadre du travail de recherche réalisé en M2 EdNTIL sous la direction de Mme de Chalonge et M. Marchal</xd:p>
		</xd:desc>
	</xd:doc>
	
	<!--	initialisation-->
	<xsl:output method="html" indent="1" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01//EN" />
	<xsl:strip-space elements="*"/>
	
	
	<!--	Déclaration de variables pour les adresses des pages constituées-->
	<xsl:variable name="basename">../04_website/punr/</xsl:variable>
	<xsl:variable name="home" select="concat($basename,'home.html')"/>
	<xsl:variable name="index" select="concat($basename,'index.html')"/>
	<xsl:variable name="bib" select="concat($basename,'bibliography.html')"/>
	<!--	template pour HEAD, métadonnées title et links-->
	<xsl:template name="head">
		<xsl:param name="title"/>
		<head>
			<title><xsl:value-of select="concat('Pour un nouveau roman ,', $title)"/></title>
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
				<li><a href=""></a></li>
				<li><a href=""></a></li>
				<li><a href=""></a></li>
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
	
	<xsl:template match="/">
		<xsl:result-document href="..\02_xml\punr_verif_encodage.html">
			<html>
				<xsl:call-template name="head">
					<xsl:with-param name="title" select="'test'"/>
				</xsl:call-template>
				<body>
					<xsl:call-template name="header"/>
					<xsl:apply-templates select="//div" mode="verif_encodage"/>
					<xsl:call-template name="footer"/>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	
	<xsl:template match="div[not(@type='subsection')]" mode="verif_encodage">
<!--		NB : produit doublons du fait de sous-sections-->
		<div>
			<h2><xsl:apply-templates select="descendant::head[1]" mode="verif_encodage"/></h2>
			<ol>
				<xsl:apply-templates select="descendant::quote[not(ancestor::div[@type='subsection'])]|descendant::hi[@rend='italic'][not(ancestor::div[@type='subsection'])]|descendant::ref[not(ancestor::div[@type='subsection'])]" mode="verif_encodage"/>
			</ol>
			<xsl:apply-templates select="descendant::hi[not(@rend='italic')]" mode="verif_encodage"/>
		</div>
	</xsl:template>
	<xsl:template match="div[@type='subsection']" mode="verif_encodage">
		<div>
			<h3><xsl:apply-templates select="descendant::head[1]" mode="verif_encodage"/></h3>
			<ol>
				<xsl:apply-templates select="descendant::quote|descendant::hi[@rend='italic']|descendant::ref" mode="verif_encodage"/>
			</ol>
			<xsl:apply-templates select="descendant::hi[not(@rend='italic')]" mode="verif_encodage"/>
		</div>
	</xsl:template>
	<xsl:template match="quote|hi[@rend='italic']" mode="verif_encodage">
		<li><xsl:apply-templates/> ; <xsl:value-of select="upper-case(local-name())"/>; <xsl:value-of select="preceding::pb[1]/@n"/></li>
	</xsl:template>
	<xsl:template match="ref" mode="verif_encodage">
		
		<li><xsl:apply-templates/> ; <xsl:value-of select="upper-case(local-name())"/>; <xsl:value-of select="preceding::pb[1]/@n"/> CREF : <xsl:call-template name="lowerNoDia"><xsl:with-param name="treated" select="@cRef"/></xsl:call-template> TYPE : <xsl:value-of select="@type"/></li>
	</xsl:template>
	
<!--	gère le changement de cRef vers cRef valide-->
	<xsl:template name="lowerNoDia">
		<xsl:param name="totreat"/>
		<xsl:param name="treated">
			<xsl:value-of select="translate(lower-case($totreat),'éêèëäàâîïìùùûüöôò','eeeeaaaiiiuuuuooo')"/>
		</xsl:param>
		<xsl:value-of select="$treated"/>
	</xsl:template>
	<xsl:template match="hi[not(@rend='italic')]" mode="verif_encodage">
		<p><xsl:apply-templates/></p>
	</xsl:template>
</xsl:stylesheet>