#A1.4  16/abril/2024
#Karla Fernanda Vazquez Avila

proc allBernstein(n: int, u: float): seq[float] =
  var B: seq[float] = @[]
  var u1 = 1.0 - u
  var uPow, coeff: float = 1.0, 1.0

  for i in 0..n:
    B.add(coeff)
    uPow *= u
    coeff = coeff * (n - i) / (i + 1) * u1

  result = B

proc pointOnBezierCurve(P: seq[tuple[x, y: float]], n: int, u: float): tuple[x, y: float] =
  var C: tuple[x, y: float] = (0.0, 0.0)
  var B: seq[float]

  B = allBernstein(n, u)

  for k in 0..n:
    C[0] += P[k][0] * B[k]
    C[1] += P[k][1] * B[k]

  result = C

# Ejemplo de uso
let P = @[(0.0, 0.0), (1.0, 2.0), (2.0, 3.0), (3.0, 1.0)]  # Puntos de control
let n = len(P) - 1  # Grado del polinomio de Bezier
let u = 0.5  # Parámetro u
let resultado = pointOnBezierCurve(P, n, u)
echo "El resultado de evaluar la curva de Bezier en u =", u, " es:", resultado
