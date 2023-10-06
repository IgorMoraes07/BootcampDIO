# pylint: disable=missing-module-docstring
# pylint: disable=missing-class-docstring
# pylint: disable=missing-function-docstring
# pylint: disable=R0913
# pylint: disable=too-many-arguments

numPedidos = int(input())

for i in range(1, numPedidos + 1):
    prato = input()
    calorias = int(input())
    Vegano = False

# TODO: Tendo em vista a variável booleana "ehVegano", imprima a saída deste desafio.

    ProdVegano = input()

    if ProdVegano == "s":
        VeganoTexto = "Vegano"
    else:
        VeganoTexto = "Nao-vegano"

    print(f"Pedido {i}: {prato} ({VeganoTexto}) - {calorias} calorias")
