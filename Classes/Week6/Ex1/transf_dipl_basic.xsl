<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY aelig "&#230;">
<!ENTITY oslash "&#248;">
<!ENTITY aring "&#229;">
<!ENTITY AElig "&#198;">
<!ENTITY Oslash "&#216;">
<!ENTITY Aring "&#197;">
<!ENTITY dash "&#45;">
<!ENTITY lquo "&#171;">
<!ENTITY rquo "&#187;">
<!ENTITY nbsp "&#x0020;">
<!ENTITY carr "&#x0D;">
<!ENTITY lsquo  "&#x2018;">
<!ENTITY ldquo  "&#x201C;">
<!ENTITY rsquo  "&#x2019;">
<!ENTITY rdquo  "&#x201D;">
<!ENTITY ercurl "&xF1C8;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:me="http://www.menota.org/ns/1.0"
    xmlns:xhtml="http://www.w3.org/1999/xhtml" version="2.0" exclude-result-prefixes="#all"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" doctype-public="-//W3C/DTD XHTML 1.0 STRICT//EN" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="tei:TEI">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>Transformation developed for the course Manuscripts
                    in the Digital Age at ESU DH 2021 by Katarzyna Anna Kapitan. CC BY-NC</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <div class="webview">
                    <xsl:apply-templates select="tei:facsimile"/>
                    <xsl:apply-templates select="tei:teiHeader"/>
                    <xsl:apply-templates select="text"/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="titleStmt">
        <xsl:element name="H1"><xsl:apply-templates/></xsl:element>
    </xsl:template>
    <xsl:template match="publicationStmt"/>
    
    <xsl:template match="msIdentifier">
        <xsl:element name="H2"><xsl:apply-templates/></xsl:element>
    </xsl:template>
    <xsl:template match="country"><xsl:apply-templates/><xsl:text>, </xsl:text></xsl:template>
    <xsl:template match="settlement"><xsl:apply-templates/><xsl:text>, </xsl:text></xsl:template>
    <xsl:template match="repository"><xsl:apply-templates/><xsl:text>, </xsl:text></xsl:template>
    <xsl:template match="idno"><xsl:apply-templates/><xsl:text>.</xsl:text></xsl:template>
    
    
    <xsl:template match="text">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="am"/>
    
    <xsl:template match="ex">
        <xsl:element name="i"><xsl:apply-templates/></xsl:element>
    </xsl:template>
    
    <xsl:template match="pb">
        <xsl:element name="br"><xsl:value-of select="@n"/></xsl:element>
    </xsl:template>
    
    <xsl:template match="lb">
        <xsl:text>|</xsl:text><xsl:element name="sup"><xsl:value-of select="@n"/></xsl:element>
    </xsl:template>
    
</xsl:stylesheet>