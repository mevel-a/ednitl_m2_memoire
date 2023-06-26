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
			<xd:p><xd:b>Created on:</xd:b> Jun 25, 2023</xd:p>
			<xd:p><xd:b>Author:</xd:b> eXu</xd:p>
			<xd:p></xd:p>
		</xd:desc>
	</xd:doc>
	
	<xsl:output method="html" encoding="UTF-8" indent="1"/>
	
	
	
	<xsl:template match="/">
		<xsl:result-document href='../quote.html'>
			<html>
				<head>
					
				</head>
				<body>
					<ul>
						<xsl:apply-templates select="//quote" mode="quote"/>	</ul>
				</body>
			</html>
		</xsl:result-document>
		

	</xsl:template>
	
	<xsl:template match="quote" mode="quote">
		<li><xsl:apply-templates/><br />@corresp= <xsl:value-of select="@corresp"/><br />PAGE <xsl:value-of select="preceding::pb[1]/@n"/><br />@cert= <xsl:value-of select="@cert"/><br /> @ana=<xsl:value-of select="@ana"/></li>
	</xsl:template>
</xsl:stylesheet>