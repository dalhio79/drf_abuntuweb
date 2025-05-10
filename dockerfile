FROM python:3.10-slim

# Instala herramientas necesarias
RUN apt-get update && apt-get install -y openssh-client

# Evita que Python haga buffering de logs
ENV PYTHONUNBUFFERED=1

# Establece directorio de trabajo
WORKDIR /app

# Copia primero las dependencias
COPY requirements.txt /app/requirements.txt

# Instala dependencias de Python
RUN pip install -r requirements.txt



# Copia el código fuente
COPY . /app

# Agrega /app al PYTHONPATH para que se pueda importar `backend`
ENV PYTHONPATH=/app


# Expone puerto 8000
EXPOSE 8000

# Comando por defecto para ejecutar el servidor Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
