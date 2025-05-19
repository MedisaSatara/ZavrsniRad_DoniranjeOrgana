#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 7074
ENV ASPNETCORE_URLS=https://+:7074

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

COPY ["DoniranjeOrgana.Subscriber/DoniranjeOrgana.Subscriber.csproj", "DoniranjeOrgana.Subscriber/"]
RUN dotnet restore "DoniranjeOrgana.Subscriber/DoniranjeOrgana.Subscriber.csproj"

COPY . .
WORKDIR "/src/DoniranjeOrgana.Subscriber"
RUN dotnet build "DoniranjeOrgana.Subscriber.csproj" -c Release -o /app/build


FROM build AS publish
RUN dotnet publish "DoniranjeOrgana.Subscriber.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "DoniranjeOrgana.Subscriber.dll"]