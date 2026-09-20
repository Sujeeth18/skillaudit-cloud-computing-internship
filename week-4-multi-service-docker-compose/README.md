# Week 4 – Multi-Service Stack with Docker Compose

## Objective

Deploy the Shop Sync Grocery Management System as a multi-service application using Docker Compose.

The application consists of:

- Shop Sync application container
- MySQL database container
- Docker Compose network
- Persistent MySQL volume

## Technologies Used

- Docker
- Docker Compose
- Node.js
- Next.js
- MySQL 8.0
- SQL

## Architecture

```text
                ┌─────────────────────────┐
                │     Shop Sync App       │
                │      Next.js / Node     │
                │                         │
                │    Docker Container     │
                │       Port 3000         │
                └────────────┬────────────┘
                             │
                    Docker Network
                             │
                ┌────────────▼────────────┐
                │        MySQL 8.0        │
                │                         │
                │    Docker Container     │
                │       Port 3306         │
                └─────────────────────────┘