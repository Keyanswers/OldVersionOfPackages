
# Carga el paquete ggsn
require(ggsn)

# Instala el paquete ggsn si no está instalado
install.packages('ggsn')

# Instala el paquete devtools
install.packages('devtools')

# Carga el paquete devtools
require(devtools)

# Instala la versión 0.5.0 del paquete ggsn
install_version('ggsn',
                version = '0.5.0')

# Carga el paquete ggsn
require(ggsn)

# Carga el paquete ggplot2
require(ggplot2)

# Carga el paquete sf
require(sf)

# Carga el paquete sp
require(sp)

# Lee el archivo shapefile 'nc.shp' incluido en el paquete sf y lo almacena en W
W = st_read(system.file(
  'shape/nc.shp',
  package = 'sf'))

# Muestra las primeras filas del objeto W
head(W)

# Crea un gráfico de ggplot con datos espaciales W, asigna el color de relleno 
# según la variable CRESS_ID y establece una paleta de colores de "dodgerblue" a "limegreen"
qqq = ggplot(W, aes(fill = CRESS_ID)) +
  geom_sf() + 
  scale_fill_continuous(
    low = "dodgerblue",
    high = "limegreen")

# Agrega una rosa de los vientos en la esquina superior izquierda del gráfico (north) y una 
# barra de escala (scalebar) que muestra la distancia en kilómetros con una longitud de 50 kilómetros y 
# utiliza el modelo WGS84 para la proyección del mapa
qqq +
  blank() +  # Añade un espacio en blanco
  north(W, symbol = 8, location = 'topleft') +  # Añade la rosa de los vientos en la esquina superior izquierda
  scalebar(W, dist = 50, dist_unit = "km", transform = TRUE, st.size = 3, model = "WGS84")  # Añade la barra de escala


        



