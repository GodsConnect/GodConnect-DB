# Use official Microsoft SQL Server image
FROM mcr.microsoft.com/mssql/server:2022-latest

# Set environment variables
ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=godconnect
ENV MSSQL_PID=Express

# Switch to root user to fix permissions
USER root

# Create and set permissions on the data directory
RUN mkdir -p /var/opt/mssql && chmod -R 777 /var/opt/mssql

# Expose SQL Server port
EXPOSE 1433

# Run SQL Server
CMD ["/opt/mssql/bin/sqlservr"]
