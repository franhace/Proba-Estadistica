import cmath
# defino el vector 0+i
i = complex(0, 1)

# definimos otros vectores
z = complex(2,3)
w = complex(1,3)
# u = complex(cmath.sqrt(2), cmath.sqrt(3))

# parte real y parte imaginaria
print(z.real)
print(z.imag)

# operaciones vectoriales
print(z**2)
print(z*w)

# modulo de un vector
a, b = 1, 2
zz = complex(a, b)

# modulo al cuadrado de z
def modcuad(z):
    modcuad= (int(z.real+z.imag))
    return modcuad

# modulo de z
def mod(z):
    mod = cmath.sqrt(modcuad(z))
    return mod

# conjudado
def conj(a,b):
    conj = complex(a, -b)
    return conj

# nos separa en parte R e imaginaria un numero complejo
def partes(z):
    real = getattr(z, 'real')
    imag = getattr(z, 'imag')
    return real, imag

# Nos devulve el conj de z sobre modcuad de forma linda (sin calcular)
print("inverso:{} / {}".format(conj(partes(z)[0],partes(z)[1]), modcuad(z)))

yy = complex(2, 1)
ww = complex(1, 3)
yw = yy*ww

c, d = partes(yy)
print(c, d)
# print(conj(c,d))

# coordenadas polares
# print(cmath.polar(z))
