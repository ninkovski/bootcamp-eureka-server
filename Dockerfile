# Usamos la imagen base de Java 8
FROM openjdk:8-jdk-alpine

# Establecemos el directorio de trabajo
WORKDIR /app

# Copiamos el archivo JAR de la aplicación (que se generará en el proceso de build)
COPY target/eurekaserver-0.0.1-SNAPSHOT.jar /app/eurekaserver.jar

# Exponemos el puerto donde correrá Eureka (puerto 8761 por defecto)
EXPOSE 8761

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "eurekaserver.jar"]
