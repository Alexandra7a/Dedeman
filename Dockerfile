# Use Microsoft's official .NET SDK image from the Docker Hub
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the entire project structure to the working directory
COPY . ./ 

# Restore the project dependencies
RUN dotnet restore Dedeman.sln

# Build the project
RUN dotnet build Dedeman.sln -c Release -o /app/build

# Final stage - runtime environment
FROM mcr.microsoft.com/dotnet/runtime:6.0 AS runtime

# Set the working directory
WORKDIR /app

# Copy the build artifacts from the build container
COPY --from=build /app/build ./

# Set up the entry point for the application
ENTRYPOINT ["dotnet", "Dedeman.exe"]

# Expose any ports if required (e.g., for remote debugging or logging)
# EXPOSE <port_number>

# Use a non-root user if security is a concern (can be added if required)