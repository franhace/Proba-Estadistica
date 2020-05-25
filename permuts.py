# -Vocales: hice lo mismo que vos
# -Consonantes: tomé a las 6 vocales como una consonante más, que llamé "V", teniendo ahora 7 consonantes y calculé las permutaciones de esto teniendo en cuenta las condiciones.
# Entonces las permutaciones de las 7 vocales sería 7! y ahora hay que tener en cuenta las condiciones.
#
#     NM: por cada caso que te sirva vas a tener 2! que no ( los tomo como si fueran letras repetidas )
#     RTC: por cada caso que te sirve tenés 3! que no.
#
# Al ser eventos independientes, quedaría (6!/2*2*2) * (7!/2*3!).
#
# ( Soy alumno )

from itertools import permutations

def permuts(string):
    permutaciones = [''.join(p) for p in permutations(string)]
    not_nm_or_rtc = 0
    for permutacion in permutaciones:
        # posicion de cada letra
        pos_n = permutacion.find('n')
        pos_m = permutacion.find('m')
        pos_r = permutacion.find('r')
        pos_t = permutacion.find('t')
        pos_c = permutacion.find('c')
        # vemos si no cumple alguna de las condiciones
        if not(pos_n < pos_m) or not(pos_r < pos_t < pos_c):
            not_nm_or_rtc += 1
        # Permutaciones que cumplen con ambas condiciones
        # else:
            # print(permutacion)
    return not_nm_or_rtc
#Consonantes
perms_consonantes = [''.join(p) for p in permutations("cmbntrv")]
consonantes = len(perms_consonantes)

#Condiciones
condiciones = permuts("cmbntrv")

#Vocales
perms_vocales = [''.join(p) for p in permutations('aaiioo')]
# eliminamos los casos a1a2, a2a1, etc
vocales = len(set(perms_vocales))

#(Conso - condiciones)*(Vocales)
print((consonantes-condiciones)*vocales)

######################## ######################## ######################## ########################

import math

def divisorGenerator(n):
    large_divisors = []
    for i in range(1, int(math.sqrt(n) + 1)):
        if n % i == 0:
            yield i
            if i*i != n:
                large_divisors.append(n / i)
    for divisor in reversed(large_divisors):
        yield int(divisor)

lista_divisores_pos= list(divisorGenerator(16))

def negativizar(lista_divisores_pos):
    lista_con_negs = []
    for i in lista_divisores_pos:
        print(i)
        lista_con_negs.append(i)
        lista_con_negs.append(-i)
    return lista_con_negs

lista_con_todos_divisores = negativizar(lista_divisores_pos)

def divisores_enteros(lista_divisores):
    lista2 = []
    for i in lista_divisores:
        # cambiar r por formula?? Prono a errores
        # r = 2, 3, 4
        # print(r[0])
        r = (i+2)
        # print(i, r)
        if float(r).is_integer():
            lista2.append(int(r))
        else:
            lista2.append("X")
    return lista2

print(lista_con_todos_divisores)
print(divisores_enteros(lista_con_todos_divisores))

######################## ######################## ######################## ########################

def algo_div(numero):
    numero_original = numero
    result = ""
    divisor = 2
    while numero != 0:
        remainder = numero % divisor  # gives the exact remainder
        print("resto, numero:", remainder, numero)
        numero = numero // divisor
        print("cociente, divisor:", numero, divisor )
        result = str(remainder) + result
        print("\n")
        # print(result)
    print("The binary representation of %d is %s" %(numero_original, result))

print(algo_div(1365))


def gcd(a, b):
    if abs(a) < abs(b):
        return gcd(b, a)

    while abs(b) > 0:
        q, r = divmod(a, b)
        a, b = b, r

    return a

print(gcd(210,144))


def extendedEuclideanAlgorithm(a, b):
    if abs(b) > abs(a):
        (x, y, d) = extendedEuclideanAlgorithm(b, a)
        return (y, x, d)

    if abs(b) == 0:
        return (1, 0, a)

    x1, x2, y1, y2 = 0, 1, 1, 0
    while abs(b) > 0:
        q, r = divmod(a, b)
        x = x2 - q * x1
        y = y2 - q * y1
        a, b, x2, x1, y2, y1 = b, r, x1, x, y1, y

    return (x2, y2, a)
print(extendedEuclideanAlgorithm(210, 144))
# (https://jeremykun.com/tag/division-algorithm/)
######################## ######################## ######################## ########################