<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns0="http://xmlns.oracle.com/apps/otm/transmission/v6.4"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                exclude-result-prefixes="oracle-xsl-mapper xsi xsd xsl ns0 socket dvm mhdr oraxsl oraext xp20 xref"
                xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/http/b2bc_generic_pos_app/gtm_ebs_td_customer_portal_in/gtm_ebs_td_customer_portal_in_client"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns1="http://xmlns.oracle.com/apps/gtm/transmission/v6.4">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/gtm_ebs_td_customer_portal_in_client.wsdl"/>
        <oracle-xsl-mapper:rootElement name="Transmission"
                                       namespace="http://xmlns.oracle.com/apps/otm/transmission/v6.4"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/gtm_ebs_td_customer_portal_in_client.wsdl"/>
        <oracle-xsl-mapper:rootElement name="Transmission"
                                       namespace="http://xmlns.oracle.com/apps/otm/transmission/v6.4"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.3.0(XSLT Build 170820.1700.2557) AT [THU FEB 18 16:49:39 EST 2021].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <ns0:Transmission>
      <ns0:TransmissionBody>
        <ns0:GLogXMLElement>
          <ns1:GtmTransaction>
            <xsl:for-each select="/ns0:Transmission/ns0:TransmissionBody/ns0:GLogXMLElement/ns1:GtmTransaction/ns1:Refnum">
              <xsl:choose>
                <xsl:when test="((ns0:RefnumQualifierGid/ns0:Gid/ns0:Xid = 'FINALIZED_DOCUMENT') and (contains(ns0:RefnumValue,'-CI') or contains(ns0:RefnumValue,'-CO')))">
                  <ns1:Refnum>
                    <ns0:RefnumQualifierGid>
                      <ns0:Gid>
                        <ns0:DomainName>
                          <xsl:value-of select="ns0:RefnumQualifierGid/ns0:Gid/ns0:DomainName"/>
                        </ns0:DomainName>
                        <ns0:Xid>
                          <xsl:value-of select="ns0:RefnumQualifierGid/ns0:Gid/ns0:Xid"/>
                        </ns0:Xid>
                      </ns0:Gid>
                    </ns0:RefnumQualifierGid>
                    <ns0:RefnumValue>
                      <xsl:value-of select="ns0:RefnumValue"/>
                    </ns0:RefnumValue>
                  </ns1:Refnum>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
          </ns1:GtmTransaction>
        </ns0:GLogXMLElement>
      </ns0:TransmissionBody>
    </ns0:Transmission>
  </xsl:template>
</xsl:stylesheet>
