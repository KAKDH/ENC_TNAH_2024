<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet 
[
<!ENTITY % Menota_entities SYSTEM 'http://www.menota.org/menota-entities.txt'>
%Menota_entities; ]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:me="http://www.menota.org/ns/1.0"
    xmlns:xhtml="http://www.w3.org/1999/xhtml" version="2.0" exclude-result-prefixes="#all"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">

    <xsl:output method="html" encoding="UTF-8"/>
    <!-- This is a basic stylesheet prepared for the course Manuscripts in the digital age at ESU DH 2019 by K. A. Kapitan in June 2019-->
    
    <xsl:strip-space elements="*"/>
    <xsl:template match="tei:TEI">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>Catalogue</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
               
                    <xsl:apply-templates select="tei:teiHeader"/>
                    <xsl:apply-templates select="tei:facsimile"/>
                
            </body>
        </html>
    </xsl:template>

    <!-- mss info -->
    <xsl:template match="tei:titleStmt"/>
    <xsl:template match="tei:availabiblity"/>
    <xsl:template match="tei:publicationStmt"/>

    <!-- Fascimine - Inster Image -->
    <xsl:template match="tei:facsimile">
        <xsl:apply-templates select="tei:graphic"/>
    </xsl:template>
    <xsl:template match="tei:graphic">
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="@url"/>
            </xsl:attribute>
            <xsl:attribute name="style">
                <xsl:text>float: left; width: 400px;</xsl:text>
            </xsl:attribute>
        </img>
    </xsl:template>
    <!-- Uses the attribute 'url' of 'graphic' element as an attribute of html elemet 'img' -->
    
    <xsl:template match="teiHeader">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="msDesc/msIdentifier">
        <h1>
            <xsl:apply-templates select="settlement"/><xsl:text>, </xsl:text>
            <xsl:apply-templates select="repository"/><xsl:text>, </xsl:text>
            <xsl:apply-templates select="idno"/>
        </h1>
    </xsl:template>



    <xsl:template match="msContents">
      <div>
        <xsl:apply-templates/>
      </div>
    </xsl:template>
    <xsl:template match="summary">
        <h2><xsl:text>Short Description</xsl:text></h2>
        <p>
        <xsl:apply-templates/>
        </p>
        <h2><xsl:text>Contents:</xsl:text></h2>
    </xsl:template>

    <xsl:template match="msItem">
        
        <ul>
            <xsl:for-each select=".">
                  <li>  <xsl:apply-templates select="title"/>
                <xsl:text> by </xsl:text>
                      <xsl:apply-templates select="author"/></li>
                    <xsl:apply-templates select="textLang"/>
                    <xsl:apply-templates select="rubric"/>
                    <xsl:apply-templates select="incipit"/>
                    <xsl:apply-templates select="explicit"/>
                    <xsl:apply-templates select="finalRubric"/>
                    <xsl:apply-templates select="colophon"/>
                    <xsl:apply-templates select="filiation"/>
                    <xsl:apply-templates select="note"/>
                    <xsl:apply-templates select="msItem"/>
            </xsl:for-each>
        </ul>
        
    </xsl:template>
    <xsl:template match="msItem/title">
   
            <xsl:apply-templates/>
       
    </xsl:template>
    <xsl:template match="msItem/author">
            <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="msItem/rubric">
        <li>
            <b>
                <xsl:text>Rubric: </xsl:text>
            </b>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="msItem/incipit">
        <li>
            <b>
                <xsl:text>Incipt: </xsl:text>
            </b>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="msItem/explicit">
        <li>
            <b>
                <xsl:text>Explicit: </xsl:text>
            </b>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="msItem/finalRubric">
        <li>
            <b>
                <xsl:text>Final Rubric: </xsl:text>
            </b>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    <xsl:template match="msItem/colophon">
        <li>
            <b>
                <xsl:text>Colophon: </xsl:text>
            </b>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    <xsl:template match="msItem/note">
        <li>
            <b>
                <xsl:text>Notes: </xsl:text>
            </b>
            <xsl:apply-templates/>
            <br/>
        </li>
    </xsl:template>
    <xsl:template match="filiation">
        <li>
            <b>
                <xsl:text>Filiation: </xsl:text>
            </b>
            <xsl:apply-templates/>
            <br/>
        </li>
    </xsl:template>



    <!-- Make expansions into italics -->
    <xsl:template match="ex">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    
</xsl:stylesheet>
