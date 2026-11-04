# AI-Powered Document Analyzer - Containerization & Kubernetes Deployment Challenge

## 📌 Project Overview

This project demonstrates the end-to-end containerization and Kubernetes orchestration of an **AI-Powered Document Analyzer Microservice**. Developed as part of the **Internal Assessment II Challenge (Cloud Native DevOps)**, it focuses on deploying a cloud-native Python application using Docker and Kubernetes.

The project includes multi-stage Docker builds, Kubernetes Deployment and NodePort Service configurations, CPU and memory resource management, readiness probes, and container health monitoring.

---

## 🛠️ Technical Stack & DevOps Tools

- **Programming Language:** Python 3.10
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Data Validation:** Pydantic
- **Containerization:** Docker Desktop
- **Orchestration:** Kubernetes
- **CLI Tool:** kubectl
- **Version Control:** Git & GitHub

---

## 📂 Project Architecture & Directory Structure

```text
doc-analyzer-app/
│
├── .dockerignore
├── Dockerfile              # Multi-stage Docker build configuration
├── deployment.yaml         # Kubernetes Deployment configuration
├── service.yaml            # Kubernetes NodePort Service configuration
├── main.py                 # FastAPI application and REST endpoints
├── requirements.txt        # Python dependencies
└── README.md               # Project documentation
```

---

## 🚀 Key Features & API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/` | Checks the application root status |
| GET | `/health` | Checks application health and readiness |
| POST | `/analyze` | Analyzes document text and returns word count and character count |
| GET | `/docs` | Provides interactive Swagger API documentation |

### Sample API Responses

**1. Root Endpoint (`GET /`)**

```json
{
  "status": "success",
  "message": "AI Document Analyzer Service Running"
}
```

**2. Health Endpoint (`GET /health`)**

```json
{
  "status": "ok"
}
```

---

## ⚙️ Execution & Deployment Guide

### Step 1: Build the Docker Image

Build the optimized Docker image using the multi-stage Dockerfile.

```bash
docker build -t doc-analyzer-app:v2 .
```

### Step 2: Run the Docker Container Locally

Run the application inside a Docker container and map port 8000.

```bash
docker run -d -p 8000:8000 --name doc-test doc-analyzer-app:v2
```

Check the container status:

```bash
docker ps
```

View container logs:

```bash
docker logs doc-test
```

Stop and remove the container:

```bash
docker stop doc-test
docker rm doc-test
```

### Step 3: Deploy the Application on Kubernetes

Apply the Kubernetes Deployment and Service configuration files.

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### Step 4: Verify Kubernetes Deployment

Check the running pods and services.

```bash
kubectl get pods,svc
```

Check the service endpoints:

```bash
kubectl get endpoints doc-analyzer-service
```

Inspect service configuration:

```bash
kubectl describe svc doc-analyzer-service
```

View application logs:

```bash
kubectl logs deployment/doc-analyzer-deployment
```

### Step 5: Access the Application

Forward local port `30080` to the Kubernetes Service port `8000`.

```bash
kubectl port-forward svc/doc-analyzer-service 30080:8000
```

Open the following URLs in your web browser:

| Application | URL |
|-------------|-----|
| Root API | http://localhost:30080 |
| Health Check | http://localhost:30080/health |
| Swagger API Documentation | http://localhost:30080/docs |

---

## ☸️ Cloud-Native DevOps Concepts Demonstrated

**1. Containerization and Isolation**
- Uses a multi-stage Docker build to optimize the container image.
- Uses `python:3.10-slim` as the lightweight base image.
- Runs the application using a dedicated non-root user (`appuser`).

**2. Declarative Infrastructure**
- Uses Kubernetes YAML manifests to define application deployment.
- Separates Deployment and Service configurations.
- Simplifies application management through `kubectl`.

**3. Health Monitoring and Readiness Probes**
- Implements a `/health` endpoint.
- Configures Kubernetes `readinessProbe`.
- Ensures traffic is directed only to healthy and ready application pods.

**4. CPU and Memory Resource Management**

The Kubernetes Deployment defines resource requests and limits.

| Resource | Requests | Limits |
|----------|----------|--------|
| CPU | 100m | 250m |
| Memory | 128Mi | 256Mi |

These configurations help control resource consumption and prevent excessive resource usage.

**5. Service Discovery and Networking**
- Uses Kubernetes NodePort Service.
- Exposes the application through port `30080`.
- Routes incoming traffic to the application running on port `8000`.
- Supports application access through Kubernetes service networking.

**6. Application Scalability and Reliability**
- Uses Kubernetes Deployment to manage application replicas.
- Supports automated pod management.
- Improves application availability through Kubernetes orchestration.

---

## 🎯 Learning Outcomes

- Understanding Docker containerization and multi-stage builds.
- Creating and managing Kubernetes Deployment manifests.
- Configuring Kubernetes Services using NodePort.
- Implementing application health checks and readiness probes.
- Managing CPU and memory requests and limits.
- Deploying and testing cloud-native microservices.
- Understanding container orchestration and service networking.

---

## 👨‍💻 Author & Academic Submission Details

- **Student Name:** Yash Dhananjay Dalavi
- **PRN:** 202301100017
- **Roll Number:** CCF54
- **Branch:** Computer Engineering – Software Engineering
- **Course:** Cloud Native DevOps
- **Assessment:** Internal Assessment II Challenge

---

## 📌 Conclusion

This project demonstrates the practical implementation of containerization and Kubernetes orchestration for a Python-based AI Document Analyzer Microservice. It provides hands-on experience with Docker image optimization, Kubernetes deployments, service networking, health monitoring, and resource management.

The project establishes a foundation for deploying scalable, reliable, and cloud-native applications using modern DevOps practices.
