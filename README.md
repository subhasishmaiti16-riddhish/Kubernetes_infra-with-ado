# 🚀 Automated Azure Kubernetes Infrastructure with Terraform & Azure DevOps CI/CD | Application Gateway + Ingress Routing

## 📌 Project Overview

This project demonstrates the end-to-end automation of Azure Kubernetes infrastructure using **Terraform, Azure DevOps Pipelines, Git, and Azure Application Gateway Ingress**.

The goal is to implement an Infrastructure as Code (IaC) workflow where infrastructure changes are managed through Git, automatically validated through CI/CD pipelines, reviewed via Pull Requests, and applied to Azure through a controlled deployment process.

The pipeline automatically triggers when code is pushed to the `feature/*` or `main` branches.

## 🎯 Project Objectives

- Automate Azure infrastructure provisioning using Terraform.
- Implement CI/CD using Azure DevOps YAML pipelines.
- Trigger Terraform Plan automatically on feature branches.
- Use Pull Requests for code review and approval before merging into `main`.
- Restrict Terraform Apply to the `main` branch.
- Deploy Kubernetes infrastructure with ingress and Application Gateway integration.
- Store Terraform state remotely in Azure Storage.

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| Microsoft Azure | Cloud infrastructure |
| Terraform | Infrastructure as Code |
| Azure DevOps Pipelines | CI/CD automation |
| Azure Kubernetes Service (AKS) | Managed Kubernetes cluster |
| Azure Application Gateway | Application traffic routing |
| Ingress integration | Routing external traffic to Kubernetes applications |
| Azure Storage | Remote Terraform state backend |
| Git | Source code management |
| Pull Requests | Code review and approval workflow |

## 🏗️ Architecture Overview

```text
              Developer
                  |
                  v
          Git Repository
                  |
          +-------+-------+
          |               |
          v               v
      feature/*           main
          |               |
          v               |
   Azure DevOps Pipeline  |
          |               |
          v               |
    Terraform Init        |
          |               |
          v               |
    Terraform Plan        |
          |               |
          v               |
      Create PR ----------+
          |
          v
    Review & Approval
          |
          v
      Merge to main
          |
          v
    Terraform Apply
          |
          v
   Microsoft Azure
          |
          v
    Azure Kubernetes
       Service
          |
          v
  Application Gateway
    + Ingress Routing
```

*Note: The diagram represents the intended workflow. Pull Request approval is enforced through repository branch policies, while the YAML pipeline restricts Apply to `main`.*

## ⚙️ CI/CD Workflow

### 1. Git-Based Infrastructure Management

Terraform code is maintained in a Git repository.

- Create a feature branch for infrastructure changes.
- Update the Terraform configuration.
- Commit and push the changes to Git.

### 2. Automatic Pipeline Trigger

The Azure DevOps pipeline triggers automatically for pushes to:

- `main`
- `feature/*`

### 3. Terraform Initialization

The pipeline installs Terraform and executes `terraform init`.

This step initializes the working directory, downloads the required providers and modules, and configures the Azure Storage remote backend.

### 4. Terraform Plan

The pipeline executes `terraform plan` to preview infrastructure changes before deployment.

This helps identify proposed resource creations, modifications, and deletions before applying changes.

### 5. Pull Request Review

After validating the changes, a Pull Request is created from the feature branch to `main`.

Reviewers can inspect the Terraform changes and approve the PR before it is merged.

### 6. Controlled Terraform Apply

After the approved changes are merged into `main`, the pipeline's Apply stage can run.

The pipeline uses this condition:

```yaml
condition: and(
  succeeded(),
  eq(variables['Build.SourceBranch'], 'refs/heads/main')
)
```

This ensures the Apply stage runs only when the required previous stages succeed and the source branch is `main`.

**Important:** Configure branch policies and required reviewers in Azure DevOps to enforce PR approval.

## 🗄️ Terraform Remote State

The project uses the AzureRM backend to store Terraform state in Azure Storage.

| Setting | Value |
|---|---|
| Resource Group | `state-file-rg` |
| Storage Account | `statefileaccountfork8s` |
| Container | `statefilestorage` |
| State Key | `preprod.statefilestorage` |

Remote state allows Terraform runs to use a shared state file and supports state locking during operations.

## 📂 Repository Structure

Example structure — adjust the paths to match your actual repository:

```text
.
├── parent/
│   ├── provider.tf
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
├── aks/
│   ├── resource-group/
│   ├── virtual-network/
│   ├── subnet/
│   ├── application-gateway/
│   ├── aks-cluster/
│   └── appgw-access/
└── azure-pipelines.yml
```

The root Terraform configuration calls reusable modules to organize Azure infrastructure resources.

## 🔐 Security Best Practices

- Store credentials and secrets securely; never commit them to Git.
- Use an Azure DevOps service connection with least-privilege permissions.
- Protect the `main` branch with Pull Request policies.
- Review Terraform Plan output before deployment.
- Restrict access to the Terraform state storage account.
- Use security scanners such as Checkov, Trivy, and TFLint where appropriate.
- Carefully review destructive Terraform changes before applying them.

## ✅ Expected Outcome

- Automated Terraform initialization and planning.
- Git-based infrastructure change management.
- Pull Request review before changes reach `main`.
- Apply stage restricted to the main branch.
- Repeatable and version-controlled Azure infrastructure deployment.
- Kubernetes infrastructure with Application Gateway and ingress integration, according to the deployed Terraform configuration.

## 📚 Key Learnings

- Infrastructure as Code with Terraform.
- Azure DevOps YAML pipeline configuration.
- Remote Terraform state management.
- Git branching and Pull Request workflows.
- Controlled infrastructure deployment.
- AKS networking and ingress architecture.
- Cloud infrastructure automation and DevOps practices.

## 🚀 Future Enhancements

- Add Terraform `fmt` and `validate` checks.
- Integrate Checkov, Trivy, TFLint, and Gitleaks.
- Publish and apply a reviewed Terraform plan artifact.
- Add a dedicated manual approval stage before Apply.
- Add deployment notifications and post-deployment validation.

## 👨‍💻 Project Summary

This project demonstrates how Terraform and Azure DevOps can be combined to build a Git-driven infrastructure automation workflow for Azure Kubernetes environments, with Pull Request governance and controlled deployment to the main branch.

### Tags

`#Azure` `#Terraform` `#AzureDevOps` `#AKS` `#Kubernetes` `#DevOps` `#CI_CD` `#InfrastructureAsCode` `#ApplicationGateway`
