#A1.2     16/abril/2024
#Karla Fernanda Vazquez Avila

proc bernstein(i, n: int, u: float): float =
    var
        temp: array[0..10, float]  # Tamaño del array ajustado
        B, ul: float

    # Inicializar temp
    for j in 0..n:
        temp[j] = 0.0
    temp[n - i] = 1.0

    ul = 1.0 - u

    for k in 1..n:
        for j in 0..n-k:  # Iterar en orden ascendente
            temp[j] = ul * temp[j] + u * temp[j + 1]

    B = temp[0]  # El resultado se encuentra en el primer elemento del array
    result = B

# Ejemplo de uso
let i = 2  # Índice del polinomio de Bernstein
let n = 4  # Grado del polinomio de Bernstein
let u = 0.3  # Valor en el que se evaluará el polinomio de Bernstein
let resultado = bernstein(i, n, u)
echo "El resultado de evaluar el polinomio de Bernstein en ", u, " es: ", resultado

