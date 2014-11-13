<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
	xmlns:gmie="http://sdi.eurac.edu/metadata/iso19139-2/schema/gmie"
	xmlns:gmi="http://sdi.eurac.edu/metadata/iso19139-2/schema/gmi"
	xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gml="http://www.opengis.net/gml"
	xmlns:gss="http://www.isotc211.org/2005/gss"
	xsi:schemaLocation="http://www.isotc211.org/2005/gmd http://www.isotc211.org/2005/gmd/gmd.xsd">

	<xsl:param name="staticFile" select="'./STATIC_INFO.xml'" />
	<!-- For DES mode uncomment next line and comment former line!! -->
	<!-- xsl:param name="staticFile" select="'@configFile@'" /-->
	<!-- For DES mode end-->
	<xsl:variable name="staticValues" select="document($staticFile)" />


	<xsl:output method="xml" indent="yes" />

	<xsl:template match="/">
	<!-- === due to a bug this works for manual sigle md entry only
	<gmi:MI_Metadata xmlns:gmi="http://sdi.eurac.edu/metadata/iso19139-2"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gmd="http://www.isotc211.org/2005/gmd"
			xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gml="http://www.opengis.net/gml"
			gco:isoType="gmd:MD_Metadata"> -->
			
<gmie:MIE_Metadata gco:isoType="gmd:MD_Metadata"
		xsi:schemaLocation="http://sdi.eurac.edu/metadata/iso19139-2/schema/gmie http://sdi.eurac.edu/metadata/iso19139-2/schema/gmie/gmie.xsd" 
	xmlns:gmie="http://sdi.eurac.edu/metadata/iso19139-2/schema/gmie" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco"
	xmlns:gml="http://www.opengis.net/gml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:gmi="http://sdi.eurac.edu/metadata/iso19139-2/schema/gmi"
	xmlns:gss="http://www.isotc211.org/2005/gss">
			<!-- =====================Include only for eclipse validation===============================
			<gmi:MI_Metadata xmlns:gmi="http://sdi.eurac.edu/metadata/iso19139-2"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gmd="http://www.isotc211.org/2005/gmd"
			xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gml="http://www.opengis.net/gml"
			gco:isoType="gmd:MD_Metadata"
			xsi:schemaLocation="http://sdi.eurac.edu/metadata/iso19139-2 http://sdi.eurac.edu/metadata/iso19139-2/schema/extensions/gmi.xsd">
			-->

			<!-- UUID -->
			<gmd:fileIdentifier xmlns:gmx="http://www.isotc211.org/2005/gmx">
				<gco:CharacterString>
					<xsl:value-of select="/MetaData/OutputFiles/Output/UUID" />
				</gco:CharacterString>
			</gmd:fileIdentifier>
			<!-- Select the metadata language value -->
			<!-- STATIC INFO -->
			<gmd:language>
				<gco:CharacterString>
					<xsl:value-of
						select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaMETADATA_LANGUAGE" />
				</gco:CharacterString>
			</gmd:language>
			<!-- STATIC INFO -->
			<!-- Select the data hierarchy level value -->
			<xsl:variable name="HierarchyLevel_value">
				<xsl:value-of
					select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaRESOURCE_TYPE" />
			</xsl:variable>
			<!-- STATIC INFO -->
			<gmd:hierarchyLevel>
				<gmd:MD_ScopeCode
					codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/ML_gmxCodelists.xml#MD_ScopeCode"
					codeListValue="{$HierarchyLevel_value}" />

			</gmd:hierarchyLevel>

			<!-- STATIC INFO -->
			<!-- Select the information about entity responsible for the metadata -->
			<gmd:contact>
				<gmd:CI_ResponsibleParty>
					<!-- Select the organization name -->
					<gmd:organisationName>
						<gco:CharacterString>
							<xsl:value-of
							select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaMETADATA_RESPONSIBLE_ORGANIZATION" />
						</gco:CharacterString>
					</gmd:organisationName>

					<gmd:contactInfo>
						<gmd:CI_Contact>
							<gmd:address>
								<gmd:CI_Address>
									<!-- Select the email address information -->
									<gmd:electronicMailAddress>
										<gco:CharacterString>
													<xsl:value-of
											select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaMETADATA_RESPONSIBLE_EMAIL" />
												</gco:CharacterString>
									</gmd:electronicMailAddress>
								</gmd:CI_Address>
							</gmd:address>
						</gmd:CI_Contact>
					</gmd:contactInfo>

					<!-- Select the entities role value -->
					<xsl:variable name="MD_Role_value">
						<xsl:value-of
							select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaMETADATA_RESPONSIBLE_ROLE" />
					</xsl:variable>
					<gmd:role>
						<gmd:CI_RoleCode
							codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/ML_gmxCodelists.xml#CI_RoleCode"
							codeListValue="{$MD_Role_value}" />

					</gmd:role>
				</gmd:CI_ResponsibleParty>
			</gmd:contact>

			<!-- LANDSAT DATA -->
			<!-- Set date Stamp when metadata was inserted/created -->
			<gmd:dateStamp>
				<!-- <gco:DateTime xmlns:srv="http://www.isotc211.org/2005/gmx"><xsl:value-of 
					select="/MetaData/OutputFiles/Output/METADATA_CREATION_DATE"/></gco:DateTime> -->
				<gco:DateTime xmlns:srv="http://www.isotc211.org/2005/gmx">
					<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/FILE_DATE" />
				</gco:DateTime>
			</gmd:dateStamp>
			<!-- Select the URL/URI information -->
			<gmd:dataSetURI>
				<gco:CharacterString>
					<xsl:value-of
						select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaURI" />
				</gco:CharacterString>
			</gmd:dataSetURI>

			<gmd:spatialRepresentationInfo>
				<gmie:MIE_Georectified>
					<gmd:numberOfDimensions>
						<gco:Integer>2</gco:Integer>
					</gmd:numberOfDimensions>
					<gmd:cellGeometry>
						<gmd:MD_CellGeometryCode
							codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/gmxCodelists.xml#MD_CellGeometryCode"
							codeListValue="area">area</gmd:MD_CellGeometryCode>
					</gmd:cellGeometry>

					<gmd:transformationParameterAvailability>
						<gco:Boolean xmlns:gco="http://www.isotc211.org/2005/gco">true</gco:Boolean>
					</gmd:transformationParameterAvailability>

					<xsl:choose>
						<xsl:when
							test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/GROUND_CONTROL_POINT_FILE_NAME">
							<gmd:checkPointAvailability>
								<gco:Boolean>true</gco:Boolean>
							</gmd:checkPointAvailability>
						</xsl:when>
						<xsl:otherwise>
							<gmd:checkPointAvailability>
								<gco:Boolean>false</gco:Boolean>
							</gmd:checkPointAvailability>
						</xsl:otherwise>
					</xsl:choose>

					<gmd:checkPointDescription>
						<gco:CharacterString>
							<xsl:value-of
								select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/GROUND_CONTROL_POINT_FILE_NAME" />
						</gco:CharacterString>
					</gmd:checkPointDescription>
					<gmd:cornerPoints>
						<gml:Point>
							<xsl:attribute name="gml:id">
								<xsl:value-of
								select="generate-id(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_UL_PROJECTION_Y_PRODUCT)" />
							</xsl:attribute>
							<gml:coordinates>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_UL_PROJECTION_X_PRODUCT" />
								<xsl:text>	</xsl:text>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_UL_PROJECTION_Y_PRODUCT" />
							</gml:coordinates>
						</gml:Point>
					</gmd:cornerPoints>

					<gmd:cornerPoints>
						<gml:Point xmlns:gml="http://www.opengis.net/gml"
							gml:id="{generate-id(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_UR_PROJECTION_Y_PRODUCT)}">
							<gml:coordinates>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_UR_PROJECTION_X_PRODUCT" />
								<xsl:text>	</xsl:text>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_UR_PROJECTION_Y_PRODUCT" />
							</gml:coordinates>
						</gml:Point>
					</gmd:cornerPoints>

					<gmd:cornerPoints>
						<gml:Point xmlns:gml="http://www.opengis.net/gml"
							gml:id="{generate-id(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_LL_PROJECTION_Y_PRODUCT)}">
							<gml:coordinates>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_LL_PROJECTION_X_PRODUCT" />
								<xsl:text>	</xsl:text>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_LL_PROJECTION_Y_PRODUCT" />
							</gml:coordinates>
						</gml:Point>
					</gmd:cornerPoints>

					<gmd:cornerPoints>
						<gml:Point xmlns:gml="http://www.opengis.net/gml"
							gml:id="{generate-id(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_LR_PROJECTION_Y_PRODUCT)}">
							<gml:coordinates>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_LR_PROJECTION_X_PRODUCT" />
								<xsl:text>	</xsl:text>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_LR_PROJECTION_Y_PRODUCT" />
							</gml:coordinates>
						</gml:Point>
					</gmd:cornerPoints>
					<gmd:pointInPixel>
						<gmd:MD_PixelOrientationCode>center</gmd:MD_PixelOrientationCode>
					</gmd:pointInPixel>
					<gmd:transformationDimensionMapping>
						<gco:CharacterString>unknown</gco:CharacterString>
					</gmd:transformationDimensionMapping>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/ORIENTATION">
						<gmi:orientationParameterDescription>
							<gco:CharacterString>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/ORIENTATION" />
							</gco:CharacterString>
						</gmi:orientationParameterDescription>
					</xsl:if>

				</gmie:MIE_Georectified>
			</gmd:spatialRepresentationInfo>

			<!-- PROJECTION PARAMETER -->

			<!-- Set reference system info (projection name and EPSG code) values -->
			<gmd:referenceSystemInfo>
				<gmi:MD_CRS>
					<gmi:projection>
						<gmd:RS_Identifier>
							<gmd:code>
								<gco:CharacterString><xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/MAP_PROJECTION" /></gco:CharacterString>
							</gmd:code>
						</gmd:RS_Identifier>
					</gmi:projection>
					<gmi:ellipsoid>
						<gmd:RS_Identifier>
							<gmd:code>
								<gco:CharacterString><xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/ELLIPSOID" /></gco:CharacterString>
							</gmd:code>
						</gmd:RS_Identifier>
					</gmi:ellipsoid>
					<gmi:datum>
						<gmd:RS_Identifier>
							<gmd:code>
								<gco:CharacterString><xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/DATUM" /></gco:CharacterString>
							</gmd:code>
						</gmd:RS_Identifier>
					</gmi:datum>
					<gmi:projectionParameters>
						<gmi:zone>
							<gco:Integer>
								<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/UTM_ZONE">
									<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/UTM_ZONE" />
								</xsl:if>
								<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/UTM_PARAMETERS/UTM_ZONE">
									<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/UTM_PARAMETERS/UTM_ZONE" />
								</xsl:if>
							</gco:Integer>
						</gmi:zone>
					</gmi:projectionParameters>
				</gmi:MD_CRS>
			</gmd:referenceSystemInfo>


			<!-- LANDSAT -->
			<!-- START INSERTING VALUES FOR IDENTIFICATION INFORMATION -->
			<!-- Basic information for the whole dataset -->
			<gmd:identificationInfo>
				<gmd:MD_DataIdentification>
					<gmd:citation>
						<gmd:CI_Citation>

							<!-- Select the title of the data -->
							<gmd:title>
								<gco:CharacterString>
									<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/LANDSAT_SCENE_ID">
											<xsl:value-of
												select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/LANDSAT_SCENE_ID" /> 
									</xsl:if>
									<xsl:if test="/MetaData/OutputFiles/Output/PRODUCT_FILENAME">
											<xsl:value-of
												select="/MetaData/OutputFiles/Output/PRODUCT_FILENAME" /> 
									</xsl:if>
								</gco:CharacterString>
							</gmd:title>

							<!-- Select the alternative title of the data -->
							<gmd:alternateTitle>
								<gco:CharacterString />
							</gmd:alternateTitle>

							<!-- Select the publication date of the data <gmd:date> <gmd:CI_Date> 
								<gmd:date> <gco:Date>2012-10-17</gco:Date> </gmd:date> <gmd:dateType> <gmd:CI_DateTypeCode 
								codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/ML_gmxCodelists.xml#CI_DateTypeCode" 
								codeListValue="publication"/> </gmd:dateType> </gmd:CI_Date> </gmd:date> -->

							<gmd:date>
								<gmd:CI_Date>
									<gmd:date>
										<gco:DateTime>
											<xsl:value-of
												select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/FILE_DATE" />
										</gco:DateTime>
									</gmd:date>
									<gmd:dateType>
										<gmd:CI_DateTypeCode
											codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/ML_gmxCodelists.xml#CI_DateTypeCode"
											codeListValue="creation" />
									</gmd:dateType>
								</gmd:CI_Date>
							</gmd:date>

							<!-- LANDSAT storage -->
							<!-- Select the URL/URI information -->
							<gmd:identifier>
								<gmd:MD_Identifier>
									<gmd:code>
										<gco:CharacterString>
											<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/LANDSAT_SCENE_ID" />
										</gco:CharacterString>
									</gmd:code>
								</gmd:MD_Identifier>
							</gmd:identifier>
						</gmd:CI_Citation>
					</gmd:citation>

					<!-- Select the Resource Abstract information -->
					<gmd:abstract>
						<gco:CharacterString>
							<xsl:value-of
							select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaABSTARCT" />
						</gco:CharacterString>
					</gmd:abstract>
					<gmd:pointOfContact>
						<gmd:CI_ResponsibleParty>
						
						
							<!-- Select the resposible organization name information -->
							<gmd:organisationName>
								<gco:CharacterString>
									<xsl:value-of
									select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaRESPONSIBLE_ORGANIZATION_NAME" />
								</gco:CharacterString>
							</gmd:organisationName>

							<gmd:contactInfo>
								<gmd:CI_Contact>
								<gmd:address>
								<gmd:CI_Address>
									<gmd:electronicMailAddress>
										<gco:CharacterString>
										<xsl:value-of select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaMETADATA_RESPONSIBLE_EMAIL" />
									</gco:CharacterString>
									</gmd:electronicMailAddress>
								</gmd:CI_Address>
							</gmd:address>
									<gmd:onlineResource>
										<!-- Select the webpage address -->
										<gmd:CI_OnlineResource>
											<gmd:linkage>
												<gmd:URL>
													<xsl:value-of
														select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaRESPONSIBLE_URL" />
												</gmd:URL>
											</gmd:linkage>
										</gmd:CI_OnlineResource>
									</gmd:onlineResource>
								</gmd:CI_Contact>
							</gmd:contactInfo>

							<!-- Select the entities role information -->
							<xsl:variable name="Data_Role_value">
								<xsl:value-of
									select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaRESPONSIBLE_ROLE" />
							</xsl:variable>
							<gmd:role>
								<gmd:CI_RoleCode
									codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/ML_gmxCodelists.xml#CI_RoleCode"
									codeListValue="{$Data_Role_value}" />
							</gmd:role>
						</gmd:CI_ResponsibleParty>
					</gmd:pointOfContact>

					<!-- Added by InM: see RT 49996 -->
					<xsl:if test="$staticValues/EURAC_GENERIC_P/InspireMetaData/CODESPACE[@type='WMS']">
						<gmd:graphicOverview>
							<gmd:MD_BrowseGraphic>
								<gmd:fileName>
									<gco:CharacterString>
											<xsl:value-of select="$staticValues/EURAC_GENERIC_P/InspireMetaData/CODESPACE" />?LAYERS=<xsl:value-of select="$staticValues/EURAC_GENERIC_P/InspireMetaData/PROCESSOR_NAME" />:<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/LANDSAT_SCENE_ID" />&amp;FORMAT=image%2Fpng&amp;SERVICE=WMS&amp;VERSION=1.1.1&amp;REQUEST=GetMap&amp;SRS=EPSG%3A4326&amp;BBOX=<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_UL_LON_PRODUCT" />,<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_LL_LAT_PRODUCT" />,<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_LR_LON_PRODUCT" />,<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_UL_LAT_PRODUCT" />&amp;WIDTH=150&amp;HEIGHT=70
									</gco:CharacterString>
								</gmd:fileName>
								<gmd:fileDescription>
									<gco:CharacterString>thumbnail</gco:CharacterString>
								</gmd:fileDescription>
								<gmd:fileType>
									<gco:CharacterString>png</gco:CharacterString>
								</gmd:fileType>
							</gmd:MD_BrowseGraphic>
						</gmd:graphicOverview>
						<gmd:graphicOverview>
							<gmd:MD_BrowseGraphic>
							<gmd:fileName>
								<gco:CharacterString>
											<xsl:value-of select="$staticValues/EURAC_GENERIC_P/InspireMetaData/CODESPACE" />?LAYERS=<xsl:value-of select="$staticValues/EURAC_GENERIC_P/InspireMetaData/PROCESSOR_NAME" />:<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/LANDSAT_SCENE_ID" />&amp;FORMAT=image%2Fpng&amp;SERVICE=WMS&amp;VERSION=1.1.1&amp;REQUEST=GetMap&amp;SRS=EPSG%3A4326&amp;BBOX=<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_UL_LON_PRODUCT" />,<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_LL_LAT_PRODUCT" />,<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_LR_LON_PRODUCT" />,<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_UL_LAT_PRODUCT" />&amp;WIDTH=745&amp;HEIGHT=330
									</gco:CharacterString>
								</gmd:fileName>
								<gmd:fileDescription>
									<gco:CharacterString>large_thumbnail</gco:CharacterString>
								</gmd:fileDescription>
								<gmd:fileType>
									<gco:CharacterString>png</gco:CharacterString>
								</gmd:fileType>
							</gmd:MD_BrowseGraphic>
						</gmd:graphicOverview>
					</xsl:if>
					<!-- ### End ### -->

					<gmd:descriptiveKeywords>
						<gmd:MD_Keywords>
							<!-- TYPE OF KEYWORD VALUE -->

							<xsl:for-each
								select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaKEYWORD">
								<gmd:keyword>
									<gco:CharacterString>
										<xsl:apply-templates select="*" />
										<xsl:value-of select="." />
									</gco:CharacterString>
								</gmd:keyword>
							</xsl:for-each>

							<gmd:type>
								<!-- TYPE OF KEYWORD VALUE -->
								<gmd:MD_KeywordTypeCode 
								codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/ML_gmxCodelists.xml#MD_KeywordTypeCode" codeListValue="theme" />
							</gmd:type>

							<!-- TITLE OF THESAURUS USED VALUE -->
							<gmd:thesaurusName>
								<gmd:CI_Citation>
									<gmd:title>
										<gco:CharacterString>GEMET - INSPIRE themes, version 1.0</gco:CharacterString>
									</gmd:title>
									<gmd:date>
										<gmd:CI_Date>

											<!-- DATE WHEN THE THESAURUS WAS PUBLISHED VALUE -->
											<gmd:date>
												<gco:Date>2008-06-01</gco:Date>
											</gmd:date>
											<gmd:dateType>
												<gmd:CI_DateTypeCode
													codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/ML_gmxCodelists.xml#CI_DateTypeCode"
													codeListValue="publication" />
											</gmd:dateType>
										</gmd:CI_Date>
									</gmd:date>
								</gmd:CI_Citation>
							</gmd:thesaurusName>
						</gmd:MD_Keywords>
					</gmd:descriptiveKeywords>

					<gmd:resourceConstraints>
						<gmd:MD_LegalConstraints>
							<gmd:useLimitation>
								<gco:CharacterString>
									<!-- LEGAL CONSTRAINTS ON DATA PUBLIC ACCESS VALUE -->
									<xsl:value-of
									select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaLIMITATIONS_ON_PUBLIC_ACCESS" />
								</gco:CharacterString>
							</gmd:useLimitation>
							<gmd:accessConstraints>

								<!-- OTHER RESTRICTIONS ON DATA VALUE -->
								<xsl:variable name="Access_Constraints_value">
									<xsl:value-of
										select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaOTHER_CONDITIONS_TO_ACCESS_AND_USE" />
								</xsl:variable>

								<gmd:MD_RestrictionCode
									codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/gmxCodelists.xml#MD_RestrictionCode"
									codeListValue="{$Access_Constraints_value}" />
							</gmd:accessConstraints>

							<gmd:useConstraints>
								<xsl:variable name="Applying_to_Access_and_use_value">
									<xsl:value-of
										select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaCONDITIONS_APPLYING_TO_ACCESS_AND_USE" />
								</xsl:variable>

								<!-- LEGAL CONSTRAINTS ON DATA USAGE VALUE -->
								<gmd:MD_RestrictionCode
									codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/gmxCodelists.xml#MD_RestrictionCode"
									codeListValue="{$Applying_to_Access_and_use_value}" />
							</gmd:useConstraints>
					<gmd:otherConstraints>
						<gco:CharacterString>no limitation</gco:CharacterString>
					</gmd:otherConstraints>							
						</gmd:MD_LegalConstraints>
					</gmd:resourceConstraints>


					<!-- Select the language used in the data -->
					<gmd:language>
						<gco:CharacterString>
							<xsl:value-of
							select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaRESOURCE_LANGUAGE" />
						</gco:CharacterString>
					</gmd:language>

					<!-- characterSet added -->
					<gmd:characterSet>
						<gmd:MD_CharacterSetCode
							codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/gmxCodelists.xml#MD_CharacterSetCode"
							codeListValue="utf8" />
					</gmd:characterSet>

					<!-- Select the topic category of the data -->
					<gmd:topicCategory>
						<gmd:MD_TopicCategoryCode>imageryBaseMapsEarthCover</gmd:MD_TopicCategoryCode>
					</gmd:topicCategory>
					<gmd:extent>
						<gmd:EX_Extent>
							<gmd:description>
								<gco:CharacterString>
									<xsl:value-of
									select="$staticValues/EURAC_GENERIC_P/InspireMetaData/MetaAOI" />
								</gco:CharacterString>
							</gmd:description>
							<gmd:geographicElement>
								<!-- BOUNDADING BOX -->
								<!-- Select the bounding box of the data -->
								<gmd:EX_GeographicBoundingBox>
									<gmd:westBoundLongitude>
										<gco:Decimal>
											<xsl:value-of
												select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_UL_LON_PRODUCT" />
										</gco:Decimal>
									</gmd:westBoundLongitude>
									<gmd:eastBoundLongitude>
										<gco:Decimal>
											<xsl:value-of
												select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_LR_LON_PRODUCT" />
										</gco:Decimal>
									</gmd:eastBoundLongitude>
									<gmd:southBoundLatitude>
										<gco:Decimal>
											<xsl:value-of
												select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_LL_LAT_PRODUCT" />
										</gco:Decimal>
									</gmd:southBoundLatitude>
									<gmd:northBoundLatitude>
										<gco:Decimal>
											<xsl:value-of
												select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CORNER_UL_LAT_PRODUCT" />
										</gco:Decimal>
									</gmd:northBoundLatitude>
								</gmd:EX_GeographicBoundingBox>

							</gmd:geographicElement>
						</gmd:EX_Extent>
					</gmd:extent>
				</gmd:MD_DataIdentification>
			</gmd:identificationInfo>
			<!-- END Basic information for the whole dataset -->


			<!-- Content Information -->

			<gmd:contentInfo>
				<gmie:MIE_ImageDescription>
					<gmd:attributeDescription>
						<gco:RecordType>Band Description</gco:RecordType>
					</gmd:attributeDescription>
					<gmd:contentType>
						<gmd:MD_CoverageContentTypeCode
							codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/gmxCodelists.xml#MD_CoverageContentTypeCode"
					codeListValue="image" />
					</gmd:contentType>
					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_1">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 1</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_1,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>

							</xsl:if>

							<!--Max and min wavelength. The values are constant to each band -->

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_1">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_1" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_1">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_1" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_1">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_1" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_1">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_1" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_1">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_1" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_1">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_1" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_1">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_1" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_1">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_1" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_1">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_1" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_1">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_1" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_1">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_1" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_1">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_1" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_1">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_1" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_1">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_1" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_1">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_1" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_1">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_1" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>

						</gmie:MIE_Band>
					</gmd:dimension>

					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_2">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 2</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_2,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>
							</xsl:if>

							<!--Max and min wavelength. The values are constant to each beand -->


							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_2">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_2" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_2">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_2" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_2">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_2" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_2">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_2" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_2">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_2" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_2">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_2" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_2">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_2" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_2">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_2" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_2">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_2" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_2">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_2" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_2">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_2" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_2">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_2" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_2">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_2" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_2">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_2" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_2">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_2" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_2">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_2" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>
						</gmie:MIE_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_3">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 3</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_3,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>
							</xsl:if>

							<!--Max and min wavelength. The values are constant to each beand -->


							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_3">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_3" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_3">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_3" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_3">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_3" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_3">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_3" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_3">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_3" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_3">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_3" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_3">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_3" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_3">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_3" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_3">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_3" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_3">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_3" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_3">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_3" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_3">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_3" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_3">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_3" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_3">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_3" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_3">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_3" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_3">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_3" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>
						</gmie:MIE_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_4">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 4</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_4,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>
							</xsl:if>

							<!--Max and min wavelength. The values are constant to each beand -->


							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_4">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_4" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_4">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_4" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_4">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_4" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_4">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_4" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_4">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_4" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_4">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_4" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_4">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_4" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_4">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_4" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_4">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_4" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_4">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_4" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_4">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_4" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_4">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_4" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_4">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_4" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_4">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_4" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_4">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_4" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_4">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_4" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>
						</gmie:MIE_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_5">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 5</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_5,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>

							</xsl:if>

							<!--Max and min wavelength. The values are constant to each beand -->


							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_5">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_5" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_5">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_5" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_5">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_5" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_5">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_5" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_5">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_5" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_5">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_5" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_5">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_5" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_5">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_5" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_5">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_5" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_5">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_5" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_5">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_5" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_5">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_5" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_5">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_5" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_5">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_5" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_5">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_5" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_5">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_5" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>
						</gmie:MIE_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_6_VCID_1">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 6 VCID 1</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_6_VCID_1,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>

							</xsl:if>

							<!--Max and min wavelength. The values are constant to each beand -->


							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_6_VCID_1">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_6_VCID_1" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_6_VCID_1">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_6_VCID_1" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_6_VCID_1">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_6_VCID_1" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_6_VCID_1">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_6_VCID_1" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_6_VCID_1">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_6_VCID_1" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_6_VCID_1">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_6_VCID_1" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_6_VCID_1">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_6_VCID_1" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_6_VCID_1">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_6_VCID_1" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_6_VCID_1">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_6_VCID_1" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_6_VCID_1">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_6_VCID_1" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_6_VCID_1">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_6_VCID_1" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_6_VCID_1">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_6_VCID_1" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_6_VCID_1">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_6_VCID_1" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_6_VCID_1">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_6_VCID_1" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_6_VCID_1">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_6_VCID_1" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_6_VCID_1">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_6_VCID_1" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>
						</gmie:MIE_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_6_VCID_2">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 6 VCID 2</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_6_VCID_2,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>

							</xsl:if>

							<!--Max and min wavelength. The values are constant to each beand -->


							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_6_VCID_2">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_6_VCID_2" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_6_VCID_2">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_6_VCID_2" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_6_VCID_2">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_6_VCID_2" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_6_VCID_2">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_6_VCID_2" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_6_VCID_2">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_6_VCID_2" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_6_VCID_2">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_6_VCID_2" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_6_VCID_2">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_6_VCID_2" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_6_VCID_2">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_6_VCID_2" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_6_VCID_2">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_6_VCID_2" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_6_VCID_2">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_6_VCID_2" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_6_VCID_2">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_6_VCID_2" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_6_VCID_2">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_6_VCID_2" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_6_VCID_2">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_6_VCID_2" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_6_VCID_2">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_6_VCID_2" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_6_VCID_2">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_6_VCID_2" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_6_VCID_2">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_6_VCID_2" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>
						</gmie:MIE_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_7">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 7</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_7,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>
							</xsl:if>

							<!--Max and min wavelength. The values are constant to each beand -->


							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_7">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_7" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_7">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_7" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_7">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_7" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_7">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_7" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_7">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_7" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_7">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_7" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_7">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_7" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_7">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_7" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_7">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_7" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_7">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_7" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_7">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_7" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_7">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_7" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_7">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_7" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_7">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_7" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_7">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_7" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_7">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_7" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>
						</gmie:MIE_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_8">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 8</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_8,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>

							</xsl:if>

							<!--Max and min wavelength. The values are constant to each beand -->


							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_8">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_8" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_8">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_8" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_8">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_8" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_8">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_8" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_8">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_8" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_8">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_8" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_8">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_8" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_8">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_8" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_8">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_8" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_8">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_8" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_8">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_8" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_8">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_8" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_8">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_8" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_8">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_8" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>
						</gmie:MIE_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_8_FIRST">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 8 first</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_8_FIRST,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>
							</xsl:if>

							<!--Max and min wavelength. The values are constant to each beand -->


							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8_FIRST">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8_FIRST" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_8_FIRST">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_8_FIRST" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8_FIRST">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8_FIRST" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_8_FIRST">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_8_FIRST" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_8_FIRST">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_8_FIRST" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_8_FIRST">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_8_FIRST" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_8_FIRST">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_8_FIRST" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_8_FIRST">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_8_FIRST" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_8_FIRST">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_8_FIRST" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_8_FIRST">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_8_FIRST" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_8_FIRST">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_8_FIRST" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_8_FIRST">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_8_FIRST" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_8_FIRST">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_8_FIRST" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_8_FIRST">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_8_FIRST" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_8_FIRST">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_8_FIRST" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_8_FIRST">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_8_FIRST" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>
						</gmie:MIE_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_8_SECOND">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 8 second</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_8_SECOND,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>
							</xsl:if>

							<!--Max and min wavelength. The values are constant to each beand -->


							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8_SECOND">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8_SECOND" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_8_SECOND">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_8_SECOND" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8_SECOND">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8_SECOND" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_8_SECOND">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_8_SECOND" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_8_SECOND">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_8_SECOND" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_8_SECOND">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_8_SECOND" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_8_SECOND">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_8_SECOND" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_8_SECOND">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_8_SECOND" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_8_SECOND">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_8_SECOND" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_8_SECOND">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_8_SECOND" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_8_SECOND">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_8_SECOND" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_8_SECOND">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_8_SECOND" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_8_SECOND">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_8_SECOND" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_8_SECOND">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_8_SECOND" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_8_SECOND">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_8_SECOND" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_8_SECOND">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_8_SECOND" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>
						</gmie:MIE_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_8_THIRD">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 8 third</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_8_THIRD,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>

							</xsl:if>

							<!--Max and min wavelength. The values are constant to each beand -->


							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8_THIRD">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8_THIRD" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_8_THIRD">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_8_THIRD" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8_THIRD">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_8_THIRD" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_8_THIRD">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_8_THIRD" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_8_THIRD">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_8_THIRD" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_8_THIRD">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_8_THIRD" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_8_THIRD">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_8_THIRD" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_8_THIRD">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_8_THIRD" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_8_THIRD">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_8_THIRD" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_8_THIRD">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_8_THIRD" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_8_THIRD">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_8_THIRD" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_8_THIRD">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_8_THIRD" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_8_THIRD">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_8_THIRD" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_8_THIRD">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_8_THIRD" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_8_THIRD">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_8_THIRD" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_8_THIRD">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_8_THIRD" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>
						</gmie:MIE_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_9">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 9</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_9,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>

							</xsl:if>

							<!--Max and min wavelength. The values are constant to each beand -->


							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_9">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_9" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_9">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_9" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_9">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_9" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_9">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_9" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_9">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_9" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_9">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_9" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_9">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_9" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_9">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_9" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_9">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_9" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_9">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_9" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_9">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_9" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_9">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_9" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_9">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_9" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_9">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_9" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_9">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_9" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_9">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_9" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>
						</gmie:MIE_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_10">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 10</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_10,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>

							</xsl:if>

							<!--Max and min wavelength. The values are constant to each beand -->


							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_10">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_10" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_10">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_10" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_10">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_10" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_10">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_10" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_10">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_10" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_10">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_10" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_10">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_10" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_10">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_10" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_10">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_10" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_10">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_10" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_10">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_10" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_10">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_10" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_10">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_10" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_10">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_10" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_10">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_10" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_10">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_10" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>
						</gmie:MIE_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmie:MIE_Band>
							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_11">
								<gmd:sequenceIdentifier>
									<gco:MemberName>
										<gco:aName>
											<gco:CharacterString>Spectral band</gco:CharacterString>
										</gco:aName>
										<gco:attributeType>
											<gco:TypeName>
												<gco:aName>
													<gco:CharacterString>Band 11</gco:CharacterString>
												</gco:aName>
											</gco:TypeName>
										</gco:attributeType>
									</gco:MemberName>
								</gmd:sequenceIdentifier>
								<gmd:descriptor>
									<gco:CharacterString>
										<xsl:value-of
											select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_11,'.TIF')" />
									</gco:CharacterString>
								</gmd:descriptor>

							</xsl:if>

							<!--Max and min wavelength. The values are constant to each beand -->


							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_11">
								<gmd:offset>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_11" />
									</gco:Real>
								</gmd:offset>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_11">
								<gmie:RadianceLMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MAXIMUM_BAND_11" />
									</gco:Real>
								</gmie:RadianceLMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_11">
								<gmie:RadianceLMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_RADIANCE/RADIANCE_MINIMUM_BAND_11" />
									</gco:Real>
								</gmie:RadianceLMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_11">
								<gmie:ReflectanceMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MAXIMUM_BAND_11" />
									</gco:Real>
								</gmie:ReflectanceMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_11">
								<gmie:ReflectanceMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_REFLECTANCE/REFLECTANCE_MINIMUM_BAND_11" />
									</gco:Real>
								</gmie:ReflectanceMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_11">
								<gmie:calibratedPixelValueMAX>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MAX_BAND_11" />
									</gco:Real>
								</gmie:calibratedPixelValueMAX>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_11">
								<gmie:calibratedPixelValueMIN>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MIN_MAX_PIXEL_VALUE/QUANTIZE_CAL_MIN_BAND_11" />
									</gco:Real>
								</gmie:calibratedPixelValueMIN>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_11">
								<gmie:correctionGainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_GAIN_BAND_11" />
									</gco:CharacterString>
								</gmie:correctionGainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_11">
								<gmie:correctionBiasBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/CORRECTION_BIAS_BAND_11" />
									</gco:CharacterString>
								</gmie:correctionBiasBand>
							</xsl:if>

							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_11">
								<gmie:gainBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_BAND_11" />
									</gco:CharacterString>
								</gmie:gainBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_11">
								<gmie:gainChangeBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_BAND_11" />
									</gco:CharacterString>
								</gmie:gainChangeBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_11">
								<gmie:gainChangeScanBand>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_PARAMETERS/GAIN_CHANGE_SCAN_BAND_11" />
									</gco:CharacterString>
								</gmie:gainChangeScanBand>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_11">
								<gmie:RadianceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_MULT_BAND_11" />
									</gco:Real>
								</gmie:RadianceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_11">
								<gmie:RadianceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/RADIANCE_ADD_BAND_11" />
									</gco:Real>
								</gmie:RadianceAdd>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_11">
								<gmie:ReflectanceMulti>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_MULT_BAND_11" />
									</gco:Real>
								</gmie:ReflectanceMulti>
							</xsl:if>

							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_11">
								<gmie:ReflectanceAdd>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/RADIOMETRIC_RESCALING/REFLECTANCE_ADD_BAND_11" />
									</gco:Real>
								</gmie:ReflectanceAdd>
							</xsl:if>
						</gmie:MIE_Band>

					</gmd:dimension>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/SUN_ELEVATION">
						<gmd:illuminationElevationAngle>
							<gco:Real>
								<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/SUN_ELEVATION" />
							</gco:Real>
						</gmd:illuminationElevationAngle>
					</xsl:if>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/SUN_AZIMUTH">
						<gmd:illuminationAzimuthAngle>
							<gco:Real>
								<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/SUN_AZIMUTH" />
							</gco:Real>
						</gmd:illuminationAzimuthAngle>
					</xsl:if>
					<gmd:imagingCondition />

					<gmd:imageQualityCode>
						<gmd:MD_Identifier>
							<gmd:code>
								<gco:CharacterString>
							<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/IMAGE_QUALITY" />
							</gco:CharacterString>
							</gmd:code>
						</gmd:MD_Identifier>
					</gmd:imageQualityCode>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/CLOUD_COVER">
						<gmd:cloudCoverPercentage>
							<gco:Real>
								<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/CLOUD_COVER" />
							</gco:Real>
						</gmd:cloudCoverPercentage>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CPF_NAME">
							<gmd:radiometricCalibrationDataAvailability>
								<gco:Boolean>true</gco:Boolean>
							</gmd:radiometricCalibrationDataAvailability>
						</xsl:when>
						<xsl:otherwise>
							<gmd:radiometricCalibrationDataAvailability>
								<gco:Boolean>false</gco:Boolean>
							</gmd:radiometricCalibrationDataAvailability>
						</xsl:otherwise>
					</xsl:choose>

					<xsl:choose>
						<xsl:when test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CPF_NAME">
							<gmd:cameraCalibrationInformationAvailability>
								<gco:Boolean>true</gco:Boolean>
							</gmd:cameraCalibrationInformationAvailability>
						</xsl:when>
						<xsl:otherwise>
							<gmd:cameraCalibrationInformationAvailability>
								<gco:Boolean>false</gco:Boolean>
							</gmd:cameraCalibrationInformationAvailability>
						</xsl:otherwise>
					</xsl:choose>


<!-- MIE -->






					<xsl:if
						test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/GROUND_CONTROL_POINTS_MODEL">
						<gmie:groundControlPointsModel>
							<gco:Integer>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/GROUND_CONTROL_POINTS_MODEL" />
							</gco:Integer>
						</gmie:groundControlPointsModel>
					</xsl:if>


			<gmie:maskInfo>
					<gmie:MIE_MaskInformation>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MASK_AVAILABILITY">									
							<gmie:maskAvailability>
								<gco:Boolean>
								<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MASK_AVAILABILITY" />
								</gco:Boolean>
							</gmie:maskAvailability>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/MASK_AVAILABILITY[@type='gap']">			
							<gmi:type>
								<gco:CharacterString>gap</gco:CharacterString>
							</gmi:type>
					</xsl:if>
					</xsl:if>
						<gmi:description>
							<gco:CharacterString>gap mask</gco:CharacterString>
						</gmi:description>
											<gmi:projection>
						<gmd:RS_Identifier>
							<gmd:code>
								<gco:CharacterString><xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/MAP_PROJECTION" /></gco:CharacterString>
							</gmd:code>
						</gmd:RS_Identifier>
					</gmi:projection>
					<gmie:maskFileName>
					<gco:CharacterString><xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/LANDSAT_SCENE_ID" />_MTLFmask</gco:CharacterString>
					</gmie:maskFileName>
					</gmie:MIE_MaskInformation>
			</gmie:maskInfo>


			<gmie:bandInfo>
					<gmie:MIE_BandCharacteristics>

						<gmie:panchromaticBand>
							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/PANCHROMATIC_LINES">
								<gmie:panchromaticLines>
									<gco:Integer>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/PANCHROMATIC_LINES" />
									</gco:Integer>
								</gmie:panchromaticLines>
								<gmie:panchromaticSamples>
									<gco:Integer>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/PANCHROMATIC_SAMPLES" />
									</gco:Integer>
								</gmie:panchromaticSamples>
							</xsl:if>
							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/GRID_CELL_SIZE_PANCHROMATIC">
								<gmi:resolution>
									<gco:Distance uom="m">
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/GRID_CELL_SIZE_PANCHROMATIC" />
									</gco:Distance>
								</gmi:resolution>
							</xsl:if>
						</gmie:panchromaticBand>

						<gmie:thermalBand>
							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/THERMAL_LINES">
								<gmie:thermalLines>
									<gco:Integer>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/THERMAL_LINES" />
									</gco:Integer>
								</gmie:thermalLines>
								<gmie:thermalSamples>
									<gco:Integer>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/THERMAL_SAMPLES" />
									</gco:Integer>
								</gmie:thermalSamples>
							</xsl:if>
							<gmi:resolution>
								<gco:Distance uom="m">
									<xsl:value-of
										select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/GRID_CELL_SIZE_THERMAL" />
								</gco:Distance>
							</gmi:resolution>
							<xsl:if
								test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/TIRS_THERMAL_CONSTANTS/K1_CONSTANT_BAND_10">
								<gmie:thermalConstant1Band10>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/TIRS_THERMAL_CONSTANTS/K1_CONSTANT_BAND_10" />
									</gco:Real>
								</gmie:thermalConstant1Band10>

								<gmie:thermalConstant1Band11>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/TIRS_THERMAL_CONSTANTS/K1_CONSTANT_BAND_11" />
									</gco:Real>
								</gmie:thermalConstant1Band11>

								<gmie:thermalConstant2Band10>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/TIRS_THERMAL_CONSTANTS/K2_CONSTANT_BAND_10" />
									</gco:Real>
								</gmie:thermalConstant2Band10>

								<gmie:thermalConstant2Band11>
									<gco:Real>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/TIRS_THERMAL_CONSTANTS/K2_CONSTANT_BAND_11" />
									</gco:Real>
								</gmie:thermalConstant2Band11>
							</xsl:if>

						</gmie:thermalBand>

						<gmie:reflectiveBand>
							<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/REFLECTIVE_LINES">
								<gmie:reflectiveLines>
									<gco:Integer>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/REFLECTIVE_LINES" />
									</gco:Integer>
								</gmie:reflectiveLines>
								<gmie:reflectiveSamples>
									<gco:Integer>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/REFLECTIVE_SAMPLES" />
									</gco:Integer>
								</gmie:reflectiveSamples>
							</xsl:if>
							<gmi:resolution>
								<gco:Distance uom="m">
									<xsl:value-of
										select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/GRID_CELL_SIZE_REFLECTIVE" />
								</gco:Distance>
							</gmi:resolution>
						</gmie:reflectiveBand>

					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_QUALITY">
						<gmie:fileNameBandQuality>
							<gco:CharacterString>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_QUALITY" />
							</gco:CharacterString>
						</gmie:fileNameBandQuality>
					</xsl:if>

					</gmie:MIE_BandCharacteristics>
			</gmie:bandInfo>


			<gmie:calibrationInfo>
				<gmie:MIE_CalibrationInformation>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CPF_NAME">
						<gmie:calibrationFilename>
							<gco:CharacterString>
								<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CPF_NAME" />
							</gco:CharacterString>
						</gmie:calibrationFilename>
					</xsl:if>
				</gmie:MIE_CalibrationInformation>
			</gmie:calibrationInfo>
						
				</gmie:MIE_ImageDescription>
			</gmd:contentInfo>

			<!-- added distribution info -->
			<gmd:distributionInfo>
				<gmd:MD_Distribution>
					<!-- Begin RT 47299 InM -->
					<xsl:choose>
						<xsl:when test="$staticValues/EURAC_GENERIC_P/InspireMetaData/CODESPACE[@type='WMS']">
							<gmd:distributionFormat>
								<gmd:MD_Format>
									<gmd:name>
										<gco:CharacterString>
											<xsl:value-of select="/MetaData/OutputFiles/Output/@filetype" />
										</gco:CharacterString>
									</gmd:name>
									<gmd:version>
										<gco:CharacterString>
											<xsl:value-of select="/MetaData/OutputFiles/Output/LINAGE" />
										</gco:CharacterString>
									</gmd:version>
								</gmd:MD_Format>
							</gmd:distributionFormat>
							<gmd:transferOptions>
								<gmd:MD_DigitalTransferOptions>
									<gmd:onLine>
										<gmd:CI_OnlineResource>
											<gmd:linkage>
												<gmd:URL>
													<xsl:value-of select="$staticValues/EURAC_GENERIC_P/InspireMetaData/CODESPACE" />?service=WMS&amp;
												</gmd:URL>
											</gmd:linkage>
											<gmd:protocol>
												<gco:CharacterString>OGC:WMS-1.1.1-http-get-map</gco:CharacterString>
											</gmd:protocol>
											<gmd:name>
												<gco:CharacterString>
													<xsl:value-of
													select="/MetaData/OutputFiles/Output/PROCESSOR_NAME" />:<xsl:value-of
													select="/MetaData/OutputFiles/Output/LAYERNAME" />
												</gco:CharacterString>
											</gmd:name>
											<gmd:description>
												<gco:CharacterString>
													Filename of layer <xsl:value-of
													select="/MetaData/OutputFiles/Output/PROCESSOR_NAME" />:<xsl:value-of
													select="/MetaData/OutputFiles/Output/LAYERNAME" /> 
													<xsl:value-of
													select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/LANDSAT_SCENE_ID" />
												</gco:CharacterString>
											</gmd:description>
										</gmd:CI_OnlineResource>
									</gmd:onLine>
								</gmd:MD_DigitalTransferOptions>
							</gmd:transferOptions>
						</xsl:when>
						<xsl:otherwise>
							<gmd:distributionFormat>
								<gmd:MD_Format>
									<gmd:name>
										<gco:CharacterString><xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/OUTPUT_FORMAT" /></gco:CharacterString>
									</gmd:name>
									<gmd:version>
										<gco:CharacterString><xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/LANDSAT_SCENE_ID" /></gco:CharacterString>
									</gmd:version>
								</gmd:MD_Format>
							</gmd:distributionFormat>
							<gmd:transferOptions>
								<gmd:MD_DigitalTransferOptions>
									<gmd:onLine>
										<gmd:CI_OnlineResource>
											<gmd:linkage>
												<gmd:URL>
													<xsl:value-of select="$staticValues/EURAC_GENERIC_P/InspireMetaData/CODESPACE" />/<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/LANDSAT_SCENE_ID" /><xsl:value-of select="$staticValues/EURAC_GENERIC_P/InspireMetaData/PRODUCT_FILETYPE" />
												</gmd:URL>
											</gmd:linkage>
											<gmd:protocol>
												<gco:CharacterString>WWW:DOWNLOAD-1.0-ftp--download</gco:CharacterString>
											</gmd:protocol>
											<gmd:name>
												<gco:CharacterString>
													<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/LANDSAT_SCENE_ID" />
												</gco:CharacterString>
											</gmd:name>
											<gmd:function>
												<gmd:CI_OnLineFunctionCode
													codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/ML_gmxCodelists.xml#CI_OnLineFunctionCode"
													codeListValue="" />
											</gmd:function>
										</gmd:CI_OnlineResource>
									</gmd:onLine>
								</gmd:MD_DigitalTransferOptions>
							</gmd:transferOptions>
						</xsl:otherwise>
					</xsl:choose>

				</gmd:MD_Distribution>
			</gmd:distributionInfo>

			<gmd:dataQualityInfo>
				<gmd:DQ_DataQuality>
					<gmd:scope>
						<gmd:DQ_Scope>
							<gmd:level>
								<gmd:MD_ScopeCode
									codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/ML_gmxCodelists.xml#MD_ScopeCode"
									codeListValue="dataset">dataset</gmd:MD_ScopeCode>
							</gmd:level>
						</gmd:DQ_Scope>
					</gmd:scope>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/GEOMETRIC_RMSE_MODEL">
			<gmd:report>
				<gmd:DQ_DomainConsistency>
					<gmd:result>
						<gmd:DQ_ConformanceResult>
							<gmd:specification>
								<gmd:CI_Citation>
									<gmd:title>
										<gco:CharacterString>INSPIRE Implementing rules</gco:CharacterString>
									</gmd:title>
									<gmd:date>
										<gmd:CI_Date>
											<gmd:date>
												<gco:Date>2000-01-01</gco:Date>
											</gmd:date>
											<gmd:dateType>
												<gmd:CI_DateTypeCode codeListValue="publication"
													codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/ML_gmxCodelists.xml#CI_DateTypeCode" />
											</gmd:dateType>
										</gmd:CI_Date>
									</gmd:date>
								</gmd:CI_Citation>
							</gmd:specification>
							<gmd:explanation>
								<gco:CharacterString>N/A</gco:CharacterString>
							</gmd:explanation>
							<gmd:pass>
								<gco:Boolean>1</gco:Boolean>
							</gmd:pass>
							</gmd:DQ_ConformanceResult>
						</gmd:result>
					</gmd:DQ_DomainConsistency>
				</gmd:report>
				<gmd:report>
							<gmd:DQ_GriddedDataPositionalAccuracy>
								<gmd:evaluationMethodDescription>
									<gco:CharacterString>GEOMETRIC RMSE MODEL</gco:CharacterString>
								</gmd:evaluationMethodDescription>
								<gmd:result>
									<gmd:DQ_QuantitativeResult>
										<gmd:valueUnit>
											<gml:BaseUnit>
												<xsl:attribute name="gml:id">
								<xsl:value-of
													select="generate-id(/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/GEOMETRIC_RMSE_MODEL)" />
								</xsl:attribute>
												<gml:identifier codeSpace="http://urn.opengis.net/">meter
												</gml:identifier>
												<gml:name>meter</gml:name>
												<gml:unitsSystem />
											</gml:BaseUnit>
										</gmd:valueUnit>
										<gmd:value>
											<gco:Record>
												<xsl:value-of
													select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/GEOMETRIC_RMSE_MODEL" />
											</gco:Record>
										</gmd:value>
									</gmd:DQ_QuantitativeResult>
								</gmd:result>
							</gmd:DQ_GriddedDataPositionalAccuracy>
						</gmd:report>
					</xsl:if>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/GEOMETRIC_RMSE_MODEL_Y">
						<gmd:report>
							<gmd:DQ_GriddedDataPositionalAccuracy>
								<gmd:evaluationMethodDescription>
									<gco:CharacterString>GEOMETRIC RMSE MODEL Y</gco:CharacterString>
								</gmd:evaluationMethodDescription>
								<gmd:result>
									<gmd:DQ_QuantitativeResult>
										<gmd:valueUnit>
											<gml:BaseUnit>
												<xsl:attribute name="gml:id">
								<xsl:value-of
													select="generate-id(/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/GEOMETRIC_RMSE_MODEL_Y)" />
								</xsl:attribute>
												<gml:identifier codeSpace="http://urn.opengis.net/">meter
												</gml:identifier>
												<gml:name>meter</gml:name>
												<gml:unitsSystem />
											</gml:BaseUnit>
										</gmd:valueUnit>
										<gmd:value>
											<gco:Record>
												<xsl:value-of
													select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/GEOMETRIC_RMSE_MODEL_Y" />
											</gco:Record>
										</gmd:value>
									</gmd:DQ_QuantitativeResult>
								</gmd:result>
							</gmd:DQ_GriddedDataPositionalAccuracy>
						</gmd:report>
					</xsl:if>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/GEOMETRIC_RMSE_MODEL_X">
						<gmd:report>
							<gmd:DQ_GriddedDataPositionalAccuracy>
								<gmd:evaluationMethodDescription>
									<gco:CharacterString>GEOMETRIC RMSE MODEL X</gco:CharacterString>
								</gmd:evaluationMethodDescription>
								<gmd:result>
									<gmd:DQ_QuantitativeResult>
										<gmd:valueUnit>
											<gml:BaseUnit>
												<xsl:attribute name="gml:id">
								<xsl:value-of
													select="generate-id(/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/GEOMETRIC_RMSE_MODEL_X)" />
								</xsl:attribute>
												<gml:identifier codeSpace="http://urn.opengis.net/">meter
												</gml:identifier>
												<gml:name>meter</gml:name>
												<gml:unitsSystem />
											</gml:BaseUnit>
										</gmd:valueUnit>
										<gmd:value>
											<gco:Record>
												<xsl:value-of
													select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/GEOMETRIC_RMSE_MODEL_X" />
											</gco:Record>
										</gmd:value>
									</gmd:DQ_QuantitativeResult>
								</gmd:result>
							</gmd:DQ_GriddedDataPositionalAccuracy>
						</gmd:report>
					</xsl:if>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/GEOMETRIC_RMSE_VERIFY">
						<gmd:report>
							<gmd:DQ_GriddedDataPositionalAccuracy>
								<gmd:evaluationMethodDescription>
									<gco:CharacterString>GEOMETRIC RMSE MODEL VERIFY</gco:CharacterString>
								</gmd:evaluationMethodDescription>
								<gmd:result>
									<gmd:DQ_QuantitativeResult>
										<gmd:valueUnit>
											<gml:BaseUnit>
												<xsl:attribute name="gml:id">
								<xsl:value-of
													select="generate-id(/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/GEOMETRIC_RMSE_VERIFY)" />
								</xsl:attribute>
												<gml:identifier codeSpace="http://urn.opengis.net/">pixel
												</gml:identifier>
												<gml:name>pixel</gml:name>
												<gml:unitsSystem />
											</gml:BaseUnit>
										</gmd:valueUnit>
										<gmd:value>
											<gco:Record>
												<xsl:value-of
													select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/GEOMETRIC_RMSE_VERIFY" />
											</gco:Record>
										</gmd:value>
									</gmd:DQ_QuantitativeResult>
								</gmd:result>
							</gmd:DQ_GriddedDataPositionalAccuracy>
						</gmd:report>
					</xsl:if>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/IMAGE_QUALITY_TIRS">
						<gmd:report>
							<gmd:DQ_NonQuantitativeAttributeAccuracy>
								<gmd:evaluationMethodDescription>
									<gco:CharacterString>Image Quality</gco:CharacterString>
								</gmd:evaluationMethodDescription>
								<gmd:result>
									<gmd:DQ_QuantitativeResult>
										<gmd:valueUnit>
											<gml:UnitDefinition>
												<xsl:attribute name="gml:id">
								<xsl:value-of
													select="generate-id(/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/IMAGE_QUALITY_TIRS)" />
								</xsl:attribute>
												<gml:description>Image Quality Landsat</gml:description>
												<gml:descriptionReference />
												<gml:identifier
													codeSpace="http://schemas.opengis.net/gml/3.2.1/units.xsd#UnitDefinitionType">quantityType</gml:identifier>
											</gml:UnitDefinition>
										</gmd:valueUnit>
										<gmd:value>
											<gco:Record>
												<xsl:value-of
													select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/IMAGE_QUALITY_TIRS" />
											</gco:Record>
										</gmd:value>
									</gmd:DQ_QuantitativeResult>
								</gmd:result>
							</gmd:DQ_NonQuantitativeAttributeAccuracy>
						</gmd:report>
					</xsl:if>
			<gmd:lineage>
				<gmd:LI_Lineage>
					<gmd:statement>
						<gco:CharacterString>Algorithm package used to process the data: Add algorithm
						</gco:CharacterString>
					</gmd:statement>
				</gmd:LI_Lineage>
			</gmd:lineage>
				</gmd:DQ_DataQuality>
			</gmd:dataQualityInfo>

			<gmi:acquisitionInformation>
				<gmie:MIE_AcquisitionInformation>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/SENSOR_ID">
						<gmi:instrument>
							<gmi:MI_Instrument>
								<gmi:type>
									<gco:CharacterString>
										<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/SENSOR_ID" />
									</gco:CharacterString>
								</gmi:type>
								<gmi:description>
									<gco:CharacterString>
										<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/SENSOR_MODE" />
									</gco:CharacterString>
								</gmi:description>
							</gmi:MI_Instrument>
						</gmi:instrument>
					</xsl:if>



						<gmi:operation>
							<gmi:MI_Operation>

						<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/STATION_ID">
							<gmie:receivingStationID>
								<gco:CharacterString>
									<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/STATION_ID" />
								</gco:CharacterString>
							</gmie:receivingStationID>
						</xsl:if>

						<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/ELEVATION_SOURCE">
							<gmie:elevationSource>
								<gco:CharacterString>
									<xsl:value-of
										select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/ELEVATION_SOURCE" />
								</gco:CharacterString>
							</gmie:elevationSource>
						</xsl:if>

						<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/EPHEMERIS_TYPE">
							<gmie:ephemerisType>
								<gco:CharacterString>
									<xsl:value-of
										select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/EPHEMERIS_TYPE" />
								</gco:CharacterString>
							</gmie:ephemerisType>
						</xsl:if>

						<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/NADIR_OFFNADIR">
							<gmie:nadirOffnadir>
								<gco:CharacterString>
									<xsl:value-of
										select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/NADIR_OFFNADIR" />
								</gco:CharacterString>
							</gmie:nadirOffnadir>
						</xsl:if>

					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/EARTH_SUN_DISTANCE">
						<gmie:earthSunDistance>
							<gco:Real>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/EARTH_SUN_DISTANCE" />
							</gco:Real>
						</gmie:earthSunDistance>
					</xsl:if>

					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/ROLL_ANGLE">
						<gmie:rollAngle>
							<gco:Real>
								<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/IMAGE_ATTRIBUTES/ROLL_ANGLE" />
							</gco:Real>
						</gmie:rollAngle>
					</xsl:if>

							</gmi:MI_Operation>
						</gmi:operation>



					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/SPACECRAFT_ID">
						<gmi:platform>
							<gmi:MI_Platform>
								<gmi:description>
									<gco:CharacterString>
										<xsl:value-of
											select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/SPACECRAFT_ID" />
									</gco:CharacterString>
								</gmi:description>
							</gmi:MI_Platform>
						</gmi:platform>
					</xsl:if>

						<gmi:acquisitionPlan>
							<gmie:MIE_Plan>
								<gmie:WRS>
									<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/WRS_PATH">
										<gmie:WRSpath>
											<gco:Integer>
												<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/WRS_PATH" />
											</gco:Integer>
										</gmie:WRSpath>
									</xsl:if>
		
									<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/WRS_ROW">
										<gmie:WRSrow>
											<gco:Integer>
												<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/WRS_ROW" />
											</gco:Integer>
										</gmie:WRSrow>
									</xsl:if>
		
									<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/TARGET_WRS_PATH">
										<gmie:WRSpathTarget>
											<gco:Integer>
												<xsl:value-of
													select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/TARGET_WRS_PATH" />
											</gco:Integer>
										</gmie:WRSpathTarget>
									</xsl:if>
		
									<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/TARGET_WRS_ROW">
										<gmie:WRSrowTarget>
											<gco:Integer>
												<xsl:value-of
													select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/TARGET_WRS_ROW" />
											</gco:Integer>
										</gmie:WRSrowTarget>
									</xsl:if>
								</gmie:WRS>
							</gmie:MIE_Plan>
						</gmi:acquisitionPlan>


	<gmie:productCharacteristics>

						<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/DATE_ACQUIRED">
							<gmie:dataAcquired>
								<gco:Date>
									<xsl:value-of
										select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/DATE_ACQUIRED" />
								</gco:Date>
							</gmie:dataAcquired>
							<gmie:sceneCenterTime>
								<gco:DateTime>
									<xsl:value-of
										select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/DATE_ACQUIRED" />
									<xsl:text>T</xsl:text>
									<xsl:value-of
										select="substring-before(/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/SCENE_CENTER_TIME,'.')" />
								</gco:DateTime>
							</gmie:sceneCenterTime>
						</xsl:if>



						<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/DATA_TYPE">
							<gmie:dataType>
								<gco:CharacterString>
									<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/DATA_TYPE" />
								</gco:CharacterString>
							</gmie:dataType>
						</xsl:if>
						<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/DATA_CATEGORY">
							<gmie:dataCategory>
								<gco:CharacterString>
									<xsl:value-of
										select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/DATA_CATEGORY" />
								</gco:CharacterString>
							</gmie:dataCategory>
						</xsl:if>


			<gmie:additionalFiles>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CPF_NAME">
						<gmie:calibrationFilename>
							<gco:CharacterString>
								<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/CPF_NAME" />
							</gco:CharacterString>
						</gmie:calibrationFilename>
					</xsl:if>
						
					
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_QUALITY">
						<gmie:fileNameBandQuality>
							<gco:CharacterString>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/FILE_NAME_BAND_QUALITY" />
							</gco:CharacterString>
						</gmie:fileNameBandQuality>
					</xsl:if>

					<gmie:maskFileName>
					<gco:CharacterString><xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/LANDSAT_SCENE_ID" />_MTLFmask</gco:CharacterString>
					</gmie:maskFileName>

					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/BPF_NAME_OLI">
						<gmie:BPFNameOLI>
							<gco:CharacterString>
								<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/BPF_NAME_OLI" />
							</gco:CharacterString>
						</gmie:BPFNameOLI>
					</xsl:if>

					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/BPF_NAME_TIRS">
						<gmie:BPFNameTIRS>
							<gco:CharacterString>
								<xsl:value-of select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/BPF_NAME_TIRS" />
							</gco:CharacterString>
						</gmie:BPFNameTIRS>
					</xsl:if>

					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/RLUT_FILE_NAME">
						<gmie:RLUTFileName>
							<gco:CharacterString>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PRODUCT_METADATA/RLUT_FILE_NAME" />
							</gco:CharacterString>
						</gmie:RLUTFileName>
					</xsl:if>	
						
						
						
		</gmie:additionalFiles>

					</gmie:productCharacteristics>
				

					<gmie:processingInformation>

						<xsl:if
							test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/PROCESSING_SOFTWARE_VERSION">
							<gmie:processingSoftwareVersion>
								<gco:CharacterString>
									<xsl:value-of
										select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/METADATA_FILE_INFO/PROCESSING_SOFTWARE_VERSION" />
								</gco:CharacterString>
							</gmie:processingSoftwareVersion>
						</xsl:if>
					<xsl:if test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/RESAMPLING_OPTION">
						<gmie:resamplingOption>
							<gco:CharacterString>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/RESAMPLING_OPTION" />
							</gco:CharacterString>
						</gmie:resamplingOption>
					</xsl:if>
					<xsl:if
						test="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/SCAN_GAP_INTERPOLATION">
						<gmie:scanGapInterpolation>
							<gco:Real>
								<xsl:value-of
									select="/MetaData/OutputFiles/Output/L1_METADATA_FILE/PROJECTION_PARAMETERS/SCAN_GAP_INTERPOLATION" />
							</gco:Real>
						</gmie:scanGapInterpolation>
					</xsl:if>					
					</gmie:processingInformation>
				
				
				</gmie:MIE_AcquisitionInformation>
			</gmi:acquisitionInformation>


		</gmie:MIE_Metadata>
	</xsl:template>

	<!-- Creates a gml:point element and generates automatically and id -->
	<xsl:template name="generatePoint">
		<xsl:param name="curr_node" />
		<xsl:param name="x_coord" />
		<xsl:param name="y_coord" />
		<gml:Point xmlns:gml="http://www.opengis.net/gml" gml:id="{generate-id($curr_node)}">
			<xsl:message>
				Current node:
				<xsl:value-of select="current()" />
			</xsl:message>
			<gml:coordinates>
				<xsl:value-of select="$x_coord" /><xsl:text> </xsl:text><xsl:value-of select="$y_coord" />
			</gml:coordinates>
		</gml:Point>
	</xsl:template>

</xsl:stylesheet>