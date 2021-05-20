<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/top/ebs_attrib_insert"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:ns1="http://xmlns.oracle.com/Application/cie/soa/b2b/utility"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns0="http://xmlns.oracle.com/apps/otm/transmission/v6.4"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns1 ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/http/b2bc_generic_pos_app/gtm_ebs_td_customer_portal_in/gtm_ebs_td_customer_portal_in_client"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns3="http://xmlns.oracle.com/apps/gtm/transmission/v6.4"
                xmlns:ns4="http://xmlns.oracle.com/pcbpel/adapter/db/b2bc_generic_pos_app/gtm_ebs_td_customer_portal_in/ebs_attrib_insert"
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
        <oracle-xsl-mapper:schema location="../WSDLs/ebs_attrib_insert.wsdl"/>
        <oracle-xsl-mapper:rootElement name="CieCustPortalDocAttrCollection"
                                       namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/ebs_attrib_insert"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.3.0(XSLT Build 170820.1700.2557) AT [FRI FEB 19 12:25:13 EST 2021].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="utilityVar"/>
  <xsl:template match="/">
    <tns:CieCustPortalDocAttrCollection>
      <xsl:for-each select="/ns0:Transmission/ns0:TransmissionBody/ns0:GLogXMLElement/ns3:GtmTransaction/ns3:Refnum">
        <xsl:choose>
          <xsl:when test='ns0:RefnumQualifierGid/ns0:Gid/ns0:Xid="MAWB"'>
            <tns:CieCustPortalDocAttr>
              <tns:recordId>
                <xsl:value-of select="/ns0:Transmission/ns0:TransmissionHeader/ns0:SenderTransmissionNo"/>
              </tns:recordId>
              <tns:docAttrIdentifier>WAYBILL_NUMBER</tns:docAttrIdentifier>
              <tns:docAttributeValue>
                <xsl:value-of select="ns0:RefnumValue"/>
              </tns:docAttributeValue>
            </tns:CieCustPortalDocAttr>
          </xsl:when>
          <xsl:when test='ns0:RefnumQualifierGid/ns0:Gid/ns0:Xid="CUSTOMER_PO"'>
            <tns:CieCustPortalDocAttr>
              <tns:recordId>
                <xsl:value-of select="/ns0:Transmission/ns0:TransmissionHeader/ns0:SenderTransmissionNo"/>
              </tns:recordId>
              <tns:docAttrIdentifier>CUSTOMER_PO_NUMBER</tns:docAttrIdentifier>
              <tns:docAttributeValue>
                <xsl:value-of select="ns0:RefnumValue"/>
              </tns:docAttributeValue>
            </tns:CieCustPortalDocAttr>
          </xsl:when>
        </xsl:choose>
      </xsl:for-each>
    </tns:CieCustPortalDocAttrCollection>
  </xsl:template>
</xsl:stylesheet>
