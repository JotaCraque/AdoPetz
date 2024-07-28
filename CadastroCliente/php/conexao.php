<?php

$dbHost = 'localhost';
$dbUsername = 'root';
$dbPassword = '';
$dbName = 'adopt-pets';

$conexao = new mysqli($dbHost, $dbUsername, $dbPassword, $dbName);

//if ($conexao->connect_errno) {
//    echo "Erro ao conectar ao banco de dados: " . $conexao->connect_error;
//} else {
//    echo "Conexão efetuada com sucesso";
//}

?>
