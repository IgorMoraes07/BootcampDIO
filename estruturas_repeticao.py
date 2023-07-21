fruits = ['apple', 'grape', 'papaya', 'orange']

for fruit in fruits:
    print(fruit)

fruits = ['apple', 'orange']
for fruit in fruits:
    print(fruit)
else:
    print('Acabou, lista cheia ...')

fruits = []
for fruit in fruits:
    print(fruit)
else:
    print('Acabou, lista vazia ...')

op = 1

while op != 0:
    print('''MENU
  =============================
  1 - HELLO WORLD
  0 - EXIT
  ''')
    op = int(input('>> '))
    if op:
        print('HELLO WORLD!!!')
else:
    print('OBRIGADO POR USAR NOSSO PROGRAMA =)')

while True:
    number = int(input('Número PAR para continuar e ÍMPAR para parar: '))

    if number % 2:  # se houver resto é impar
        break
    else:
        print('AEEEE, vamos continuar!!!')

range(4)

for n in range(0, 11):
    print(n)

# exibindo a tabuada do 5
for n in range(0, 51, 5):
    print(n)
