Hola = print("hello")

Hola

Lautaro = 5
Lorenzo = 4

print(Lautaro + Lorenzo)

respuesta = input("sos negro?")

if respuesta == "sin":
    print("NOO *lo usa de esclavo*")
else:
    print("Muy bien papupapu *le da un cargo politico")


contador = 1
while contador <= 15:
    print("Contando:", contador)
    contador += 1

    
for i in range(5):
    print("Número:", i)


#Funciones siempre son "def nombre_de_la_funcion():"
def prueba():
    print("Prueba ñakaña")

def saludar(nombre):
    print("Hola, " + nombre + "!")

saludar("Lorenzo")
saludar("Juan")


def datos():
    Nombre = input("¿Nombre? ")
    edad = input("¿Edad? ")
    print("Nombre:", Nombre)
    print("Edad:", edad)

datos()

def sumar(a, b):
    return a + b

# Llamar y guardar el resultado:
resultado = sumar(3, 5)
print("La suma es:", resultado)

