<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Bundle
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Bundle</sch:title>
    <sch:rule context="f:Bundle">
      <sch:assert test="count(f:timestamp) &gt;= 1">timestamp: minimum cardinality of 'timestamp' is 1</sch:assert>
      <sch:assert test="count(f:total) &lt;= 0">total: maximum cardinality of 'total' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle</sch:title>
    <sch:rule context="f:Bundle">
      <sch:assert test="not(f:total) or (f:type/@value = 'searchset') or (f:type/@value = 'history')">total only when a search or history (inherited)</sch:assert>
      <sch:assert test="not(f:entry/f:search) or (f:type/@value = 'searchset')">entry.search only when a search (inherited)</sch:assert>
      <sch:assert test="not(f:entry/f:request) or (f:type/@value = 'batch') or (f:type/@value = 'transaction') or (f:type/@value = 'history')">entry.request mandatory for batch/transaction/history, otherwise prohibited (inherited)</sch:assert>
      <sch:assert test="not(f:entry/f:response) or (f:type/@value = 'batch-response') or (f:type/@value = 'transaction-response') or (f:type/@value = 'history')">entry.response mandatory for batch-response/transaction-response/history, otherwise prohibited (inherited)</sch:assert>
      <sch:assert test="(f:type/@value = 'history') or (count(for $entry in f:entry[f:resource] return $entry[count(parent::f:Bundle/f:entry[f:fullUrl/@value=$entry/f:fullUrl/@value and ((not(f:resource/*/f:meta/f:versionId/@value) and not($entry/f:resource/*/f:meta/f:versionId/@value)) or f:resource/*/f:meta/f:versionId/@value=$entry/f:resource/*/f:meta/f:versionId/@value)])!=1])=0)">FullUrl must be unique in a bundle, or else entries with the same fullUrl must have different meta.versionId (except in history bundles) (inherited)</sch:assert>
      <sch:assert test="not(f:type/@value = 'document') or exists(f:identifier/f:system) or exists(f:identifier/f:value)">A document must have an identifier with a system and a value (inherited)</sch:assert>
      <sch:assert test="not(f:type/@value = 'document') or exists(f:timestamp/@value)">A document must have a date (inherited)</sch:assert>
      <sch:assert test="not(f:type/@value='document') or f:entry[1]/f:resource/f:Composition">A document must have a Composition as the first resource (inherited)</sch:assert>
      <sch:assert test="not(f:type/@value='message') or f:entry[1]/f:resource/f:MessageHeader">A message must have a MessageHeader as the first resource (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle.meta</sch:title>
    <sch:rule context="f:Bundle/f:meta">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle.implicitRules</sch:title>
    <sch:rule context="f:Bundle/f:implicitRules">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle.language</sch:title>
    <sch:rule context="f:Bundle/f:language">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle.identifier</sch:title>
    <sch:rule context="f:Bundle/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle.type</sch:title>
    <sch:rule context="f:Bundle/f:type">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle.timestamp</sch:title>
    <sch:rule context="f:Bundle/f:timestamp">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle.total</sch:title>
    <sch:rule context="f:Bundle/f:total">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle.link</sch:title>
    <sch:rule context="f:Bundle/f:link">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle.link.extension</sch:title>
    <sch:rule context="f:Bundle/f:link/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle.link.modifierExtension</sch:title>
    <sch:rule context="f:Bundle/f:link/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle.link.relation</sch:title>
    <sch:rule context="f:Bundle/f:link/f:relation">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle.link.url</sch:title>
    <sch:rule context="f:Bundle/f:link/f:url">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle.entry</sch:title>
    <sch:rule context="f:Bundle/f:entry">
      <sch:assert test="exists(f:resource) or exists(f:request) or exists(f:response)">must be a resource unless there's a request or response (inherited)</sch:assert>
      <sch:assert test="not(exists(f:fullUrl[contains(string(@value), '/_history/')]))">fullUrl cannot be a version specific reference (inherited)</sch:assert>
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Bundle.signature</sch:title>
    <sch:rule context="f:Bundle/f:signature">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
