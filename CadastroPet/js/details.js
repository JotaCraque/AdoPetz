// Dados dos produtos (deve ser igual ao `products` no `scripts.js`)
const products = [
    { id: 1, name: 'Produto 1', description: 'Descrição do Produto 1', cor: 'bege', image: 'Images/foto de cachorro.jpg' },
    { id: 2, name: 'Produto 2', description: 'Descrição do Produto 2', cor: 'branco', image: 'Images/dog3.jpg' },
    { id: 3, name: 'Produto 3', description: 'Descrição do Produto 3', cor: 'verde', image: 'Images/dog B.jpg' },
    // Adicione mais produtos conforme necessário
];

// Função para obter parâmetros da URL
function getQueryParam(param) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(param);
}

// Função para exibir detalhes do produto
function displayProductDetail(product) {
    const detailContainer = document.getElementById('product-detail');
    detailContainer.innerHTML = `
        <img src="${product.image}" alt="${product.name}">
        <h2>${product.name}</h2>
        <p>${product.description}</p>
        <p>${product.cor}</p>
    `;
}

// Carregar detalhes do produto com base no ID na URL
document.addEventListener('DOMContentLoaded', () => {
    const productId = parseInt(getQueryParam('id'));
    const product = products.find(p => p.id === productId);
    if (product) {
        displayProductDetail(product);
    } else {
        document.getElementById('product-detail').innerHTML = '<p>Produto não encontrado.</p>';
    }
});
