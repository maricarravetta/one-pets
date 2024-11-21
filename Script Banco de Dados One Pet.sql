-- Feito no MYSQL

DROP TABLE IF EXISTS Enderecos;
DROP TABLE IF EXISTS Fale_Conosco;
DROP TABLE IF EXISTS Newslater;
DROP TABLE IF EXISTS Itens_Carrinho;
DROP TABLE IF EXISTS Produtos;
DROP TABLE IF EXISTS Pedidos;
DROP TABLE IF EXISTS Carrinho;
DROP TABLE IF EXISTS Usuarios;


CREATE TABLE Usuarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Senha VARCHAR(255) NOT NULL
);

CREATE TABLE Enderecos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    Logradouro VARCHAR(255) NOT NULL,
    Numero VARCHAR(10),
    Bairro VARCHAR(100),
    Cidade VARCHAR(100),
    Estado VARCHAR(100),
    CEP VARCHAR(15),
    Pais VARCHAR(100),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID)
);

CREATE TABLE Fale_Conosco (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    Registro TEXT NOT NULL,
    Data DATETIME NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID)
);

CREATE TABLE Newslater (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    Data DATETIME NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID)
);

CREATE TABLE Carrinho (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID)
);


CREATE TABLE Produtos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255) NOT NULL,
    Categoria VARCHAR(100) NOT NULL
);

CREATE TABLE Itens_Carrinho (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Carrinho INT NOT NULL,
    ID_Produto INT NOT NULL,
    Quantidade INT NOT NULL,
    Preco_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Carrinho) REFERENCES Carrinho(ID),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID)
);

CREATE TABLE Pedidos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    ID_Carrinho INT NOT NULL,
    Valor_Total DECIMAL(10, 2) NOT NULL,
    Metodo_Pagamento VARCHAR(50) NOT NULL,
    Status INT NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID),
    FOREIGN KEY (ID_Carrinho) REFERENCES Carrinho(ID)
);


-- Inserindo 10 registros na tabela Usuarios
INSERT INTO Usuarios (Nome, Email, Senha)
VALUES
('João Silva', 'joao.silva@email.com', 'senha123'),
('Maria Oliveira', 'maria.oliveira@email.com', 'senha456'),
('Carlos Pereira', 'carlos.pereira@email.com', 'senha789'),
('Ana Costa', 'ana.costa@email.com', 'senha101'),
('Felipe Souza', 'felipe.souza@email.com', 'senha112'),
('Luana Almeida', 'luana.almeida@email.com', 'senha131'),
('Ricardo Gomes', 'ricardo.gomes@email.com', 'senha415'),
('Patrícia Rocha', 'patricia.rocha@email.com', 'senha161'),
('Paulo Santos', 'paulo.santos@email.com', 'senha171'),
('Fernanda Lima', 'fernanda.lima@email.com', 'senha181');

-- Inserindo 10 registros na tabela Produtos
INSERT INTO Produtos (Descricao, Categoria)
VALUES
('Camiseta Personalizada', 'Roupas'),
('Coleira de Couro', 'Acessórios'),
('Cama Confortável', 'Móveis'),
('Ração Premium', 'Alimentos'),
('Brinquedo Interativo', 'Brinquedos'),
('Gaiola para Pássaros', 'Acessórios'),
('Caixa de Transporte', 'Acessórios'),
('Ração Natural', 'Alimentos'),
('Túnel de Brinquedo', 'Brinquedos'),
('Almofada para Cães', 'Móveis');

-- Inserindo 10 registros na tabela Enderecos
INSERT INTO Enderecos (ID_Usuario, Logradouro, Numero, Bairro, Cidade, Estado, CEP, Pais)
VALUES
(1, 'Rua das Flores', '123', 'Centro', 'São Paulo', 'SP', '01010-010', 'Brasil'),
(2, 'Avenida Brasil', '456', 'Jardim Paulista', 'Rio de Janeiro', 'RJ', '20020-020', 'Brasil'),
(3, 'Rua da Paz', '789', 'Bela Vista', 'Belo Horizonte', 'MG', '30030-030', 'Brasil'),
(4, 'Rua da Liberdade', '101', 'Centro', 'Curitiba', 'PR', '80010-100', 'Brasil'),
(5, 'Avenida das Américas', '202', 'Leblon', 'Rio de Janeiro', 'RJ', '22440-040', 'Brasil'),
(6, 'Rua das Palmeiras', '303', 'Vila Mariana', 'São Paulo', 'SP', '04050-050', 'Brasil'),
(7, 'Rua das Acácias', '404', 'Ponta Negra', 'Manaus', 'AM', '69020-030', 'Brasil'),
(8, 'Rua do Sol', '505', 'Centro', 'Fortaleza', 'CE', '60020-020', 'Brasil'),
(9, 'Avenida do Estado', '606', 'Morro da Cruz', 'Florianópolis', 'SC', '88015-010', 'Brasil'),
(10, 'Rua São João', '707', 'Jardim Paulista', 'São Paulo', 'SP', '01020-020', 'Brasil');

-- Inserindo 10 registros na tabela Fale_Conosco
INSERT INTO Fale_Conosco (ID_Usuario, Registro, Data)
VALUES
(1, 'Problema com o produto recebido.', '2024-11-20 10:30:00'),
(2, 'Dúvidas sobre a entrega do pedido.', '2024-11-21 12:45:00'),
(3, 'Solicitação de troca de item.', '2024-11-22 14:00:00'),
(4, 'Atraso na entrega', '2024-11-22 15:30:00'),
(5, 'Produto danificado', '2024-11-22 16:00:00'),
(6, 'Problema com o pagamento', '2024-11-23 09:00:00'),
(7, 'Dúvidas sobre o processo de devolução', '2024-11-23 10:30:00'),
(8, 'Pedido não recebido', '2024-11-23 11:45:00'),
(9, 'Solicitação de reembolso', '2024-11-24 12:00:00'),
(10, 'Erro no processamento do pedido', '2024-11-24 13:00:00');

-- Inserindo 10 registros na tabela Newslater
INSERT INTO Newslater (ID_Usuario, Data)
VALUES
(1, '2024-11-20 09:00:00'),
(2, '2024-11-21 08:30:00'),
(3, '2024-11-22 07:45:00'),
(4, '2024-11-23 09:15:00'),
(5, '2024-11-23 10:00:00'),
(6, '2024-11-24 11:00:00'),
(7, '2024-11-24 12:00:00'),
(8, '2024-11-25 13:00:00'),
(9, '2024-11-25 14:00:00'),
(10, '2024-11-26 15:00:00');

-- Inserindo 10 registros na tabela Carrinho
INSERT INTO Carrinho (ID_Usuario)
VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- Inserindo 10 registros na tabela Itens_Carrinho
INSERT INTO Itens_Carrinho (ID_Carrinho, ID_Produto, Quantidade, Preco_Unitario)
VALUES
(1, 1, 2, 49.99),  -- João Silva comprando 2 camisetas
(2, 2, 1, 89.90),  -- Maria Oliveira comprando 1 coleira
(3, 3, 1, 150.00), -- Carlos Pereira comprando 1 cama
(4, 4, 3, 59.90),  -- Ana Costa comprando 3 rações
(5, 5, 1, 19.90),  -- Felipe Souza comprando 1 brinquedo
(6, 6, 2, 79.90),  -- Luana Almeida comprando 2 gaiolas
(7, 7, 1, 120.00), -- Ricardo Gomes comprando 1 caixa de transporte
(8, 8, 2, 70.00),  -- Patrícia Rocha comprando 2 rações naturais
(9, 9, 1, 130.00), -- Paulo Santos comprando 1 túnel de brinquedo
(10, 10, 1, 110.00); -- Fernanda Lima comprando 1 almofada

-- Inserindo 10 registros na tabela Pedidos
INSERT INTO Pedidos (ID_Usuario, ID_Carrinho, Valor_Total, Metodo_Pagamento, Status)
VALUES
(1, 1, 99.98, 'Cartão de Crédito', 1),  -- João Silva finalizou pedido
(2, 2, 89.90, 'Boleto', 0),            -- Maria Oliveira pedido em aberto
(3, 3, 150.00, 'Pix', 1),              -- Carlos Pereira finalizou pedido
(4, 4, 179.70, 'Cartão de Crédito', 1), -- Ana Costa finalizou pedido
(5, 5, 19.90, 'Boleto', 0),            -- Felipe Souza pedido em aberto
(6, 6, 159.80, 'Pix', 1),              -- Luana Almeida finalizou pedido
(7, 7, 120.00, 'Cartão de Crédito', 1), -- Ricardo Gomes finalizou pedido
(8, 8, 140.00, 'Boleto', 0),           -- Patrícia Rocha pedido em aberto
(9, 9, 130.00, 'Pix', 1),              -- Paulo Santos finalizou pedido
(10, 10, 110.00, 'Cartão de Crédito', 1); -- Fernanda Lima finalizou pedido


-- Fazendo seleção dos itens

SELECT * FROM Pedidos;

SELECT 
    Pedidos.ID AS Pedido_ID,
    Pedidos.Valor_Total,
    Pedidos.Metodo_Pagamento,
    Pedidos.Status AS Status_Pedido,
    Usuarios.ID AS Usuario_ID,
    Usuarios.Nome AS Usuario_Nome,
    Usuarios.Email AS Usuario_Email,
    Carrinho.ID AS Carrinho_ID,
    Carrinho.ID_Usuario AS Carrinho_Usuario_ID
FROM Pedidos
LEFT JOIN Usuarios ON Pedidos.ID_Usuario = Usuarios.ID
LEFT JOIN Carrinho ON Pedidos.ID_Carrinho = Carrinho.ID;



