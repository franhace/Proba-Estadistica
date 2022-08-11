for c in range (0,100):
    x1 = abs(6-c)
    x2 = abs(28-c)
    x3 = 0
    x4 = abs(35-c)
    x5 = abs(55-c)
    lista = []
    lista.append(x1)
    lista.append(x2)
    lista.append(x3)
    lista.append(x4)
    lista.append(x5)
    lista.sort()
    if lista[2] == 5:
        print(c)
        print(lista)

