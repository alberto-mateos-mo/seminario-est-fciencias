Ejercicios del modelo Poission
================

### 1

**Problema hipotético**

El Instituto de Ciencias Aplicadas y Tecnología de la UNAM trabaja en un
proyecto para desarrollar estándares para la concentración de asbesto
presente en el agua destinada a consumo humano.

En un experimento controlado se disolvieron asbestos en agua y
posteriormente esta se hizo pasar por un filtro con el objetivo de
contar el número de fibras de asbesto que quedaban atrapadas en el
mismo.

El procedimiento se realizó con 200 filtros, lo que dió como resultados
un promedio de 27.7 fibras de asbestos por filtro y lo siguiente:

|                                                            Número de fibras                                                             | 0-10  | 11-15 | 16-20 | 21-24 | 25-27 | 28-30 | \>=31 | suma  |
| :-------------------------------------------------------------------------------------------------------------------------------------: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|                         Número observado de filtros<br>![O\_i](https://latex.codecogs.com/png.latex?O_i "O_i")                          |   2   |   1   |  36   |  52   |  50   |  39   |  20   |  200  |
|                          Número esperado de filtros<br>![E\_i](https://latex.codecogs.com/png.latex?E_i "E_i")                          | 0.12  | 2.43  | 34.62 | 57.51 | 45.36 | 32.62 | 27.34 |  200  |
| ![\\frac{(O\_i-E\_i)^2}{E\_i}](https://latex.codecogs.com/png.latex?%5Cfrac%7B%28O_i-E_i%29%5E2%7D%7BE_i%7D "\\frac{(O_i-E_i)^2}{E_i}") | 30.25 | 0.85  | 0.06  | 0.53  | 0.48  | 1.25  | 1.97  | 35.39 |

El consultor estadístico asumió un modelo Poisson para el número
observado de fibras.

  - Explique el racional detrás de la elección del modelo Poisson,
    describa los supuestos y de un estimador para el parámetro.

El consultor desea probar que el modelo es el adecuado usando la prueba
chi-cuadrada. Con los resultados de la tabla se obtiene que la
estadística de prueba es 35.39

  - Escriba la prueba de hipótesis que se realiza y el resultado de la
    prueba a un nivel de significancia del 5%

### 2

**Problema hipotético**

Usted está trabajando en un proyecto del IIMAS que consiste en analizar
el daño causado a embarcaciones por la exposición al oleaje.

Como parte del proyecto se recolectaron los siguientes datos:

*type*: tipo de embarcación (codificado con las letra A a E)

*year*: año de construcción de la embarcación

*period*: periodo de operación (1960-74, 75-79)

*service*: acumulado de meses en servicio

*incidents*: número de incidentes por daño

1.  Ajuste un modelo poisson a los datos y explique detalladamente.

(Hint: ajuste el modelo `incidents ~
offset(log(service))+type+year+period`)

2.  ¿Diría que el modelo es bueno?

3.  El uso de offset() en el modelo permite agregar variables cuyo
    parámetro se fija en el valor 1 en lugar de permitirle al algoritmo
    estimarlo. Explique por qué es buena idea usarlo para agregar la
    variable *service* al modelo.

N. B. Use los datos `ships` del paquete `MASS`
