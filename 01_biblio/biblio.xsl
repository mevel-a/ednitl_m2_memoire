<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	exclude-result-prefixes="xs math xd"
	version="3.0">
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Nov 22, 2022</xd:p>
			<xd:p><xd:b>Author:</xd:b> Mével Adrien</xd:p>
			<xd:p>Transformation de biblio en xml to latex, encodage maison et médiocre mais suffisant.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:output method="text" encoding="UTF-8" indent="0" use-character-maps="chars"/>
	<!--	<xsl:strip-space elements="*"/>-->
	<xsl:character-map name="chars"> <!--carte de remplacement des caractères spéciaux à échapper pour LateX-->
		<xsl:output-character character="&amp;" string="\&amp;"/>
		<!--<xsl:output-character character="}" string="\}"/>-->
		<xsl:output-character character="_" string="\_"/>
		<xsl:output-character character="^" string="\^"/>
		<xsl:output-character character=" " string="~"/>
		<!--		AJOUT REMPLACEMENT DES CARACTÈRES SPÉCIAUX vers unicode pour latex-->
		<!--		<xsl:output-character character="ſ" string='\int'/>-->
		<!--		<xsl:output-character character="ꝛ" string='\char"A75B'/>-->
		<!--<xsl:output-character character="q̃" string='\~q'/>-->
		<!--		<xsl:output-character character="ꝑ" string='\char'/>-->
		<!--		<xsl:output-character character="ẽ" string='\char'/>-->
		<!--<xsl:output-character character="" string='\char'/>
		<xsl:output-character character="" string='\char'/>-->
	</xsl:character-map>
	
	<xsl:strip-space elements="*"/>
	<xsl:template match="/">
		\documentclass[12pt, a4paper]{article}
		\usepackage[utf8]{inputenc}
		\usepackage[T1]{fontenc}
		\usepackage{lmodern}
		\usepackage[dvipsnames]{xcolor}
		\usepackage{fancyhdr}
		\usepackage{reledmac}
		\usepackage{float}
		\usepackage{graphicx}
		\usepackage[top=2cm, bottom=2cm, left=4cm, right=4cm, heightrounded, marginparwidth=3.5cm, marginparsep=0.3cm]{geometry}
		\renewcommand{\headrulewidth}{0.1pt}
		\renewcommand{\footrulewidth}{0.3pt}
		\usepackage{hyperref}
		\pagestyle{fancy}
		\lhead{{\scshape{Mével}} Adrien M2 EdNitl}
		\chead{}
		\rhead{2022-2023}
		\fancyfoot[]{}
		\rfoot{\thepage}
		\usepackage[french]{babel}
		\setlength{\headheight}{20.61049pt}
		
		\begin{document}
		\vspace*{3cm}
		
		
		\begin{center}
		\huge
		\textsc{Bibliographie}
		\end{center}
		\vspace{3cm}
		\newcommand{\punr}{\textit{Pour un nouveau roman}}
		\newcommand{\robbe}{Alain~Robbe-Grillet}
		
		<xsl:apply-templates/>
		\end{document}
	</xsl:template>
	<xsl:template match="div">
		\vspace*{2cm}
		\setlength{\parindent}{0cm}
{\large\textsc{<xsl:value-of select="head"/>}}
		\vspace*{1cm}
		\setlength{\parindent}{25pt}
		
		
		
		<xsl:apply-templates><xsl:sort select="date/@type='first'"/></xsl:apply-templates>
		
		
		
		
		
	</xsl:template>

<xsl:template match="head"/>
	<!--<xsl:template match="bibliography">
		<xsl:for-each select="ref">

		</xsl:for-each>
	</xsl:template>-->
	
	<xsl:template match="ref">
		<xsl:for-each select="author">\textsc{<xsl:value-of select="author/name"/>}<xsl:if test="author/surname"> <xsl:value-of select="author/surname"/> </xsl:if><xsl:if test="following::author"> ,</xsl:if></xsl:for-each><xsl:if test="child::traductor">, \textsc{<xsl:value-of select="traductor/name"/>} <xsl:value-of select="traductor/surname"/> (trad.)</xsl:if>, \textit{<xsl:value-of select="title"/>}<xsl:if test="@type=not('nocity')">, <xsl:value-of select="city"/></xsl:if>, <xsl:value-of select="ed"/><xsl:if test="child::coll">, coll. «~<xsl:value-of select="coll"/>~»</xsl:if>, <xsl:value-of select="date[@type='effective']"/> <xsl:if test="child::date[@type='trad']"><xsl:value-of select="child::date[@type='trad']"/> pour la traduction française, </xsl:if><xsl:if test="child::date[@type='first']"> [<xsl:value-of select="date[@type='first']"/>]</xsl:if><xsl:if test="online">
			
			En ligne~: \hyperlink{<xsl:value-of select="online"/>}{<xsl:value-of select="online"/>}, consulté le \today
		</xsl:if>\par 
		 
		
	</xsl:template>
	<xsl:template match="ref[@type='article']">
		\textsc{<xsl:value-of select="author/name"/>} <xsl:value-of select="author/surname"/> <xsl:if test="child::traductor">, \textsc{<xsl:value-of select="traductor/name"/>} <xsl:value-of select="traductor/surname"/> (trad.)</xsl:if><xsl:if test="child::editor">, \textsc{<xsl:value-of select="editor/name"/>} <xsl:value-of select="editor/surname"/> (ed.)</xsl:if>, \textit{<xsl:value-of select="title"/>}, <xsl:value-of select="city"/>, <xsl:value-of select="ed"/><xsl:if test="child::coll">, coll. «~<xsl:value-of select="coll"/>~»</xsl:if>, <xsl:value-of select="date[@type='effective']"/> <xsl:if test="child::date[@type='trad']">, <xsl:value-of select="child::date[@type='trad']"/> pour la traduction française, </xsl:if><xsl:if test="child::date[@type='first']">[<xsl:value-of select="date[@type='first']"/>]</xsl:if><xsl:if test="child::pages">, p.~<xsl:value-of select="pages"/></xsl:if><xsl:if test="online">
			
			En ligne~: \hyperlink{<xsl:value-of select="online"/>}{<xsl:value-of select="online"/>}, consulté le \today
		</xsl:if>\par
		
		
		
		
	</xsl:template>
	<xsl:template match="ref[@type='online']">
		\textit{<xsl:value-of select="title"/>} en ligne~: \hyperlink{<xsl:value-of select="online"/>}{<xsl:value-of select="online"/>}, consulté le <xsl:value-of select="date"/>\par
		
		
		
	</xsl:template>
</xsl:stylesheet>