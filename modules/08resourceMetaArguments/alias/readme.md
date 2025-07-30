
Basic syntax
```sh
provider "aws" {
  region = local.AWS_REGION
  profile = "user-s3" #ec2 access
  alias = "onlys3"
}
```

to reference this any resource block

```sh
resource "aws_s3_bucket" "test" {
    provider = aws.onlys3
    bucket = "ejfneofkeo"
}
```

this works if you have only one module, if you are working with submodules this doesntt work

tf by default will send provider with no alias

if you give alias and want to use that aliased provier in submodule you need to define provider block in module(PASSING IT TO OTHER MODULE)

By doing this we are overwriting tf default inhertiance, so we need to redefine ```providers list``` in the subclass tf

```sh
module "metaArgumeents" {
  source = "./modules/08resourceMetaArguments/alias"
  # map the module’s “aws” provider to your root’s aliased one
  providers = {
    aws.onlys3=aws.onlys3 #maps submodule provider named "onlys3" with root module onlys3 alias
  }
}

```

in ```submodule``` main.tf

```sh
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
      configuration_aliases = [aws.onlys3] #telling submodule touse provider with aluas onlys3
    }
  }
}

resource "aws_s3_bucket" "test" {
    provider = aws.onlys3
    bucket = "ejfneofkeo"
}
```

it may look like submodule is using default aws, but it was overwritten by ``` aws=aws.onlys3``` this piece of code in ```root``` main.tf 

