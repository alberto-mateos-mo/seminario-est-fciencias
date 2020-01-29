## Script conocimientos básicos y avanzados de R

##Algunos ejemplos de ayuda en línea mediante comandos:
help() #Muestra una ventana de ayuda general sobre R.
help.start() #Arranca un manual de ayuda completo en formato html, utilizando el navegador del sistema.
help(log) #Muestra una ventana de ayuda sobre la funci?n logaritmo.
apropos("plot") #Muestra las funciones u objetos que incluyen la cadena "plot" en su nombre.
help.search("plot") #Muestra la ayuda sobre las funciones que incluyen la cadena "plot".


## Vectores

## Crear un vector con las entradas 0.1, 0.2, 0.3
roma<-c(0.1,0.2,0.3)
## Análogamente
assign("mora", c(0.4,0.5,0.6))
## También funciona
c(0.7,0.8,0.9)->z
## Sin asignar un valor
1/roma
## 'Concatenar' vectores
mora<-c(roma,0,0,0,roma)
##Podemos extraer elementos de un vector de este modo:
mora[3];mora[-3];mora[c(1,5,7)]

## Aritmética de vectores
v<-2*roma+mora+1
## Existen una infinidad de funciones para manipular 'datos', como son:
sum(v) ## suma todos los elementos del objeto
prod(v) ## multiplica todos los elementos del objeto
max(v) ## máximo
min(v) ## mínimo
which.max(v) ## índice del máximo
which.min(v) ## índice del mínimo
range(v) ## vector de dos entradas con el mínimo y máximo respectivamente
## etc

## Muestra los nombres de los objetos en memoria
ls()
## Muestra las variables con cierta serie de caracteres en su nombre
ls(pat="m")
## Muestra las variables las cuales su nombre empieza con el caracter dado
ls(pat="^m")
## Muestra detalles de los objetos en memoria
ls.str()
## Eliminar todas las variables de 'Global Environment'
rm(list=ls())
## Eliminar únicamente variables que empiezan con la letra m
rm(list=ls(pat="^m"))
## Tipo de elementos del objeto
mode(v)
## Tamaño del objeto
length(v)
## Los datos faltantes son representados por NA (not available)
## R representa correctamente valores numéricos no finitos
x<-5/0
exp(x)
exp(-x)
x-x

## Para declarar cadenas de caracteres usamos comillas dobles ""
x<-"Hola Mundo"
## Si queremos incluir el símbolo " en una cadena de caracteres, debe ser después de \
x<- "Hola \" Mundo"

## Para leer y escribir archivos, R usa un directorio de trabajo. Para conocer cuál usamos
getwd()
## Para cambiarlo usamos
setwd("C:/Users/A8036887/Documents/Datos")
## Es necesario dar la ruta del archivo que se quiere leer si no se encuentra en el directorio de trabajo

## Leer archivos
## Parámetros (importantes):
## file: nombre del archivo entre ""
## header: TRUE o False
## sep: separador de los campos
datos<-read.table("data.txt", header = TRUE, sep="\t")
odatos<-read.csv("data.csv") 
## Para revisar si es data.frame
is.data.frame(datos)
## Número de columnas del data.frame
ncol(datos)
## Número de filas del data.frame
nrow(datos)
## Resumen
summary(datos)

## Guardar datos
write.table(datos, "toma.txt", append=F, sep="\t")
write.csv(odatos, "toma2.csv")

## Genera un vector con valores subsecuentes
x<-1:30
## Genera un vector con cierta secuencia
y<-seq(1,5,0.5)
w<-seq(10,0,-0.5)
## Genera un vector que repite un dato cierto número de veces
z<-rep(1,20)
## Genera un vector con series valores subsecuentes hasta los números indicados
q<-sequence(3:5)
q<-sequence(c(10,5))
## Genera series regulares de factores dados. 
q<-gl(3,5,length=30)
q<-gl(2,6,label=c("Hombre","Mujer"))
## A diferencia de los anteriores, la siguiente función genera un data frame con todas las
## posible combinaciones de vectores o factores dados como argumentos
q<-expand.grid(h=c(60,80),w=c(100,300), sex=c("Hombre", "Mujer"))

## Descargar y cargar librerías
install.packages("MASS")
library(MASS)

## Creación de objetos
## Vector (numeric, logical, character)
a<-vector(mode= "logical", length=5)
b<-logical(length=5)

## Factor (ordered = is.ordered(x), exclude, levels)
a<-factor(1:3, labels = c("Hola", "Adios", "Ah"))
b<-factor(x=c(2,5), levels = 2:5)
c<-factor(1:5,exclude=4)
levels(b)

## Matriz (byrow)
a<-matrix(1:6, 2,3, byrow=F)
## Otra forma de crear una matriz
b<-1:15
dim(b)<-c(5,3)

## Data Frame
x<-1:4
n<-10
M<-c(10,35)
a<-data.frame(x,n,M)

## List
a<-list(x,M)
b<-list(A=x,B=M)
names(b)

## Expression
x<-3
y<-2.5
z<-1
expp<-expression(x/(y + exp(z)))
eval(expp)
## Un tipo de función que recibe expression como argumento
D(expp, "x")
D(expp, "y")
D(expp, "z")

## Convertir objetos (as.numeric, as.character, as.logical, etc)
as.character(x)
as.logical(x)
## Dichas funciones afectan cada tipo de objeto de manera diferente

## Operadores 
## Aritméticos                  Comparación                 L?gicos
## suma +                       menor que <                 NOT  !
## resta -                      mayor que >                 & and
## multiplicación *             menor o igual que <=        && id.
## división /                   mayor o igual que >=        | OR
## potencia ^                   igual ==                    || id.
## módulo %%                    diferente !=                
## división entera %/%
x<-1:3
y<-1:3
z<-c(1,2,4)
x==y
## Los operadores de comparación operan sobre cada elemento del vector
## Las siguientes funciones también comparan si son iguales pero sobre todo el vector.
## Es decir, con que uno sea diferente devolverá F la primera y la segunda una medida de diferencias
identical(x,y)
identical(z,x)
all.equal(x,y)
all.equal(x,z)

## Un par de ejemplos de comparaciones interesantes
0.9==(1-0.1)
identical(0.9,1-0.1)
all.equal(0.9,1-0.1)
0.9==(1.1-0.2)
identical(0.9,1.1-0.2)
all.equal(0.9,1.1-0.2)
all.equal(0.9,1.1-0.2, tolerance=1e-16)

## Para acceder a valores de un objeto
## Para acceder a los valores de un vector utilizamos []
## Se puede usar sólo para obtener un valor o asignarle
a<-1:30
a[25]
a[23]<-100
## El índice también puede ser dado como un vector
i<-c(1,15)
a[i]
## Para acceder a los valores de una matriz o data frame se utiliza [ , ]
a<-matrix(1:15,5,3, byrow = T)
a[2,3]
## Se puede acceder a valores de columnas ([,i]) o filas ([i,]) completas, al igual 
## asignarles valores
a[1, ]
a[ ,2]
a[1, ]<-4:6
a[ ,2]<-10:14
## Si queremos que al acceder a una fila o columna de una matriz, lo que devuelva sea
## de nuevo una matriz (en lugar de un vector) cambiamos el valor de drop
a[ ,3,drop=F] 
## Lo anterior también se puede utilizar para eliminar filas o columnas
a[ ,-2]
a[-1, ]
a<-a[-1,-2] ## borra primer fila y segunda columna de la matriz original
## También se pueden eliminar varias filas o columnas 
a<-a[-(2:3) , ]
## Para vectores, matrices y arrays se puede acceder a sus valores con una comparación
## como índice
a<-1:20
a[a >= 5]<-100

## Al igual que list, vector, matrix, array, data frame, etc, pueden tener los 
## atributos names, rownames, colnames, etc, dependiendo del objeto.
a<-1:3
names(a)
names(a)<-c("A","B","C")

a<-matrix(1:10, 2, 5)
colnames(a)
rownames(a)
colnames(a)<-c("A","B","C","D","E")
rownames(a)<-c("1","2")
dimnames(a)

a<-array(1:8, dim = rep(2,3))
dimnames(a)
dimnames(a)<-list(c("A","B"), c("C","D"),c("E","F"))

## Si un vector, data frame o list tiene nombres en sus columnas pueden ser extraídas
## utilizando $
a<-list(A=1:4,B=5:8,C=9:12)
a$A

## La siguiente instrucción abrirá un editor donde podrán modificar los valores del 
## "objeto" manualmente.
a<-matrix(1:10, 2, 5)
data.entry(a)
## La siguiente instrucción hace exactamente lo mismo pero imprime también el obejto
## original para comparar cambios
de(a)

## Aritmética de matrices
## Para "pegar" dos matrices sobre columnas o filas se utiliza cbind o rbind respectivamente
a<-matrix(1:25,5,5,byrow = T)
b<-matrix(26:50, 5,5,byrow=T)
c<-cbind(a,b)
d<-rbind(a,b)
## Multiplicación de matrices %*%
e<-c %*% d
## Transpuesta de una matriz
t(e)
## Diagonal de una matriz
diag(e)
## También puedes crear una matriz identidad con esta función
diag(10)
## O bien
a<-1:10
diag(a)

## Gráficos
## Para conocer algunos de los tipos de gráficos que R puede hacer se usa lo siguiente
demo(graphics)
demo(persp)

## Algunas funciones gráficas
h<-seq(1,10,0.1)
m<-rexp(100, rate=2)
d<-dexp(h, rate=2)
p<-pexp(h, rate=2)
q<-qexp(0.5, rate=2)
plot(d)
plot(h,d,type="l")
boxplot(m)
hist(m)
## Algunos argumentos importantes para estas gráficas
## add: superpone los plots
## axes: T/F si dibuja o no los ejes
## type: tipo de gráfico. "p" puntos; "l" líneas; "b" puntos conectados por líneas; "h" líneas verticales; etc.
## xlim, ylim: límites de valores (vector)
## xlab, ylab: nombres de los ejes (caracter)
## main: título (caracter)
## sub: subtítulo (caracter)

## Comandos de bajo nivel
dev.off()
s<-dexp(h, rate=5)
plot(h,d)
lines(h,s, col="red")
hist(m)
abline(v=mean(m)) ## v:vertical; h:horizontal

## Ciclos, condiciones y funciones
## Ciclo "for"
for (anio in c(2000,2001,2002,2003,2004,2005,2006,2007)){
  print(paste("Cuenta",anio))
}

## Condición "if"
for (i in 1:10){
  if(!i %% 2){
    next
  } 
  print(i)
}

## Ciclo "while"
i<-1
while(i < 10){
  print(i)
  i<-i+1
}

## Declarar funciones
funcionfactorial<-function(a){
  res<-1
  if(a<0){
    return("No existen factoriales de números negativos.")
  } else if(a==0){
    return(res)
  } else{
    for(i in 1:a){
      res<-res*i
    }
    return(res)
  }
}

funcionfactorial(-5)
funcionfactorial(0)
funcionfactorial(10)

## Para generar secuencias aleatorias se usan funciones como las siguientes
## 100 observaciones de una exponencial con parámetro lambda=2
m<-rexp(100, rate=2)
## 50 observaciones de una geométrica con parámetro p=0.2
n<-rgeom(50, prob = 0.2)
## Existen diversos tipos de funciones de la forma rfunc, las cuales arrojan diferentes resultados
## si variamos la letra r:
## r-> realizaciones de una variable aleatoria
## d-> función de probabilidad/densidad
## p-> función de distribución 
## q-> valor del cuantil q
h<-seq(1,10,0.1)
d<-dexp(h, rate=2)
p<-pexp(h, rate=2)
q<-qexp(0.5, rate=2)

