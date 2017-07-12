xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://claro.com.pe/esb/data/logAuditoria/v1/";
(:: import schema at "../XSD/RegistroAuditoria.xsd" ::)

declare variable $idAuditoria as xs:string external;
declare variable $fecha as xs:dateTime external;
declare variable $nombreServicio as xs:string external;
declare variable $nombreOperacion as xs:string external;
declare variable $idTransaccionOSB as xs:string external;
declare variable $idTransaccionNegocio as xs:string? external;
declare variable $tipoMensaje as xs:string external;
declare variable $header as element()? external;
declare variable $body as element()? external;
declare variable $fault as element()? external;
declare variable $resultado as xs:string external;

declare function local:func($idAuditoria as xs:string, 
                            $fecha as xs:dateTime, 
                            $nombreServicio as xs:string, 
                            $nombreOperacion as xs:string, 
                            $idTransaccionOSB as xs:string, 
                            $idTransaccionNegocio as xs:string?,
                            $header as element()?, 
                            $body as element()?, 
                            $fault as element()?, 
                            $resultado as xs:string) 
                            as element() (:: element(*, ns1:ItemAuditoriaType) ::) {
    <ns1:itemAuditoria>
        <ns1:idAuditoria>{fn:data($idAuditoria)}</ns1:idAuditoria>
        <ns1:fecha>{fn:data($fecha)}</ns1:fecha>
        <ns1:nombreServicio>{fn:data($nombreServicio)}</ns1:nombreServicio>
        <ns1:nombreOperacion>{fn:data($nombreOperacion)}</ns1:nombreOperacion>
        <ns1:idTransaccionESB>{fn:data($idTransaccionOSB)}</ns1:idTransaccionESB>
        <ns1:idTransaccionNegocio>{fn:data($idTransaccionNegocio)}</ns1:idTransaccionNegocio>        
        {
            if ($header)
            then <ns1:header>{$header}</ns1:header>
            else ()
        }
        {
            if ($body)
            then <ns1:body>{$body}</ns1:body>
            else ()
        }
        {
            if ($fault)
            then <ns1:fault>{$fault}</ns1:fault>
            else ()
        }
        <ns1:resultado>{fn:data($resultado)}</ns1:resultado>
    </ns1:itemAuditoria>
};

local:func($idAuditoria, $fecha, $nombreServicio, $nombreOperacion, $idTransaccionOSB, $idTransaccionNegocio, $header, $body, $fault, $resultado)