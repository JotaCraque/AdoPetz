<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, javax.servlet.http.HttpSession" %>
<%
    String messageError = "";
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    HttpSession userSession = request.getSession();
    Connection connection = null;

    // Verifica se o formulário foi enviado e se os parâmetros não são nulos
    if (request.getMethod().equalsIgnoreCase("POST") && email != null && senha != null && !email.isEmpty() && !senha.isEmpty()) {
        try {
            // Configura a URL do banco de dados, o usuário e a senha
            String dbUrl = "jdbc:mysql://localhost:3306/meu_banco";
            String dbUser = "root";
            String dbPassword = "root";

            // Carrega o driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Estabelece a conexão com o banco de dados
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            if (connection != null && !connection.isClosed()) {
                // Verifica na tabela de Pessoa Física
                String sql = "SELECT * FROM pessoafisica WHERE email = ? AND senha = ?";
                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setString(1, email);
                stmt.setString(2, senha);
                ResultSet resultSet = stmt.executeQuery();

                if (resultSet.next()) {
                    // Se encontrar, faz o login
                    userSession.setAttribute("email", email);
                    userSession.setAttribute("tipo", "fisica");
                    response.sendRedirect("../../index.html"); // Redireciona para o index
                    return;
                } else {
                    // Verifica na tabela de Pessoa Jurídica
                    sql = "SELECT * FROM pessoajuridica WHERE email = ? AND senha = ?";
                    stmt = connection.prepareStatement(sql);
                    stmt.setString(1, email);
                    stmt.setString(2, senha);
                    resultSet = stmt.executeQuery();

                    if (resultSet.next()) {
                        // Se encontrar, faz o login
                        userSession.setAttribute("email", email);
                        userSession.setAttribute("tipo", "juridica");
                        response.sendRedirect("../../sobre-nos.html");
                        return;
                    } else {
                        messageError = "E-mail ou senha incorretos.";
                    }
                }
            } else {
                messageError = "Erro ao conectar com o banco de dados: conexão fechada.";
            }

        } catch (Exception e) {
            e.printStackTrace();
            messageError = "Erro ao conectar com o banco de dados: " + e.getMessage();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    messageError = "Erro ao fechar a conexão: " + e.getMessage();
                }
            }
        }
    } else {
        messageError = "Por favor, preencha todos os campos.";
    }

    request.setAttribute("messageError", messageError);
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado do Login</title>
    <link rel="stylesheet" href="../css/error.css">
    <script>
        function redirecionar() {
            setTimeout(function() {
                window.location.href = "../login.html";
            }, 4000);
        }
    </script>
</head>
<body onload="redirecionar()">
    <div class="container">
        <h1>Resultado do Login</h1>
        <div id="error-message">
            <p><%= request.getAttribute("messageError") %></p>
        </div>
    </div>
</body>
</html>
