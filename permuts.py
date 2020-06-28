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

# from itertools import permutations
#
# def permuts(string):
#     permutaciones = [''.join(p) for p in permutations(string)]
#     not_nm_or_rtc = 0
#     for permutacion in permutaciones:
#         # posicion de cada letra
#         pos_n = permutacion.find('n')
#         pos_m = permutacion.find('m')
#         pos_r = permutacion.find('r')
#         pos_t = permutacion.find('t')
#         pos_c = permutacion.find('c')
#         # vemos si no cumple alguna de las condiciones
#         if not(pos_n < pos_m) or not(pos_r < pos_t < pos_c):
#             not_nm_or_rtc += 1
#         # Permutaciones que cumplen con ambas condiciones
#         # else:
#             # print(permutacion)
#     return not_nm_or_rtc
# #Consonantes
# perms_consonantes = [''.join(p) for p in permutations("cmbntrv")]
# consonantes = len(perms_consonantes)
#
# #Condiciones
# condiciones = permuts("cmbntrv")
#
# #Vocales
# perms_vocales = [''.join(p) for p in permutations('aaiioo')]
# # eliminamos los casos a1a2, a2a1, etc
# vocales = len(set(perms_vocales))

#(Conso - condiciones)*(Vocales)
# print((consonantes-condiciones)*vocales)

######################## ######################## ######################## ########################
#congruencia

from itertools import permutations


def lexicographical_permutation(str):
    perm = sorted(''.join(chars) for chars in permutations(str))
    for x in perm:
        print(x)


str = 'congruencia'
# print(len(lexicographical_permutation(str)))

# import library
from math import factorial


def lexicographical_permutations(str):
    # there are going to be n ! permutations where n = len(seq)
    for p in range(factorial(len(str))):
        print(''.join(str))

        i = len(str) - 1

        # find i such that str[i:] is the largest sequence with
        # elements in descending lexicographic order
        while i > 0 and str[i - 1] > str[i]:
            i -= 1

        # reverse str[i:]
        str[i:] = reversed(str[i:])

        if i > 0:

            q = i
            # find q such that str[q] is the smallest element
            # in str[p:] such that str[q] > str[i - 1]
            while str[i - 1] > str[q]:
                q += 1

            # swap str[i - 1] and str[q]
            temp = str[i - 1]
            str[i - 1] = str[q]
            str[q] = temp


s = 'pruebas'
s = list(s)
s.sort()
# s = [i for i in lexicographical_permutations(s)]
# print(len(s))
# print(s)

# ii) forma de que vocales si o si entre n's
# def permuts(string):
#     permutaciones = [''.join(p) for p in permutations(string)]
#     not_nm_or_rtc = 0
#     for permutacion in permutaciones:
#         # posicion de cada letra
#         pos_n = permutacion.find('n')
#         pos_m = permutacion.find('m')
#         pos_r = permutacion.find('r')
#         pos_t = permutacion.find('t')
#         pos_c = permutacion.find('c')
#         # vemos si no cumple alguna de las condiciones
#         if not(pos_n < pos_m) or not(pos_r < pos_t < pos_c):
#             not_nm_or_rtc += 1
#         # Permutaciones que cumplen con ambas condiciones
#         # else:
#             # print(permutacion)
#     return not_nm_or_rtc
# #Consonantes
# perms_consonantes = [''.join(p) for p in permutations("cmbntrv")]
# # consonantes = len(perms_consonantes)
#
# #Condiciones
# # condiciones = permuts("cmbntrv")
#
# #Vocales
# perms_vocales = [''.join(p) for p in permutations('aaiioo')]
# # eliminamos los casos a1a2, a2a1, etc
# # vocales = len(set(perms_vocales))
#
# #(Conso - condiciones)*(Vocales)
# # print((consonantes-condiciones)*vocales)


######################################################################
"""
Scriptcito para encontrar divisores enteros de un numero, 
dadas ciertas condiciones para un n

Ej: Hallar todos los n€N / 2n-2/n+4
"""


# import math
#
# def divisorGenerator(n):
#     large_divisors = []
#     for i in range(1, int(math.sqrt(n) + 1)):
#         if n % i == 0:
#             yield i
#             if i*i != n:
#                 large_divisors.append(n / i)
#     for divisor in reversed(large_divisors):
#         yield int(divisor)
#
# lista_divisores_pos= list(divisorGenerator(246))
#
# def negativizar(lista_divisores_pos):
#     lista_con_negs = []
#     for i in lista_divisores_pos:
#         print(i)
#         lista_con_negs.append(i)
#         lista_con_negs.append(-i)
#     return lista_con_negs
#
# lista_con_todos_divisores = negativizar(lista_divisores_pos)
#
# def divisores_enteros(lista_divisores):
#     lista2 = []
#     for i in lista_divisores:
#         # cambiar r por formula?? Prono a errores
#         # r = 2, 3, 4
#         # print(r[0])
#
#         # Escribir formula del n a despejar aca!
#         r = (i-6)/3
#
#         # print(i, r)
#         if float(r).is_integer():
#             lista2.append(int(r))
#         else:
#             lista2.append("X")
#     return lista2
#
# print(lista_con_todos_divisores)
# print(divisores_enteros(lista_con_todos_divisores))

######################## ######################## ######################## ########################
# print(bin(1365))


def algo_div(numero):
    numero_original = numero
    result = ""
    divisor = -14
    while numero != 0:
        remainder = numero % divisor  # gives the exact remainder
        print("resto, numero:", remainder, numero)
        numero = numero // divisor
        print("cociente, divisor:", numero, divisor )
        result = str(remainder) + result
        print("\n")
        # print(result)
    print("The binary representation of %d is %s" %(numero_original, result))

# print(algo_div(133))


# def gcd(a, b):
#     if abs(a) < abs(b):
#         return gcd(b, a)
#
#     while abs(b) > 0:
#         q, r = divmod(a, b)
#         a, b = b, r
#
#     return a
#
# print(gcd(990,187))


# Algo de la division de euclides
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
print()
# print(extendedEuclideanAlgorithm(1038, 14))
# (https://jeremykun.com/tag/division-algorithm/)
######################## ######################## ######################## ########################

# suma de funciones enteras
def ecuacion_a_cumplir1(comienzo, fin):
    aes = []
    for a in list(range(comienzo, fin)):
        ecuacion = (a-2)/6
        if ecuacion.is_integer():
            aes.append(a)
    print(aes)
    return aes

def ecuacion_a_cumplir2(comienzo, fin):
    aes = []
    for a in list(range(comienzo, fin)):
        try:

            ecuacion = (2*a - 1) / (a-1)
            if a != 0 and ecuacion.is_integer():
                aes.append(a)
        except ZeroDivisionError:
            pass

    print(aes)
    return aes

# print(ecuacion_a_cumplir2())

def todos_valores_que_cumples(comienzo, fin):
    x1 = ecuacion_a_cumplir1(comienzo, fin)
    x2 = ecuacion_a_cumplir2(comienzo, fin)
    x = set(x1) & set(x2)
    return x

# print(todos_valores_que_cumples(-200000,1000000))

#############################################################################
from itertools import permutations

def permuts(string):
    permutaciones = [''.join(p) for p in permutations(string)]
    cuantas_vocales_juntas = 0
    cuantas_3vocales_juntas = 0
    tres_juntas = 0
    for permutacion in permutaciones:
        # posicion de cada letra
        pos_u = permutacion.find('u')
        pos_e = permutacion.find('e')
        pos_a = permutacion.find('a')
        # vemos si cumple alguna de las condiciones
        if abs(pos_u - pos_e) <=1 or abs(pos_e - pos_a) <=1:
            cuantas_vocales_juntas += 1
            if abs(pos_u - pos_e) <=1 and abs(pos_e - pos_a) <=1:
                # print(permutacion)
                # Los restamos porque ya los contó aca arriba
                cuantas_vocales_juntas -= 1
                tres_juntas += 1

        # Permutaciones que cumplen con ambas condiciones
        # else:
            # print(permutacion)
    print(tres_juntas)
    return cuantas_vocales_juntas
#
perms = [''.join(p) for p in permutations("pruebas")]
perms_totales = len(set(perms))
print(perms_totales)
condiciones = permuts("pruebas")
print(condiciones)
#Respuesta
# print(5040-condiciones)

import math

def gcd(a, b):
    if abs(a) < abs(b):
        return gcd(b, a)

    while abs(b) > 0:
        q, r = divmod(a, b)
        a, b = b, r

    return a

print(gcd(990,187))

def divisorGenerator(n):
    large_divisors = []
    for i in range(1, int(math.sqrt(n) + 1)):
        if n % i == 0:
            yield i
            if i*i != n:
                large_divisors.append(n / i)
    for divisor in reversed(large_divisors):
        yield int(divisor)

lista_divisores_pos= list(divisorGenerator(246))

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
    lista3 = []
    lista4 = []
    for a in range(0,100):
        for b in range(0,100):
            x = 7*a -3*b
            y = 2*a + 5*b
            tup = (a,b)
            mcd = gcd(x,y)
            t_m = (tup,mcd)
            if mcd in lista_divisores_pos:
                lista2.append(tup)
                lista3.append(mcd)
                lista4.append(t_m)
            # else:
                # lista2.append("X")
    print(set(lista3))
    print(lista4)
    # return lista2

print(lista_con_todos_divisores)
print(divisores_enteros(lista_con_todos_divisores))

######## Para calcular rapido la potencia a la cual queda elevado un a al usar PTF ######
## Hallar el resto de 33^(1427) mod 5
# El b es por si hay algo tipo: b.a^(n)≡??(p)

a = 3
n = 385
p = 16 # OJO CON P QUE TIENE QUE SER PRIMO!!!!!!!!!!!!!!!!!!!
b = 0
resto_a_mod_p = divmod(a, p)
resto_n_mod_p_1 = divmod(n, p-1)
print(resto_a_mod_p)
print(resto_n_mod_p_1)
print("{}^({})≡??({})".format(a, n, p))
print("{}≡{}({})".format(a, resto_a_mod_p[1], p))
print("({}^({}))^({}).{}^({})≡???({})".format(a, p-1, resto_n_mod_p_1[0], a, resto_n_mod_p_1[1], p))
resto_p_1_mod_p = divmod((resto_a_mod_p[1])**resto_n_mod_p_1[1], p)
if b != 0:
    resto_p_1_mod_p = divmod(((resto_a_mod_p[1]) ** resto_n_mod_p_1[1])*b, p)
print(resto_p_1_mod_p)
print("{}^{}≡{}({})".format(resto_a_mod_p[1], resto_n_mod_p_1[1], resto_p_1_mod_p[1], p))


## Para resolver cosas de la forma 7^(13)X ≡ 5 (11)
# 1) Resolvemos 7^(13) ≡ ??=c (11)
# 2) Resolvemos cX ≡ 5 (11)
