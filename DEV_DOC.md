# Developer Documentation

## Prerequisites & Setup
1. **Host Configuration:** Ensure your host machine resolves `moel-hai.42.fr` to `127.0.0.1` (usually by editing `/etc/hosts`).
2. **Secrets & Environment:** Create a `.env` file in the `srcs` directory defining your variables (e.g., domain name, database users). Configure your local secrets files to feed credentials into the containers securely.

## Building and Launching
The infrastructure is orchestrated via Docker Compose and controlled by a Makefile at the root.
*   `make`: Builds the images and starts the containers in detached mode.
*   `make build`: Forces a rebuild of the Docker images.
*   `make logs`: Displays the output logs of all running containers.

## Container & Volume Management
*   **Check network:** `docker network ls` (Ensure the custom inception network exists).
*   **Check volumes:** `docker volume ls`
*   **Inspect a volume:** `docker volume inspect <volume_name>` to verify the mount points.

## Data Persistence
The project uses two Docker named volumes to ensure data survives container deletion:
1.  **Database Volume:** Stores MariaDB data. Configured to persist on the host at `/home/moel-hai/data/mariadb`.
2.  **WordPress Volume:** Stores core WordPress files and user uploads. Configured to persist on the host at `/home/moel-hai/data/wordpress`.