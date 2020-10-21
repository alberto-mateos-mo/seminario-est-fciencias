# Regresión Lineal

Usted trabaja como científico de datos en una compañía y el equipo de marketing le ha pedido ayuda para evaluar la eficiencia de los esfuerzos marcarios.

El director de marketing quiere poder encontrar respuesta al menos a las siguientes preguntas:

- ¿Qué acciones son más eficientes y qué tan eficientes son?

- ¿Cuáles son las menos eficientes?

- ¿Cuánto estoy generando de ventas solo por ser nuestra marca la que vende ese producto?

- ¿Qué puede decir sobre la estrategia que hemos seguido, ha funcionado?

- Si para el siguiente trimestre tengo presupuestada la misma cantidad que he venido asignando a comunicación, ¿cuánto espero vender el siguiente trimestre?,¿podría sugerir una mejor estrategia?, ¿cuánto vendería con la estrategia que sugiere?

- ¿Qué puede decir sobre la estrategia de precios?

Los datos para el ejercicio se encuentran acá y se llaman: mmm_Rlab.csv

Algunas sugerencias:

1. Crear variables dummies para las variables categóricas y comparar el modelo con aquel con las variables sin modificar.

2. Crear una nueva variable que junte el precio base y el descuento. ¿Cómo se compararía este modelo con uno usando interacciones entre esas dos variables?

3. Dado que estamos hablando de dinero, es sensato pensar que las sugerencias deban hacerse en "dinero de hoy" para ello será necesario traer a valor presente todas las variables usando la tasa de inflación. Comparen el modelo original contra el modelo con valor presente.

Para esto último asuman que los datos son quincenales y que inician en enero de 2018.