## Métodos basados en árboles.

### 1. Árboles de clasificación

Una compañía quiere entender cómo eficientar campañas promocionales, su objetivo como analista es ayudar a la compañia a mejorar el target de una campaña usando los resultados de las últimas 5 campañas.

Analize los resultados desde el punto de vista de las características del cliente y de la relación cliente-tienda.

Explique clara y detalladamente los resultados del mejor modelo que pueda generar.

Los datos a usar son `marketing_campaign.csv` y la descripción de las variables es la siguiente:

- AcceptedCmp1: 1 si el cliente participó en la campaña 1 promocional
- AcceptedCmp2: 1 si el cliente participó en la campaña 2 promocional
- AcceptedCmp3: 1 si el cliente participó en la campaña 3 promocional
- AcceptedCmp4: 1 si el cliente participó en la campaña 4 promocional
- AcceptedCmp5: 1 si el cliente participó en la campaña 5 promocional
- Response: 1 si el cliente participó en la última campaña
- Complain: 1 si el cliente ha presentado alguna _queja_ en los últimos dos años
- DtCustomer: fecha en la que el cliente se registró al CRM de la compañía
- Education: nivel educativo del cliente
- Marital: estado marital del cliente
- Kidhome: número de niños pequeños en casa del cliente
- Teenhome: número de adolescentes en casa del cliente
- Income: ingreso anual del hogar del cliente
- MntFishProducts: cantidad gastada en pescado en los últimos dos años
- MntMeatProducts: cantidad gastada en carne en los últimos dos años
- MntFruits: cantidad gastada en frutas en los últimos dos años
- MntSweetProducts: cantidad gastada en dulces en los últimos dos años
- MntWines: cantidad gastada en vinos en los últimos dos años
- MntGoldProds: cantidad gastada en productos de oro en los últimos dos años
- NumDealsPurchases: número de compras realizadas con descuentos
- NumCatalogPurchases: numero de compras realizadas usando el catálogo
- NumStorePurchases: número de compras realizadas diractamente en tiendas
- NumWebPurchases: número de compras realizadas en el sitio web
- NumWebVisitsMonth: número de visitas realizadas al sitio web
- Recency: número de días que pasaron desde la última compra

### 2. Árboles de regresión

Usando los datos `house_prices.csv` identifiqué las características que le dan un mayor o menor precio a una casa.

La descripción de los datos es la siguiente:

- SalePrice: precio de venta en dolares.
- MSSubClass: clase del edificio
- MSZoning: clasificación de la zona
- LotFrontage: longitud de calle (en pies) conectados a la propiedad
- LotArea: tamaño del lote en pies cuadrados
- Street: tipo de calle
- Alley: tipo de callejon
- LotShape: forma del lote
- LandContour: grado de planitud del lote
- Utilities: tipo de utilería disponible
- LotConfig: configuración del lote
- LandSlope: inclinación de la propiedad
- Neighborhood: ubicaciones físicas
- Condition1: proximidad a avenida principal o tranporte público
- Condition2: proximidad a segunda avenida principal o transporte público (si existe)
- BldgType: tipo de vivienda
- HouseStyle: estilo de vivienda
- OverallQual: calidad de materiales y terminado
- OverallCond: condición
- YearBuilt: fecha original de construcción
- YearRemodAdd: fecha de remodelación
- RoofStyle: tipo de techo
- RoofMatl: material del techo
- Exterior1st: cubierta exterior de la casa
- Exterior2nd: segunda cubierta exterior de la casa
- MasVnrType: tipo de mampostería
- MasVnrArea: área de mampostería
- ExterQual: calidad del material exterior
- ExterCond: condición actual del material exterior
- Foundation: tipo de cimientos
- BsmtQual: altura del sótano
- BsmtCond: condición general del sótano
- BsmtExposure: exposición del sótano
- BsmtFinType1: calidad del terminado en sotano
- BsmtFinSF1: pies cuadrados de terminado tipo 1
- BsmtFinType2: calidad del segundo terminado en sotano (si tiene)
- BsmtFinSF2: pies cuadrados de terminado 2
- BsmtUnfSF: pies de cuadrados de sótano no terminado
- TotalBsmtSF: área total del sotano en pies cuadrados
- Heating: tipo de calefacción
- HeatingQC: calidad y condición de la calefacción
- CentralAir: aire acondicionado central
- Electrical: sistema eléctrico
- 1stFlrSF: área en pies cuadrados del primer piso
- 2ndFlrSF: área en pies cuadrados del segundo piso
- LowQualFinSF: área en pies cuadrados de terminados de baja calidad
- GrLivArea: superficia habitable en pies cuadrados
- BsmtFullBath: baños completos en el sótano
- BsmtHalfBath: medios baños en el sótano
- FullBath: baños completos
- HalfBath: medios baños
- Bedroom: número de habitaciones
- Kitchen: número de cocinas
- KitchenQual: calidad de la cocina
- TotRmsAbvGrd: número total de cuartos
- Functional: puntaje de funcionalidad de la casa
- Fireplaces: número de chimeneas
- FireplaceQu: calidad de la chimenea
- GarageType: ubicación del garaje
- GarageYrBlt: año de cosntrucción del garaje
- GarageFinish: terminado interior del garaje
- GarageCars: tamaño del garaje en autos
- GarageArea: tamaño del garaje en pies cuadrados
- GarageQual: calidad del garaje
- GarageCond: condición del garaje
- PavedDrive: camino pavimentado
- WoodDeckSF: área en pies cuadrados de piso de duela
- OpenPorchSF: área en pies cuadrado de patio abierto
- EnclosedPorch: área en pies cuadrados de patio cerrado
- PoolArea: área del alberca en pies cuadrados
- PoolQC: calidad de la alberca
- Fence: calidad de la reja
- MiscFeature: otra característica
- MiscVal: valor de la característica adicional
- MoSold: mes de venta
- YrSold: año de venta
- SaleType: tipo de venta
- SaleCondition: condición de la venta

Más detalles se pueden encontrar en `house_prices_detailed.txt`.

### 3. Random forest

Diseñe un algorítmo que pueda predecir con un nivel alto de confianza el valor de venta de una casa.