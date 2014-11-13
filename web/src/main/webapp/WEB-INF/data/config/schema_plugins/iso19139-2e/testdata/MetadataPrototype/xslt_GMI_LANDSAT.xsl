<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0" xmlns:gmi="http://sdi.eurac.edu/metadata/iso19139-2"
	xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gml="http://www.opengis.net/gml"
	xmlns:gss="http://www.isotc211.org/2005/gss"
	xsi:schemaLocation="http://www.isotc211.org/2005/gmd http://sdi.eurac.edu/metadata/schema/gmd/gmd.xsd">

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
			
			<gmi:MI_Metadata xmlns:gmi="http://sdi.eurac.edu/metadata/iso19139-2" 
			xmlns:gss="http://www.isotc211.org/2005/gss" 
			xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd" 
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
			gco:isoType="gmd:MD_Metadata" 
			xsi:schemaLocation="http://sdi.eurac.edu/metadata/iso19139-2  ../../WEB-INF/data/config/schema_plugins/iso19139-2/schema/gmi/gmie.xsd">
			
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
				<gmi:MI_Georectified>
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

				</gmi:MI_Georectified>
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
				<gmi:MI_ImageDescription>
					<gmd:attributeDescription>
						<gco:RecordType>Band Description</gco:RecordType>
					</gmd:attributeDescription>
					<gmd:contentType>
						<gmd:MD_CoverageContentTypeCode
							codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/codelist/gmxCodelists.xml#MD_CoverageContentTypeCode"
					codeListValue="image" />
					</gmd:contentType>
					<gmd:dimension>
						<gmi:MI_Band>
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

						</gmi:MI_Band>
					</gmd:dimension>

					<gmd:dimension>
						<gmi:MI_Band>
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

						</gmi:MI_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmi:MI_Band>
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

						</gmi:MI_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmi:MI_Band>
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

						</gmi:MI_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmi:MI_Band>
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


						</gmi:MI_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmi:MI_Band>
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


						</gmi:MI_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmi:MI_Band>
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


						</gmi:MI_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmi:MI_Band>
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

						</gmi:MI_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmi:MI_Band>
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


						</gmi:MI_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmi:MI_Band>
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


						</gmi:MI_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmi:MI_Band>
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


						</gmi:MI_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmi:MI_Band>
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


						</gmi:MI_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmi:MI_Band>
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


						</gmi:MI_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmi:MI_Band>
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


						</gmi:MI_Band>
					</gmd:dimension>
					<gmd:dimension>
						<gmi:MI_Band>
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


						</gmi:MI_Band>

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



						
				</gmi:MI_ImageDescription>
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
				<gmi:MI_AcquisitionInformation>
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
							<gmi:MI_Plan>

							</gmi:MI_Plan>
						</gmi:acquisitionPlan>


				</gmi:MI_AcquisitionInformation>
			</gmi:acquisitionInformation>


		</gmi:MI_Metadata>
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