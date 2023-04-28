<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all"
	version="3.0"
	xmlns="http://www.tei-c.org/ns/1.0">
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Apr 19, 2023</xd:p>
			<xd:p><xd:b>Author:</xd:b> Adrien Mével</xd:p>
			<xd:p>Feuille xsl de balisage semi-auto du texte de Pour un nouveau roman d'Alain
				Robbe-Grillet. Cette feuille place les attributs corrige l'attribut @cRef.</xd:p>
		</xd:desc>
	</xd:doc>


	<xsl:output method="xml" encoding="UTF-8" indent="0"/>
	<xsl:strip-space elements="*"/>
	
	<xsl:template match="*">
		<xsl:if test="local-name()='p'"><xsl:text>
			
		</xsl:text></xsl:if><xsl:element name="{local-name()}">
			<xsl:for-each select="@*">
				<xsl:choose>
					<xsl:when test="local-name() = 'id'">
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
	<!--<xsl:template match="p">
		<p>
			<xsl:for-each select="attribute()">
				<xsl:choose>
					<xsl:when test="local-name()='part'"/>
					<xsl:otherwise>
						<xsl:attribute name="{local-name()}" select="."/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:apply-templates/>
		</p>
	</xsl:template>-->
	<xsl:template match="comment()">
		<xsl:comment select="."/>
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
							<xsl:call-template name="rectif_subsection_head"><xsl:with-param name="originalString" select="."/></xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates/>
						</xsl:otherwise>
					</xsl:choose>
					<!--					récupération des secondes parties de titre de sous-sections dans la première partie, avec la date-->
					<xsl:if test="following-sibling::head[@type = 'subsection_head'][1]">
						<xsl:call-template name="rectif_subsection_head"><xsl:with-param name="originalString" select="following-sibling::head[@type = 'subsection_head'][1]"/><xsl:with-param name="second" select="'1'"/></xsl:call-template>
						<xsl:text> </xsl:text>
						<date rend="txt_right">
							<xsl:value-of select="following-sibling::p[@rend = 'txt_right'][2]"/>
						</date>
					</xsl:if>
					<xsl:if test="following-sibling::p[@rend = 'txt_right'][1]">
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

	<xsl:template match="ref">
		<ref type="{@type}" cRef="{translate(lower-case(@cRef),'ëéêèöï','eeeeoi')}"><xsl:apply-templates/></ref>
	</xsl:template>


	<!--	# quote @corresp="toDefine" @cert="mReferenceStatus" @ana="mAxiologicStatus" @type="ttNature"-->
	<xsl:template match="quote">
		<xsl:element name="{local-name()}">
			<xsl:attribute name="type"><xsl:choose><xsl:when test="@type"><xsl:value-of select="@type"/></xsl:when>
				<xsl:otherwise>ttNature</xsl:otherwise>
			</xsl:choose></xsl:attribute>
			<xsl:attribute name="corresp"><xsl:choose><xsl:when test="@corresp"><xsl:value-of select="@corresp"/></xsl:when><xsl:otherwise>toDefine</xsl:otherwise>
			</xsl:choose></xsl:attribute>
			<xsl:attribute name="cert"><xsl:choose>
				<xsl:when test="@cert"><xsl:value-of select="@cert"/></xsl:when>
				<xsl:otherwise>9</xsl:otherwise>
				<!--				mReferenceStatus-->
			</xsl:choose></xsl:attribute>
			<xsl:attribute name="ana"><xsl:choose>
				<xsl:when test="@ana"><xsl:value-of select="@ana"/></xsl:when>
				<xsl:otherwise>mAxiologicStatus</xsl:otherwise>
			</xsl:choose></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	
	<xd:doc>
		<xd:desc>
			<xd:p>Template de traitement des "subsection_head", supprime les capitales de mise en forme (au demeurant peu élégante), rétablit les majuscules au nom propres et à la première lettre du titre. Pour ce faire le template teste via paramètre s'il s'agit de la première ligne d'un titre ou de la seconde (= un second élément dont la première lettre serait mise en capitale sinon) et ajoute un espace s'il s'agit de la deuxième ligne. </xd:p>
		</xd:desc>
		<xd:param name="originalString">la string originale envoyé depuis le template gérant les head</xd:param>
		<xd:param name="second">s'il s'agit du deuxième élément d'un même titre de sous-section (une deuxième ligne), contient '1' envoyé depuis le template gérant les head</xd:param>
		<xd:param name="lcString">le string originale transformée : première lettre en capitale le reste en minuscule.</xd:param>
	</xd:doc>
	<xsl:template name="rectif_subsection_head">
		<xsl:param name="originalString"/>
		<xsl:param name="second"/>
		<xsl:param name="lcString">
			<xsl:choose>
				<xsl:when test="$second='1'">
					<xsl:value-of select="concat(' ',lower-case($originalString))"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat(translate(substring(lower-case($originalString), 1, 1), 'abcdefghijklmnopqrstuvwxyzé', 'ABCDEFGHIJKLMNOPQRSTUVWXYZÉ'),substring(lower-case($originalString),2))"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param> 
		<xsl:variable name="rectifiedString">
			<xsl:choose>
				<xsl:when test="contains($lcString,'beckett')">
					<xsl:value-of select="replace($lcString,' beckett',' Beckett')"/>
				</xsl:when>
				<xsl:when test="contains($lcString,'nouveau roman')">
					<xsl:value-of select="replace($lcString,'nouveau roman','Nouveau Roman')"/>
				</xsl:when>
				<xsl:when test="contains($lcString,'Joë bousquet')">
					<xsl:value-of select="replace($lcString,'Joë bousquet','Joë Bousquet')"/>
				</xsl:when>
				<xsl:when test="contains($lcString,'zeno')">
					<xsl:value-of select="replace($lcString,'zeno','Zeno')"/>
				</xsl:when>
				<xsl:when test="contains($lcString,'raymond roussel')">
					<xsl:value-of select="replace($lcString,'raymond roussel','Raymond Roussel')"/>
				</xsl:when>
				<!--<xsl:when test="contains($lcString,'')">
				<xsl:variable name="rectifiedString" select="replace($lcString,'','')"/>
			</xsl:when>-->
				<xsl:otherwise>
					<xsl:value-of select="$lcString"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:value-of select="$rectifiedString"/>
	</xsl:template>
</xsl:stylesheet>