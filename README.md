elastic beanstalk terraform module
===========

A terraform module to create/update a beanstalk environment in AWS.


Module Input Variables
----------------------

- `app_name` - application name*
- `app_environment` - application environment*
- `instance_type` - ec2 instance type e.g t2.medium. Default value: t2.micro
- `asg_min_instances` - min number of ec2 auto scaling instances. Default value: 1
- `asg_max_instances` - max number of ec2 auto scaling instances. Default value: 2
- `elb_scheme` - aws elb scheme type, supported values: private, public. Default value: private
- `ec2_key` - private encrypted file to access ec2 instances via RDP or SSH*
- `extra_tags` - dictionary of tags that will be added to resources created by the module e.g {Foo = "Bar"}

It's generally preferable to keep `vpc`, `subnets`, `ELBsubnets` immutable.

Versioning
-----
Mosule versioning can be achived using tags and releases, everytime a change is made on master branch 
it is recommended to draft a new release and tag the release using convention v1.0.0. 
The terraform scripts using the module need to updated with the correct revision to consume the changes.

Usage
-----

```
module "beanstalk-web-app" {
  source = "github.com/carloan4u/terraform-aws-beanstalk-environment-module?ref=v1.0.1"
  app_name = "application-name"
  app_environment = "qa"
  asg_min_instances = 1
  asg_max_instances = 2
}
```



**NOTE**: The CNAME is simply `application_name`-`environment_name`.`region.elasticbeanstalk.com`.

Authors
=======

Originally created and maintained by [Zuto IO Team]
