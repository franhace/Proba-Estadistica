# def lexicographical_permutation(str):
#     perm = sorted(''.join(chars) for chars in permutations(str))
#     for x in perm:
#         print(x)
#
#
# # str = 'congruencia'
# # print(len(lexicographical_permutation(str)))
#
# from itertools import permutations
#
# # import library
# from math import factorial
#
#
# def lexicographical_permutations(str):
#     # there are going to be n ! permutations where n = len(seq)
#     for p in range(factorial(len(str)-2)):
#         print(''.join(str))
#
#         i = len(str) - 1
#
#         # find i such that str[i:] is the largest sequence with
#         # elements in descending lexicographic order
#         while i > 0 and str[i - 1] > str[i]:
#             i -= 1
#
#         # reverse str[i:]
#         str[i:] = reversed(str[i:])
#
#         if i > 0:
#
#             q = i
#             # find q such that str[q] is the smallest element
#             # in str[p:] such that str[q] > str[i - 1]
#             while str[i - 1] > str[q]:
#                 q += 1
#
#             # swap str[i - 1] and str[q]
#             temp = str[i - 1]
#             str[i - 1] = str[q]
#             str[q] = temp
#
#
# s = 'posiciones'
# s = list(s)
# s.sort()
# print(s)
# # s = [i for i in lexicographical_permutations(s)]
# # print(len(s))
# # print(s)
#
# # ii) forma de no repetir mas de 1 vez 1 de las repetidas
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

s = list(range(1,81))
print(len(s))
r = [1, 20, 40, 60, 80]
s.remove(1)
s.remove(20)
s.remove(40)
s.remove(60)
s.remove(80)

print(len(s))
print(s)

for n in range(10):
    a = 3 * n + 5 ** (n + 1)
    b = 2 * n - 5 ** n
    r1 = a % 13
    r2 = b % 13
    if r1 == 0 and r2 == 0:
        print(a,b)
        print(a/13,b/13)
        print(n)
        break