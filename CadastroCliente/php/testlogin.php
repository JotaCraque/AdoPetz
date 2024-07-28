<?php
session_start();

if (isset($_POST['submit']) && !empty($_POST['email']) && !empty($_POST['senha'])) {
    include_once('conexao.php');
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    // Verifica na tabela de Pessoa Física
    $sql = "SELECT * FROM pessoafisica WHERE email = ?";
    $stmt_pf = $conexao->prepare($sql);
    $stmt_pf->bind_param("s", $email);
    $stmt_pf->execute();
    $result_pf = $stmt_pf->get_result();

    // Verifica na tabela de Pessoa Jurídica se não encontrou na Pessoa Física
    if ($result_pf->num_rows < 1) {
        $sql = "SELECT * FROM pessoajuridica WHERE email = ?";
        $stmt_pj = $conexao->prepare($sql);
        $stmt_pj->bind_param("s", $email);
        $stmt_pj->execute();
        $result_pj = $stmt_pj->get_result();

        if ($result_pj->num_rows < 1) {
            header('Location: ../login.html'); // Se não encontrou em nenhuma tabela, redireciona para o login
            exit(); // Encerra o script
        } else {
            $row = $result_pj->fetch_assoc();
            if (password_verify($senha, $row['senha'])) {
                $_SESSION['email'] = $email;
                $_SESSION['tipo'] = 'juridica';
                header('Location: ../sistema.html'); // Se encontrou na tabela de Pessoa Jurídica e senha correta, redireciona para o sistema
                exit(); // Encerra o script
            } else {
                header('Location: ../login.html'); // Senha incorreta, redireciona para o login
                exit(); // Encerra o script
            }
        }
    } else {
        $row = $result_pf->fetch_assoc();
        if (password_verify($senha, $row['senha'])) {
            $_SESSION['email'] = $email;
            $_SESSION['tipo'] = 'fisica';
            header('Location: ../sistema.html'); // Se encontrou na tabela de Pessoa Física e senha correta, redireciona para o sistema
            exit(); // Encerra o script
        } else {
            header('Location: ../login.html'); // Senha incorreta, redireciona para o login
            exit(); // Encerra o script
        }
    }
} else {
    header('Location: ../login.html');
    exit(); // Encerra o script
}
?>
