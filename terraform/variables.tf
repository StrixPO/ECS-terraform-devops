variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "devops-assignment"
}

variable "frontend_image" {
  description = "ECR image for frontend"
  type        = string
}

variable "backend_image" {
  description = "ECR image for backend"
  type        = string
}
