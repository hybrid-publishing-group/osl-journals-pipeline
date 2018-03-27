<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:saxon="http://saxon.sf.net/"
  xmlns:idml2xml="http://transpect.io/idml2xml" 
  xmlns:html="http://www.w3.org/1999/xhtml"
  xmlns:epub="http://www.idpf.org/2007/ops"
  xmlns:css="http://www.w3.org/1996/css" 
  xmlns:xlink="http://www.w3.org/1999/xlink" 
  xmlns:dbk="http://docbook.org/ns/docbook"
  xmlns:hub2htm="http://transpect.io/hub2htm" 
  xmlns:docx2hub="http://transpect.io/docx2hub"
  xmlns:tr="http://transpect.io" 
  xmlns:mml="http://www.w3.org/1998/Math/MathML"
  xmlns="http://www.w3.org/1999/xhtml">

  <!--  * This stylesheet is used to transform hub format in XHTML 1.0
        * 
        * Input is expected to be Hub 1.1:
        * http://www.le-tex.de/resource/schema/hub/1.1/hub.rng
        * 
        * Invoke either with inital template or consecutive with inital modes   
        *
        * -->

  <xsl:import href="http://transpect.io/hub2html/xsl/hub2html.xsl"/>
  
  
  <xsl:template match="dbk:title[parent::*:table]" mode="hub2htm-cals2html">
    <caption>
      <xsl:apply-templates select="@style" mode="#current"/>
      <xsl:apply-templates select="@srcpath, node()" mode="#current"/>
    </caption>
  </xsl:template>

</xsl:stylesheet>
