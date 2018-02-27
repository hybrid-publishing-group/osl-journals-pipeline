<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:saxon="http://saxon.sf.net/"
  xmlns:dbk="http://docbook.org/ns/docbook"
  xmlns:tr="http://transpect.io"
  xmlns:idml2xml="http://transpect.io/idml2xml"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:css="http://www.w3.org/1996/css"
  xmlns:hub="http://transpect.io/hub"
  xmlns="http://docbook.org/ns/docbook"
  xpath-default-namespace="http://docbook.org/ns/docbook"
  exclude-result-prefixes="xs saxon tr xlink hub dbk idml2xml"
  version="2.0">
 
  <!--  catch all must be first -->
  <xsl:import href="http://transpect.io/evolve-hub/xsl/evolve-hub.xsl"/>
  
  <xsl:variable name="hub:hierarchy-role-regexes-x" as="xs:string+"
    select="('osl_[Hh]eading[ ]?1$', 'osl_[Hh]eading[ ]?2$', 'osl_[Hh]eading[ ]?3$', 'osl_[Hh]eading[ ]?4$', 'osl_[Hh]eading[ ]?5$', 'osl_[Hh]eading[ ]?6$')" />
  
  <xsl:variable name="hub:itemizedlist-mark-chars-regex" as="xs:string"
    select="'([&#xb7;&#x25aa;&#x25a1;&#x25b6;&#x25cf;&#x2212;&#x2022;\p{So}\p{Pd}&#x23af;&#xF0B7;&#xF0BE;&#61485;&#x2d7;-])'"/>

  <xsl:output
    method="xml"
    indent="no"
    encoding="utf-8"
    />

  <xsl:output
    name="debug"
    method="xml"
    indent="yes"
    encoding="utf-8"
    saxon:suppress-indentation="para title simpara tocentry"
    />

  <!-- Params -->

  <xsl:param name="debug" select="'yes'"/>
  <xsl:param name="debug-path" select="concat($stylesheet-dir, 'debug')"/>
  <xsl:param name="set-debugging-info-origin" select="'false'"/>
  <xsl:param name="srcpaths" select="'no'"/>
  <xsl:param name="create-caption-numtext-separator" select="'no'"/>
  <xsl:param name="expand-css-properties" select="'yes'"/>
  <xsl:param name="remove-HyperlinkTextDestination-links" select="'no'"/>
  <xsl:param name="aux" select="'no'"/>
  <xsl:param name="evolve-textreference-to-link" select="'no'"/>
  <xsl:param name="move-floats" select="'yes'"/>
  <xsl:param name="remove-empty-paras" select="'no'"/>
  <xsl:param name="map-phrase-with-css-vertical-pos-to-super-or-subscript" select="'no'"/>
  <xsl:param name="collect-continued-floats" select="'no'"/>
  <xsl:param name="clean-hub_remove-attributes-with-paths" select="'no'"/>
  <xsl:param name="split-at-br-also-for-non-br-paras" select="'yes'"/>
  <xsl:param name="create-ulinks-from-text" select="'no'"/>
  
<!--  MODE: clean-hub-->
  
  <xsl:template match="annotation" mode="hub:clean-hub"/>

</xsl:stylesheet>
