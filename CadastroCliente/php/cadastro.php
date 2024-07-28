<?php
// Incluir o arquivo de conexão com o banco de dados
include_once("conexao.php");

function verificarExistencia($conexao, $campo, $valor, $tabela) {
    $query = "SELECT 1 FROM $tabela WHERE $campo = ? LIMIT 1";
    $stmt = $conexao->prepare($query);
    $stmt->bind_param("s", $valor);
    $stmt->execute();
    $stmt->store_result();
    $existe = $stmt->num_rows > 0;
    $stmt->close();
    return $existe;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['submit1'])) {
        if (isset($_POST['nome'], $_POST['email'], $_POST['cpf'], $_POST['cep'], $_POST['telefone'], $_POST['senha'], $_POST['datanasc'], $_POST['estado'], $_POST['genero'])) {
            $nome = $_POST['nome'];
            $email = $_POST['email'];
            $cpf = $_POST['cpf'];
            $cep = $_POST['cep'];
            $telefone = $_POST['telefone'];
            $senha = password_hash($_POST['senha'], PASSWORD_DEFAULT);
            $datanasc = $_POST['datanasc'];
            $estado = $_POST['estado'];
            $genero = $_POST['genero'];

            if (verificarExistencia($conexao, 'cpf', $cpf, 'pessoafisica')) {
                echo "O CPF já está registrado.";
            } else {
                // Inserir dados no banco de dados usando consultas preparadas
                $query = "INSERT INTO pessoafisica (cpf, nome, email, cep, telefone, senha, datanasc, estado, genero) 
                          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                $stmt = $conexao->prepare($query);
                $stmt->bind_param("sssssssss", $cpf, $nome, $email, $cep, $telefone, $senha, $datanasc, $estado, $genero);

                if ($stmt->execute()) {
                    header('Location: ../login.html');
                    exit();
                } else {
                    echo "Erro ao inserir registro: " . $stmt->error;
                }

                $stmt->close();
            }
        } else {
            echo "Todos os campos obrigatórios devem ser preenchidos.";
        }
    } elseif (isset($_POST['submit2'])) { 
        if (isset($_POST['nome'], $_POST['email'], $_POST['cnpj'], $_POST['cep'], $_POST['telefone'], $_POST['senha'], $_POST['estado'])) {
            $nome = $_POST['nome'];
            $email = $_POST['email'];
            $cnpj = $_POST['cnpj'];
            $cep = $_POST['cep'];
            $telefone = $_POST['telefone'];
            $senha = password_hash($_POST['senha'], PASSWORD_DEFAULT); 
            $estado = $_POST['estado'];

            if (verificarExistencia($conexao, 'cnpj', $cnpj, 'pessoajuridica')) {
                echo "O CNPJ já está registrado.";
            } else {
                // Inserir dados no banco de dados usando consultas preparadas
                $query = "INSERT INTO pessoajuridica (cnpj, nome, email, cep, telefone, senha, estado)  
                          VALUES (?, ?, ?, ?, ?, ?, ?)";
                $stmt = $conexao->prepare($query);
                $stmt->bind_param("sssssss", $cnpj, $nome, $email, $cep, $telefone, $senha, $estado);

                if ($stmt->execute()) {
                    header('Location: ../login.html');
                    exit();
                } else {
                    echo "Erro ao inserir registro: " . $stmt->error;
                }

                $stmt->close();
            }
        } else {
            echo "Todos os campos obrigatórios devem ser preenchidos.";
        }
    }
}
?>
