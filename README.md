# Event Management Application

A Docker-based three-tier application for managing events, similar to Eventbrite. The application features an Angular front-end, a Golang backend, and a MongoDB-based microservice for location indexing and queries. Integrated monitoring is provided by Linkerd and Prometheus.

## Table of Contents

- [Event Management Application](#event-management-application)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Features](#features)
  - [Architecture](#architecture)
  - [Prerequisites](#prerequisites)
  - [Getting Started](#getting-started)
    - [Installation](#installation)
    - [Usage](#usage)
  - [Configuration](#configuration)
  - [Services](#services)
  - [Monitoring](#monitoring)
  - [Deployment](#deployment)
  - [Contributing](#contributing)
  - [License](#license)
  - [Contact](#contact)

## Introduction

This project is a Docker-based three-tier application for managing events. It uses Docker Compose for orchestration and integrates various tools for monitoring.

## Features

- Angular front-end for displaying event data.
- Golang backend for CRUD operations on events and users.
- MongoDB microservice for location indexing and queries.
- Integrated monitoring with Linkerd and Prometheus.

## Architecture

The application is divided into three main components:

1. **Front-end**: An Angular application that displays event data to the users.
2. **Backend API**: A Golang application that handles postgres CRUD operations on events and users.
3. **GeoSpacial API**: A service for communicating with the backend API via gRPC, using MongoDB for location indexing and queries.

![Architecture Diagram](path_to_architecture_diagram.png)

## Prerequisites

Ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/Johnyoat/ezy-event-deployment.git
    cd ezy-event-deployment
    ```

2. Create a `.env` file based on the provided `.env.example`:

    ```bash
    cp .env.example .env
    ```

3. Customize the `.env` file to suit your needs.

### Usage

Start the services using Docker Compose:

```bash
docker-compose up -d
```

This command will build the Docker images (if not already built) and start the services in the background.

To stop the services:

```bash
docker-compose down
```

## Configuration

Detail the configuration options available in your `.env` file or other configuration files. Include specifics about configuring the Angular app, Golang backend, and MongoDB microservice.

## Services

### Docker Compose Configuration

```yaml
version: '3.8'
services:
  postgres-database:
    image: postgres:alpine
    ports:
      - "5432:5432"
    environment:
      POSTGRES_PASSWORD: qigfot-4Sobja-wixjut
      PGDATA: /var/lib/postgressql/data
    volumes:
      - ./postgres:/var/lib/postgressql/data
    restart: always
    networks:
      ezy-network:
        ipv4_address: 192.168.92.13

  mongodb:
    image: mongo
    ports:
      - "27017:27017"
    volumes:
      - ./mongo:/data/db
    restart: always
    networks:
      ezy-network:
        ipv4_address: 192.168.92.15

  ezy-event-api:
    image: johnyoat/ezyevent-api:1.0
    ports:
      - "8080:8080"
    links:
      - postgres-database
    networks:
      ezy-network:
        ipv4_address: 192.168.92.17
    depends_on:
      - postgres-database

  ezy-event-location-api:
    image: johnyoat/ezyevent-location-api:1.0
    ports:
      - "8081:8081"
    links:
      - "ezy-event-api"
    networks:
      ezy-network:
        ipv4_address: 192.168.92.179     
    depends_on:
      - ezy-event-api

networks:
  ezy-network:
    ipam:
      driver: default
      config:
        - subnet: "192.168.92.0/24"
```

- **postgres-database**: PostgreSQL database for storing event and user data.
  - **Image**: `postgres:alpine`
  - **Ports**: `5432:5432`
  - **Environment Variables**:
    - `POSTGRES_PASSWORD`: Password for the PostgreSQL user.
    - `PGDATA`: Directory for storing database data.
  - **Volumes**: `./postgres:/var/lib/postgressql/data`
  - **Networks**: `ezy-network` (IP: `192.168.92.13`)

- **mongodb**: MongoDB service for location indexing and queries.
  - **Image**: `mongo`
  - **Ports**: `27017:27017`
  - **Volumes**: `./mongo:/data/db`
  - **Networks**: `ezy-network` (IP: `192.168.92.15`)

- **ezy-event-api**: Golang application for CRUD operations on events and users.
  - **Image**: `johnyoat/ezyevent-api:1.0`
  - **Ports**: `8080:8080`
  - **Links**: `postgres-database`
  - **Depends_on**: `postgres-database`
  - **Networks**: `ezy-network` (IP: `192.168.92.17`)

- **ezy-event-location-api**: Golang microservice for handling event locations.
  - **Image**: `johnyoat/ezyevent-location-api:1.0`
  - **Ports**: `8081:8081`
  - **Links**: `ezy-event-api`
  - **Depends_on**: `ezy-event-api`
  - **Networks**: `ezy-network` (IP: `192.168.92.179`)

## Monitoring

- **Linkerd**: Service mesh for observability and security.
- **Prometheus**: Monitoring and alerting toolkit.

## Deployment

Simply use Docker Compose to manage the deployment locally or in a Docker Swarm.

```bash
docker-compose up -d
```

## Contributing

Contributions are welcome! Please read the [contributing guidelines](CONTRIBUTING.md) for more information.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries or feedback, please contact:

- Osei Yeboah Johnson - [oseiyeboahjohnson@gmail.com](mailto:oseiyeboahjohnson@gmail.com)
- Project Link: [https://github.com/Johnyoat/ezy-event-deployment](https://github.com/Johnyoat/ezy-event-deployment)
