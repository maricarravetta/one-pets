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
