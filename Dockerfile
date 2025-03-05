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

# Etapa 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/out ./

# Expõe a porta da aplicação
EXPOSE 8080
CMD ["dotnet", "BlazorApp.dll"]
