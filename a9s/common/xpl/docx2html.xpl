<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:osl="http://tib.eu/osl"
  xmlns:tr="http://transpect.io" xmlns:hub2htm="http://transpect.io/hub2htm"
  xmlns:docx2hub="http://transpect.io/docx2hub"
  xmlns:hub="http://transpect.io/hub"
  xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0"
  name="docx2html">

  <p:output port="result" primary="true"/>
  <p:serialization port="result" indent="true" 
    method="xhtml" omit-xml-declaration="false"/>

  <p:output port="hub" >
    <p:pipe port="result" step="docx2hub"/>
  </p:output>
  <p:option name="debug-dir-uri" select="resolve-uri('debug')"/>
  <p:option name="debug" select="'yes'"/>
  <p:serialization port="hub" indent="true" omit-xml-declaration="false"/>

  <p:option name="docx"/>

  <p:import href="http://transpect.io/docx2hub/xpl/docx2hub.xpl"/>
  <p:import href="http://transpect.io/hub2html/xpl/hub2html.xpl"/>
  <p:import href="http://transpect.io/evolve-hub/xpl/evolve-hub.xpl"/>
  <p:import href="http://transpect.io/cascade/xpl/paths.xpl"/>
  
  <tr:paths name="paths">
    <p:with-option name="pipeline" select="'docx2html'"/>
<!--    <p:with-option name="interface-language" select="$interface-language"/>-->
<!--    <p:with-option name="clades" select="$clades"/>-->
    <p:with-option name="file" select="$docx"/>
    <p:with-option name="debug" select="$debug"/>
    <p:with-option name="debug-dir-uri" select="$debug-dir-uri"/>
    <p:input port="conf">
      <!--<p:pipe port="conf" step="transpect-custom-paths"/>-->
      <p:document href="http://this.transpect.io/conf/transpect-conf.xml"/>
    </p:input>
    <p:input port="params">
      <p:empty/>
    </p:input>
  </tr:paths>
  
  <docx2hub:convert name="docx2hub">
    <p:with-option name="docx" select="$docx"/>
    <p:with-option name="debug-dir-uri" select="$debug-dir-uri"/>
    <p:with-option name="debug" select="$debug"/>
  </docx2hub:convert>
  
  <hub:evolve-hub name="evolve-hub-dyn" srcpaths="yes">
    <p:input port="paths">
      <p:pipe port="result" step="paths"/>
    </p:input>
    <p:with-option name="debug" select="$debug"/>
    <p:with-option name="debug-dir-uri" select="$debug-dir-uri"/>
  </hub:evolve-hub>
  
  <hub2htm:convert>
    <p:input port="other-params">
      <p:empty/>
    </p:input>
    <p:input port="paths">
      <p:pipe port="result" step="paths"/>
    </p:input>
    <p:with-option name="debug-dir-uri" select="$debug-dir-uri"/>
    <p:with-option name="debug" select="$debug"/>
  </hub2htm:convert>
  
</p:declare-step>