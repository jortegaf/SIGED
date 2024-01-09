<?php
     require_once  'model_documento.php';

class Modelo_Documento extends conexionBD{
    private $conexion;

    public function __construct($db) {
        $this->conexion = $db;
    }

    public function obtenerUltimoNumeroDocumento() {
        try {
            $c = conexionBD::conexionPDO();            
            $sql = "SELECT MAX(numero_documento) AS ultimo_documento FROM documentos";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $ultimoNumeroDocumento = $row['ultimo_documento'];
            return $ultimoNumeroDocumento;
        } catch(PDOException $e) {
            return null;
        }
        conexionBD::cerrar_conexion(); 
    }
}
?>
