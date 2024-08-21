// Dados dos produtos
const products = [
    { id: 1, name: 'Produto 1', description: 'Descrição do Produto 1', cor: 'bege', image: 'Images/foto de cachorro.jpg' },
    { id: 2, name: 'Produto 2', description: 'Descrição do Produto 2', cor: 'branco', image: 'Images/dog3.jpg' },
    { id: 3, name: 'Produto 3', description: 'Descrição do Produto 3', cor: 'Verde', image: 'Images/dog B.jpg' },
    // Adicione mais produtos conforme necessário
];

// Seletores
const productContainer = document.getElementById('product-list');
const inputSearch = document.getElementById('search-input');

// Função para criar e adicionar um produto à tela
function addProduct(product) {
    const div = document.createElement('div');
    div.className = 'product-card';
    div.innerHTML = `
        <a href="product-details.html?id=${product.id}" class="product-link">
            <img src="${product.image}" alt="${product.name}">
            <h3>${product.name}</h3>
            <p>${product.description}</p>
            <p>${product.cor}</p>
        </a>
    `;
    productContainer.appendChild(div);
}

// Função para exibir todos os produtos
function displayProducts(products) {
    productContainer.innerHTML = ''; // Limpa o container antes de adicionar os produtos
    products.forEach(addProduct);
}

// Exibe todos os produtos ao carregar a página
displayProducts(products);

// Função de pesquisa
inputSearch.addEventListener('input', () => {
    const searchTerm = inputSearch.value.toLowerCase();
    const filteredProducts = products.filter(product => 
        product.name.toLowerCase().includes(searchTerm) || 
        product.description.toLowerCase().includes(searchTerm) ||
        product.cor.toLowerCase().includes(searchTerm) // Corrigido para incluir a cor
    );
    displayProducts(filteredProducts);
});
