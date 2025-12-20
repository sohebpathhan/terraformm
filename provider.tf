provider "aws" {
  region = "ca-central-1"
}


# allow for all ipv4 traffic
resource "aws_security_group" "allow_ssh" {
  name        = "defsg2"
  description = "Allow SSH inbound traffic"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


# crete home template
resource "aws_launch_template" "home_template" {
  name_prefix   = "home-template-"
  image_id      = var.image_id# Amazon Linux 2 AMI
  instance_type = "t3.micro"
  key_name      = "micro_central"

 
  vpc_security_group_ids = [ aws_security_group.allow_ssh ]

  user_data = base64encode( <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Welcome to my home page.shoheb</h1>" > /var/www/html/index.html
              EOF
              )
}

# crete teplate for mobile
resource "aws_launch_template" "mobile_template" {
  name_prefix   = "mobile-template-"
  image_id      = var.image_id # Amazon Linux 2 AMI
  instance_type = "t3.micro"
  key_name      = "micro_central"

  vpc_security_group_ids = [ aws_security_group.allow_ssh ]

  user_data = base64encode( <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Welcome to my mobile page.shoheb</h1>" > /var/www/html/index.html
              EOF
              )
} 

# crete template for laptop
resource "aws_launch_template" "laptop_template" {
  name_prefix   = "laptop-template-"
  image_id      = var.image_id # Amazon Linux 2 AMI
  instance_type = "t3.micro"
  key_name      = "micro_central"

  vpc_security_group_ids = [ aws_security_group.allow_ssh ]

  user_data = base64encode( <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Welcome to my laptop page.shoheb</h1>" > /var/www/html/index.html
              EOF
              )
}
# create auto scaling group for home
resource "aws_autoscaling_group" "home_asg" {
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  launch_template {
    id      = aws_launch_template.home_template.id
    version = "$Latest"
  }
    vpc_zone_identifier  = [
      var.subnet_id-1,
       var.subnet_id-2
       ]
    tag {
        key                 = "Name"
        value               = "home-asg-instance"
        propagate_at_launch = true
        }
}

# create autoscaling policy for home
resource "aws_autoscaling_policy" "home_scale_up" {
  name                   = "home-scale-up-policy"
  autoscaling_group_name = aws_autoscaling_group.home_asg.name
  policy_type = "PredictiveScaling"   
    predictive_scaling_configuration {
  metric_specification {
    target_value = 50

    predefined_load_metric_specification {
      predefined_metric_type = "ASGTotalCPUUtilization"
    }
  }
}

    }




# create auto scaling group for mobile
resource "aws_autoscaling_group" "mobile_asg" {
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  launch_template {
    id      = aws_launch_template.mobile_template.id
    version = "$Latest"
  }
    vpc_zone_identifier  = [
      var.subnet_id-1, 
      var.subnet_id-2
      ]
    tag {
        key                 = "Name"
        value               = "mobile-asg-instance"
        propagate_at_launch = true
        }
     }

# create autoscaling policy for mobile
resource "aws_autoscaling_policy" "mobile_scale_up" {   
  name                   = "mobile-scale-up-policy"
  autoscaling_group_name = aws_autoscaling_group.mobile_asg.name
  policy_type = "PredictiveScaling"   
   predictive_scaling_configuration {
  metric_specification {
    target_value = 50

    predefined_load_metric_specification {
      predefined_metric_type = "ASGTotalCPUUtilization"
    }
  }
}
 
   }    

    

# create auto scaling group for laptop
resource "aws_autoscaling_group" "laptop_asg" {
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  launch_template {
    id      = aws_launch_template.laptop_template.id
    version = "$Latest"
  }
    vpc_zone_identifier  = [
      var.subnet_id-1, 
      var.subnet_id-2
      ]
    tag {
        key                 = "Name"
        value               = "laptop-asg-instance"
        propagate_at_launch = true
        }
     }      

# create autoscaling policy for laptop
resource "aws_autoscaling_policy" "laptop_scale_up" {   
  name                   = "laptop-scale-up-policy"
  autoscaling_group_name = aws_autoscaling_group.laptop_asg.name
  policy_type = "PredictiveScaling"
   predictive_scaling_configuration {
  metric_specification {
    target_value = 50

    predefined_load_metric_specification {
      predefined_metric_type = "ASGTotalCPUUtilization"
    }
  }
}

        }