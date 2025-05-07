-- Inserir Clientes
insert into client (Fname, Minit, Lname, CPF, Address) values
('João', 'P', 'Silva', '12345678901', 'Rua 1, Centro'),
('Maria', 'A', 'Souza', '23456789012', 'Rua 2, Bairro Novo'),
('Carlos', 'M', 'Oliveira', '34567890123', 'Avenida Central'),
('Ana', 'C', 'Costa', '45678901234', 'Praça da Sé');

-- Inserir Produtos
insert into product (Pname, classification_kids, category, avaliation, size) values
('Fone de ouvido', false, 'Eletrônico', 4, null),
('Barbie Elsa', true, 'Brinquedos', 7, null),
('Body Carters', true, 'Vestuário', 10, 'M'),
('Sofá Retrátil', false, 'Móveis', 8, '3x2'),
('Fire Stick Amazon', false, 'Eletrônico', 5, null),
('Bicicleta Infantil', true, 'Brinquedos', 9, 'Pequeno'),
('Camiseta Nike', false, 'Vestuário', 6, 'G'),
('Jogo de Panelas', false, 'Alimentos', 7, null);

-- Inserir Fornecedores
insert into supplier (SocialName, CNPJ, contact) values
('Tech Eletronics', '12345678912345', '11999999999'),
('Baby Brinquedos', '23456789123456', '11888888888'),
('Moveis Modernos', '34567891234567', '11777777777');

-- Inserir Vendedores
insert into seller (SocialName, CNPJ, contact) values
('Americanas S.A.', '12345678901234', '21985474'),
('Magazine Luiza', '23456789012345', '11965432'),
('Mercado Livre', '34567890123456', '11321456');

-- Inserir Estoques
insert into storage (location, capacity) values
('Rio de Janeiro', 100),
('São Paulo', 300),
('Belo Horizonte', 200);

-- Relacionar Produto e Pedido
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
(1, 'Enviado', 'Compra de eletrônicos', 15, true),
(2, 'Entregue', 'Compra de brinquedos', 20, false),
(3, 'Em processamento', 'Compra de móveis', 30, true);

insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
(1, 1, 2, 'Disponível'),
(2, 2, 1, 'Disponível'),
(4, 3, 1, 'Disponível');

-- Relacionar Produto e Vendedor
insert into productSeller (idPsProduct, idPsSeller, prodQuantity) values
(1, 1, 100),
(2, 2, 50),
(3, 3, 75);

-- Relacionar Produto e Fornecedor
insert into productSupplier (idPsProduct, idPsSupplier, quantity) values
(1, 1, 500),
(2, 2, 400),
(4, 3, 200);

-- Relacionar Produto e Estoque
insert into productStorage (idPsProduct, idPsStorage, quantity) values
(1, 1, 50),
(2, 1, 30),
(3, 2, 20),
(4, 2, 10),
(5, 3, 15);

-- Localização dos Produtos nos Estoques
insert into storageLocation (idLproduct, idLstorage, location) values
(1, 1, 'RJ-A1'),
(2, 1, 'RJ-B2'),
(3, 2, 'SP-A3'),
(4, 2, 'SP-B4'),
(5, 3, 'BH-C5');
