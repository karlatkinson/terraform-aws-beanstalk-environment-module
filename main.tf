resource "aws_elastic_beanstalk_environment" "beanstalk_environment" {
  name = "${var.app_name}-${var.app_environment}"
  application = "${var.app_name}"
  solution_stack_name = "64bit Windows Server 2012 R2 running IIS 8.5"
  cname_prefix = "${var.app_name}-${var.app_environment}"
  tags = "${merge(map("Provisioner", "Terraform"),var.extra_tags)}"  

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "VPCId"
    value = "vpc-f0fc7899"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "AssociatePublicIpAddress"
    value = "false"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = "subnet-f38142be,subnet-764ee50d"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "ELBSubnets"
    value = "subnet-1e8a2165,subnet-59418114"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "ELBScheme"
    value = "${var.elb_scehme}"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "${var.instance_type}"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "EC2KeyName"
    value = "${var.ec2_key}"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name = "Availability Zones"
    value = "Any 2"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name = "MinSize"
    value = "${var.asg_min_instances}"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name = "MaxSize"
    value = "${var.asg_max_instances}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "ServiceRole"
    value = "aws-elasticbeanstalk-service-role"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "EnvironmentType"
    value = "LoadBalanced"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "environment"
    value = "${var.app_environment}"
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name = "RollingUpdateEnabled"
    value = "true"
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name = "RollingUpdateType"
    value = "Health"
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name = "MinInstancesInService"
    value = "1"
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name = "MaxBatchSize"
    value = "1"
  }
  setting {
    namespace = "aws:elb:loadbalancer"
    name = "CrossZone"
    value = "true"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSizeType"
    value = "Fixed"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSize"
    value = "1"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "DeploymentPolicy"
    value = "Rolling"
  }
  setting {
    namespace = "aws:elb:policies"
    name = "ConnectionDrainingEnabled"
    value = "true"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "SecurityGroups"
    value = "sg-9efc8ef7,sg-75afd21c"
  }
  setting {
    namespace = "aws:elb:healthcheck"
    name = "HealthyThreshold"
    value = "2"
  }
  setting {
    namespace = "aws:elb:healthcheck"
    name = "Interval"
    value = "10"
  }
  setting {
    namespace = "aws:elb:healthcheck"
    name = "Target"
    value = "HTTP:80/api/values"
  }
  setting {
    namespace = "aws:elb:healthcheck"
    name = "Timeout"
    value = "5"
  }
  setting {
    namespace = "aws:elb:healthcheck"
    name = "UnhealthyThreshold"
    value = "3"
  }

  lifecycle {
    create_before_destroy = true
  }  
}