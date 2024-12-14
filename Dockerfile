# 1. 使用 Maven 官方镜像进行源码构建
FROM maven:3.8.7-eclipse-temurin-8 AS build

# 2. 设置工作目录并复制项目源码
WORKDIR /app
COPY . .

# 3. 执行 Maven 构建命令
RUN mvn clean package -DskipTests

# 4. 使用轻量级 JDK 镜像运行应用
FROM openjdk:8-jdk-alpine

# 5. 设置工作目录
WORKDIR /app

# 6. 从构建阶段复制打包好的 JAR 文件到运行镜像中
COPY --from=build /app/target/*.jar app.jar

# 7. 启动应用程序
ENTRYPOINT ["java", "-jar", "app.jar"]