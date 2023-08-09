<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	exclude-result-prefixes="xs math xd"
	version="3.0">
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Aug 4, 2023</xd:p>
			<xd:p><xd:b>Author:</xd:b> eXu</xd:p>
			<xd:p></xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:output method="text" encoding="UTF-8" use-character-maps="tex"/>
	
	<xsl:strip-space elements="*"/>
	
<!--escape character & replace if needed-->
	<xsl:character-map name="tex">
		<xsl:output-character string="~" character=" "/><!--unbreakable space-->
		<xsl:output-character character="_" string="\_"/><!--underscore-->
	</xsl:character-map>
	
	
	<xsl:template match="title"/>
	<xsl:template match="p">
		<xsl:apply-templates/><xsl:text>

</xsl:text>
	</xsl:template>
	<xsl:template match="span[@class='STDsc']">
<xsl:text>\textsc{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
	</xsl:template>
	<xsl:template match="span[@class='STDitalic']">
<xsl:text>\textit{</xsl:text><xsl:apply-templates/><xsl:text>}</xsl:text>
	</xsl:template>
	<xsl:variable name="n">
<xsl:text>
</xsl:text></xsl:variable>
	<xsl:variable name="n_tex">
		<xsl:text>
%</xsl:text>
	</xsl:variable>
	<xsl:template match="ul">
<xsl:text>\begin{itemize}
</xsl:text><xsl:apply-templates/>
<xsl:text>\end{itemize}
</xsl:text>
	</xsl:template>
	<xsl:template match="li">
<xsl:text>
	\item </xsl:text><xsl:apply-templates/><xsl:text>
</xsl:text>
	</xsl:template>
	<xsl:template match="comment()">
		<xsl:choose>
			<xsl:when test="contains(.,'ch01')">
\subsubsection{À quoi servent les théories}
			</xsl:when>
			<xsl:when test="contains(.,'ch02')">
\subsubsection{Une voie pour le roman futur}
			</xsl:when>
			<xsl:when test="contains(.,'ch03')">
\subsubsection{Sur quelques notions périmées}
			</xsl:when>
			<xsl:when test="contains(.,'ch04')">
\subsubsection{Nature, humanisme, tragédie}
			</xsl:when>
			<xsl:when test="contains(.,'ch05')">				\subsubsection{Éléments d'une anthologie moderne}
			</xsl:when>
			<xsl:when test="contains(.,'ch06')">
\subsubsection{Énigmes et transparences chez Raymond Roussel}
			</xsl:when>
			<xsl:when test="contains(.,'ch07')">\subsubsection{La conscience malade de Zeno}
			</xsl:when>
			<xsl:when test="contains(.,'ch08')">
\subsubsection{Joë Bousquet le rêveur}
			</xsl:when>
			<xsl:when test="contains(.,'ch09')">
\subsubsection{Samuel Beckett ou la présence sur la scène}
			</xsl:when>
			<xsl:when test="contains(.,'ch10')">
\subsubsection{Un roman qui s'invente lui-même}
			</xsl:when>
			<xsl:when test="contains(.,'ch11')">
\subsubsection{Nouveau roman, homme nouveau}
			</xsl:when>
			<xsl:when test="contains(.,'ch12')">
\subsubsection{Temps et description dans le récit d'aujourd'hui}
			</xsl:when>
			<xsl:when test="contains(.,'ch13')">
\subsubsection{Du réalisme à la réalité}
			</xsl:when>
			<xsl:otherwise><xsl:text>%</xsl:text><xsl:value-of select="replace(.,$n,$n_tex)"/><xsl:text>
	
	
</xsl:text></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>