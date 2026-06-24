# ---- Build stage ----
# FROM ubuntu:24.04 AS build
FROM jay1570/flutter-base:3.44.2 AS build


WORKDIR /app

COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get

COPY . .

RUN flutter build web --release --base-href /

# ---- Serve stage ----
FROM nginx:alpine

COPY --from=build /app/build/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]