# My Terraform AWS Playground

Hey! This is my collection of Terraform scripts for setting up various AWS resources. I've been building these out to learn Terraform better and to have reusable templates for common infrastructure patterns. Feel free to use any of these as starting points for your own projects.

## What's in Here?

I've organized everything into separate folders, each one handling a specific piece of AWS infrastructure. This way, you can pick and choose what you need without having to deal with irrelevant code.

### At the Root Level
- **provider.tf** - This just sets up my AWS provider config
- **var.tf** - Where I keep my common variables

### The Actual Stuff

**create vpc/** - Got a VPC I'm playing with here. It sets up the networking foundation if you want to spin up a VPC with all the basics.

**create_eksclusture_aws_tf/** - This is my EKS cluster setup. If you want to run Kubernetes on AWS, this is the folder. Still working through some of the configurations though!

**create_instance_using_custo_sg+output_block_use/** - This one's got an EC2 instance with a custom security group, and I'm using it to practice the output block. Shows how to get useful info out of your infrastructure after it's deployed.

**instance_using_terr/** - Pretty straightforward EC2 instance setup. Good starter template if you just need a basic instance with configurable variables.

**remote_backend_and_state_file_locking/** - This folder shows how I'm handling remote state files and locking. Super important if you're working with a team to avoid stepping on each other's toes.

## Before You Start

Make sure you've got:
- Terraform installed on your machine ([grab the latest here](https://www.terraform.io/downloads.html))
- An AWS account with the right permissions to create resources
- AWS CLI set up and configured with your credentials
- Access to the services you're trying to spin up (EC2, VPC, EKS, etc.)

## How to Use This

1. Navigate into whichever folder has what you want
2. If there's a `var.tf`, take a look at it and customize the values for your use case
3. Run `terraform init` to set things up
4. Run `terraform plan` to see what will be created (always do this first!)
5. If it looks good, run `terraform apply`

That's it! Terraform will do the heavy lifting.

## A Few Things I've Learned

- Don't skip `terraform plan` - it saves you from surprises
- Each folder works independently, so use them however you want
- Make sure your AWS credentials are set before applying anything
- The remote backend setup is really helpful if you're sharing infrastructure code with others
- Good variable names and descriptions make your future self very happy
- Security groups can be tricky - start restrictive and only open up what you need

## Tearing It Down

When you're done playing around:
```
terraform destroy
```

Just be aware this will delete **everything** that Terraform created. Make sure you're comfortable with that before running it!

## Need Help?

- [Terraform docs](https://www.terraform.io/docs/index.html) - Pretty good docs honestly
- [AWS provider for Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) - Has examples for pretty much everything
