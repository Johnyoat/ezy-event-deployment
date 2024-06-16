# Event Management Application

A Docker-based three-tier application for managing events, similar to Eventbrite. The application features an Angular front-end, a Golang backend, and a MongoDB-based microservice for location indexing and queries. Integrated monitoring is provided by Linkerd and Prometheus.

### [Demo Link](http://3.79.105.211)

![screenshot](https://res.cloudinary.com/plartfomx/image/upload/v1717611740/zagtyuep1qc8cmr0ytgc.png)

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
  <!-- - [Monitoring](#monitoring) -->
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
<!-- - Integrated monitoring with Linkerd and Prometheus. -->

## Architecture

The application is divided into three main components:

1. **[Front-end](https://github.com/saltcodes/ezyevent-web)**: An Angular application that displays event data to the users.
2. **[Backend API](https://github.com/saltcodes/ezyevent-api)**: A Golang application that handles postgres CRUD operations on events and users.
3. **[GeoSpacial API](https://github.com/saltcodes/ezyevent-location-api)**: A service for communicating with the backend API via gRPC, using MongoDB for location indexing and queries.

<img src="https://res.cloudinary.com/plartfomx/image/upload/v1717612408/xyrhty5j0tpndvrpzcor.png" alt="Architecture Diagram" height="350" width="80%">

## Prerequisites

Ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [MongoDB Atlass](https://www.mongodb.com/try/download/atlascli)
- [pgAdmin](https://www.pgadmin.org/download/)

## Getting Started

### Installation

Clone the repository:

```bash
git clone https://github.com/Johnyoat/ezy-event-deployment.git
cd ezy-event-deployment
```

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

There's no password for mongodb but there's a password for postgres which is `qigfot-4Sobja-wixjut` and username `postgres`. Both databases can be connected with their respective clients from the deployed host.


 ### MongoDB Configuration

1. Initial Databse `ezyevents` is created from the deployment and import the [sample data](ezyevents.events-location.json) `event-location-data` into `ezyevents-location` collection.

3. A 2DSphere index is created for the collection. You can read more [here](https://www.mongodb.com/docs/manual/core/indexes/index-types/geospatial/2dsphere/)


### Postgres Database

The deployment creates a database called `ezyevent` and load  [sample data](ezyevent.sql) `ezyevent.sql` into it.

### Front-end 

It's still a work in progress but you can clone it from here
```bash
git clone https://github.com/Johnyoat/ezy-event-deployment
```

Vist the [repo](https://github.com/Johnyoat/ezy-event-deployment) for more instructions

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
      POSTGRES_DB: ezyevents
      POSTGRES_PASSWORD: qigfot-4Sobja-wixjut
      PGDATA: /var/lib/postgressql/data
    volumes:
      - ./postgres:/var/lib/postgressql/data
      - ./ezyevent.sql:/docker-entrypoint-initdb.d/ezyevent.sql
    restart: always
    networks:
      - ezy-network
  mongodb:
    image: mongo
    environment:
      MONGO_INITDB_DATABASE: ezyevents
    ports:
      - "27017:27017"
    volumes:
      - ./mongo:/data/db
      - ./event-location-data.js:/docker-entrypoint-initdb.d/event-location-data.js:ro
    restart: always
    networks:
      - ezy-network

  ezy-event-api:
    image: johnyoat/ezyevent-api:1.1
    ports:
      - "8080:8080"
    links:
      - postgres-database
    networks:
      - ezy-network
    depends_on:
      - postgres-database
    restart: on-failure:20
  ezy-event-location-api:
    image: johnyoat/ezyevent-location-api:1.1
    ports:
      - "8081:8081"
    links:
      - "ezy-event-api"
    networks:
      - ezy-network 
    depends_on:
      - ezy-event-api
    restart: always
  ezy-event-web-app:
    image: johnyoat/ezyevent-web:1.2
    ports:
      - "80:80"
    networks:
      - ezy-network
    depends_on:
      - ezy-event-api  
networks:
  ezy-network:
    driver: bridge 
```

#### `postgres-database`
- **Image**: `postgres:alpine`
  - Uses the lightweight Alpine-based PostgreSQL image.
- **Ports**: `5432:5432`
  - Maps port 5432 on the host to port 5432 in the container.
- **Environment Variables**:
  - `POSTGRES_DB`: `ezyevents`
  - `POSTGRES_PASSWORD`: `qigfot-4Sobja-wixjut`
  - `PGDATA`: `/var/lib/postgressql/data`
- **Volumes**:
  - `./postgres:/var/lib/postgressql/data`
  - `./ezyevent.sql:/docker-entrypoint-initdb.d/ezyevent.sql`
- **Restart Policy**: `always`
  - Always restarts the container if it stops.
- **Network**: `ezy-network`

#### `mongodb`
- **Image**: `mongo`
  - Uses the official MongoDB image.
- **Environment Variable**:
  - `MONGO_INITDB_DATABASE`: `ezyevents`
- **Ports**: `27017:27017`
  - Maps port 27017 on the host to port 27017 in the container.
- **Volumes**:
  - `./mongo:/data/db`
  - `./event-location-data.js:/docker-entrypoint-initdb.d/event-location-data.js:ro`
- **Restart Policy**: `always`
  - Always restarts the container if it stops.
- **Network**: `ezy-network`

#### `ezy-event-api`
- **Image**: `johnyoat/ezyevent-api:1.1`
  - Custom image for the EzyEvent API.
- **Ports**: `8080:8080`
  - Maps port 8080 on the host to port 8080 in the container.
- **Links**: `postgres-database`
  - Links to the PostgreSQL database service.
- **Network**: `ezy-network`
- **Depends On**: `postgres-database`
  - Ensures the database starts before this service.
- **Restart Policy**: `on-failure:20`
  - Restarts up to 20 times on failure.

#### `ezy-event-location-api`
- **Image**: `johnyoat/ezyevent-location-api:1.1`
  - Custom image for the EzyEvent Location API.
- **Ports**: `8081:8081`
  - Maps port 8081 on the host to port 8081 in the container.
- **Links**: `ezy-event-api`
  - Links to the EzyEvent API service.
- **Network**: `ezy-network`
- **Depends On**: `ezy-event-api`
  - Ensures the EzyEvent API starts before this service.
- **Restart Policy**: `always`
  - Always restarts the container if it stops.

#### `ezy-event-web-app`
- **Image**: `johnyoat/ezyevent-web:1.2`
  - Custom image for the EzyEvent web application.
- **Ports**: `80:80`
  - Maps port 80 on the host to port 80 in the container.
- **Network**: `ezy-network`
- **Depends On**: `ezy-event-api`
  - Ensures the EzyEvent API starts before this service.

### Network

#### `ezy-network`
- **Driver**: `bridge`
  - Creates an isolated network for the services.

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
