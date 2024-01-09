<?php
require_once 'model_documento.php';

class DocumentoController {
    private $modelo;

    public function __construct() {
        // Aquí se supone que ya tienes una conexión a la base de datos establecida con PDO
        $db = new PDO("mysql:host=localhost;dbname=sistema_tramite", "root", "");
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        $this->modelo = new DocumentoModel($db);
    }

    public function obtenerUltimoNumeroDocumento() {
        return $this->modelo->obtenerUltimoNumeroDocumento();
    }
}
?>
