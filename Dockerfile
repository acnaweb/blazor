# Etapa 1: Build da aplicação
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copia os arquivos do projeto e restaura as dependências
COPY src/BlazorApp/*.csproj ./BlazorApp/
WORKDIR /app/BlazorApp
RUN dotnet restore

# Copia o restante do código e publica a aplicação
COPY src/BlazorApp/ ./
RUN dotnet publish -c Release -o /app/out

# Etapa 2: Servidor Web (Nginx)
FROM nginx:alpine AS runtime
WORKDIR /usr/share/nginx/html

# Remove arquivos padrão do Nginx
RUN rm -rf ./*

# Copia os arquivos da aplicação Blazor WASM
COPY --from=build /app/out/wwwroot ./

# Exposição da porta do Nginx
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
