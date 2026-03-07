# EKS Cluster Setup

## What's This?

This is my EKS (Elastic Kubernetes Service) setup. If you want to run containerized apps on Kubernetes but don't want to manage the control plane yourself, EKS is your friend. This folder has the Terraform config to get a cluster spun up on AWS.

## What You'll Get

You'll end up with a full EKS cluster ready to deploy pods to. It handles all the nitty-gritty details of setting up the control plane so you can focus on your applications.

## Fair Warning

EKS can get complicated pretty quick. This is a starter template, but you might need to tweak stuff depending on your needs (networking, IAM roles, node groups, etc.). I'm still learning this part myself, so if something doesn't work, check the AWS docs!

## Getting Started

1. Make sure your AWS credentials are good
2. Come into this folder
3. Poke around `main.tf` to see what's being configured
4. Run `terraform init`
5. Run `terraform plan` to preview what's happening
6. When you're ready: `terraform apply`

## Files

- **main.tf** - The EKS cluster configuration
- **provider.tf** - AWS provider setup specific to this folder

## Tearing It Down

```
terraform destroy
```

Keep in mind, destroying an EKS cluster can take a bit of time. Don't panic if it seems to hang for a minute or two!

## Next Steps (After It's Running)

Once you've got the cluster up, you'll probably want to:
- Configure kubectl to talk to your cluster
- Set up node groups (worker nodes)
- Deploy some actual workloads

Check out the AWS and Kubernetes docs if you need help with those parts!
