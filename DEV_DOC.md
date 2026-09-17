# Developer Documentation

## Prerequisites & Setup
1. **Host Configuration:** Ensure your host machine resolves `moel-hai.42.fr` to `127.0.0.1` (usually by editing `/etc/hosts`).
2. **Environment Variables:** Create a `.env` file in the `srcs` directory defining all your configuration variables and credentials (e.g., domain name, database users, passwords). Ensure this file is ignored by Git to prevent leaking sensitive credentials.

## Building and Launching
The infrastructure is orchestrated via Docker Compose and controlled by a Makefile at the root.
*   `make`: Builds the images and starts the containers in detached mode.

## Container & Volume Management
*   **Check network:** `docker network ls` (Ensure the custom inception network exists).
*   **Check volumes:** `docker volume ls`
*   **Inspect a volume:** `docker volume inspect <volume_name>` to verify the mount points.

## Data Persistence
The project uses two Docker named volumes to ensure data survives container deletion:
1.  **Database Volume:** Stores MariaDB data. Configured to persist on the host at `/home/moel-hai/data/mariadb`.
2.  **WordPress Volume:** Stores core WordPress files and user uploads. Configured to persist on the host at `/home/moel-hai/data/wordpress`.