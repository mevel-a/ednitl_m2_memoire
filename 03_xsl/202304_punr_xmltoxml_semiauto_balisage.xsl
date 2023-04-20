<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:tei="http://www.tei-c.org/ns/1.0"
	xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs xd tei"
	version="3.0">
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Apr 19, 2023</xd:p>
			<xd:p><xd:b>Author:</xd:b> Adrien Mével</xd:p>
			<xd:p>Feuille xsl de balisage semi-auto du texte de Pour un nouveau roman d'Alain
				Robbe-Grillet. Cette feuille place les attributs corrige l'attribut @cRef.</xd:p>
		</xd:desc>
	</xd:doc>


	<xsl:output method="xml" encoding="UTF-8" indent="1"/>

	<xsl:template match="*">
		<xsl:element name="{local-name()}">
			<xsl:for-each select="@*">
				<xsl:choose>
					<xsl:when test="local-name() = 'xml:id'">
						<xsl:attribute name="xml:id">
							<xsl:value-of select="."/>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="{local-name()}">
							<xsl:value-of select="."/>
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>


	<!--	récupération indication de date dans le titre-->
	<xsl:template match="head">
		<xsl:choose>
			<!--			suppression des secondes parties de subsection_head-->
			<xsl:when
				test="(@type = 'subsection_head') and (preceding-sibling::head[@type = 'subsection_head'][1])"/>
			<xsl:otherwise>
				<xsl:element name="{local-name()}">
					<xsl:for-each select="@*">
						<xsl:choose>
							<xsl:when test="local-name() = 'xml:id'">
								<xsl:attribute name="xml:id">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="{local-name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
					<xsl:choose>
						<xsl:when test="@type = 'subsection_head'">
							<!--					ajout maj premier caractère, suppression caps sur les autres-->
							<xsl:value-of
								select="translate(substring(lower-case(.), 1, 1), 'abcdefghijklmnopqrstuvwxyzé', 'ABCDEFGHIJKLMNOPQRSTUVWXYZÉ')"
							/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates/>
						</xsl:otherwise>
					</xsl:choose>
					<!--					récupération des secondes parties de titre de sous-sections dans la première partie, avec la date-->
					<xsl:if test="following-sibling::head[@type = 'subsection_head'][1]">
						<xsl:value-of
							select="translate(substring(lower-case(following-sibling::head[@type = 'subsection_head'][1]), 1, 1), 'abcdefghijklmnopqrstuvwxyzé', 'ABCDEFGHIJKLMNOPQRSTUVWXYZÉ')"/>
						<xsl:text>
 </xsl:text>
						<date rend="txt_right">
							<xsl:value-of select="following-sibling::p[@rend = 'txt_right'][2]"/>
						</date>
					</xsl:if>
					<!--					récupération de la date dans les autres cas ???-->
					<xsl:if test="following-sibling::p[@rend = 'txt_right'][1]">
						<!--				risque de capturer tous les following -->
						<xsl:text>
 </xsl:text>
						<date rend="txt_right">
							<xsl:value-of select="following-sibling::p[@rend = 'txt_right'][1]"/>
						</date>
					</xsl:if>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>
	<!--	supression indication de date-->
	<xsl:template match="p[@rend = 'txt_right']"/>


	<xsl:template match="hi[@rend='small_caps']">
		<xsl:element name="{local-name()}">
			<xsl:for-each select="@*">
				<xsl:attribute name="{local-name()}">
					<xsl:value-of select="."/>
				</xsl:attribute>
			</xsl:for-each>
			<xsl:choose>
				<xsl:when test=".='Barthes'">
					<xsl:apply-templates/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="lower-case(.)"/>
				</xsl:otherwise>
			</xsl:choose>				
		</xsl:element>
	</xsl:template>

	<!--	# quote @corresp="toDefine" @cert="mReferenceStatus" @ana="mAxiologicStatus" @type="ttNature"-->
	<xsl:template match="quote">
		<xsl:element name="{local-name()}">
			<xsl:choose>
				<xsl:when test="@type"/>
				<xsl:otherwise>
					<xsl:attribute name="type">ttNature</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="@corresp"/>
				<xsl:otherwise>
					<xsl:attribute name="corresp">toDefine</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="@cert"/>
				<xsl:otherwise>
					<xsl:attribute name="cert">mReferenceStatus</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="@ana"/>
				<xsl:otherwise>
					<xsl:attribute name="ana">mAxiologicStatus</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:for-each select="@*">
				<xsl:attribute name="{local-name()}">
					<xsl:value-of select="."/>
				</xsl:attribute>
			</xsl:for-each>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
