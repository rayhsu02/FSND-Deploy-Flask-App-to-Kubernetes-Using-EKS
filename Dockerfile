# Use the python:stretch image as a source image
FROM python:stretch

# Set up an app directory for your code
COPY . /app

WORKDIR /app



# Install pip and needed Python packages from requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Define an entrypoint which will run the main app using the Gunicorn WSGI server. The Gunicorn should run with the arguments as follows: ["gunicorn", "-b", ":8080", "main:APP"].
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]