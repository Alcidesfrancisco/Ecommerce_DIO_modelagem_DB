use ecommerce;
SELECT count(*) FROM clients;
select distinct concat(Fnome,' ',Minit,' ',LName) as Client from clients;

-- Primeiro nome, sobrenome e CPF de todos os clientes pessoa física.
SELECT Fnome, LName, CPF
FROM clients
WHERE clientType = 'PF';

-- Nome do produto, a categoria e a classificação (rating) de todos os produtos cadastrados.
SELECT Pname, category, rating
FROM product;

-- lista dos pedidos com cliente e pagamentos
select  concat(Fnome,' ',Minit,' ',LName) as Client, r.description, r.status, p.typePayment, p.valor 
		from clients c, request r, payments p 	
        where c.idClient = r.idClient and p.idPayment = r.idPayment;


-- Retornar os nomes e CPFs dos clientes que fizeram pedidos confirmados
SELECT Fnome, LName, CPF
FROM clients
WHERE idClient IN (
    SELECT idClient
    FROM request
    WHERE status = 'confirmado'
);
     
-- Retornar o nome e a contagem de pedidos para clientes que têm mais de 2 pedidos confirmados:
SELECT concat(c.Fnome,' ', c.LName)as clientName, COUNT(r.idRequest) AS NumPedidos
FROM clients c
JOIN request r ON c.idClient = r.idClient
WHERE r.status = 'confirmado'
GROUP BY c.idClient
HAVING COUNT(r.idRequest) > 1;

-- Atualizar o limite disponível para pagamento dos clientes que fizeram pedidos processando 
-- e tem limite menor que 600 para 600:
UPDATE payments p
JOIN request r ON p.idPayment = r.idPayment
SET limitAvaliable = 600
WHERE r.status = 'Processando' and limitAvaliable < 600;

-- Retornar os produtos em ordem decrescente de avaliação (rating) e, 
-- em caso de empate, ordenar por nome (Pname) em ordem alfabética:
SELECT idProduct, Pname, rating
FROM product
ORDER BY rating DESC, Pname;

-- Excluir todos os produtos que não possuem fornecedores na tabela de relacionamento "productSupplier":
DELETE product
FROM product
LEFT JOIN productSupplier ps ON product.idProduct = ps.idProduct
WHERE ps.idProduct IS NULL;

-- categoria do produto e a soma da quantidade de produtos em estoque para cada categoria
SELECT category, SUM(quantity) AS total_quantity
FROM productSupplier
INNER JOIN product ON productSupplier.idProduct = product.idProduct
GROUP BY category;
