<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01//EN"
        doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
    <xsl:template match="/">
        <xsl:result-document method="html" href="html/index.html">
            <html>
                <head>
                    <title>Index</title>
                </head>
                <body>
                    <h1><xsl:value-of select="//tei:titleStmt/tei:title[@type='full']"/></h1>
                    <h2>Table of Contents</h2>
                    <ul>
                        <xsl:for-each select="//tei:person">
                            <li>
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="./@xml:id"/><xsl:text>.html</xsl:text>
                                    </xsl:attribute>
                                    <xsl:choose>
                                        <xsl:when test="starts-with(@xml:id,'fas')">
                                            <xsl:text>Fasti </xsl:text>
                                            <xsl:number value="substring-after(@xml:id,'fas')" format="1"/>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@xml:id,'pers')">
                                            <xsl:text>Person </xsl:text>
                                            <xsl:number value="substring-after(@xml:id,'pers')" format="1"/>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@xml:id,'hero')">
                                            <xsl:text>Hero </xsl:text>
                                            <xsl:number value="substring-after(@xml:id,'hero')" format="1"/>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:text>. </xsl:text>
                                    <xsl:value-of select="./tei:persName[@xml:lang='en']"/></xsl:element>
                            </li>
                        </xsl:for-each>
                    </ul>
                </body>
            </html>
        </xsl:result-document>
        <xsl:for-each select="//tei:person">
            <xsl:result-document method="html" href="html/{@xml:id}.html">
                <html>
                    <head>
                        <title>
                            <xsl:value-of select="//tei:titleStmt/tei:title[1]"/>
                            <xsl:text>: </xsl:text>
                            <xsl:value-of select="tei:persName[@xml:lang = 'en'][1]"/>
                        </title>
                        <meta charset="utf-8"/>
                        <style>
                            dt
                            {
                            font-weight:bold;
                            display:inline-block;
                            width:10em;
                            float:left;
                            clear:both;
                            }
                            dd
                            {
                            display:inline-block;
                            min-width:5%;
                            float:left;
                            margin-bottom:0.25em;
                            }</style>
                        <script src="http://isawnyu.github.io/awld-js/lib/requirejs/require.min.js" type="text/javascript"/>
                        <script src="http://isawnyu.github.io/awld-js/awld.js" type="text/javascript"/>
                        <script type="text/javascript">
                            awld.init();
                        </script>
                    </head>
                    <body>
                        <h1>
                            <xsl:value-of select="//tei:titleStmt/tei:title[1]"/>
                        </h1>
                        <h2>
                            <xsl:choose>
                                <xsl:when test="starts-with(@xml:id,'fas')">
                                    <xsl:text>Fasti </xsl:text>
                                    <xsl:number value="substring-after(@xml:id,'fas')" format="1"/>
                                </xsl:when>
                                <xsl:when test="starts-with(@xml:id,'pers')">
                                    <xsl:text>Person </xsl:text>
                                    <xsl:number value="substring-after(@xml:id,'pers')" format="1"/>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:text>. </xsl:text>
                            <xsl:value-of select="tei:persName[@xml:lang = 'en'][1]"/>
                        </h2>
                        <dl>
                            <dt>Citation:</dt>
                            <dd>
                                <xsl:value-of select="//tei:titleStmt/tei:title[@type='abbrev']"/>
                                <xsl:text>, </xsl:text>
                                <xsl:choose>
                                    <xsl:when test="/tei:TEI/@xml:id='FPAph'">
                                        <xsl:choose>
                                            <xsl:when test="starts-with(@xml:id,'fas')">
                                                <xsl:text>Fasti </xsl:text>
                                                <xsl:number value="substring-after(@xml:id,'fas')" format="1"/>
                                            </xsl:when>
                                            <xsl:when test="starts-with(@xml:id,'pers')">
                                                <xsl:text>Person </xsl:text>
                                                <xsl:number value="substring-after(@xml:id,'pers')" format="1"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:when>
                                </xsl:choose>                                
                            </dd>
                            <dt>Permalink:</dt>
                            <dd>
                                <a href="">http://digiclass.github.io/prosopography/Aphrodisias/html/<xsl:value-of
                                    select="./@xml:id"/>.html</a>
                            </dd>
                            <dt>Type:</dt>
                            <dd>person</dd>
                            <dt>Name(s):</dt>
                            <xsl:for-each select="tei:persName">
                                <dd>
                                    <xsl:value-of select="normalize-space(text())"/>
                                    <xsl:if test="following-sibling::tei:persName">
                                    <xsl:text>; </xsl:text>
                                    </xsl:if>
                                </dd>    
                            </xsl:for-each>
                            <dt>Associated date(s):</dt>
                            <dd>
                                <xsl:value-of select="tei:floruit"/>
                            </dd>
                            <dt>Associated place(s):</dt>
                            <dd>
                                <a href="{tei:affiliation/@ref}">
                                    <xsl:value-of select="tei:affiliation"/>
                                </a>
                            </dd>
                            <dt>Occupation/title(s):</dt>
                            <dd>
                                <xsl:for-each select="tei:occupation">
                                    <xsl:value-of select="text()"/>
                                    <xsl:if test="following-sibling::tei:occupation">
                                        <xsl:text>; </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </dd>
                                <dt>Attestation(s):</dt>
                                <dd>
                                    <xsl:for-each select="tei:listBibl/tei:bibl[text()]">
                                        <xsl:choose>
                                            <xsl:when test="@corresp">
                                            <xsl:element name="a">
                                                    <xsl:attribute name="href" select="@corresp"/>
                                                    <xsl:value-of select="normalize-space(.)"/>
                                             </xsl:element>     
                                            </xsl:when>
                                            <!-- write exceptions for known URLs here -->
                                            <xsl:when test="starts-with(.,'http')">
                                            <xsl:element name="a">
                                                    <xsl:attribute name="href" select="normalize-space(.)"/>
                                                    <xsl:value-of select="normalize-space(.)"/>
                                             </xsl:element>     
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:if test="following-sibling::tei:bibl[text()]">
                                            <xsl:element name="br"/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </dd>
                                <xsl:if test="tei:idno">
                                <dt>Other identifier(s):</dt>
                                <dd>
                                    <xsl:for-each select="tei:idno">
                                        <xsl:value-of select="text()"/>
                                        <xsl:if test="following-sibling::tei:bibl">
                                            <xsl:text>; </xsl:text>
                                        </xsl:if>
                                    </xsl:for-each>
                                </dd>
                            </xsl:if>
                        </dl>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>