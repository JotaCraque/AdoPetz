<?php
session_start();

// Incluindo arquivo de conexão com o banco de dados
include_once('conexao.php');

// Verificar se o formulário foi submetido
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email']) && isset($_POST['nova_senha'])) {
    // Obter o e-mail e a nova senha do formulário
    $email = $_POST['email'];
    $novaSenha = $_POST['nova_senha'];

    // Verificar se o e-mail existe na tabela de Pessoa Física
    $sql = "SELECT * FROM pessoafisica WHERE email = '$email'";
    $result_pf = $conexao->query($sql);

    // Se não encontrou na tabela de Pessoa Física, verifica na tabela de Pessoa Jurídica
    if ($result_pf->num_rows == 0) {
        $sql = "SELECT * FROM pessoajuridica WHERE email = '$email'";
        $result_pj = $conexao->query($sql);

        // Se não encontrou em nenhuma das tabelas, exibe mensagem de erro
        if ($result_pj->num_rows == 0) {
            echo "E-mail não encontrado. Verifique se o endereço de e-mail está correto.";
            exit(); // Encerra o script
        }
    }

    // Atualizar senha no banco de dados
    $sql = "UPDATE ";
    $sql .= $result_pf->num_rows > 0 ? "pessoafisica" : "pessoajuridica";
    $sql .= " SET senha = '$novaSenha' WHERE email = '$email'";
    $result = $conexao->query($sql);

    if ($result) {
        // Mensagem de sucesso
        echo "Senha alterada com sucesso! Você será redirecionado para a página de login em 5 segundos.";

        // Redirecionamento usando cabeçalhos HTTP
        header("refresh:5; url=http://localhost/projetotcc/login.html");
        exit(); // Certifique-se de sair após o redirecionamento
    } else {
        echo "Erro ao atualizar senha: " . $conexao->error;
    }
} else {
    echo "Erro: Não foi possível processar sua solicitação.";
}
?>
