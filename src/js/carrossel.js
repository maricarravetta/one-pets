let index = 0;

function proximo() {
    const carrossel = document.querySelector('.carrossel-imagens');
    const totalImagens = carrossel.children.length;
    const imagensPorVez = 2;

    index = (index + 1) % (totalImagens - imagensPorVez + 1);
    carrossel.style.transform = `translateX(-${index * 33.33}%)`;
}

function anterior() {
    const carrossel = document.querySelector('.carrossel-imagens');
    const totalImagens = carrossel.children.length;
    const imagensPorVez = 2;

    index = (index - 1 + (totalImagens - imagensPorVez + 1)) % (totalImagens - imagensPorVez + 1);
    carrossel.style.transform = `translateX(-${index * 66.33}%)`;
}


// Função para redirecionar para a página de produtos com a categoria na URL
function filtrarPorCategoria(categoria) {
    window.location.href = `produtos.html?categoria=${categoria}`;
}

// Adicionar eventos de clique para cada imagem do carrossel
document.addEventListener("DOMContentLoaded", () => {
    // Seleciona todos os itens do carrossel
    const carrosselItens = document.querySelectorAll(".carrossel-item");

    // Adiciona um listener de clique a cada item do carrossel
    carrosselItens.forEach(item => {
        item.addEventListener("click", () => {
            const categoria = item.getAttribute("data-category").toLowerCase(); // Obtém a categoria em minúsculas
            filtrarPorCategoria(categoria);
        });
    });
});


document.addEventListener('DOMContentLoaded', () => {
  const searchInput = document.querySelector('.search-input');
  const searchButton = document.querySelector('.search-button');

  // Adiciona um evento de clique ao botão de pesquisa
  searchButton.addEventListener('click', () => {
      const query = searchInput.value.trim(); // Obtém o valor da busca e remove espaços extras

      // Verifica se o usuário digitou algo na barra de busca
      if (query) {
          // Redireciona para a página de produtos com o parâmetro de busca
          window.location.href = `produtos.html?categoria=${encodeURIComponent(query)}`;
      } else {
          alert('Por favor, digite algo para buscar.');
      }
  });
});

 
