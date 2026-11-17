<?php
/**
 * Contato — INSERT
 * Recebe os dados do formulário e grava na tabela contatos.
 */
require_once __DIR__ . '/conexao.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: ../frontend/index.php#contato');
    exit;
}

$nome = trim($_POST['nome'] ?? '');
$email = trim($_POST['email'] ?? '');
$mensagem = trim($_POST['mensagem'] ?? '');

if ($nome === '' || $email === '' || $mensagem === '') {
    header('Location: ../frontend/index.php?contato=erro#contato');
    exit;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    header('Location: ../frontend/index.php?contato=erro#contato');
    exit;
}

$sql = 'INSERT INTO contatos (nome, email, mensagem) VALUES (?, ?, ?)';
$stmt = mysqli_prepare($conexao, $sql);

if (!$stmt) {
    header('Location: ../frontend/index.php?contato=erro#contato');
    exit;
}

mysqli_stmt_bind_param($stmt, 'sss', $nome, $email, $mensagem);
$ok = mysqli_stmt_execute($stmt);
mysqli_stmt_close($stmt);
mysqli_close($conexao);

if ($ok) {
    header('Location: ../frontend/index.php?contato=ok#contato');
} else {
    header('Location: ../frontend/index.php?contato=erro#contato');
}
exit;
