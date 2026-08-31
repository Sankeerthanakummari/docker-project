# Base image: Ubuntu with Python installed
FROM ubuntu:22.04

# Set working directory
WORKDIR /app

# Copy requirements and project files
COPY requirements.txt /app/
COPY devops /app/

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Install dependencies globally (no need for venv inside Docker)
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose Django port
EXPOSE 8000

# Run Django server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

