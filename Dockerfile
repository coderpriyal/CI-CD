# Use official Maven image to build the project
FROM eclipse-temurin:17-jdk AS build

WORKDIR /app
COPY . .

# 🩵 FIX: Give execute permission to mvnw
RUN chmod +x mvnw

# Build the project
RUN ./mvnw clean package -DskipTests

# Use a lightweight JRE image to run the app
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

