<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:osl="http://tib.eu/osl"
  xmlns:tr="http://transpect.io" xmlns:hub2htm="http://transpect.io/hub2htm"
  xmlns:docx2hub="http://transpect.io/docx2hub"
  xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">

  <p:output port="result" primary="true"/>
  <p:serialization port="result" indent="true" 
    method="xhtml" omit-xml-declaration="false"/>

  <p:output port="hub" >
    <p:pipe port="result" step="docx2hub"/>
  </p:output>
  <p:serialization port="hub" indent="true" omit-xml-declaration="false"/>
  

  <p:option name="docx"/>

  <p:import href="http://transpect.io/docx2hub/xpl/docx2hub.xpl"/>
  <p:import href="http://transpect.io/hub2html/xpl/hub2html.xpl"/>
  
  <docx2hub:convert name="docx2hub">
    <p:with-option name="docx" select="$docx"/>
  </docx2hub:convert>
  
  <hub2htm:convert>
    <p:input port="other-params">
      <p:empty/>
    </p:input>
    <p:input port="paths">
      <p:empty/>
    </p:input>
  </hub2htm:convert>
  
</p:declare-step>