<?php
/**
 * Conexão com o banco de dados MySQL (XAMPP).
 * Ajuste usuário/senha se o seu MySQL estiver diferente do padrão.
 */
$host = 'localhost';
$usuario = 'root';
$senha = '';
$banco = 'voxidiomas';

$conexao = mysqli_connect($host, $usuario, $senha, $banco);

if (!$conexao) {
    die('Erro ao conectar ao banco de dados: ' . mysqli_connect_error());
}

mysqli_set_charset($conexao, 'utf8mb4');
