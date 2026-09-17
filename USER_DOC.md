# User Documentation

## Provided Services
This stack provides a fully functional, secure WordPress website. It runs behind an Nginx web server (handling HTTPS traffic) and stores its data in a MariaDB database.

## Managing the Stack
*   **Start the project:** Run `make` or `make up` at the root of the repository.
*   **Stop the project:** Run `make down`.
*   **Clean the project:** Run `make clean` or `make fclean` to remove containers, networks, and images.

## Accessing the Website
*   **Main Website:** Open your browser and go to `https://moel-hai.42.fr`.
*   **Administration Panel:** Go to `https://moel-hai.42.fr/wp-admin` and log in with your administrator account. Note: The site is only accessible via port 443 (HTTPS); port 80 (HTTP) is disabled.

## Managing Credentials
All sensitive credentials (database passwords, admin user details) are managed via local `.env` files and Docker secrets located in the `srcs` directory. Do not expose these files publicly.

## Basic Checks
To ensure services are running correctly:
1. Open a terminal and run `docker ps`. You should see three containers running (`nginx`, `wordpress`, `mariadb`).
2. Verify the website loads successfully in your browser without showing the WordPress installation page.