<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gco="http://www.isotc211.org/2005/gco"
	xmlns:gmi="http://sdi.eurac.edu/metadata/iso19139-2/schema/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx" xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:gml="http://www.opengis.net/gml"
	xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:geonet="http://www.fao.org/geonetwork" xmlns:exslt="http://exslt.org/common" exclude-result-prefixes="gmd gco gml gts srv xlink exslt geonet">


	<!-- Required for edit mode -->
	<!-- Simple views is ISO19139 -->
	<xsl:template name="metadata-iso19139-2view-simple">
		<xsl:call-template name="metadata-iso19139view-simple" />
	</xsl:template>

	<!-- Required for edit mode -->
	<xsl:template name="view-with-header-iso19139-2">
		<xsl:param name="tabs" />

		<xsl:call-template name="view-with-header-iso19139">
			<xsl:with-param name="tabs" select="$tabs" />
		</xsl:call-template>
	</xsl:template>

	<!-- main template - the way into processing iso19139-2 -->
	<xsl:template name="metadata-iso19139-2">
		<xsl:param name="schema"/>
		<xsl:param name="edit" select="false()"/>
		<xsl:param name="embedded"/>

		<!-- apply iso19139 located in iso19139 -->
		<xsl:apply-templates mode="iso19139" select=".">
			<xsl:with-param name="schema" select="$schema"/>
			<xsl:with-param name="edit" select="$edit"/>
			<xsl:with-param name="embedded" select="$embedded"/>
		</xsl:apply-templates>
	</xsl:template>

	<!-- RT#53364 InM begin -->
	<!-- Enables in the left tab to show acquisition information -->
	<xsl:template name="iso19139-2CompleteTab">
		<xsl:param name="tabLink"/>
    <xsl:param name="schema"/>
    
		<!-- INSPIRE tab -->
		<xsl:if test="/root/gui/env/inspire/enable = 'true' and /root/gui/env/metadata/enableInspireView = 'true'">
		  <xsl:call-template name="mainTab">
		    <xsl:with-param name="title" select="/root/gui/strings/inspireTab"/>
		    <xsl:with-param name="default">inspire</xsl:with-param>
		    <xsl:with-param name="menu">
		      <item label="inspireTab">inspire</item>
		    </xsl:with-param>
		  </xsl:call-template>
		</xsl:if>
		
		<xsl:if test="/root/gui/env/metadata/enableIsoView = 'true'">
		  <xsl:call-template name="mainTab">
		    <xsl:with-param name="title" select="/root/gui/strings/byGroup"/>
		    <xsl:with-param name="default">ISOCore</xsl:with-param>
		    <xsl:with-param name="menu">
		      <item label="isoMinimum">ISOMinimum</item>
		      <item label="isoCore">ISOCore</item>
		      <item label="isoAll">ISOAll</item>
		    </xsl:with-param>
		  </xsl:call-template>
		 </xsl:if>
		
		<xsl:if test="/root/gui/config/metadata-tab/advanced">
		  <xsl:call-template name="mainTab">
		    <xsl:with-param name="title" select="/root/gui/strings/byPackage"/>
		    <xsl:with-param name="default">identification</xsl:with-param>
		    <xsl:with-param name="menu">
		      <item label="metadata">metadata</item>
		      <item label="identificationTab">identification</item>
		      <item label="maintenanceTab">maintenance</item>
		      <item label="constraintsTab">constraints</item>
		      <item label="spatialTab">spatial</item>
		      <item label="refSysTab">refSys</item>
		      <item label="distributionTab">distribution</item>
		      <item label="dataQualityTab">dataQuality</item>
		      <item label="appSchInfoTab">appSchInfo</item>
		      <item label="porCatInfoTab">porCatInfo</item>
		      <item label="contentInfoTab">contentInfo</item>
		      <item label="acquisitionInfoTab">acquisitionInfo</item>
		      <item label="extensionInfoTab">extensionInfo</item>
		    </xsl:with-param>
		  </xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- RT#53364 InM end -->


	<!-- Redirection template for profil gmi in order to process extraTabs. -->
	<xsl:template mode="iso19139" match="gmi:MI_Metadata" priority="200">
		<xsl:param name="schema" />
		<xsl:param name="edit" />
		<xsl:param name="embedded" />

		<xsl:variable name="dataset" select="gmd:hierarchyLevel/gmd:MD_ScopeCode/@codeListValue='dataset' or normalize-space(gmd:hierarchyLevel/gmd:MD_ScopeCode/@codeListValue)=''" />

		<xsl:choose>
			<!-- metadata tab -->
			<xsl:when test="$currTab='metadata'">
				<xsl:call-template name="iso19139Metadata">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:call-template>
			</xsl:when>

			<!-- identification tab -->
			<xsl:when test="$currTab='identification'">
				<xsl:apply-templates mode="elementEP" select="gmd:identificationInfo|geonet:child[string(@name)='identificationInfo']">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:apply-templates>
			</xsl:when>

			<!-- maintenance tab -->
			<xsl:when test="$currTab='maintenance'">
				<xsl:apply-templates mode="elementEP" select="gmd:metadataMaintenance|geonet:child[string(@name)='metadataMaintenance']">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:apply-templates>
			</xsl:when>

			<!-- constraints tab -->
			<xsl:when test="$currTab='constraints'">
				<xsl:apply-templates mode="elementEP" select="gmd:metadataConstraints|geonet:child[string(@name)='metadataConstraints']">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:apply-templates>
			</xsl:when>

			<!-- spatial tab -->
			<xsl:when test="$currTab='spatial'">
				<xsl:apply-templates mode="elementEP" select="gmd:spatialRepresentationInfo|geonet:child[string(@name)='spatialRepresentationInfo']">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:apply-templates>
			</xsl:when>

			<!-- refSys tab -->
			<xsl:when test="$currTab='refSys'">
				<xsl:apply-templates mode="elementEP" select="gmd:referenceSystemInfo|geonet:child[string(@name)='referenceSystemInfo']">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:apply-templates>
			</xsl:when>

			<!-- distribution tab -->
			<xsl:when test="$currTab='distribution'">
				<xsl:apply-templates mode="elementEP" select="gmd:distributionInfo|geonet:child[string(@name)='distributionInfo']">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:apply-templates>
			</xsl:when>

			<!-- embedded distribution tab -->
			<xsl:when test="$currTab='distribution2'">
				<xsl:apply-templates mode="elementEP" select="gmd:distributionInfo/gmd:MD_Distribution/gmd:transferOptions/gmd:MD_DigitalTransferOptions">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:apply-templates>
			</xsl:when>

			<!-- dataQuality tab -->
			<xsl:when test="$currTab='dataQuality'">
				<xsl:apply-templates mode="elementEP" select="gmd:dataQualityInfo|geonet:child[string(@name)='dataQualityInfo']">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:apply-templates>
			</xsl:when>

			<!-- appSchInfo tab -->
			<xsl:when test="$currTab='appSchInfo'">
				<xsl:apply-templates mode="elementEP" select="gmd:applicationSchemaInfo|geonet:child[string(@name)='applicationSchemaInfo']">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:apply-templates>
			</xsl:when>

			<!-- porCatInfo tab -->
			<xsl:when test="$currTab='porCatInfo'">
				<xsl:apply-templates mode="elementEP" select="gmd:portrayalCatalogueInfo|geonet:child[string(@name)='portrayalCatalogueInfo']">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:apply-templates>
			</xsl:when>

			<!-- contentInfo tab -->
			<xsl:when test="$currTab='contentInfo'">
				<xsl:apply-templates mode="elementEP" select="gmd:contentInfo|geonet:child[string(@name)='contentInfo']">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:apply-templates>
			</xsl:when>

			<!-- acquisitionInfo tab -->
			<xsl:when test="$currTab='acquisitionInfo'">
				<xsl:apply-templates mode="elementEP" select="gmi:acquisitionInfo|geonet:child[string(@name)='acquisitionInfo']">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:apply-templates>
			</xsl:when>

			<!-- extensionInfo tab -->
			<xsl:when test="$currTab='extensionInfo'">
				<xsl:apply-templates mode="elementEP" select="gmd:metadataExtensionInfo|geonet:child[string(@name)='metadataExtensionInfo']">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:apply-templates>
			</xsl:when>

			<!-- ISOMinimum tab -->
			<xsl:when test="$currTab='ISOMinimum'">
				<xsl:call-template name="inspiretabs">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
					<xsl:with-param name="dataset" select="$dataset" />
				</xsl:call-template>
			</xsl:when>

			<!-- ISOCore tab -->
			<xsl:when test="$currTab='ISOCore'">
				<xsl:call-template name="isotabs">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
					<xsl:with-param name="dataset" select="$dataset" />
					<xsl:with-param name="core" select="true()" />
				</xsl:call-template>
			</xsl:when>

			<!-- ISOAll tab -->
			<xsl:when test="$currTab='ISOAll'">
				<xsl:call-template name="iso19139Complete">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
				</xsl:call-template>
			</xsl:when>

			<!-- INSPIRE tab -->
			<xsl:when test="$currTab='inspire'">
				<xsl:call-template name="inspiretabs">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
					<xsl:with-param name="dataset" select="$dataset" />
				</xsl:call-template>
			</xsl:when>

			<!-- Represents the default view -->
			<xsl:otherwise>
				<xsl:call-template name="iso19139Simple">
					<xsl:with-param name="schema" select="$schema" />
					<xsl:with-param name="edit" select="$edit" />
					<xsl:with-param name="flat" select="/root/gui/config/metadata-tab/*[name(.)=$currTab]/@flat" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!-- Brief template 
	<xsl:template name="iso19139-2Brief">
		<xsl:call-template name="iso19139Brief" />
	</xsl:template>
	-->

	<xsl:template name="iso19139-2-javascript" />

</xsl:stylesheet>