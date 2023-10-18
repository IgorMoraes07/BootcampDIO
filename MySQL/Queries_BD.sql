-- inserção de dados e queries
USE ecommerce;

SHOW TABLES;
-- idClient, Fname, Minit, Lname, CPF, Address
INSERT INTO Clients (Fname, Minit, Lname, CPF, Address) 
VALUES('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'), 
	('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores'),
    ('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
    ('Julia','S','França', 789123456,'rua lareijras 861, Centro - Cidade das flores'),
    ('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
    ('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores');

-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
INSERT INTO product (Pname, classification_kids, category, avaliação, size) 
VALUES ('Fone de ouvido',false,'Eletrônico','4',null),
	('Barbie Elsa',true,'Brinquedos','3',null),
    ('Body Carters',true,'Vestimenta','5',null),
    ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null),
    ('Sofá retrátil',False,'Móveis','3','3x57x80'),
    ('Farinha de arroz',False,'Alimentos','2',null),
    ('Fire Stick Amazon',False,'Eletrônico','3',null);

SELECT * FROM clients;
SELECT * FROM product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

DELETE FROM orders WHERE idOrderClient IN (1,2,3,4);
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) 
VALUES (1, default,'compra via aplicativo',null,1),
	(2,default,'compra via aplicativo',50,0),
    (3,'Confirmado',null,null,1),
    (4,default,'compra via web site',150,0);

-- idPOproduct, idPOorder, poQuantity, poStatus
SELECT * FROM orders;

INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) 
VALUES (1,5,2,null),
	(2,5,1,null),
    (3,6,1,null);

-- storageLocation,quantity
INSERT INTO productStorage (storageLocation,quantity) 
VALUES ('Rio de Janeiro',1000),
	('Rio de Janeiro',500),
    ('São Paulo',10),
    ('São Paulo',100),
    ('São Paulo',10),
    ('Brasília',60);

-- idLproduct, idLstorage, location
INSERT INTO storageLocation (idLproduct, idLstorage, location) 
VALUES (1,2,'RJ'),
	(2,6,'GO');

-- idSupplier, SocialName, CNPJ, contact
INSERT INTO supplier (SocialName, CNPJ, contact) 
VALUES ('Almeida e filhos', 123456789123456,'21985474'),
	('Eletrônicos Silva',854519649143457,'21985484'),
    ('Eletrônicos Valma', 934567893934695,'21975474');
                            
SELECT * FROM supplier;
-- idPsSupplier, idPsProduct, quantity
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) 
VALUES (1,1,500),
	(1,2,400),
    (2,4,633),
    (3,3,5),
    (2,5,10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, location, contact) 
VALUES ('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
	('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
    ('Kids World',null,456789123654485,null,'São Paulo', 1198657484);

SELECT * FROM seller;
-- idPseller, idPproduct, prodQuantity
INSERT INTO productSeller (idPseller, idPproduct, prodQuantity) 
VALUES (1,6,80),
	(2,7,10);

SELECT * FROM productSeller;

SELECT COUNT(*) FROM clients;
SELECT * FROM clients c, orders o WHERE c.idClient = idOrderClient;

SELECT Fname, Lname, idOrder, orderStatus FROM clients c, orders o 
WHERE c.idClient = idOrderClient;

SELECT CONCAT(Fname,' ',Lname) AS Client, idOrder AS Request, orderStatus AS Status FROM clients c, orders o 
WHERE c.idClient = idOrderClient;

INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) 
VALUES (2, default,'compra via aplicativo',null,1);
                             
SELECT COUNT(*) FROM clients c, orders o 
WHERE c.idClient = idOrderClient;

SELECT * FROM orders;

-- recuperação de pedido com produto associado
SELECT * FROM clients c 
INNER JOIN orders o 
	ON c.idClient = o.idOrderClient 
INNER JOIN productOrder p 
	ON p.idPOorder = o.idOrder 
GROUP BY idClient; 
        
-- Recuperar quantos pedidos foram realizados pelos clientes?
SELECT c.idClient, Fname, count(*) AS Number_of_orders FROM clients c 
INNER JOIN orders o 
	ON c.idClient = o.idOrderClient
GROUP BY idClient;
