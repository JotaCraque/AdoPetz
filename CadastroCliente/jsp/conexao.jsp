<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.SQLException" %>
<%
    Connection messageConnection = null; // Renomeada para evitar conflito
    try {
        // Carrega o driver do MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Estabelece a conexão com o banco de dados
        messageConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/meu_banco", "root", "root");

        // Define a conexão como um atributo da página
        pageContext.setAttribute("messageConnection", messageConnection);
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace(); // Log do erro
    }
%>
