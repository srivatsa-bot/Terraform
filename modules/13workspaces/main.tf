# suppose you have prod and dev env, you want ot test first in dev and then in prod, insted of making two sepreate tf modules you specify which workspace you are using

#terraform.workspace will print the current workspace
resource "aws_s3_bucket" "buk" {
  bucket = "test-${terraform.workspace}" 
}

output "buk_name" {
  value = aws_s3_bucket.buk.bucket
}

# command	                        Description
# terraform workspace list	        Shows all existing workspaces
# terraform workspace show	        Displays the current active workspace
# terraform workspace new <name>  	Creates a new workspace
# terraform workspace select <name>	Switches to an existing workspace
# terraform workspace delete <name>	Deletes a workspace