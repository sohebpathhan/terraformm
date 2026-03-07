# VPC Setup

## What's This About?

This is my go-to template for spinning up a VPC on AWS. Nothing crazy here, just the networking foundation you need to start deploying stuff into AWS. I use this whenever I want a clean slate with a VPC that's ready to go.

## What You Get

When you run this, you'll get a basic VPC set up with all the essentials. It's a good starting point before you build out the rest of your infrastructure.

## How to Use It

1. Make sure your AWS credentials are set up
2. Jump into this folder
3. Check the variables if you want to customize anything (subnet ranges, VPC CIDR, etc.)
4. Run `terraform init` to download the provider
5. Run `terraform plan` to see what's going to be created
6. If it looks good, `terraform apply`

## Files

- **main.tf** - All the VPC config lives here

That's it!

## Going Nuclear

Ready to delete it?
```
terraform destroy
```

Pretty straightforward stuff. Good starting point for learning Terraform or quick prototyping!
