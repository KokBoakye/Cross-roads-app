# Crossy-Road Static Site Deployment with Terraform & CI/CD

This project provisions AWS infrastructure using Terraform and deploys a static Crossy-Road style game to an S3 bucket via GitHub Actions CI/CD.

## 📁 Project Structure

.
├── README.md
├── dist # Final build files to be deployed to S3
│ ├── index.html
│ ├── script.js
│ └── style.css
├── src # Source files for the game
│ ├── index.html
│ ├── script.js
│ └── style.css
└── terraform # Infrastructure-as-Code using Terraform
├── backend.tf # Backend configuration to store state in S3
├── main.tf # Main resource definitions (S3 buckets, policies)
├── variables.tf # Input variables
├── terraform.tfstate # Terraform state file (auto-managed)
└── terraform.tfstate.backup

## 🚀 Features

- Static website hosted on AWS S3
- CI/CD pipeline using GitHub Actions to auto-deploy on push to `main`
- Terraform-managed infrastructure
- Remote state storage in a dedicated S3 backend bucket for state locking and collaboration

## 🧰 Technologies Used

- AWS S3
- Terraform
- GitHub Actions
- HTML, CSS, JavaScript (Vanilla)

## 🛠️ Setup

### 1. Provision Infrastructure

Update any variables if needed and run:

```bash
cd terraform
terraform init     # Initializes and configures the remote backend
terraform apply    # Provisions resources
Make sure the backend S3 bucket (terraform-backend-crossy-road) already exists if you're using it for state storage.
2. Deploy with GitHub Actions
Push to the main branch to trigger the deployment workflow. The GitHub Actions workflow syncs the ./dist folder to your S3 bucket.
3. View Site
After deployment, access the website via the S3 bucket's static website endpoint (output by Terraform).
🔐 Security
Public access to the website bucket is enabled via bucket policy.
Terraform state is securely stored in a separate private S3 bucket.