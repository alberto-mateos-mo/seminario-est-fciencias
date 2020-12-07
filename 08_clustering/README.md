## Algoritmos de clústerización

Usando los datos la [Encuesta Nacional de Ingresos y Gastos de los Hogares 2018](https://www.inegi.org.mx/programas/enigh/nc/2018/#Microdatos) lleve acabo una clústerización que le ayude a identificar grupos de hogares con comportamientos similares en cuanto a gastos e ingresos.

N.B. use el conjunto _concentrado de hogares_, información al respecto de las variables la encuentra [aquí](https://www.inegi.org.mx/contenidos/programas/enigh/nc/2018/doc/enigh18_descriptor_archivos_fd_ns.pdf).

__Algorítmo k-medias__

- ¿Cuántos grupos considera adecuados? Compare los resultados que arrojan los distintos algorítmos implementados en R.

- ¿Qué algorítmo considera que da mejores resultados y por qué?

- Compare los grupos desde el punto de vista de las métricas de variación y desde el punto de vista de los datos, ¿son, en efecto, grupos con comportamientos distintos?

- Elabora alguna visualización que le ayude a justificar el número de grupos usados.

- Explique detalladamente las características de cada grupo.

- Explore si los grupos que encontró siguen algún patrón geográfico y/o sociodemográfico.

__Algorítmo jerárquico__

- Aplique el algorítmo de clústerización jerárquica a los datos usados en k-medias

- Compare los resultados del ábol de clústerización cuando usa las métricas euclidieana, máximo, manhatta y minkowski. Explique detalladamente sus hallazgos y seleccione la métrica que, bajo su criterio, funciona mejor para este ejercicio.

- ¿Cuántos grupos considera adecuados?, ¿usaría la misma cantidad de grupos que encontró con el algoritmo k-medias?

- Compare los resultados de los grupos bajo los distintos métodos de aglomeración implementados en R. ¿Cuál considera que arroja los mejores grupos y por qué?, haga evidente que sus grupos son distintos entre ellos.

- ¿Qué criterio de comparación entre grupos usaría?

- Sí elegió la misma cantidad de grupos que en k-medias, compare los resultados y explique sus hallazgos con detalle, en caso contrario explique el racional de elegir una cantidad distinta de grupos.

- Explore si los grupos que encontró siguen algún patrón geográfico y/o sociodemográfico.