use ecommerce;
SELECT count(*) FROM clients;
select distinct concat(Fnome,' ',Minit,' ',LName) as Client from clients;

-- lista dos pedidos com cliente e pagamentos
select  concat(Fnome,' ',Minit,' ',LName) as Client, r.description, r.status, p.typePayment, p.valor 
		from clients c, request r, payments p 	
        where c.idClient = r.idClient and p.idPayment = r.idPayment;
        
SELECT concat(c.Fnome,' ', c.LName)as clientName, COUNT(r.idRequest) AS NumPedidos
FROM clients c
JOIN request r ON c.idClient = r.idClient
WHERE r.status = 'confirmado'
GROUP BY c.idClient
HAVING COUNT(r.idRequest) > 1;