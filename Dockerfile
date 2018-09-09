FROM composer:latest AS bedrock

RUN ["composer", "create-project", "roots/bedrock", "."]

FROM bitnami/nginx:latest

RUN ["mkdir", "-p", "/app/wordpress"]
COPY --from=bedrock /app /app/wordpress
COPY ./.env /app/wordpress/.env