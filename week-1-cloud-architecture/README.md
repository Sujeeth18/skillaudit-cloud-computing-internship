# Shop Sync — Cloud Architecture

## Overview

Shop Sync is a grocery management system designed to manage shopkeepers, retailers, products, orders, and inventory. This Week 1 task focuses on designing how the application can be deployed using a scalable three-tier cloud architecture.

## Architecture

The architecture is divided into three main tiers:

1. Presentation Tier
2. Application Tier
3. Data Tier

### 1. Presentation Tier

The presentation tier contains the client web browser used by Shop Sync users.

Users access the application through a web browser. Requests from the client are sent to the load balancer in the application tier.

### 2. Application Tier

The application tier contains a load balancer and multiple application server instances.

**Load Balancer**

The load balancer receives incoming user requests and distributes traffic between the available application servers. This prevents a single server from handling all requests and improves application availability.

**Application Servers**

Two application server instances are used:

- App Server 1 — Next.js + React + API Routes
- App Server 2 — Next.js + React + API Routes

The application servers process user requests and communicate with the data services.

**Horizontal Scaling**

The application tier supports horizontal scaling. When the number of users or incoming requests increases, additional application server instances can be added behind the load balancer.

This allows the system to handle increased traffic without depending on a single application server.

### 3. Data Tier

The data tier contains Redis Cache, MySQL Database, and Object Storage.

**Redis Cache**

Redis is used as an in-memory cache for frequently accessed data.

Caching reduces repeated database queries and provides faster access to commonly requested information. This can improve application response time and reduce the workload on the MySQL database.

**MySQL Database**

MySQL is the primary relational database for Shop Sync.

It stores structured application data such as:

- Users
- Products
- Orders
- Inventory
- Shop Sync business data

The application servers communicate with MySQL when persistent data needs to be created, updated, or retrieved.

**Object Storage**

Object storage is used for files such as product images and uploaded files.

Keeping large files separate from the relational database helps keep the database focused on structured application data while providing dedicated storage for files.

## Request Flow

The basic request flow is:

```text
User
  ↓
Web Browser
  ↓
Load Balancer
  ↓
Application Servers
  ↓
Redis Cache / MySQL Database / Object Storage