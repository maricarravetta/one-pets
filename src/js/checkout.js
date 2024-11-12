document.addEventListener("DOMContentLoaded", function() {
    const cepInput = document.getElementById("cep");
    const entregaLabel = document.querySelector("label[for='entrega']");

    // Permitir apenas números no campo de CEP
    cepInput.addEventListener("input", function() {
        this.value = this.value.replace(/\D/g, "");
    });

    // Exibir prazo de entrega ao perder o foco
    cepInput.addEventListener("blur", function() {
        if (this.value.length > 0) {
            entregaLabel.innerHTML = "<strong>Prazo de entrega: 15 dias úteis</strong><br><strong>Valor do frete: R$9,90";
        } else {
            entregaLabel.innerHTML = "<strong>Prazo de entrega:</strong>";
        }
    });
});
