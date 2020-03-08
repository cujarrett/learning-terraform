![logo](./media/readme-logo.jpg)

## What is it?
It's a small set of hacks to learn [Hashicorp](https://www.hashicorp.com/)'s [Terraform](https://www.terraform.io/) :building_construction: :cloud:. I'm using `Terraform v0.12.19` for this adventure.

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.

Configuration files describe to Terraform the components needed to run a single application or your entire datacenter. Terraform generates an execution plan describing what it will do to reach the desired state, and then executes it to build the described infrastructure. As the configuration changes, Terraform is able to determine what changed and create incremental execution plans which can be applied.

The infrastructure Terraform can manage includes low-level components such as compute instances, storage, and networking, as well as high-level components such as DNS entries, SaaS features, etc.

### Infrastructure as Code
Infrastructure is described using a high-level configuration syntax. This allows a blueprint of your datacenter to be versioned and treated as you would any other code. Additionally, infrastructure can be shared and re-used.

## Things I like
- Ease of not only spinning up resources but also I really like how easy it is to spin down resources even if they are complex. This solves the [main gripe I had with AWS while studying for the Certified Solutions Architect – Associate](https://github.com/cujarrett/learning-aws/blob/master/aws-certified-solutions-architect%E2%80%93associate/index.md#things-i-dont-like)
- "Cloud Agnostic" meaning it can be used to spin up resources in AWS, GCP, Azure, etc. The Terraform files would need updated to account for each public cloud namings but the overall structure should be feasible to remain.
- Can be used to set up on prem infrastructure as well

## Things I'm not a huge fan of
- Not super quick... I know, I know, this stuff used to take day/weeks/months but I'm inpatient. That said, it's still way quicker than me trying to spin up resources without Terraform with something like AWS CLI. The slowness isn't on Terraform though I don't think. The 2-5 mins it takes to spin up an RDS is inherent to the architecture of RDS.
- Centralized state file when local makes me nervous about not being able to quickly spin down those resources if is accidentally deleted.
- Gathering allowed values and keys from AWS and Hashicorp docs feels like it could use a slick CLI or plugin to solve the manual run around.
- Hashicorp's docs don't currently show all mandated fields grouped on top of the docs for each resource.
- I've not seen a way to roll back or automate rolling back from a bad Terraform apply.

## Completed Examples
- [AWS EC2](./ec2/)
- [AWS RDS](./rds/)
- [AWS VPC](./vpc/)
- [AWS CloudFront with S3 origin](./cloudfront-with-s3-origin/)

## Take Aways
#### Terraform CLI
- **init** - Initialize a Terraform working directory
- **plan** - Generate and show an execution plan - Shows deltas from what is deployed vs the new configs
- **apply** - Builds or changes infrastructure
- **destroy** - Destroy Terraform-managed infrastructure outlined in the state file
- **show** - Inspect Terraform state or plan

#### `provider.tf`
Houses info and auth for your public cloud of choice. Obviously this shouldn't be made public.
```
provider "aws" {
  access_key = "REDACTED"
  secret_key = "REDACTED"
  region = "us-east-1"
}
```

#### `main.tf`
Used to build resources such as this simple VPC or you can make it as complex as you want. A common practice is to use [Modules](#Modules) and separate the architecture into separate folders and files for more structure and reusability.
```
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}
```

- `aws_vpc` is the type of resource.
- `my_vpc` is the name is used to refer to this resource from elsewhere in the same Terraform module, but has no significance outside of the scope of a module.

#### State
Terraform must store state about your managed infrastructure and configuration. This state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.

This state is stored by default in a local file named "terraform.tfstate", but it can also be stored remotely, which works better in a team environment.

Terraform uses this local state to create plans and make changes to your infrastructure. Prior to any operation, Terraform does a refresh to update the state with the real infrastructure.

#### Input Variables
Input variables serve as parameters for a Terraform module, allowing aspects of the module to be customized without altering the module's own source code, and allowing modules to be shared between different configurations.

When you declare variables in the root module of your configuration, you can set their values using CLI options and environment variables. When you declare them in child modules, the calling module should pass values in the module block.

`default` sets a default value for a variable.

String example
```
variable "my_string" {
  type = string
  default = "My String"
}
```

#### Output Values
Output values are like the return values of a Terraform module, and have several uses:

- A child module can use outputs to expose a subset of its resource attributes to a parent module.
- A root module can use outputs to print certain values in the CLI output after running terraform apply.
- When using remote state, root module outputs can be accessed by other configurations via a terraform_remote_state data source.

Resource instances managed by Terraform each export attributes whose values can be used elsewhere in configuration. Output values are a way to expose some of that information to the user of your module.

Outputs are only rendered when Terraform applies your plan. Running terraform plan will not render outputs.

Example creating an AWS VPC and grabbing the ID of the VPC created
```
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
```

```sh
terraform apply
...
Outputs:

vpcId = "vpc-abcdefg1234567890"
```

Output can be marked as sensitive with the `sensitive` argument. Sensitive output values are still recorded in the state, and so will be visible to anyone who is able to access the state data.
```
output "db_password" {
  value       = aws_db_instance.db.password
  description = "The password for logging in to the database."
  sensitive   = true
}
```

#### Modules
A module is a container for multiple resources that are used together.

Every Terraform configuration has at least one module, known as its root module, which consists of the resources defined in the .tf files in the main working directory.

A module can call other modules, which lets you include the child module's resources into the configuration in a concise way. Modules can also be called multiple times, either within the same configuration or in separate configurations, allowing resource configurations to be packaged and re-used.

Modules can be local or remote.
