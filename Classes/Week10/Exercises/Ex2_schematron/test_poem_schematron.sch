<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <sch:pattern>
        <sch:rule context="tei:lg">
            <sch:assert test="@type">The type attribute is required for lg</sch:assert>
            <!-- Make the rhyme attribute required for lg element -->
        </sch:rule>
    </sch:pattern>
    <sch:pattern>
        <sch:rule context="tei:lg[@type='limerick']">
            <sch:report test="count( child::tei:l ) != 5" role="error">A limerick should not
                have <sch:value-of select="count( child::tei:l )"/> lines</sch:report>
        </sch:rule>
    </sch:pattern>
</sch:schema>