# Todo App

This is a simple Todo application built with Python, Flask, MySQL, and HTML/CSS/JavaScript. The application allows you to add, update, and delete todo items.

## Project Structure

The project is divided into three main parts:

- `frontend`: This directory contains the HTML, CSS, and JavaScript files for the frontend of the application.
- `backend`: This directory contains the Python and Flask files for the backend of the application.
- `db`: This directory contains the SQL scripts for setting up the database.

## Prerequisites

- Docker
- Docker Compose

## Setup

1. Clone the repository to your local machine.

2. Navigate to the project directory.

3. Run the following command to start the application:

```bash
docker-compose up --build
```

This command will start three Docker containers:

- `frontend`: This container runs the frontend of the application. It uses the Nginx server to serve the static HTML, CSS, and JavaScript files.

- `backend`: This container runs the backend of the application. It uses the Flask framework to handle HTTP requests and responses.

- `db`: This container runs the MySQL database for the application.

The `docker-compose.yaml` file in the project root directory defines the configuration for these containers.

## Usage

Once the application is running, you can access it at `http://localhost:8081`.

You can add a new todo item by typing the text of the todo in the input field and clicking the "Add" button.

You can update a todo item by clicking the "Update" button next to the todo. This will open a prompt where you can enter the new text for the todo. You will also be asked whether the todo is done.

You can delete a todo item by clicking the "Delete" button next to the todo.

## Development

The application is set up for development using Docker volumes. This means that changes you make to the files on your local machine will be reflected inside the Docker containers.

For example, if you make a change to a file in the `frontend` directory, the change will be reflected in the `frontend` Docker container. Similarly, if you make a change to a file in the `backend` directory, the change will be reflected in the `backend` Docker container.

## Contributing

Contributions are welcome. Please open an issue or submit a pull request if you have something to contribute.

## License

This project is licensed under the MIT Licence.
