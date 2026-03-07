# Basic EC2 Instance

## The Simplest Thing

This is probably the most straightforward example in the repo - just a basic EC2 instance. Perfect if you're new to Terraform or just need a simple instance without all the fancy stuff.

## What You Get

One EC2 instance running on AWS. That's it. Clean and simple.

## When to Use This

- Learning Terraform basics
- Quick prototyping
- Just need a single machine to play with
- Don't need a custom security group or complex setup

## How to Use It

1. Make sure your AWS credentials are configured
2. Come into this folder
3. Look at `var.tf` if you want to change the instance type, AMI, or anything else
4. Run `terraform init`
5. Run `terraform plan`
6. Run `terraform apply`

## Files

- **main.tf** - The EC2 instance configuration
- **provider.tf** - AWS provider setup
- **var.tf** - Variables you can customize

## Customize It

The `var.tf` file has variables for stuff like:
- Instance type (t2.micro, t2.small, etc.)
- What AMI to use
- Any other thing you might want to change

Just edit those variables before running `terraform apply`!

## Done and Dusted

```
terraform destroy
```

Boom, instance is gone.

That's honestly all there is to it. This is a great stepping stone before moving on to more complex infrastructure!
