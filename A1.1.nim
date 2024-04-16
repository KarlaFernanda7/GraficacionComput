#A1.1 pagina 7   16/abril/2024
#Karla Fernanda Vazquez Avila

proc horner(a: seq[float], n: int, u0: float): float =
    var C: float = a[n]
    for i in countdown(n - 1, 0):
        C = C * u0 + a[i]
    result = C

# Ejemplo de uso
var coeficientes = @[2.0, -3.0, 1.0]  # Coeficientes del polinomio: 2 - 3x + x^2
let grado = len(coeficientes) - 1  # Grado del polinomio
let u0 = 2.0  # Valor en el que se evaluará el polinomio
let resultado = horner(coeficientes, grado, u0)
echo "El resultado de evaluar el polinomio en ", u0, " es: ", resultado

