
# DevOps Assignment – Fullstack CI/CD on AWS

This project demonstrates a full DevOps pipeline for a two-tier web application with:

- 🐍 **FastAPI backend**
- ⚛️ **Next.js frontend**
- 🐳 Dockerized containers
- 🚀 GitHub Actions CI/CD
- ☁️ AWS ECS (Fargate) deployment via Terraform
- 📈 CloudWatch monitoring & alerts
- 🔐 Secrets Manager integration
- 🧱 ALB-based load balancing

---

## 🔧 Tech Stack

| Layer        | Tool                          |
|--------------|-------------------------------|
| Frontend     | Next.js                       |
| Backend      | FastAPI                       |
| CI/CD        | GitHub Actions                |
| Container    | Docker                        |
| IaC          | Terraform                     |
| Platform     | AWS ECS + Fargate + ALB       |
| Monitoring   | AWS CloudWatch                |
| Security     | IAM, Secrets Manager          |

---

## 📁 Folder Structure


```
 ├── backend/ # FastAPI app
 ├── frontend/ # Next.js frontend
 ├── terraform/ # Terraform IaC files
 ├── .github/workflows/ # CI/CD YAMLs
 ├── README.md
 └── docker-compose.yml
```


---

## 🚀 How to Run Locally

```bash
docker-compose up --build
```
```
Frontend: http://localhost:3000
```
```
Backend: http://localhost:8000
```


CI/CD Workflow
On Push to develop:
  - Run backend tests (pytest)
  - Run frontend tests (Jest/Cypress)
  - Build and push Docker images to AWS ECR

On Merge to main:
  - Triggered deployment via Terraform
  - Infrastructure via Terraform
  - Provisioned:
    - VPC, subnets, IGW
    - ECS cluster + services (Fargate)
    - ALB routing
    - IAM roles
    - Secrets Manager
    - CloudWatch dashboard + alarm

To deploy:
```bash
CopyEdit
cd terraform/
terraform init
terraform apply -var-file="terraform.tfvars"
```

### Monitoring
  - CPU + Memory metrics via CloudWatch
  - Alarm if CPU > 70% for backend ECS service

### Secrets & IAM
  - Secrets stored in AWS Secrets Manager
  - Retrieved securely at runtime
  - ECS tasks use least-privilege IAM roles
