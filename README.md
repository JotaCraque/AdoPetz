# 🐾 Adopetz

**Adopetz** é uma plataforma web desenvolvida para conectar pessoas interessadas em adotar animais a tutores que desejam disponibilizá-los para adoção. O sistema prioriza a segurança, a comunicação eficiente e a facilidade de uso, proporcionando um ambiente confiável e intuitivo para o processo de adoção responsável.

---

## 📌 Funcionalidades

- Cadastro de usuários com verificação via CPF para prevenir fraudes e garantir autenticidade.
- Login seguro e redirecionamento à página principal da plataforma.
- Listagem dinâmica de animais disponíveis para adoção.
- Visualização de ano de an\u00funcios com informações detalhadas de cada animal.
- Sistema de **chat em tempo real** entre adotantes e tutores para facilitar a comunicação e agilizar o processo de adoção.
- Área para usuários cadastrarem seus próprios animais disponíveis para adoção.

---

## 🛠️ Tecnologias Utilizadas

| Camada         | Tecnologias/Recursos                   |
|----------------|----------------------------------------|
| **Frontend**   | HTML5, CSS3, JavaScript puro           |
| **Backend**    | Node.js, Express.js                    |
| **Banco de Dados** | MySQL                              |
| **Execução Local** | Visual Studio Code + `server.js`  |

---

## ⚙️ Arquitetura & Estrutura Técnica

- **Ambiente Node.js** para execução do servidor, gerenciamento de rotas, middlewares e lógica de autenticação.
- **API RESTful** criada para conectar frontend e backend, permitindo ações como login, cadastro, listagem de animais, criação de anúncios e mensagens no chat.
- **MySQL** como sistema de banco de dados relacional, utilizado para armazenar com segurança os dados dos usuários, anúncios e mensagens trocadas.
- Utilização de **middlewares customizados** para validação de dados e controle de acesso.
- Sistema de **chat funcional** baseado em troca de mensagens, garantindo fluidez e simplicidade na interação entre usuários.

---

## 🌟 Objetivos do Projeto

- Praticar integração completa entre **frontend, backend e banco de dados** com foco em segurança e experiência do usuário.
- Aplicar conceitos fundamentais de **autenticação, APIs, manipulação de dados, comunicação em tempo real** e estrutura de banco relacional.
- Desenvolver uma aplicação com propósito social, que simula um cenário real de solução de problema com tecnologia.

---

## 🚀 Execução Local

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/adopetz.git
   cd adopetz
   ```

2. Instale as dependências:
   ```bash
   npm install
   ```

3. Configure o banco de dados MySQL e insira as credenciais no arquivo de conexão.

4. Inicie o servidor local:
   ```bash
   node server.js
   ```

5. Acesse via navegador: `http://localhost:3000`

---

## 🧐 Aprendizados Técnicos

- Construção e consumo de APIs com Express.js.
- Manipulação do DOM para atualizar informações dinamicamente.
- Utilização de `fetch` para chamadas assíncronas.
- Conexão entre aplicação Node.js e banco MySQL.
- Lógica de autenticação e proteção contra criação de usuários falsos.
- Controle de estados, tratamento de erros e boas práticas em projetos web.

---
