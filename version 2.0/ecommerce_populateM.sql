
use ecommerce;
-- Populando tabela clients
INSERT INTO clients (Fnome, Minit, LName, CPF, CNPJ, Adress, clientType) VALUES
    ('João', 'A', 'Silva', '12345678904', NULL, 'Rua A, 123', 'PF'),
    ('Maria', 'B', 'Santos', '98765432109', NULL, 'Av. B, 456', 'PF'),
    ('Empresa ABC', NULL, 'Indústria Ltda', NULL, '12345678901236', 'Rua Comercial, 789', 'PJ'),
    ('Empresa XYZ', NULL, 'Comércio S.A.', NULL, '98765432109866', 'Av. Tecnológica, 1010', 'PJ'),
    ('Pedro', 'C', 'Oliveira', '45678912306', NULL, 'Rua C, 789', 'PF'),
    ('Mariana', 'D', 'Ferreira', '65432198706', NULL, 'Av. D, 456', 'PF'),
    ('Empresa QWE', NULL, 'Tecnologia S.A.', NULL, '34567891234564', 'Rua Industrial, 789', 'PJ'),
    ('Empresa RST', NULL, 'Distribuidora Ltda.', NULL, '54321678909878', 'Av. dos Distribuidores, 1010', 'PJ'),
    ('Lucas', 'E', 'Rocha', '78912345604', NULL, 'Rua E, 123', 'PF'),
    ('Ana', 'F', 'Pereira', '87654321905', NULL, 'Av. F, 456', 'PF'),
    ('Empresa XYZ', NULL, 'Eletrônicos S.A.', NULL, '76543219876543', 'Rua dos Eletrônicos, 789', 'PJ'),
    ('Empresa ABC', NULL, 'Brinquedos Ltda.', NULL, '98765432123456', 'Av. dos Brinquedos, 1010', 'PJ'),
    ('Carlos', 'G', 'Souza', '67891234501', NULL, 'Rua G, 123', 'PF'),
    ('Eduarda', 'H', 'Melo', '54321987601', NULL, 'Av. H, 456', 'PF'),
    ('Empresa ASDF', NULL, 'Alimentos S.A.', NULL, '87654321987654', 'Rua das Roupas, 789', 'PJ');


-- Populando tabela product
INSERT INTO product (Pname, classfication_kids, category, rating, size) VALUES
    ('Smartphone XYZ', false, 'eletrônico', 4.5, 'Grande'),
    ('Camiseta Listrada', true, 'vestuário', 3.8, 'M'),
    ('Bola de Futebol', true, 'brinquedos', 4.2, NULL),
    ('Biscoitos de Chocolate', false, 'Alimentos', 4.0, NULL),
    ('Tablet ABC', false, 'eletrônico', 3.7, 'Médio'),
    ('Vestido Floral', true, 'vestuário', 4.1, 'P'),
    ('Carrinho de Controle Remoto', true, 'brinquedos', 4.5, NULL),
    ('Barras de Cereal', false, 'Alimentos', 3.5, NULL),
    ('Smartwatch XYZ', false, 'eletrônico', 4.3, NULL),
    ('Blusa de Moletom', true, 'vestuário', 3.9, 'G'),
    ('Quebra-Cabeça 1000 peças', true, 'brinquedos', 4.0, NULL),
    ('Biscoitos de Aveia', false, 'Alimentos', 4.2, NULL),
    ('Notebook ABC', false, 'eletrônico', 4.1, NULL),
    ('Calça Jeans', true, 'vestuário', 4.4, 'M'),
    ('Boneca de Pelúcia', true, 'brinquedos', 3.8, NULL);

-- Populando tabela payments
INSERT INTO payments (idPayment, idClient, typePayment, limitAvaliable) VALUES
    (1, 1, 'Boleto', 1000.00),
    (2, 1, 'cartão', 2000.00),
    (3, 2, 'Dois cartões', 1500.00),
    (4, 3, 'cartão', 5000.00),
    (5, 4, 'Boleto', 3000.00),
    (6, 5, 'cartão', 2500.00),
    (7, 5, 'Boleto', 3500.00),
    (8, 6, 'Dois cartões', 2000.00),
    (9, 7, 'cartão', 4000.00),
    (10, 8, 'Boleto', 1500.00),
    (11, 9, 'Boleto', 2200.00),
    (12, 9, 'cartão', 1800.00),
    (13, 10, 'Dois cartões', 2700.00),
    (14, 11, 'cartão', 3200.00),
    (15, 12, 'Boleto', 1800.00);

-- Populando tabela request
INSERT INTO request (idClient, status, description, freightage, paymentCash, idPayment) VALUES
    (1, 'confirmado', 'Pedido de smartphone', 15.50, false, 2),
    (1, 'Processando', 'Pedido de camiseta', 12.00, true, 1),
    (2, 'cancelado', 'Pedido de bola', 8.00, false, 3),
    (3, 'confirmado', 'Pedido de biscoitos', 20.00, true, 4),
    (4, 'confirmado', 'Pedido de tablet', 18.50, false, 5),
    (4, 'cancelado', 'Pedido de vestido', 10.00, false, 6),
    (5, 'Processando', 'Pedido de carrinho', 15.00, true, 7),
    (5, 'confirmado', 'Pedido de barras de cereal', 22.00, true, 8),
    (6, 'Processando', 'Pedido de smartwatch', 9.50, false, 9),
    (6, 'confirmado', 'Pedido de blusa de moletom', 14.00, true, 10),
    (7, 'Processando', 'Pedido de quebra-cabeça', 12.00, false, 11),
    (8, 'Processando', 'Pedido de biscoitos de aveia', 20.50, true, 12),
    (9, 'confirmado', 'Pedido de notebook', 16.00, false, 13),
    (9, 'cancelado', 'Pedido de calça jeans', 11.00, false, 14),
    (10, 'Processando', 'Pedido de boneca de pelúcia', 13.00, true, 15);

-- Populando tabela request_payments (relacionamento N:M pedido/pagamento)
INSERT INTO request_payments (idRequest, idPayment, idClient) VALUES
    (1, 2, 1),
    (2, 1, 1),
    (3, 3, 2),
    (4, 4, 3),
    (4, 5, 4),
    (5, 6, 5),
    (6, 7, 5),
    (7, 8, 6),
    (8, 9, 7),
    (9, 10, 8),
    (10, 11, 9),
    (11, 12, 9),
    (12, 13, 10),
    (13, 14, 11),
    (14, 15, 12);

-- Populando tabela productStorage
INSERT INTO productStorage (idProductStarage, location, quantity) VALUES
    (1, 'Prateleira A', 50),
    (2, 'Estoque B', 100),
    (3, 'Caixa 1', 25),
    (4, 'Estoque C', 500),
    (5, 'Prateleira X', 150),
    (6, 'Estoque Y', 75),
    (7, 'Caixa 2', 60),
    (8, 'Estoque Z', 300),
    (9, 'Prateleira B', 80),
    (10, 'Estoque D', 120),
    (11, 'Caixa 3', 40),
    (12, 'Estoque E', 250),
    (13, 'Prateleira C', 45),
    (14, 'Estoque F', 80),
    (15, 'Caixa 4', 30);

-- Populando tabela Supplier
INSERT INTO Supplier (idSupplier, CNPJ, socialName, contact) VALUES
    (1, '12345678901234', 'Fornecedor Eletrônicos Ltda', '987654321'),
    (2, '98765432109876', 'Fornecedor Brinquedos S.A.', '123456789'),
    (3, '87654321098765', 'Fornecedor Alimentos S.A.', '543216789'),
    (4, '56789012345678', 'Fornecedor Vestuário Ltda', '678901234'),
    (5, '34567890123456', 'Fornecedor Tecnologia Ltda', '890123456');

-- Populando tabela seller
INSERT INTO seller (idSeller, CNPJ, CPF, socialName, AbsName, contact, Adress) VALUES
    (1, NULL, '123456789', 'Vendedor A', 'Vendedor Absoluto', '987654321', 'Rua dos Vendedores, 123'),
    (2, '98765432109876', NULL, 'Empresa XYZ', 'Vendedor B', '123456789', 'Av. da Empresa, 456'),
    (3, NULL, '543216789', 'Vendedor C', 'Vendedor Sênior', '678901234', 'Rua dos Sêniores, 789'),
    (4, '34567890123457', NULL, 'Empresa QWE', 'Vendedor D', '890123456', 'Av. da Empresa, 1010'),
    (5, NULL, '678901234', 'Vendedor E', 'Vendedor Master', '901234567', 'Rua dos Mestres, 123'),
    (6, '56789012345678', NULL, 'Empresa RST', 'Vendedor F', '890123456', 'Av. da Empresa, 456'),
    (7, NULL, '890123456', 'Vendedor G', 'Vendedor Júnior', '901234567', 'Rua dos Júniores, 789'),
    (8, '45678901234567', NULL, 'Empresa ASDF', 'Vendedor H', '890123456', 'Av. da Empresa, 1010'),
    (9, NULL, '901234567', 'Vendedor I', 'Vendedor Pleno', '901234567', 'Rua dos Plenos, 123'),
    (10, '34567890123456', NULL, 'Empresa ZXCV', 'Vendedor J', '890123456', 'Av. da Empresa, 456'),
    (11, NULL, '234567890', 'Vendedor K', 'Vendedor Sênior', '901234567', 'Rua dos Sêniores, 789'),
    (12, '56789012345670', NULL, 'Empresa POIU', 'Vendedor L', '890123456', 'Av. da Empresa, 1010'),
    (13, NULL, '123456780', 'Vendedor M', 'Vendedor Master', '901234567', 'Rua dos Mestres, 123'),
    (14, '67890123456789', NULL, 'Empresa MNBV', 'Vendedor N', '890123456', 'Av. da Empresa, 456'),
    (15, NULL, '456789012', 'Vendedor O', 'Vendedor Absoluto', '901234567', 'Rua dos Vendedores, 789');

-- Populando tabela product_seller (relacionamento produto/vendedor)
INSERT INTO product_seller (idproduct, idSeller, quantity) VALUES
    (1, 1, 20),
    (2, 1, 30),
    (3, 1, 15),
    (3, 2, 100),
    (4, 2, 200),
    (5, 3, 50),
    (6, 3, 70),
    (6, 4, 30),
    (7, 4, 80),
    (8, 5, 40),
    (9, 5, 60),
    (10, 6, 25),
    (11, 6, 35),
    (11, 7, 65),
    (12, 7, 90);

-- Populando tabela product_request (relacionamento produto/pedido)
INSERT INTO product_request (idProduct, idRequest, quantity, status) VALUES
    (1, 1, 2, 'confirmado'),
    (2, 1, 1, 'cancelado'),
    (3, 2, 3, 'Processando'),
    (4, 3, 5, 'confirmado'),
    (1, 4, 1, 'confirmado'),
    (2, 4, 2, 'confirmado'),
    (4, 4, 3, 'confirmado'),
    (5, 5, 2, 'Processando'),
    (6, 5, 1, 'confirmado'),
    (7, 6, 3, 'Processando'),
    (8, 6, 1, 'confirmado'),
    (9, 7, 2, 'Processando'),
    (10, 8, 4, 'confirmado'),
    (11, 9, 1, 'confirmado'),
    (12, 10, 2, 'Processando');

-- Populando tabela storage_location
INSERT INTO storage_location (idProduct, idStorage, location) VALUES
    (1, 1, 'Prateleira A'),
    (2, 2, 'Estoque B'),
    (3, 3, 'Caixa 1'),
    (4, 4, 'Estoque C'),
    (5, 5, 'Prateleira X'),
    (6, 6, 'Estoque Y'),
    (7, 7, 'Caixa 2'),
    (8, 8, 'Estoque Z'),
    (9, 9, 'Prateleira B'),
    (10, 10, 'Estoque D'),
    (11, 11, 'Caixa 3'),
    (12, 12, 'Estoque E'),
    (13, 13, 'Prateleira C'),
    (14, 14, 'Estoque F'),
    (15, 15, 'Caixa 4');

-- Populando tabela productSupplier (relacionamento produto/fornecedor)
INSERT INTO productSupplier (idSupplier, idProduct, quantity) VALUES
    (1, 1, 100),
    (1, 2, 50),
    (2, 3, 200),
    (2, 4, 500),
    (3, 5, 150),
    (3, 6, 75),
    (4, 7, 60),
    (4, 8, 300),
    (5, 9, 80),
    (5, 10, 120),
    (1, 11, 40),
    (2, 12, 250),
    (3, 13, 45),
    (4, 14, 80),
    (5, 15, 30);

-- Populando tabela delivery
INSERT INTO delivery (idDelivery, trackingCode, idRequest, status) VALUES
    (1, 'ABC123', 1, 'processando'),
    (2, 'XYZ456', 2, 'Em trânsito'),
    (3, 'DEF789', 4, 'Entregue'),
    (4, 'GHI012', 5, 'processando'),
    (5, 'JKL345', 6, 'Em trânsito'),
    (6, 'MNO678', 7, 'Entregue'),
    (7, 'PQR901', 8, 'processando'),
    (8, 'STU234', 9, 'Em trânsito'),
    (9, 'VWX567', 10, 'Entregue'),
    (10, 'YZA890', 11, 'processando'),
    (11, 'BCD123', 12, 'Em trânsito'),
    (12, 'EFG456', 13, 'Entregue'),
    (13, 'HIJ789', 14, 'processando'),
    (14, 'KLM012', 15, 'Em trânsito');

