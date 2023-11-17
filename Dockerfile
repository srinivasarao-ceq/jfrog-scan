# FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
# WORKDIR /app
# COPY . /app
# RUN dotnet restore
# RUN dotnet publish -c Release -o out


# FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
# WORKDIR /app
# COPY --from=build /app/out ./
# ENTRYPOINT ["dotnet", "test-project.dll"]

FROM amazonlinux
WORKDIR /app
RUN yum install dotnet -y
COPY . .
ENTRYPOINT ["dotnet", "run"]