#  Blazor WebAssembly

### Criando a Aplicação  Blazor WebAssembly

```sh
dotnet new list
```

```sh
dotnet new blazorwasm -o src/BlazorApp
cd src/BlazorApp
dotnet new sln -n BlazorApp
dotnet sln add BlazorApp.csproj
cd ../../
dotnet new gitignore

```

### Rodando a Aplicação com Docker

* Build

```sh
docker build -t blazor-app .
```

* Run

```sh
docker run -p 8080:80 blazor-app
```    

Agora, a aplicação estará rodando em http://localhost:8080. 🚀


![](assets/images/home.png)




### Install dotnet Ubuntu 22.04

https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-install?pivots=os-linux-ubuntu-2204&tabs=dotnet9