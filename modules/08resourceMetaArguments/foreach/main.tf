# this is somewhat similar to count in  cunt you give number, here ypu will give key value pair(maps) 
# this unlocks each function it wil have two functions 
# each.keys = gives list of keys
# each.values = gives lis of values
# To define a map we will use values?(useful in outputs) 


#we can use for each as list(but underneath its a map) amd maps dont supoort [*]
# in this case only each.key is valid
#also we need to have unique values we convert this into toset()
# resource "aws_s3_bucket" "example" {
#     for_each = toset(["efefefefasd","fjonfuewoifwoi"])
#     # bucket = "my-tf-test-bucket-38225-${count.index}"
#     bucket = each.key
# }


# now in the convention of map
#unlocks each.value iterate through every object and get its value to rerun the resource block
resource "aws_s3_bucket" "example" {
    for_each = {
        buk1="efefwfwfwf",
        buk2="eiwoifweflknk"
    }
    # bucket = "my-tf-test-bucket-38225-${count.index}"
    bucket = each.value
}

#values functions extracts all the list into map, then on the list you dont need to use [*]
# output "val08" {
#     value = values(aws_s3_bucket.example).bucket_regional_domain_name
# }

# the above one works but if you try to put the expression into string it doesnt work
#tf doesnt allow to ocnvert direct list objects ot string so we need to use join() or we can use [for expression :]

# output "val08" {
#     value = [for b in values(aws_s3_bucket.example) : "s3://${b.bucket}"]
# }

# or 

#this synatx is weird
output "val08" {
    value = "s3://${join(", s3://", values(aws_s3_bucket.example)[*].bucket)}"
}

#joins two calues in list using , S3://
#example join("-",["efef","efef"]) ---> efe-eff
