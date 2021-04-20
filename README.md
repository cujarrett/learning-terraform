![logo](./media/readme-logo.jpg)

## What is it?

This project holds my study notes studying for [HashiCorp Certified: Terraform Associate](https://www.hashicorp.com/certification/terraform-associate).
It's also a small set of hacks to learn common use cases with [Hashicorp](https://www.hashicorp.com/)
's [Terraform](https://www.terraform.io/) :building_construction: :cloud:.

### Completed Examples
- [AWS EC2](./ec2/)
- [AWS RDS](./rds/)
- [AWS VPC](./vpc/)
- [AWS CloudFront with S3 origin](./cloudfront-with-s3-origin/)

## What is Terraform?

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.

Configuration files describe to Terraform the components needed to run a single application or your entire datacenter. Terraform generates an execution plan describing what it will do to reach the desired state, and then executes it to build the described infrastructure. As the configuration changes, Terraform is able to determine what changed and create incremental execution plans which can be applied.

The infrastructure Terraform can manage includes low-level components such as compute instances, storage, and networking, as well as high-level components such as DNS entries, SaaS features, etc.

## Infrastructure as Code (IaC)
Infrastructure is described using a high-level configuration syntax. This allows a blueprint of your datacenter to be versioned and treated as you would any other code. Additionally, infrastructure can be shared and re-used.

### Configuration Management vs Infrastructure Orchestration

Ansible, Chef, Puppet are configuration management tools which means that
they are primarily designed to install and manage software on existing
servers.

Terraform, CloudFormation are the infrastructure orchestration tools
which basically means they can provision the servers and infrastructure
by themselves.

### Attributes

Terraform has capability to output the attribute of a resource with the output values.

Example:

```sh
ec2_public_ip     = 35.161.21.197
bucket_identifier = terraform-test-kplabs.s3.amazonaws.com
```

An outputed attribute can not only be used for the users reference but it can also act as input to other resources being created via terraform.

### Output

## Things I like
- Ease of not only spinning up resources but also I really like how easy it is to spin down resources even if they are complex. This solves the [main gripe I had with AWS while studying for the Certified Solutions Architect – Associate](https://github.com/cujarrett/learning-aws/blob/master/aws-certified-solutions-architect%E2%80%93associate/index.md#things-i-dont-like)
- "Cloud Agnostic" meaning it can be used to spin up resources in AWS, GCP, Azure, etc. The Terraform files would need updated to account for each public cloud namings but the overall structure should be feasible to remain.
- Can be used to set up on prem infrastructure as well
- Ability to make targeted changes such as destroying a portion of your deployed infra. Example: `terrafrom destroy -target aws_instance.myec2`.

## Things I'm not a huge fan of
- Not super quick... I know, I know, this stuff used to take day/weeks/months but I'm inpatient. That said, it's still way quicker than me trying to spin up resources without Terraform with something like AWS CLI. The slowness isn't on Terraform though I don't think. The 2-5 mins it takes to spin up an RDS is inherent to the architecture of RDS.
- Centralized state file when local makes me nervous about not being able to quickly spin down those resources if is accidentally deleted.
- Gathering allowed values and keys from AWS and Hashicorp docs feels like it could use a slick CLI or plugin to solve the manual run around.
- Hashicorp's docs don't currently show all mandated fields grouped on top of the docs for each resource.
- I've not seen a way to roll back or automate rolling back from a bad Terraform apply.
