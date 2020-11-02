## Aplicación del modelo multinomial

### 1

__Problema hipotético__

Una encuesta realizada por Universum incluía la siguiente pregunta “¿Dirías que la astrología es una ciencia, tiene algo de ciencia o es cero científica?”

Como parte de un proyecto, Universum nos ha pedido ayuda para analizar si la educación es un factor para disminuir la creencia en la astrología.

La siguiente es una tabla cruzada de las respuestas con el nivel de estudios.

|              | Cero científica | Algo científica | Es una ciencia |
|:------------:|:---------------:|:---------------:|:--------------:|
|  <Secundaria |        98       |        84       |       23       |
|  Secundaria  |       574       |       286       |       50       |
| Bachillerato |       122       |        44       |        4       |
| Licenciatura |       168       |        57       |       11       |
|   Posgrado   |       148       |        23       |        1       |


N.B. Usar las variables __ASTROSCI__ y __DEGREE__.

### 2

En la encuesta se pregunta a los entrevistados que identifiquen si, para algunos problemas, consideran que se está gastanto mucho, lo necesario o poco en ellos, queremos analizar si esta respuesta puede explicarse con algunas otras sobre demográficos, religión e inclinación oplítica.

Usando las variables __NATMASS__, __AGE__, __SEX__, __SEI__, __REGION__ y __POLVIEWS__ realice el siguiente análisis.

1. Convierta la variable __NATMASS__ a factor cuyo nivel base sea _about right_

2. Recodifique la variable __POLVIEWS__ para que sea un factor que vaya desde _extremely liberal_ hasta _extremely conservative_

3. ¿Qué inclinación política es más frecuente?, diseñe un gráfico de inclinación política y gasto en transporte masivo (NATMASS) y describa detalladamente.

4. Nos gustaría tener una interpretación útil del intercepto, ¿qué tranformación haría a las variables __AGE__ y __SEI__ para lograrlo? Una vez identificada aplíquela a las variables.

5. Ajuste un modelo multinomial usando __NATMASS__ como variable a explicar pero no incluya la variable de inclinación política (modelo 1).

6. Interprete el coeficiente de la variable edad usando el logarítmo de la proporción de probabilidades y solo la proporción de probabilidades.

7. Ajuste un modelo usando ahora también la variable de inclinación política y realice las pruebas necesaria para evaluar si esta variable es útil, inteprete el resultado de la prueba en el contexto del problema (modelo 2).

8. Examine los residuales para verificar si el modelo 2 es el adecuado. 
Hint: Obtenga las probabilidades ajustadas, calcule los residuales para cada categoría de __NATMASS__ y grafique contra las variables continuas y categóricas

9. Explique si el modelo 2 es adecuado para describir la relación entre la inclinación política y la percepción de gasto en transporte masivo.

10. Dependiendo de su respuesta al punto anterior describa los resultados en el contexto del problema o explique qué necesita para obtener un modelo apropiado (aplique los cambios e interprete con el modelo que considere adecuado).