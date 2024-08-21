<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ include file="conexao.jsp" %>

<%
    String email = request.getParameter("email");
    String novaSenha = request.getParameter("nova_senha");
    Connection connection = (Connection) pageContext.getAttribute("messageConnection");

    if (request.getMethod().equalsIgnoreCase("POST") && email != null && novaSenha != null && !email.isEmpty() && !novaSenha.isEmpty()) {
        try {
            if (connection != null) {
                boolean emailExistente = false;

                // Verificar se o e-mail existe na tabela de Pessoa Física
                String sql = "SELECT 1 FROM pessoafisica WHERE email = ?";
                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setString(1, email);
                ResultSet resultSet = stmt.executeQuery();

                if (resultSet.next()) {
                    // Atualizar senha na tabela de Pessoa Física
                    sql = "UPDATE pessoafisica SET senha = ? WHERE email = ?";
                    PreparedStatement updateStmt = connection.prepareStatement(sql);
                    updateStmt.setString(1, novaSenha);
                    updateStmt.setString(2, email);
                    int rowsUpdated = updateStmt.executeUpdate();
                    emailExistente = true;
                } else {
                    // Verificar se o e-mail existe na tabela de Pessoa Jurídica
                    sql = "SELECT 1 FROM pessoajuridica WHERE email = ?";
                    stmt = connection.prepareStatement(sql);
                    stmt.setString(1, email);
                    resultSet = stmt.executeQuery();

                    if (resultSet.next()) {
                        // Atualizar senha na tabela de Pessoa Jurídica
                        sql = "UPDATE pessoajuridica SET senha = ? WHERE email = ?";
                        PreparedStatement updateStmt = connection.prepareStatement(sql);
                        updateStmt.setString(1, novaSenha);
                        updateStmt.setString(2, email);
                        int rowsUpdated = updateStmt.executeUpdate();
                        emailExistente = true;
                    }
                }

                if (emailExistente) {
                    // Senha alterada com sucesso
                    response.sendRedirect("../login.html"); // Redireciona para a página de login
                } else {
                    // E-mail não encontrado
                    response.sendRedirect("redefinirsenha_form.jsp?error=email_not_found");
                }
            } else {
                response.sendRedirect("redefinirsenha_form.jsp?error=db_connection_error");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("redefinirsenha_form.jsp?error=sql_error");
        }
    } else {
        response.sendRedirect("redefinirsenha_form.jsp?error=missing_fields");
    }
%>
