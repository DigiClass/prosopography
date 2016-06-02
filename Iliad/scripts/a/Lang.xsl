<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:t="http://www.tei-c.org/ns/1.0" 
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    version="2.0">
    
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no"/>
    
    <!-- copy all existing elements -->
    
    <xsl:template match="t:*">
        <xsl:element name="{local-name()}">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//processing-instruction()">
        <xsl:text>
</xsl:text>
        <xsl:copy>
            <xsl:value-of select="."/>
        </xsl:copy>
        <xsl:text>
</xsl:text>
    </xsl:template>
    
    <xsl:template match="comment()">
        <xsl:copy>
            <xsl:value-of select="."/>
        </xsl:copy>
    </xsl:template>
    
    <!--   EXCEPTIONS   -->
    
    <xsl:template match="t:persName[@xml:lang='ar'][string(.)]">
        <xsl:element name="{local-name()}">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
        <xsl:if test="not(following-sibling::t:persName[@xml:lang='ar'])">
            <xsl:variable name="arab" select="concat('https://www.wikidata.org/wiki/Special:EntityData/',substring-after(.,'/entity/'),'.rdf')"/>
            <xsl:if test="string(document($arab)//rdf:Description[@rdf:about='https://www.wikidata.org/wiki/Special:EntityData/'])">
                <xsl:text>
                  </xsl:text>
                <xsl:element name="persName">
                    <xsl:attribute name="xml:lang"><xsl:text>ar</xsl:text></xsl:attribute>
                    <xsl:text></xsl:text>
                    <xsl:value-of select="document($arab)//skos:prefLabel[@xml:lang='ar']"/>
                </xsl:element>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>