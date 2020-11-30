## Reducción de dimensiones

Los datos que se encuentran en el archivo `respuestas_encuesta.csv` corresponden a las respuestas de una encuesta que evaluo diferentes aspectos de la personalidad de adultos jóvenes.

La descripción de las variables se encuentran en el archivo `columnas_descrip.csv`, considere que para las variables numéricas el valor 1 indica una menor identificación con el enunciado de la pregunta y el valor 5 indica una mayor identificación.

#### Ejercicio 1

Realice una reducción de dimensiones con el algorítmo PCA, explique su estrategia para abordar este problema, explique detalladamente cuántos componentes escogería y por qué; estudie las variables rotadas y trate de identificar cómo están construidas las nuevas dimensiones.

Compare la reducción cuando usa descomposición de valores singulares de la matriz de datos y cuando usa el calculo de eigenvectores/eigenvalores sobre la matriz de covarianza.

¿Observa diferencias? En caso afirmativo expliqué qué método usaría y en qué casos. Si no observa diferencias piense en los posibles casos en que estas diferencias puedan existir.

#### Ejercicio 2

Realice una reducción de dimensiones que le permita extraer construir variables latentes, explique su estrategia para abordar el problema, estudie con cuidado los pesos factoriales con el objetivo de asignarle un nombre (y una interpretación) a las variables latentes.

Diseñe un índice sociológico con las variables latentes, de una interpretación del índice que diseñó, explique qué valores puede tomar, qué interpretación tienen estos valores, etc.