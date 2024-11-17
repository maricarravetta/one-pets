document.addEventListener("DOMContentLoaded", () => {
    const categorySelect = document.getElementById("category");
    const products = document.querySelectorAll(".product");

    // Função para filtrar os produtos
    function filtrarProdutos(categoria) {
        products.forEach((product) => {
            const productCategory = product.getAttribute("data-category");
            if (categoria === "all" || productCategory === categoria) {
                product.style.display = "block";
            } else {
                product.style.display = "none";
            }
        });
    }

    // Captura o parâmetro da URL para filtrar os produtos
    const params = new URLSearchParams(window.location.search);
    const categoriaURL = params.get('categoria');

    if (categoriaURL) {
        categorySelect.value = categoriaURL;
        filtrarProdutos(categoriaURL); // Filtra automaticamente com base no parâmetro da URL
    }

    // Adiciona um evento ao combobox para filtrar ao mudar a categoria manualmente
    categorySelect.addEventListener("change", () => {
        const selectedCategory = categorySelect.value;
        filtrarProdutos(selectedCategory);

        // Atualiza a URL sem recarregar a página
        const newURL = `?categoria=${encodeURIComponent(selectedCategory)}`;
        window.history.pushState({}, '', newURL);
    });
});

