-- 1. Quantos pedidos foram feitos por cada cliente
SELECT 
    c.Fname, c.Lname, COUNT(o.idOrder) AS total_pedidos
FROM 
    client c
JOIN 
    orders o ON c.idClient = o.idOrderClient
GROUP BY 
    c.idClient;



-- Algum vendedor também é fornecedor?
SELECT 
    s.SocialName AS Vendedor, f.SocialName AS Fornecedor
FROM 
    seller s
JOIN 
    supplier f ON s.CNPJ = f.CNPJ;



-- Relação de produtos, fornecedores e estoques
SELECT 
    p.Pname AS Produto, 
    s.SocialName AS Fornecedor, 
    st.location AS Estoque, 
    ps.quantity AS Estoque_Produto
FROM 
    product p
JOIN 
    productSupplier ps ON p.idProduct = ps.idPsProduct
JOIN 
    supplier s ON ps.idPsSupplier = s.idSupplier
JOIN 
    productStorage pSt ON p.idProduct = pSt.idPsProduct
JOIN 
    storage st ON pSt.idPsStorage = st.idStorage;



-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT 
    f.SocialName AS Fornecedor, 
    p.Pname AS Produto
FROM 
    supplier f
JOIN 
    productSupplier ps ON f.idSupplier = ps.idPsSupplier
JOIN 
    product p ON ps.idPsProduct = p.idProduct;



-- Produtos mais vendidos por vendedor
SELECT 
    v.SocialName AS Vendedor, 
    p.Pname AS Produto, 
    SUM(ps.prodQuantity) AS Quantidade_Vendida
FROM 
    productSeller ps
JOIN 
    seller v ON ps.idPsSeller = v.idSeller
JOIN 
    product p ON ps.idPsProduct = p.idProduct
GROUP BY 
    v.idSeller, p.idProduct
ORDER BY 
    Quantidade_Vendida DESC;



-- Produtos que estão em falta no estoque
SELECT 
    p.Pname AS Produto, 
    SUM(ps.quantity) AS Quantidade_Em_Estoque
FROM 
    product p
JOIN 
    productStorage ps ON p.idProduct = ps.idPsProduct
GROUP BY 
    p.idProduct
HAVING 
    SUM(ps.quantity) = 0;



-- Pedidos enviados mas não pagos em dinheiro
SELECT 
    o.idOrder, 
    c.Fname, 
    c.Lname, 
    o.orderStatus, 
    o.orderDescription, 
    o.sendValue
FROM 
    orders o
JOIN 
    client c ON o.idOrderClient = c.idClient
WHERE 
    o.orderStatus = 'Enviado' 
    AND o.paymentCash = false;



-- Relação de estoques por cidade
SELECT 
    st.location AS Estoque_Cidade, 
    p.Pname AS Produto, 
    SUM(ps.quantity) AS Quantidade_Disponível
FROM 
    storage st
JOIN 
    productStorage ps ON st.idStorage = ps.idPsStorage
JOIN 
    product p ON ps.idPsProduct = p.idProduct
GROUP BY 
    st.location, p.idProduct;



-- Pedidos de clientes e os produtos que compraram
SELECT 
    c.Fname, c.Lname, o.idOrder, 
    p.Pname AS Produto, 
    po.poQuantity AS Quantidade
FROM 
    orders o
JOIN 
    client c ON o.idOrderClient = c.idClient
JOIN 
    productOrder po ON o.idOrder = po.idPOorder
JOIN 
    product p ON po.idPOproduct = p.idProduct;



-- Produtos com avaliação acima da média
SELECT 
    Pname, avaliation
FROM 
    product
WHERE 
    avaliation > (SELECT AVG(avaliation) FROM product);
