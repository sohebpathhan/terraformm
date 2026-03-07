# EC2 Instance with Custom Security Group

## What's Going On Here?

This folder is my playground for practicing two things: creating an EC2 instance with a custom security group AND showing how to use the output block properly. It's a nice little example of how to expose useful information after Terraform creates your infrastructure.

## What You'll Create

- An EC2 instance running on AWS
- A custom security group with rules configured the way you want
- Some nice outputs that show you important details (like the public IP, instance ID, etc.)

## The Good Stuff

This is great for learning because it combines a few concepts:
- Security group rules (what traffic gets allowed)
- EC2 instance creation
- Terraform outputs (how to get values back out after creation)

Perfect for understanding how these pieces fit together!

## How to Get It Running

1. Set up your AWS credentials first
2. Navigate into this folder
3. Check if any variables need tweaking for your setup
4. Run `terraform init`
5. Run `terraform plan` to see everything that'll be created
6. Run `terraform apply` when ready

## Files

- **main.tf** - EC2 instance and security group config
- **outputs.tf** - Where the useful outputs are defined
- **provider.tf** - AWS provider configuration

## What Gets Output

After it runs, you'll see some helpful info like:
- The instance's public IP (so you can SSH in)
- The instance ID
- Security group ID
- Other useful details

This is why the `outputs.tf` file is cool - it pulls out the good stuff automatically!

## Cleaning Up

```
terraform destroy
```

Pretty easy. Just make sure you're not destroying something you still need!

## Tips

- Adjust the security group rules to only allow what you actually need
- The instance type can be changed if you want something bigger or smaller
- Play around with the outputs - add more if you need different information!
