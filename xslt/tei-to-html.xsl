<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01//EN"
        doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
    <xsl:template match="/">
        <xsl:for-each select="//tei:person">
            <xsl:result-document method="html" href="html-test/{@xml:id}.html">
                <html>
                    <head>
                        <title>
                            <xsl:value-of select="//tei:titleStmt/tei:title[1]"/>
                            <xsl:text>: </xsl:text>
                            <xsl:value-of select="tei:persName[@xml:lang='en'][1]"/>
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
                        <script src="http://isawnyu.github.io/awld-js/lib/requirejs/require.min.js" type="text/javascript"></script>
                        <script src="http://isawnyu.github.io/awld-js/awld.js" type="text/javascript"></script>
                        <script type="text/javascript">
                            awld.init();
                        </script>
                    </head>
                    <body>
                        <h1>
                            <xsl:value-of select="//tei:titleStmt/tei:title[1]"/>
                        </h1>
                        <h2>
                            <xsl:value-of select="tei:persName[@xml:lang='en'][1]"/>
                        </h2>
                        <dl>
                            <dt>Permalink:</dt>
                            <dd>
                                <a href="">http://digiclass.github.io/prosopography/Aphrodisias/<xsl:value-of
                                        select="./@xml:id"/>.html</a>
                            </dd>
                            <dt>Type:</dt>
                            <dd>person</dd>
                            <dt>Name(s):</dt>
                            <xsl:for-each select="tei:persName">
                                <dd>
                                    <xsl:value-of select="text()"/>
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
                                    <xsl:value-of select="text()"/>; </xsl:for-each>
                            </dd>
                            <dt>Attestation(s):</dt>
                            <dd>
                                <xsl:for-each select="tei:listBibl/tei:bibl">
                                    <xsl:value-of select="text()"/>;
                                </xsl:for-each>
                            </dd>
                            <dt>Other identifier(s):</dt>
                            <dd>
                                <xsl:for-each select="tei:idno">
                                    <xsl:value-of select="text()"/>
                                </xsl:for-each>
                            </dd>
                        </dl>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
