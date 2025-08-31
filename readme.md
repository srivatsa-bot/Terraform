https://www.credly.com/badges/897529b9-b04b-48e2-9a1d-d23cf8a1ed0e/public_url

Passed

----


#iac starts at planning and designing pase of sdlc

#Terraform is idempotent we will always get the expected state, main diff between terraform anad ansoble.
if we update config file our old resoyces will be there and new infra is created(non-idempotent)
in terrafoem old inaf is modified if not modified then its is destroyed and created again

#COnfiguration drift is the when provisoined infra has unexpected config change dude to multiple reasons
#terra has state foles to avoid this accedental configuration drift

#immutable infra once deployed not modified only deleted 
#mutable infra once deployed changes can be made with  Config management tools like ansible.cloud-inint(user metatdat aws)

#gitops -  git will review the pull request(pr) at prod branch

#uimmutable infra is poosibel by packer, required packages are backed into vityual machine images before being depoly giving us perfectly immutable infra

#hashicorp is agnoist (not one cloud depended), used for cross cloud workloads

#terra config files are written in hcl(hashicorp lang) similar to json

#the underlying software for terrafrom cloud and entirprise is terraform  platform


#terrafoem providers vs modules vs procisioners

providers : Plugins that let Terraform interact with APIs of cloud platforms or services (like AWS, Azure, GCP).

Modules: Reusable containers of Terraform configuration—like functions in programming.

Provisioners : Mechanisms to run scripts or commands on local or remote machines during resource creation or destruction. like cloud in
