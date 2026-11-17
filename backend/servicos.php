<?php
/**
 * Serviços — LISTAGEM
 * Busca os cursos na tabela servicos para exibir no site.
 */
require_once __DIR__ . '/conexao.php';

$servicos = [];

$sql = 'SELECT id, titulo, descricao, preco, unidade_preco, imagem, alt_imagem, link_orcamento
        FROM servicos
        ORDER BY ordem ASC, id ASC';

$resultado = mysqli_query($conexao, $sql);

if ($resultado) {
    while ($linha = mysqli_fetch_assoc($resultado)) {
        $servicos[] = $linha;
    }
    mysqli_free_result($resultado);
}
