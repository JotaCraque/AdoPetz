<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ include file="conexao.jsp" %>

<%
    String messageCadastro = "";
    boolean isSuccess = false;

    Connection connection = (Connection) pageContext.getAttribute("messageConnection");

    if (connection != null) {
        try {
            if (request.getParameter("submit1") != null) {
                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String cpf = request.getParameter("cpf");
                String cep = request.getParameter("cep");
                String telefone = request.getParameter("telefone");
                String senha = request.getParameter("senha");
                String datanasc = request.getParameter("datanasc");
                String estado = request.getParameter("estado");
                String genero = request.getParameter("genero");

                if (nome != null && email != null && cpf != null && cep != null && telefone != null &&
                    senha != null && datanasc != null && estado != null && genero != null) {

                    if (cep.length() > 9) {
                        messageCadastro = "CEP não pode ter mais de 9 caracteres.";
                    } else {
                        // Check if email already exists
                        String checkEmailQuery = "SELECT 1 FROM pessoafisica WHERE email = ?";
                        try (PreparedStatement pstmtCheckEmail = connection.prepareStatement(checkEmailQuery)) {
                            pstmtCheckEmail.setString(1, email);

                            if (pstmtCheckEmail.executeQuery().next()) {
                                messageCadastro = "O Email ja esta registrado.";
                            } else {
                                // Check if CPF already exists
                                String checkCpfQuery = "SELECT 1 FROM pessoafisica WHERE cpf = ?";
                                try (PreparedStatement pstmtCheckCpf = connection.prepareStatement(checkCpfQuery)) {
                                    pstmtCheckCpf.setString(1, cpf);

                                    if (pstmtCheckCpf.executeQuery().next()) {
                                        messageCadastro = "O CPF já está registrado.";
                                    } else {
                                        String insertQuery = "INSERT INTO pessoafisica (cpf, nome, email, cep, telefone, senha, datanasc, estado, genero) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                                        try (PreparedStatement pstmtInsert = connection.prepareStatement(insertQuery)) {
                                            pstmtInsert.setString(1, cpf);
                                            pstmtInsert.setString(2, nome);
                                            pstmtInsert.setString(3, email);
                                            pstmtInsert.setString(4, cep);
                                            pstmtInsert.setString(5, telefone);
                                            pstmtInsert.setString(6, senha);
                                            pstmtInsert.setString(7, datanasc);
                                            pstmtInsert.setString(8, estado);
                                            pstmtInsert.setString(9, genero);

                                            if (pstmtInsert.executeUpdate() > 0) {
                                                isSuccess = true;
                                                response.sendRedirect("../login.html");
                                                return;
                                            } else {
                                                messageCadastro = "Erro ao inserir registro.";
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    messageCadastro = "Todos os campos obrigatórios devem ser preenchidos.";
                }
            } else if (request.getParameter("submit2") != null) {
                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String cnpj = request.getParameter("cnpj");
                String cep = request.getParameter("cep");
                String telefone = request.getParameter("telefone");
                String senha = request.getParameter("senha");
                String estado = request.getParameter("estado");

                if (nome != null && email != null && cnpj != null && cep != null && telefone != null && senha != null && estado != null) {

                    if (cep.length() > 9) {
                        messageCadastro = "CEP não pode ter mais de 9 caracteres.";
                    } else {
                        // Check if email already exists
                        String checkEmailQuery = "SELECT 1 FROM pessoajuridica WHERE email = ?";
                        try (PreparedStatement pstmtCheckEmail = connection.prepareStatement(checkEmailQuery)) {
                            pstmtCheckEmail.setString(1, email);

                            if (pstmtCheckEmail.executeQuery().next()) {
                                messageCadastro = "O Email ja esta registrado.";
                            } else {
                                // Check if CNPJ already exists
                                String checkCnpjQuery = "SELECT 1 FROM pessoajuridica WHERE cnpj = ?";
                                try (PreparedStatement pstmtCheckCnpj = connection.prepareStatement(checkCnpjQuery)) {
                                    pstmtCheckCnpj.setString(1, cnpj);

                                    if (pstmtCheckCnpj.executeQuery().next()) {
                                        messageCadastro = "O CNPJ ja esta registrado.";
                                    } else {
                                        String insertQuery = "INSERT INTO pessoajuridica (cnpj, nome, email, cep, telefone, senha, estado) VALUES (?, ?, ?, ?, ?, ?, ?)";
                                        try (PreparedStatement pstmtInsert = connection.prepareStatement(insertQuery)) {
                                            pstmtInsert.setString(1, cnpj);
                                            pstmtInsert.setString(2, nome);
                                            pstmtInsert.setString(3, email);
                                            pstmtInsert.setString(4, cep);
                                            pstmtInsert.setString(5, telefone);
                                            pstmtInsert.setString(6, senha);
                                            pstmtInsert.setString(7, estado);

                                            if (pstmtInsert.executeUpdate() > 0) {
                                                isSuccess = true;
                                                response.sendRedirect("../login.html");
                                                return;
                                            } else {
                                                messageCadastro = "Erro ao inserir registro.";
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    messageCadastro = "Todos os campos obrigatórios devem ser preenchidos.";
                }
            } else {
                messageCadastro = "Tipo de pessoa inválido.";
            }
        } catch (SQLException e) {
            messageCadastro = "Erro: " + e.getMessage();
            e.printStackTrace();
        }
    } else {
        messageCadastro = "Não foi possível estabelecer uma conexão com o banco de dados.";
    }

    request.setAttribute("messageCadastro", messageCadastro);
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <link rel="stylesheet" href="../css/error.css">
    <script>
        function redirecionar() {
            setTimeout(function() {
                window.location.href = "../cadastro.html";
            }, 4000);
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Resultado do Cadastro</h1>
        <div id="error-message">
            <p><%= request.getAttribute("messageCadastro") %></p>
        </div>
    </div>
    <script>
        // Redirecionar apenas se não houve redirecionamento do servidor
        if (<%= !isSuccess %>) {
            redirecionar();
        }
    </script>
</body>
</html>
