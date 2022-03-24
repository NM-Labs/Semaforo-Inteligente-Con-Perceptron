# Semaforo-Inteligente-Con-Perceptron
Semáforo Inteligente utilizando el Perceptrón de Rosenblatt. Este proyecto se realizó para construir desde su forma más básica la unidad de cálculo elemental de las redes neuronales conocida como perceptrón. Se realizo una implementación que involucra tanto hardware como software, así como la comunicación entre elementos que conforman al sistema. Se tuvo por objetivo crear una solución a pequeña escala pero que pueda ser escalable una situación cotidiana.

Es así, como se decidió crear un sistema capaz de distinguir entre personas (en nuestro caso figuras humanas de plástico) y autos (a escala de juguete), pero con el detalle suficiente para poder representar la forma real de estas entidades. En el proyecto se utilizaron métodos de pre-procesamiento de imágenes para poder obtener información que fuese clasificable para un perceptrón. Obteniendo la respuesta de clasificación emitida por el perceptrón, se envía la señal a un microcontrolador para poder ejercer el control de un semáforo para vehículos y uno para peatones.
 
Con ello, se enfatiza la importancia del análisis de datos para poder comprender de forma computacional la variación de magnitudes físicas en un entorno. Así como la capacidad de los algoritmos pertenecientes al área de inteligencia artificial para emitir una respuesta apropiada ante dichas magnitudes. Por último, se evidencia el como mediante el enlace de los componentes electrónicos, nos permite una eficiente obtención de datos que son procesados por el perceptrón, y nos ayuda a ejercer control sobre un sistema físico.


Actualización: Marzo 2021

Se cambió la configuración de las carpetas quedando como:

* EntrenamientoImagenBinaria: Código de experimentos realizados con perceptrón construido en C++, y donde se entrena con imagen binaria directamente. 
* EntrenamientoCaracterísticasdeImagenBinaria: Código de nuevos experimentos con perceptrón de código base de Matlab, se entrena con características extraídas de la imagen binaria.
	Se mejora el desempeño del modelo bajo esta última aproximación.
