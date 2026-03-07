# Terraform AWS Infrastructure Repository

This repository contains Terraform configurations for provisioning various AWS resources. Each folder contains independent modules for different infrastructure components.

## Repository Structure

### Root-Level Files
- **provider.tf** - Global AWS provider configuration
- **var.tf** - Global variables definition

### Modules

#### 1. `create vpc/`
Creates a Virtual Private Cloud (VPC) in AWS with networking infrastructure.
- **Files**: `main.tf`
- **Purpose**: Set up VPC and associated networking resources

#### 2. `create_eksclusture_aws_tf/`
Sets up an Amazon EKS (Elastic Kubernetes Service) cluster.
- **Files**: `main.tf`, `provider.tf`
- **Purpose**: Provision EKS cluster for container orchestration

#### 3. `create_instance_using_custo_sg+output_block_use/`
Creates an EC2 instance with custom security groups and demonstrates output block usage.
- **Files**: `main.tf`, `outputs.tf`, `provider.tf`
- **Purpose**: Deploy EC2 instance with custom security group rules and expose important values via outputs

#### 4. `instance_using_terr/`
Creates an EC2 instance using Terraform with variable configuration.
- **Files**: `main.tf`, `provider.tf`, `var.tf`
- **Purpose**: Deploy EC2 instance with customizable parameters

#### 5. `remote_backend_and_state_file_locking/`
Demonstrates remote state management and state file locking best practices.
- **Files**: `main.tf`
- **Purpose**: Show how to configure remote backend (e.g., S3) and enable state locking for team collaboration

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v0.12 or later recommended)
- AWS Account with appropriate IAM permissions
- AWS CLI configured with credentials
- Access to AWS services (VPC, EC2, EKS, etc.)

## Getting Started

1. Clone or navigate to the repository
2. Navigate to the desired module directory
3. Update variables and configuration as needed
4. Initialize Terraform:
   ```
   terraform init
   ```
5. Plan the deployment:
   ```
   terraform plan
   ```
6. Apply the configuration:
   ```
   terraform apply
   ```

## Usage Notes

- Each module can be used independently
- Ensure AWS credentials are configured before running `terraform apply`
- Review `terraform plan` output carefully before applying changes
- For production use, configure remote state management (see `remote_backend_and_state_file_locking/` module)
- Modify variables in respective `var.tf` files to customize resources

## Best Practices

- Always run `terraform plan` before `terraform apply`
- Keep state files secure and use remote backends for team environments
- Use meaningful variable names and add descriptions in `var.tf`
- Implement proper security group rules (deny by default, allow specific traffic)
- Tag resources appropriately for cost tracking and organization

## Cleanup

To remove provisioned resources:
```
terraform destroy
```

**Warning**: This will delete all resources managed by Terraform in that module.

## Support

For questions or issues with Terraform visit:
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
