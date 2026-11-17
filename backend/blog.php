<?php
/**
 * Blog — LISTAGEM
 * Busca os posts na tabela blog_posts para exibir no site.
 */
require_once __DIR__ . '/conexao.php';

$posts = [];

$sql = 'SELECT id, titulo, resumo, autor, cargo_autor, data_publicacao, imagem, alt_imagem, fonte
        FROM blog_posts
        ORDER BY data_publicacao DESC';

$resultado = mysqli_query($conexao, $sql);

if ($resultado) {
    while ($linha = mysqli_fetch_assoc($resultado)) {
        $posts[] = $linha;
    }
    mysqli_free_result($resultado);
}

/**
 * Formata data no padrão usado no site (ex.: 01 de setembro de 2026 às 14:30).
 */
function formatarDataBlog(string $dataHora): string
{
    $meses = [
        1 => 'janeiro', 2 => 'fevereiro', 3 => 'março', 4 => 'abril',
        5 => 'maio', 6 => 'junho', 7 => 'julho', 8 => 'agosto',
        9 => 'setembro', 10 => 'outubro', 11 => 'novembro', 12 => 'dezembro',
    ];

    $timestamp = strtotime($dataHora);
    if ($timestamp === false) {
        return $dataHora;
    }

    $dia = date('d', $timestamp);
    $mes = $meses[(int) date('n', $timestamp)];
    $ano = date('Y', $timestamp);
    $hora = date('H:i', $timestamp);

    return "{$dia} de {$mes} de {$ano} às {$hora}";
}
