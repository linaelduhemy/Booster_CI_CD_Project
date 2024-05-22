# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files to the container
COPY . .

# Set environment variables
ENV DJANGO_SETTINGS_MODULE=simpleApp.settings

# Expose the port the app runs on
EXPOSE 8000

# Run database migrations
RUN python manage.py makemigrations && python manage.py migrate

# Run the Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
