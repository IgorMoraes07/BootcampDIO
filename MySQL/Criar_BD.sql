-- Criação de banco de dados para o E-Commerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- Criar tabela cliente
CREATE TABLE Cliente(
	idCliente int auto_increment primary key,
    PNome varchar(20),
    UNome varchar(20),
    CPF char(11) not null,
    Telefone1 char(11),
    Telefone2 char(11),
    Email varchar(30),
    constraint unique_cpf_cliente unique(CPF)
);
ALTER TABLE Cliente auto_increment=1;

-- Criar tabela Endereço
CREATE TABLE Endereco(
	idEndereco int auto_increment primary key,
    Rua varchar(40),
    Bairro varchar(25),
    Numero varchar(5),
    Complemento varchar(10),
    CEP char(8),
    Cidade varchar(20),
    Estado char(2),
    End_padrao boolean default true
);

-- Criar tabela Cartão
CREATE TABLE Cartao(
	idCartao int auto_increment primary key,
    Nome_titular varchar(30),
    Numero_cartao varchar(14),
    Bandeira enum('Mastercard','Visa','Elo','Hipercard', 'American Express'),
    Data_validade date,
    Metodo enum('crédito','débito') default ('crédito')
);

-- Criar tabela Forma de Pagamento
CREATE TABLE Pagamento(
	idPagamento int auto_increment primary key,
    PIX varchar(45),
    Boleto varchar(50),
    idCliente int,
    idCartao int,
    constraint fk_cliente_pagamento foreign key (idCliente) references Cliente(idCliente),
    constraint fk_cartao_pagamento foreign key (idCartao) references Cartao(idCartao)
);

-- Criar tabela Produto
CREATE TABLE Produto(
	idProduto int auto_increment primary key,
    Nome varchar(20) not null,
    Descricao varchar(30),
    Categoria enum('Eletrônico', 'Roupa e calçado', 'Papelaria', 'Alimentos', 'Cozinha', 'Móveis', 'Outros') not null,
    Codigo char(13) not null, 
    Avaliacao float,
    Valor_unitario float not null,
    constraint unique_codigo_produto unique(Codigo)
);
-- ALTER TABLE Produto auto_increment=1;

-- Criar tabela Vendedor
CREATE TABLE Vendedor(
	idVendedor int auto_increment primary key,
    Razao_social varchar(30) not null,
    Nome_fantasia varchar(30),
    CNPJ char(14) not null,
    Telefone char(11),
    Email varchar(30)
);
-- ALTER TABLE Vendedor auto_increment=1;

-- Criar tabela Fornecedor
CREATE TABLE Fornecedor(
	idFornecedor int auto_increment primary key,
    Razao_social varchar(30) not null,
    Nome_fantasia varchar(30),
    CNPJ char(14) not null,
	Telefone char(11),
    Email varchar(30)
);
-- ALTER TABLE Fornecedor auto_increment=1;

-- Criar tabela Transportadora
CREATE TABLE Transportadora(
	idTransportadora int auto_increment primary key,
    Razao_social varchar(50) not null,
    Nome_fantasia varchar(50),
    CNPJ char(14) not null,
	Telefone char(11),
    Email varchar(30)
);
-- ALTER TABLE Transportadora auto_increment=1;

-- Criar tabela Entrega
CREATE TABLE Entrega(
	idEntrega int auto_increment primary key,
    status_entrega enum('Processando', 'Em trânsito', 'Entregue'),
    codigo_rastreio varchar(20),
    valor_frete float,
    idTransportadora int,
    idEndereco int,
    constraint fk_transp_entrega foreign key (idTransportadora) references Transportadora(idTransportadora),
    constraint fk_endereco_entrega foreign key (idEndereco) references Endereco(idEndereco)
);
-- ALTER TABLE Entrega auto_increment=1;

-- Criar tabela Pedido
CREATE TABLE Pedido(
	idPedido int auto_increment primary key,
    Data_pedido datetime,
    Status_pedido enum('Pendente de pagamento', 'Cancelado', 'Confirmado'),
    idCliente int,
    idPagamento int,
    idEntrega int,
    constraint fk_cliente_pedido foreign key (idCliente) references Cliente(idCliente),
    constraint fk_pagamento_pedido foreign key (idPagamento) references Pagamento(idPagamento),
    constraint fk_entrega_pedido foreign key (idEntrega) references Entrega(idEntrega)
);
-- alter table Pedido auto_increment=1;

-- Criar tabela Endereco_cliente
CREATE TABLE Endereco_Cliente(
	idCliente int,
    idEndereco int,
    constraint fk_endereco_cliente foreign key (idCliente) references Cliente(idCliente),
    constraint fk_cliente_endereco foreign key (idEndereco) references Endereco(idEndereco)
);

-- Criar tabela Compras (Pedido_Produto)
CREATE TABLE Compras(
	idPedido int,
    idProduto int,
    quantidade int default 1,
    constraint fk_pedido_compras foreign key (idPedido) references Pedido(idPedido),
    constraint fk_produto_compras foreign key (idProduto) references Produto(idProduto)
);

-- Criar tabela Estoque
CREATE TABLE Estoque(
	idEstoque int auto_increment primary key,
    localizacao varchar(30)
);
-- ALTER TABLE Estoque auto_increment=1;

-- Criar tabela Estoque disponível (Estoque_Produto)
CREATE TABLE Estoque_disponivel(
	idProduto int,
    idEstoque int,
    quantidade int not null default 0,
    constraint fk_produto_disponivel foreign key (idProduto) references Produto(idProduto),
    constraint fk_estoque_disponivel foreign key (idEstoque) references Estoque(idEstoque)
);

-- Criar tabela Fornecimento (Fornecedor_Estoque)
CREATE TABLE Fornecimento(
	idFornecedor int,
    idEstoque int,
    constraint fk_fornecedor_fornecimento foreign key (idFornecedor) references Fornecedor(idFornecedor),
    constraint fk_estoque_fornecimento foreign key (idEstoque) references Estoque(idEstoque)
);

-- Criar tabela Produto_vendedor
CREATE TABLE Produto_vendedor(
	idProduto int,
    idVendedor int,
    constraint fk_produto_vendedor foreign key (idProduto) references Produto(idProduto),
    constraint fk_vendedor_produto foreign key (idVendedor) references Vendedor(idVendedor)
);