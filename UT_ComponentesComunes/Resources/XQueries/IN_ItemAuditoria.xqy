xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "http://claro.com.pe/esb/data/logAuditoria/v1/";
(:: import schema at "../../../UT_LogAuditoria/UT_LogAuditoria/Resources/WSDL/registrarAuditoria.wsdl" ::)
declare namespace ns1="http://claro.com.pe/esb/data/generico/claroGenericHeader/v1/";
(:: import schema at "../XSD/ClaroGenericHeaders_v1.xsd" ::)

declare variable $idAuditoria as xs:string external;
declare variable $nombreServicio as xs:string external;
declare variable $nombreOperacion as xs:string external;
declare variable $idTransaccionOSB as xs:string? external;
declare variable $idTransaccionNegocio as xs:string? external;
declare variable $tipoMensaje as xs:string? external;
declare variable $header as element(*)? external;
declare variable $body as element(*)? external;
declare variable $fault as element(*)? external;
declare variable $resultado as xs:string external;

declare function local:IN_RegistroAuditoria($idAuditoria as xs:string, 
                                            $nombreServicio as xs:string, 
                                            $nombreOperacion as xs:string,
                                            $idTransaccionOSB as xs:string?,
                                            $idTransaccionNegocio as xs:string?,
                                            $tipoMensaje as xs:string?,
                                            $header as element(*)?,
                                            $body as element(*)?, 
                                            $fault as element(*)?,
                                            $resultado as xs:string) 
                                            as element() (:: schema-element(auditoria) ::) {
    
    <auditoria>
      <item>        
        <idAuditoria>{$idAuditoria}</idAuditoria>
        <fecha>{fn:current-dateTime()}</fecha>
        <nombreServicio>{$nombreServicio}</nombreServicio>
        <nombreOperacion>{$nombreOperacion}</nombreOperacion>
        <idTransaccionESB>{fn:data($idTransaccionOSB)}</idTransaccionESB>
        <idTransaccionNegocio>{fn:data($idTransaccionNegocio)}</idTransaccionNegocio>  
        <tipoMensaje>{fn:data($tipoMensaje)}</tipoMensaje>  
        <header>{fn-bea:serialize($header)}</header>
        <body>{fn-bea:serialize($body)}</body>
        <fault>{fn-bea:serialize($fault)}</fault>
        <resultado>{$resultado}</resultado>
      </item>
    </auditoria>
};

local:IN_RegistroAuditoria($idAuditoria, $nombreServicio, $nombreOperacion, $idTransaccionOSB, $idTransaccionNegocio,$tipoMensaje, $header, $body, $fault, $resultado)