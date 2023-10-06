# pylint: disable=missing-module-docstring
# pylint: disable=missing-class-docstring
# pylint: disable=missing-function-docstring
# pylint: disable=R0913
# pylint: disable=too-many-arguments

valorHamburguer = float(input())
quantidadeHamburguer = int(input())
valorBebida = float(input())
quantidadeBebida = int(input())
valorPago = float(input())

##TODO: Calcular o preço final do pedido (total dos hambúrgueres + total das bebidas).
pedidoHamburguer = valorHamburguer * quantidadeHamburguer
pedidoBebida = valorBebida * quantidadeBebida
pedido = sum(pedidoHamburguer, pedidoBebida)

##TODO: Calcular o troco do pedido, considerando o preço final e o valor pago pelo usuário.

##TODO: Imprimir a saída no formato especificado neste desafio.
