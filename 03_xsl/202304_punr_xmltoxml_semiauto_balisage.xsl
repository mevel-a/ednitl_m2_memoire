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
<xsl:variable name="apos" select='"&apos;"'/>

	<xsl:output method="xml" encoding="UTF-8" indent="0"/>
	<xsl:strip-space elements="*"/>
	
	<xsl:template match="*">
		<xsl:if test="(local-name()='p')or(local-name()='TEI')"><xsl:text>
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
	<xsl:template match="comment()">
		<xsl:text>
</xsl:text><xsl:comment select="."/><xsl:text>
</xsl:text>
	</xsl:template>

	<!--	récupération indication de date dans le titre-->
	<xsl:template match="head">
<xsl:text>
</xsl:text>
		<xsl:choose>
			<!--suppression des secondes parties de subsection_head-->
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
							<xsl:call-template name="rectif_subsection_head"><xsl:with-param name="originalString" select="."/><xsl:with-param name="date"><xsl:choose>
								<xsl:when test="descendant::date"><xsl:value-of select="descendant::date"/></xsl:when><xsl:otherwise/>
							</xsl:choose><!--<xsl:if test="descendant::date"></xsl:if>--></xsl:with-param></xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates/>
						</xsl:otherwise>
					</xsl:choose>
					<!--					récupération des secondes parties de titre de sous-sections dans la première partie, avec la date-->
					<xsl:if test="following-sibling::head[@type = 'subsection_head'][1]">
						<xsl:call-template name="rectif_subsection_head"><xsl:with-param name="originalString" select="following-sibling::head[@type = 'subsection_head'][1]"/><xsl:with-param name="second" select="'1'"/></xsl:call-template>
						<xsl:text> </xsl:text>
						<!--<date rend="txt_right">
							<xsl:value-of select="following-sibling::p[@rend = 'txt_right'][2]"/>
						</date>-->
					</xsl:if>
					<xsl:if test="following-sibling::p[@rend = 'txt_right'][1]">
						<date rend="txt_right">
							<xsl:value-of select="translate(following-sibling::p[@rend = 'txt_right'][1],'()','')"/>
						</date>
					</xsl:if>
					<xsl:if test="descendant::date">
						<date rend="txt_right">
							<xsl:value-of select="date"/>
						</date>
					</xsl:if>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>
	<!--	supression indication de date-->
	<xsl:template match="p[@rend = 'txt_right']"/>
	<xsl:template match="date"/>


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
	<xsl:template match="hi[@rend='italic']">
		<xsl:element name="{local-name()}">
			<xsl:for-each select="@*">
				<xsl:attribute name="{local-name()}">
					<xsl:value-of select="."/>
				</xsl:attribute>
			</xsl:for-each>
			<xsl:choose>
				<xsl:when test=".='Les Gommes'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="robbe-grillet_les_gommes"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Le Voyeur'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="robbe-grillet_le_voyeur"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='La Jalousie'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="robbe-grillet_la_jalousie"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Ficrions'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="borges_fictions"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Don Quichotte'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="cervantes_don_quichotte"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Les Faux-Monnayeurs'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="gide_les_faux_monnayeurs"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='La Nausée'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="sartre_la_nausee"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='La Princesse de Clèves'and(not(descendant::ref))">
					<ref cert="9" type="œuvre" cRef="lafayette_la_princesse_de_cleve"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Père Goriot'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="balzac_le_pere_goriot"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Ulysse'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="joyce_ulysse"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Le Château'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="kafka_le_chateau"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Le Bruit et la Fureur'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="faulkner_le_bruit_et_la_fureur"><xsl:apply-templates/></ref>
				</xsl:when>
<!--				apostrophe problématique, à échapper ou faire à la main-->
<!--				nécessite des @mReferenceStatus à la main + Godot doit parfois rêtre encodé en quote parfois en ref-->
				<!--<xsl:when test=".=concat('L','','Étranger')and(not(descendant::ref))">
					<ref type="œuvre" cRef="camus_l_etranger"><xsl:apply-templates/></ref>
				</xsl:when>-->
				<xsl:when test=".='Voyage au bout de la nuit'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="celine_voyage_au_bout_de_la_nuit"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='la Comédie Humaine'and(not(descendant::ref))">
					<ref type="œuvre" cRef="balzac_la_comedie_humaine"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Madame Bovary'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="flaubert_madame_bovary"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Situations I'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="sartre_situation_i"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Le Parti pris des choses'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="ponge_le_parti_pris_des_choses"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Le Cageot'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="ponge_le_cageot"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Le Sentiment tragique de la vie'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="unamuno_le_sentiment_tragique_de_la_vie"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Chateau des Pyrénées...'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="magritte_le_chateau_des_pyrenees"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Molloy'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="beckett_molloy"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Le Meneur de Lune'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="bousquet_le_meneur_de_lune"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='En attendant Godot'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="beckett_en_attendant_godot"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Mahu ou le Matériau'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="pinget_mahu_ou_le_materiau"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Le Renard et la Boussole'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="pinget_le_renard_et_la_boussole"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='La Chartreuse de Parme'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="stendhal_la_chartreuse_de_parme"><xsl:apply-templates/></ref>
				</xsl:when>
<!--				<xsl:when test=".='L'Immortelle'and(not(descendant::ref))">-->
<!--					<ref type="œuvre" cRef="robbe-grillet_l_immortelle"><xsl:apply-templates/></ref>-->
				<!--</xsl:when>-->
				<!--<xsl:when test=".='L’Année dernière à Marienbad,'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="resnais_l_année_dernière_a_marienbad,"><xsl:apply-templates/></ref>
				</xsl:when>-->
				<xsl:when test=".='Le Chiendent'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="queneau_le_chiendent"><xsl:apply-templates/></ref>
				</xsl:when>
				<xsl:when test=".='Loin du Rueil'and(not(descendant::ref))">
					<ref  type="œuvre" cRef="queneau_loin_du_rueil"><xsl:apply-templates/></ref>
				</xsl:when>
				<!--<xsl:when test=".=''and(not(descendant::ref))">
					<ref  type="œuvre" cRef=""><xsl:apply-templates/></ref>
				</xsl:when>-->
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>				
		</xsl:element>
	</xsl:template>

	<xsl:template match="ref">
		<xsl:variable name="cert">
			<xsl:choose>
				<xsl:when test="@cert"><xsl:value-of select="@cert"/></xsl:when>
				<xsl:otherwise>9</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<ref type="{@type}" cRef="{translate(lower-case(@cRef),'ëéêèöï','eeeeoi')}" cert="{$cert}"><xsl:apply-templates/></ref>
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
				<!--mReferenceStatus-->
			</xsl:choose></xsl:attribute>
			<xsl:attribute name="ana"><xsl:choose>
				<xsl:when test="@ana"><xsl:value-of select="@ana"/></xsl:when>
				<xsl:otherwise>mAxiologicStatus</xsl:otherwise>
			</xsl:choose></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="div">
		<xsl:text>
</xsl:text>
		<div>
			<xsl:for-each select="@*">
				<xsl:choose>
					<xsl:when test="local-name() = 'id'">
						<xsl:attribute name="xml:id">
							<xsl:choose>
								<xsl:when test=".='page006'">ch01</xsl:when>
								<xsl:when test=".='page016'">ch02</xsl:when>
								<xsl:when test=".='page028'">ch03</xsl:when>
								<xsl:when test=".='page054'">ch04</xsl:when>
								<xsl:when test=".='page084'">ch05</xsl:when>
								<xsl:when test=".='page086'">ch06</xsl:when>
								<xsl:when test=".='page095'">ch07</xsl:when>
								<xsl:when test=".='page101'">ch08</xsl:when>
								<xsl:when test=".='page118'">ch09</xsl:when>
								<xsl:when test=".='page135'">ch10</xsl:when>
								<xsl:when test=".='page142'">ch11</xsl:when>
								<xsl:when test=".='page154'">ch12</xsl:when>
								<xsl:when test=".='page170'">ch13</xsl:when>
								<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
							</xsl:choose>
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
		</div>
	</xsl:template>
	
	
<!--TROUVER UN MOYEN DE GÉRER LES DATES :
		un param qui test si il y a une date, 
		si oui, la stocke dans une variable 
		et un replace la supprime du contenu de la string rectifiée
		sinon rien
	-->
	<xd:doc>
		<xd:desc>
			<xd:p>Template de traitement des "subsection_head", supprime les capitales de mise en forme (au demeurant peu élégante), rétablit les majuscules au nom propres et à la première lettre du titre. Pour ce faire le template teste via paramètre s'il s'agit de la première ligne d'un titre ou de la seconde (= un second élément dont la première lettre serait mise en capitale sinon) et ajoute un espace s'il s'agit de la deuxième ligne. </xd:p>
		</xd:desc>
		<xd:param name="originalString">la string originale envoyé depuis le template gérant les head</xd:param>
		<xd:param name="second">s'il s'agit du deuxième élément d'un même titre de sous-section (une deuxième ligne), contient '1' envoyé depuis le template gérant les head</xd:param>
		<xd:param name="lcString">la string originale transformée : première lettre en capitale le reste en minuscule.</xd:param>
		<xd:param name="date">contient le sous-élément date si il y en a un</xd:param>
	</xd:doc>
	<xsl:template name="rectif_subsection_head">
		<xsl:param name="date"/>
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
				<xsl:when test="contains($lcString,'Samuel beckett')">
					<xsl:value-of select="replace($lcString,' beckett',' Beckett')"/>
				</xsl:when>
				<!--deuxième itération et suivantes : -->
				<xsl:when test="contains($lcString,'Samuel beckett')">
					<xsl:value-of select="replace($lcString,' beckett',' Beckett')"/>
				</xsl:when>
				<xsl:when test="contains($lcString,'nouveau roman')">
					<xsl:value-of select="replace($lcString,'nouveau roman','Nouveau Roman')"/>
				</xsl:when>
				<xsl:when test="contains($lcString,'Joë bousquet')">
					<xsl:value-of select="replace($lcString,'Joë bousquet','Joë Bousquet')"/>
					<!--deuxième itération et suivantes : -->
				</xsl:when>
				<xsl:when test="contains($lcString,'zeno')">
					<xsl:value-of select="replace($lcString,'zeno','Zeno')"/>
					<!--deuxième itération et suivantes : -->
				</xsl:when>
				<xsl:when test="contains($lcString,'raymond roussel')">
					<xsl:value-of select="replace($lcString,'raymond roussel','Raymond Roussel')"/>
				</xsl:when>
				<!--deuxième itération et suivantes : -->
				<xsl:when test="contains($lcString,'raymond roussel')">
					<xsl:value-of select="replace($lcString,'raymond roussel','Raymond Roussel')"/>
				</xsl:when>
				<!--deuxième itération et suivantes : -->
				<xsl:when test="contains($lcString,'Joë bousquet')">
					<xsl:value-of select="replace($lcString,'Joë bousquet','Joë Bousquet')"/>
				</xsl:when>
				<!--deuxième itération et suivantes : -->
				<xsl:when test="contains($lcString,'nouveau roman')">
					<xsl:value-of select="replace($lcString,'nouveau roman','Nouveau Roman')"/>
				</xsl:when>
				<!--<xsl:when test="contains($lcString,'')">
				<xsl:variable name="rectifiedString" select="replace($lcString,'','')"/>
			</xsl:when>-->
				<xsl:otherwise>
					<xsl:value-of select="$lcString"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="not($date='')">
<!--				Suppression des parenthèses, qui si elles ne sont pas supprimées demeurent à cause semble-t-il du moteur RegEx d'Oxygen, elles seronts ajoutées lors du passage à la version html-->
				<xsl:value-of select="translate(replace($rectifiedString,$date,''),'()','')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$rectifiedString"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>