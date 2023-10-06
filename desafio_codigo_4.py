# pylint: disable=missing-module-docstring
# pylint: disable=missing-class-docstring
# pylint: disable=missing-function-docstring
# pylint: disable=R0913
# pylint: disable=too-many-arguments

def main():
    n = int(input())
    total = 0

    for i in range(1, n + 1):
        pedido = input().split(" ")
        nome = pedido[0]
        valor = float(pedido[1])
        total += valor

# TODO: Criar as condições para aplicar o cupom de desconto (10% ou 20%).

    cupom_desconto = input()

    desconto = 0.0
    if cupom_desconto == "10%":
        desconto = 0.1
    elif cupom_desconto == "20%":
        desconto = 0.2
    valor_com_desconto = total - (total * desconto)
    print(f"Valor total: {valor_com_desconto:.2f}")


if __name__ == "__main__":
    main()
