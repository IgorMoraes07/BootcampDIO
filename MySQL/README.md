# Desafio - Projeto E-Commerce

Criação de um banco de dados de um e-commerce fictício

Software: MySQL Workbench

## Modelagem conceitual

– Produto
*  Os produtos são vendidos por uma única plataforma online. Contudo, estes podem ter vendedores distintos (terceiros).
*  Cada produto possui um fornecedor.
*  Um ou mais produtos podem compor um pedido.
  
– Cliente
*  O cliente pode se cadastrar no site com seu CPF ou CNPJ.
*  O endereço do cliente irá determinar o valor do frete.
*  Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto.

– Pedido
*  Os pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega.
*  Um produto ou mais compoem o pedido.
*  O pedido pode ser cancelado.
  
– Fornecedor
*  Um produto pode ter vários fornecedores.

– Estoque
*  Podem haver vários estoques com o mesmo produto.

Refinamento
----
- Cliente PJ e PF - Uma conta pode ser PJ ou PF, mas não pode ter as duas informações
- Pagamento - Pode ter cadastrado mais de uma forma de pagamento
- Entrega - possui status e código de restreio
