<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:t="http://www.tei-c.org/ns/1.0" 
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
    
    <xsl:template match="t:idno[@type='wikidata']">
        <xsl:element name="{local-name()}">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
        <xsl:if test="not(following-sibling::t:idno[@type='Arabic'])">
            <xsl:text>
                  </xsl:text>
            <xsl:element name="idno">
                <xsl:attribute name="type"><xsl:text>Arabic</xsl:text></xsl:attribute>
                <xsl:text>http:</xsl:text>
                <xsl:value-of select="document(.)//span[@class='wikibase-sitelinkview-link wikibase-sitelinkview-link-arwiki']/a/@href"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="t:idno[@type='wikidata']">
        <xsl:element name="{local-name()}">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
        <xsl:if test="not(following-sibling::t:idno[@type='Chinese'])">
            <xsl:text>
                  </xsl:text>
            <xsl:element name="idno">
                <xsl:attribute name="type"><xsl:text>Chinese</xsl:text></xsl:attribute>
                <xsl:text>http:</xsl:text>
                <xsl:value-of select="document(.)//span[@class='wikibase-sitelinkview-link wikibase-sitelinkview-link-zhwiki']/a/@href"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>