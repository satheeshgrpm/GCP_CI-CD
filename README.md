
# CreativeAI Enterprise - Ready to Deploy

## Includes
- Terraform: VPC, IAM, VMs (DEV/QA/PROD), GKE, Artifact Registry
- Backend (Node.js) + Docker (multi-brand)
- Kubernetes manifests (dev/qa/prod)
- GitHub Actions CI/CD (build, push, promote)
- Cloud Build
- Artifact lifecycle (30 days)
- Rollback & promotion scripts

## Quick Start
1. Update project_id in terraform/variables.tf
2. terraform init && terraform apply
3. gcloud container clusters get-credentials creativeai-cluster --region asia-south1
4. Push to dev branch to trigger CI/CD
