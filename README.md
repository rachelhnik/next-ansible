# Devops CICD project deployment guide

![Logo](https://lucid.app/publicSegments/view/0cd79e1f-0475-421d-a38e-b059472fe5e0/image.png)

## Tech Stack

This project leverages the following technologies for CI/CD and deployment:

- GitHub Actions – Automated workflows for continuous integration and deployment

- Docker – Containerization of the application

- Docker Hub – Hosting and managing container images

- Nginx – Reverse proxy for handling web traffic

- Ansible – Configuration management and automation

- AWS EC2 – Cloud infrastructure for hosting the application

## Deployment Prcess

1. Generate SSH Key Pair

To enable secure authentication, generate an SSH key pair:

```bash
 ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

```

- Copy the private key and add it to GitHub Secrets as SSH_PRIVATE_KEY.

- Copy the public key and add it to the server known_host file.

2. Configure Required Secrets and Variables

### GitHub Secrets

| Secret Name          | Description                                                       |
| -------------------- | ----------------------------------------------------------------- |
| `SSH_PRIVATE_KEY`    | Private SSH key for authenticating GitHub Actions with the server |
| `DOCKERHUB_USERNAME` | Docker Hub username for pushing images                            |
| `DOCKERHUB_TOKEN`    | Docker Hub access token for authentication                        |

### GitHub Variables

| Name           | Description                              |
| -------------- | ---------------------------------------- |
| `SSH_HOST`     | EC2 server IP address                    |
| `SSH_USERNAME` | SSH username (e.g., `ubuntu`)            |
| `DOMAIN_NAME`  | Domain name for deployment               |
| `IMAGE_NAME`   | Docker image name                        |
| `ENABLE_SSL`   | Set to `true` to enable SSL with Certbot |

## Workflow Automation (CI/CD)

This project follows an automated deployment workflow using GitHub Actions, Docker, and Ansible.

1. Build Stage

On every push to the main branch, GitHub Actions triggers the build workflow.

The application is containerized using Docker.

The built image is pushed to Docker Hub.

2. Deployment Stage

Ansible automates the configuration management process.

It installs necessary dependencies such as Docker, Nginx, and Certbot.

Logs into Docker Hub, pulls the latest Docker image, and runs the container.

Configures Nginx as a reverse proxy.

Generates and configures an SSL certificate if ENABLE_SSL is set to true.

3. Successful Deployment

Once all stages complete successfully, the application is live and accessible via the configured domain name.

## Conclusion

This setup ensures a streamlined, automated, and secure deployment process. By leveraging GitHub Actions, Docker, and Ansible, we achieve reproducibility, scalability, and ease of maintenance across different environments.

## Contributing

Contributions are always welcome!
Please submit a pull request or open an issue for discussion.

## Contact

For any inquiries or issues, feel free to contact rachel.shwehnit@gmail.com. 🚀
