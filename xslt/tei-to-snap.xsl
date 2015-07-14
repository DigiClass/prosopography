<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="//tei:listPerson[not(ancestor::tei:listPerson)]"/>
    </xsl:template>
    
    <xsl:template match="tei:listPerson">
        <xsl:text><![CDATA[@prefix cito: <http://purl.org/spar/cito/> .
@prefix cnt: <http://www.w3.org/2011/content#> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix lawd: <http://lawd.info/ontology/> .
@prefix dct: <http://purl.org/dc/terms/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix snap: <http://onto.snapdrgn.net/snap#> .
]]></xsl:text>
        <!-- Model for each person record -->
        <xsl:for-each select="descendant::tei:person">
            <xsl:variable name="myid" select="@xml:id"/>
            <xsl:variable name="myuri">
                <xsl:text>http://digiclass.github.io/prosopography/Aphrodisias/</xsl:text>
                <xsl:value-of select="$myid"/>
                <xsl:text>.html</xsl:text>
            </xsl:variable>
            <!-- URI plus rdf:type -->
            <xsl:text><![CDATA[<]]></xsl:text>
            <xsl:value-of select="$myuri"/>
            <xsl:text><![CDATA[>]]>   </xsl:text>
            <xsl:text>rdf:type   </xsl:text>
            <xsl:choose>
                <xsl:when test="@role='deity'">
                    <xsl:text>lawd:Deity</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>lawd:Person</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <!-- Model for human-readable identifier -->
            <xsl:if test="tei:persName[@type='citable']">
                <xsl:text> ;&#xa;</xsl:text>
                <xsl:text>          dct:bibliographicCitation   "</xsl:text>
                <xsl:value-of select="normalize-space(tei:persName[@type='citable'])"/>
                <xsl:text>"</xsl:text>
            </xsl:if>
            <!-- Model for publisher -->
            <xsl:if test="ancestor::tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher">
                <xsl:text> ;&#xa;</xsl:text>
                <xsl:text>          dct:publisher   </xsl:text>
                <xsl:value-of select="normalize-space(ancestor::tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher)"/>
            </xsl:if>
            <!-- Model for collection -->
            <xsl:if test="ancestor::tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno">
                <xsl:text> ;&#xa;</xsl:text>
                <xsl:text>          dct:isPartOf   </xsl:text>
                <xsl:value-of select="normalize-space(ancestor::tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno)"/>
            </xsl:if>
            <!-- Model for each foaf:name -->
            <xsl:if test="child::tei:persName">
                <xsl:text> ;&#xa;</xsl:text>
                <xsl:text>          foaf:name   </xsl:text>
                <xsl:for-each select="child::tei:persName">
                    <xsl:text>"</xsl:text>
                    <xsl:value-of select="normalize-space(normalize-unicode(.))"/>
                    <xsl:text>"</xsl:text>
                    <xsl:if test="@xml:lang">
                        <xsl:text>@</xsl:text>
                        <xsl:value-of select="@xml:lang"/>
                    </xsl:if>
                    <xsl:if test="following-sibling::tei:persName">
                        <xsl:text> , </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:if>
            <!-- Model for each lawd:hasName -->
            <xsl:if test="child::tei:persName[@ref]">
                <xsl:text> ;&#xa;</xsl:text>
                <xsl:text>          lawd:hasName   </xsl:text>
                <xsl:text><![CDATA[<]]></xsl:text>
                <xsl:value-of select="child::tei:persName/@ref"/>
                <xsl:text><![CDATA[>]]></xsl:text>
            </xsl:if>
            <!-- Model for attestation/citation -->
            <xsl:if test="tei:listBibl/tei:bibl/text()">
                <xsl:text> ;&#xa;</xsl:text>
                <xsl:text>          lawd:hasAttestation   </xsl:text>
                <xsl:text><![CDATA[<]]></xsl:text>
                <xsl:value-of select="$myuri"/>
                <xsl:text>#reference</xsl:text>
                <xsl:text><![CDATA[>]]></xsl:text>
            </xsl:if>
            <!-- Model for date -->
            <xsl:if test="child::tei:floruit">
                <xsl:text> ;&#xa;</xsl:text>
            </xsl:if>
            
            <!-- Model for place -->
            <xsl:if test="tei:affiliation/text()">
                <xsl:text> ;&#xa;</xsl:text>
                <xsl:text>          lawd:associatedPlace   </xsl:text>
                <xsl:text><![CDATA[<]]></xsl:text>
                <xsl:value-of select="tei:affiliation/@ref"/>   
                <xsl:text><![CDATA[>]]></xsl:text>
            </xsl:if>
            
            <!-- Model for occupation -->
            <!-- Model for disambiguators -->
            <!-- Model for relationships/bonds -->
            <!-- Model for other ids -->
            
            <xsl:text> .&#xa;&#xa;</xsl:text>
            
            <!-- All citations for this person -->
            <!-- All bonds for this person -->
            
        </xsl:for-each>
        
        <!-- Model for publisher (whole collection) -->
        <!-- Model for collection (whole collection) -->
    </xsl:template>
    
</xsl:stylesheet>