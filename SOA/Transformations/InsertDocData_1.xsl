<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:ns1="http://xmlns.oracle.com/Application/cie/soa/b2b/utility"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns0="http://xmlns.oracle.com/apps/otm/transmission/v6.4"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/top/ebs_custport_insert"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns1 ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/http/b2bc_generic_pos_app/gtm_ebs_td_customer_portal_in/gtm_ebs_td_customer_portal_in_client"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns3="http://xmlns.oracle.com/apps/gtm/transmission/v6.4"
                xmlns:ns4="http://xmlns.oracle.com/pcbpel/adapter/db/b2bc_generic_pos_app/gtm_ebs_td_customer_portal_in/ebs_custport_insert"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/gtm_ebs_td_customer_portal_in_client.wsdl"/>
        <oracle-xsl-mapper:rootElement name="Transmission"
                                       namespace="http://xmlns.oracle.com/apps/otm/transmission/v6.4"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/cie_soa_b2b_utillity.xsd"/>
        <oracle-xsl-mapper:rootElement name="request"
                                       namespace="http://xmlns.oracle.com/Application/cie/soa/b2b/utility"/>
        <oracle-xsl-mapper:param name="utilityVar"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/ebs_custport_insert.wsdl"/>
        <oracle-xsl-mapper:rootElement name="CieGtmCustPortalTempCollection"
                                       namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/ebs_custport_insert"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.3.0(XSLT Build 170820.1700.2557) AT [MON FEB 22 13:26:26 EST 2021].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="utilityVar"/>
  <xsl:template match="/">
    <tns:CieGtmCustPortalTempCollection>
      <xsl:for-each select="$utilityVar/ns1:request/ns1:gtm_document/ns1:gtm_document">
        <tns:CieGtmCustPortalTemp>
          <tns:recordId>
            <xsl:value-of select="oraext:sequence-next-val (&quot;apps.CIE_GTM_CUST_PORTAL_TEMP_S&quot;,&quot;jdbc/ebsDS&quot;)"/>
          </tns:recordId>
          <tns:documentSource>GTM</tns:documentSource>
          <xsl:choose>
            <xsl:when test="contains(ns1:gtm_document_id,'-CI')">
              <tns:documentType>COMMERCIAL_INVOICE</tns:documentType>
            </xsl:when>
            <xsl:when test="contains(ns1:gtm_document_id,'-COO')">
              <tns:documentType>CERTIFICATE_OF_ORIGIN</tns:documentType>
            </xsl:when>
          </xsl:choose>
          <tns:documentNumIdentifier>GTM_TRANSACTION</tns:documentNumIdentifier>
          <tns:documentNumber>
            <xsl:value-of select="ns1:gtm_document_id"/>
          </tns:documentNumber>
          <tns:fileName>
            <xsl:value-of select="ns1:gtm_document_id"/>
          </tns:fileName>
          <tns:fileContent>
            <xsl:value-of select="ns1:gtm_document_content"/>
          </tns:fileContent>
          <tns:status>Ready</tns:status>
          <tns:creationDate>
            <xsl:value-of select="substring(xp20:current-dateTime(),1.0,19.0)"/>
          </tns:creationDate>
          <tns:createdBy>1595</tns:createdBy>
          <xsl:choose>
            <xsl:when test='ns0:Transmission/ns0:TransmissionBody/ns0:GLogXMLElement/ns3:GtmTransaction/ns3:Refnum/ns0:RefnumQualifierGid/ns0:Gid/ns0:Xid="MAWB"'>
              <tns:mawbNo>
                <xsl:value-of select="/ns0:Transmission/ns0:TransmissionBody/ns0:GLogXMLElement/ns3:GtmTransaction/ns3:Refnum/ns0:RefnumValue"/>
              </tns:mawbNo>
            </xsl:when>
          </xsl:choose>
        </tns:CieGtmCustPortalTemp>
      </xsl:for-each>
    </tns:CieGtmCustPortalTempCollection>
  </xsl:template>
</xsl:stylesheet>
