#A1.5    16/Abril/2024
#Karla Fernanda Vazquez Avila

proc deCasteljau(P: seq[tuple[x, y: float]], n: int, u: float): tuple[x, y: float] =
    var
        Q: array[0..10, tuple[x, y: float]]  # Tamaño del array ajustado
        C: tuple[x, y: float]

    # Inicializar Q
    for i in 0..n:
        Q[i] = P[i]

    for k in 1..n:
        for i in 0..n-k:
            let Qij = Q[i]
            let Qij1 = Q[i+1]
            let Qnew: tuple[x, y: float] = ((1.0 - u) * Qij.x + u * Qij1.x, (1.0 - u) * Qij.y + u * Qij1.y)
            Q[i] = Qnew

    C = Q[0]
    result = C

# Ejemplo de uso
let P = @[(0.0, 0.0), (1.0, 2.0), (2.0, 3.0), (3.0, 1.0)]  # Puntos de control
let n = len(P) - 1  # Grado del polinomio de Bezier
let u = 0.5  # Parámetro u
let resultado = deCasteljau(P, n, u)
echo "El resultado de evaluar la curva de Bezier en u =", u, " es:", resultado
