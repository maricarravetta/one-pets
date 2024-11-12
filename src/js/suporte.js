// validação do formulário
document.querySelector('form').addEventListener('submit', function(event) {
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const message = document.getElementById('message').value;

    if (!name || !email || !message) {
        alert('Por favor, preencha todos os campos obrigatórios.');
        event.preventDefault(); // Impede o envio do formulário
    } else {
        alert('Mensagem enviada com sucesso!'); // Mensagem de sucesso
        this.reset(); // aqui vai limpa o formulário após o envio
    }
});

// busca dinâmica
const searchInput = document.querySelector('.search-input');
const serviceOptions = document.querySelectorAll('#service option');

searchInput.addEventListener('input', function() {
    const filter = this.value.toLowerCase();
    serviceOptions.forEach(option => {
        if (option.textContent.toLowerCase().includes(filter)) {
            option.style.display = 'block'; // mostra a opção
        } else {
            option.style.display = 'none'; // esconde a opção
        }
    });
});


window.addEventListener("load", function() {
    setTimeout(() => {
        document.querySelector(".whatsapp-button").classList.add("show");
    }, 1000); // 1,5 segundos
});
