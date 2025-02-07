FROM python:3.8.3-slim

# Create a working directory
WORKDIR /analytics

# Copy source code to working directory
COPY app.py /analytics
COPY requirements.txt /analytics
COPY config.py /analytics


# Install packages from requirements.txt
RUN apt update -y
RUN apt install -y build-essential libpq-dev
RUN pip install --upgrade pip 
RUN pip install --upgrade Flask
RUN pip install werkzeug==2.2.2
RUN pip install -r requirements.txt

# Set ENV variables
# ENV DB_USERNAME=myuser
# ENV DB_PASSWORD=${POSTGRES_PASSWORD}
# ENV DB_HOST=127.0.0.1
# ENV DB_PORT=5433
# ENV DB_NAME=mydatabase

# Expose port 80
EXPOSE 80

# Run app.py at container launch
CMD ["python", "app.py", "config.py"]
