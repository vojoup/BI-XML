<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="my-page"
								   page-height="297mm"
								   page-width="210mm"
								   margin="1in">
					<fo:region-body margin-bottom="15mm"/>
					<fo:region-after extent="10mm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="my-page">
				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>

	<xsl:template match="country">
		<fo:block break-after="page" color="#424242">
			<fo:block font-weight="700" font-size="280%" margin-bottom="10mm" color="#1565C0"><xsl:value-of select="@name" /></fo:block>
            <fo:external-graphic src="flags/{@name}.gif" />
			<xsl:apply-templates select="section"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="section">
		<fo:block margin-bottom="10mm">
			<fo:block font-weight="700" font-size="190%" margin-bottom="5mm" color="#1565C0"><xsl:value-of select="@name" /></fo:block>
			<fo:block><xsl:value-of select="value" /></fo:block>
			<xsl:apply-templates select="property" />
		</fo:block>
	</xsl:template>

	<xsl:template match="property">
		<fo:block margin-bottom="5mm">
			<fo:block font-weight="700" font-size="130%" color="#1565C0"><xsl:value-of select="name" /></fo:block>
			<fo:block margin-top="2mm" keep-with-previous="always"><xsl:value-of select="value" /></fo:block>
			<xsl:if test="subproperty">
				<fo:table table-layout="fixed" width="100%" margin-top="2mm" keep-with-previous="always">
					<fo:table-column column-width="proportional-column-width(1)"/>
					<fo:table-column column-width="proportional-column-width(1)"/>
					<fo:table-body>
						<xsl:apply-templates select="subproperty" />
					</fo:table-body>
				</fo:table>
			</xsl:if>
		</fo:block>
	</xsl:template>

	<xsl:template match="subproperty">
		<fo:table-row>
			<fo:table-cell column-number="1" padding="1mm" border="1px solid #2196F3" color="#fff" background-color="#2196F3">
				<fo:block font-weight="700"><xsl:value-of select="name/text()" /></fo:block>
			</fo:table-cell>
			<fo:table-cell column-number="2" padding="1mm" border="1px solid #2196F3">
				<fo:block><xsl:value-of select="value/text()" /></fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

</xsl:stylesheet>