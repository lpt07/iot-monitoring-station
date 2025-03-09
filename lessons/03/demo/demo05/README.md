# Flask Application with Docker

This project demonstrates how to containerize a simple Flask application using Docker. The application will run a basic web server and display "Hello, World!" when accessed via `http://localhost:5000`.

## Project Structure

The project has the following structure:

```
demo05/
  |-- app/             (Flask application code)
      |-- server.py    (Flask application)
  |-- Dockerfile       (Dockerfile for creating the Docker image)
  |-- requirements.txt (Python dependencies)
```

### 1. **Dockerfile**

The `Dockerfile` is used to define the environment and instructions for building the Docker image that will run your Flask app. Below is a breakdown of the instructions in the `Dockerfile`:

FROM python:3.9-slim
- **`FROM python:3.9-slim`**: This specifies the base image for the Docker container. We're using a lightweight version of Python 3.9 to keep the container size small.

WORKDIR /app
- **`WORKDIR /app`**: This sets the working directory inside the container to `/app`. All subsequent commands will be run from this directory. It is the place where the Flask app code will reside.

COPY requirements.txt /app/
- **`COPY requirements.txt /app/`**: This copies the `requirements.txt` file from your local machine to the `/app` directory inside the Docker container.

RUN pip install --no-cache-dir -r requirements.txt
- **`RUN pip install --no-cache-dir -r requirements.txt`**: This command installs the Python dependencies defined in `requirements.txt` using `pip`. The `--no-cache-dir` option prevents the cache from being stored, keeping the image size smaller.

COPY app/ /app/
- **`COPY app/ /app/`**: This copies the contents of the `app` directory from your local machine into the `/app` directory inside the container. This includes the Flask application (`server.py`), as well as any additional files or directories you may have in the `app` folder.

EXPOSE 5000
- **`EXPOSE 5000`**: This instruction tells Docker that the container will listen on port `5000`. However, this is just for documentation purposes inside Docker and does not expose the port to the host machine. Port mapping needs to be done using the `-p` option when running the container.

CMD ["python", "server.py"]
- **`CMD ["python", "server.py"]`**: This specifies the command to run when the container starts. In this case, it runs the Flask application using Python (`python server.py`).

### 2. **requirements.txt**

The `requirements.txt` file contains the list of Python packages that need to be installed for the Flask application to run properly.

Flask==2.2.2
- **`Flask==2.2.2`**: This specifies that we need to install Flask version 2.2.2. Flask is the web framework used to create the web server in this project.
- **`werkzeug==2.2.2`**: This specifies that we need to install Werkzeug version 2.2.2. Werkzeug is a utility library that Flask depends on for various functionalities such as URL handling, session management, and HTTP utilities.

### 3. **Flask App (`server.py`)**

The `server.py` file contains the Python code for the Flask web application. It includes a route that handles the root URL (`/`) and returns a simple "Hello, World!" message.

```python
from flask import Flask

# Create an instance of the Flask class to represent the application
app = Flask(__name__)

# Define a route for the root URL ("/")
@app.route('/')
def hello_world():
    # This function returns a simple string when the root URL is accessed
    return "Hello, World from Flask!"

# Check if the script is being run directly (not imported as a module)
if __name__ == "__main__":
    # Run the app on all available network interfaces (0.0.0.0) at port 5000
    app.run(host="0.0.0.0", port=5000)
```

## Building and Running the Docker Container

### Step 1: Build the Docker Image

Run the following command in the root directory of the project (where the Dockerfile is located):

```bash
docker build -t flask-app .
```

### Step 2: Run the Docker 

Once the image is built, you can run the container with the following command:

```bash
docker run -p 5000:5000 flask-app
```

This will start the Flask application inside the Docker container, and you should be able to access the application at http://localhost:5000.