<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="ttl" select="'BI-XML semestral project'"/>

    <xsl:variable name="css-import">
        <link rel="stylesheet" href="../styles/bootstrap.min.css"/>
        <link rel="stylesheet" href="../styles/customize.css"/>
    </xsl:variable>

    <xsl:template match="countries">
        <xsl:result-document method="html" doctype-system="about:legacy-compat" encoding="utf-8" href="output/index.html">
            <html lang="en">
                <head>
                    <title>
                        <xsl:copy-of select="$ttl"></xsl:copy-of>
                    </title>
                    <xsl:copy-of select="$css-import"/>
                </head>
                <body>
                    <div class="container">
                        <div class="navbar navbar-default navbar-static-top">
                            <h1>
                                <xsl:copy-of select="$ttl"></xsl:copy-of>
                            </h1>
                        </div>
                        <div class="row">
                            <xsl:apply-templates select="country" mode="link"/>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        <xsl:copy>
            <xsl:apply-templates select="country" mode="default"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="country" mode="link">
        <div class="col-sm-4 text-center">
            <a href="{@name}.html" class="btn btn-primary d-inline-block ml-1 mr-1">
                <xsl:value-of select="@name"/>
            </a>
        </div>
    </xsl:template>

    <xsl:template match="country" mode="default">
        <xsl:result-document method="html" doctype-system="about:legacy-compat" encoding="utf-8"
                             href="output/{@name}.html">
            <html lang="en">
                <head>
                    <title>
                        <xsl:value-of select="@name"/>
                    </title>
                    <xsl:copy-of select="$css-import"/>
                </head>
                <body>
                    <div class="container">
                        <div class="navbar navbar-default navbar-static-top">
                            <h1>
                                <xsl:value-of select="@name"/>
                            </h1>
                            <a href="index.html" class="btn btn-primary pull-right">Choose a different country</a>
                        </div>
                        <xsl:apply-templates select="section"/>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="section">
        <div class="category">
            <h2>
                <xsl:value-of select="@name"/>
            </h2>
            <xsl:apply-templates select="property"/>
        </div>
    </xsl:template>

    <xsl:template match="property">
        <div class="property">
            <h3>
                <xsl:value-of select="name"/>
            </h3>
            <xsl:apply-templates select="value"/>
            <xsl:if test="subproperty">
                <table class="table-striped table">
                    <xsl:apply-templates select="subproperty"/>
                </table>
            </xsl:if>
        </div>
    </xsl:template>

    <xsl:template match="value">
        <p>
            <xsl:value-of select="text()"/>
        </p>
    </xsl:template>

    <xsl:template match="subproperty">
        <tr>
            <td>
                <xsl:value-of select="name"/>
            </td>
            <td>
                <xsl:value-of select="value"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>