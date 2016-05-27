<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:t="http://www.tei-c.org/ns/1.0" 
    xmlns:wdt="http://www.wikidata.org/prop/direct/"
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
    
    <xsl:template match="t:idno[@type='wikidata'][string(.)]">
        <xsl:element name="{local-name()}">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
        <xsl:if test="not(following-sibling::t:idno[@type='VIAF'])">
            <xsl:variable name="wd-ent" select="concat('https://www.wikidata.org/wiki/Special:EntityData/',substring-after(.,'/wiki/'),'.rdf')"/>
            <xsl:if test="string(document($wd-ent)//wdt:P214[1])">
            <xsl:text>
                  </xsl:text>
            <xsl:element name="idno">
                <xsl:attribute name="type"><xsl:text>VIAF</xsl:text></xsl:attribute>
                <xsl:text>https://viaf.org/viaf/</xsl:text>
                <xsl:value-of select="document($wd-ent)//wdt:P214[1]"/>
            </xsl:element>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>