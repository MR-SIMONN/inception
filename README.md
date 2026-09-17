*This project has been created as part of the 42 curriculum by moel-hai.*

## Description
Inception is a system administration project that deploys a containerized web infrastructure using Docker Compose. The architecture relies on independent containers for Nginx, MariaDB, and WordPress running PHP-FPM, all built from custom Debian 11 (Bullseye) base images. 

### Technical Choices & Comparisons
*   **Virtual Machines vs Docker:** A VM virtualizes the physical hardware to run a full, heavy guest OS. Docker virtualizes only the OS kernel, allowing lightweight containers to share the host's kernel while remaining isolated.
*   **Secrets vs Environment Variables:** Environment variables are standard for configuration but can be exposed in process trees or application logs. Docker Secrets securely mount sensitive data directly into the container's temporary memory (`tmpfs`), keeping it hidden from the environment.
*   **Docker Network vs Host Network:** The host network attaches containers directly to the VM's network interfaces, which can cause port conflicts. A custom Docker network creates an isolated internal LAN, allowing Nginx, PHP-FPM, and MariaDB to communicate securely using their container names without exposing internal ports.
*   **Docker Volumes vs Bind Mounts:** A bind mount maps a specific host path to a container, depending on the host's directory structure. A named volume is an isolated storage unit managed entirely by Docker, ensuring data (like the database and WordPress files) safely persists across container deletions.

## Instructions
1. Clone the repository and navigate to the `srcs` directory.
2. Ensure your `.env` file and secrets are properly configured.
3. Run `make` at the root of the repository to build and start the infrastructure.
4. Access the site via `https://moel-hai.42.fr`.

## Resources
*   [Docker Documentation](https://docs.docker.com/)
*   [Nginx Configuration Guide](https://nginx.org/en/docs/)
*   **AI Usage:** AI was used as a thought partner to understand core DevOps concepts (like FastCGI routing and Docker networking), to debug container exit codes, and to refine the structure of this documentation. No code was copy-pasted without full comprehension.