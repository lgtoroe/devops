# DOCKER. Que es?

"Docker", el software de TI, es una tecnologia de creacion de contenedores que permite la creacion y el uso de contenedores de Linux.

Con DOCKER, puede usar los contenedores como maquinas virtuales extremadamente livianas y modulares. Ademas, obtiene flexibilidad con estos contenedores: puede crearlos, implementarlos, copiarlos y moverlos de un entorno a otro, lo cual le permite optimizar sus aplicaciones para la nube.

Como funciona Docker?
La tecnologia Docker usa el kernel de Linux y las funciones de este, como Cgroups y namespaces, para segregar los procesos, de modo que puedan ejecutarse de manera independiente. El proposito de los contenedores es esta independencia: la capacidad de ejecutar varios procesos y aplicaciones por separado para hacer un mejor uso de su infraestructura y, al mismo tiempo, conservar la seguridad que tendria con sistemas separados.

Ventajas de los contenedores Docker
Modularidad, el enfoque Docker para la creacion de contenedores se centra en la capacidad de tomar una parte de una aplicaci?n, para actualizarla o repararla, sin necesidad de tomar la aplicaci?n completa. Ademas de este enfoque basado en los microservicios, puede compartir procesos entre varias aplicaciones de la misma forma que funciona la arquitectura orientada al servicio (SOA).

Control de versiones de imagenes y capas
Cada archivo de imagen de Docker se compone de una serie de capas. Estas capas se combinan en una sola imagen. Una capa se crea cuando la imagen cambia. Cada vez que un usuario especifica un comando, como ejecutar o copiar, se crea una nueva capa.

Docker reutiliza estas capas para construir nuevos contenedores, lo cual hace mucho m?s r?pido el proceso de construccion. Los cambios intermedios se comparten entre im?genes, mejorando aun m?s la velocidad, el tama?o y la eficiencia. El control de versiones es inherente a la creaci?n de capas. Cada vez que se produce un cambio nuevo, basicamente, usted tiene un registro de cambios incorporado: control completo de sus imagenes de contenedor.

Restauracion
Probablemente la mejor parte de la creacion de capas es la capacidad de restaurar. Toda imagen tiene capas. ?No le gusta la iteracion actual de una imagen? Restaurela a la version anterior. Esto es compatible con un enfoque de desarrollo agil y permite hacer realidad la integracion e implementacion continuas (CI/CD) desde una perspectiva de las herramientas.

Implementacion rapida
Solia demorar dias desarrollar un nuevo hardware, ejecutarlo, proveerlo y facilitarlo. Y el nivel de esfuerzo y sobrecarga era extenuante. Los contenedores basados en Docker pueden reducir el tiempo de implementacion a segundos. Al crear un contenedor para cada proceso, puede compartir rapidamente los procesos similares con nuevas aplicaciones. Y, debido a que un SO no necesita iniciarse para agregar o mover un contenedor, los tiempos de implementacion son sustancialmente inferiores. Ademas, con la velocidad de implementacion, puede crear y destruir la informacion creada por sus contenedores sin preocupacion, de forma facil y rentable.

Por lo tanto, la tecnolog?a Docker es un enfoque mas granular y controlable, basado en microservicios, que prioriza la eficiencia.
