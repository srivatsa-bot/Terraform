terraform cloud is used to maintain the state of the ```teeraform.tfstate``` file in multi meployee workspaces

in tf you can create multiple workspaces and share them

to show the no of workspaces
```sh
terraform workspace list
```
so the main difference between executing teerafom in local machine and cloud machine, in local cloud service api request is send directly from local machine, but in cloud case you will upload .```.tfsatte``` file to cloud(like github), tf will run this in its own servers and send the http to cloud providers.

by doing this even if your local state file is deleetd/old it will be updated with the recent one

Firdt login 
```sh
terraform login
```

add this to main.tf
```sh
terraform { 
  cloud { 
    
    organization = "get it form website" 

    workspaces { 
      name = "" 
    } 
  } 
}
```
then do this to link with the cloud
```sh
terraform init
```

note befor doing apply, note that the code is run in tff cloud, so you need to give credit of clous provider api as env varibles in ``tf cloud gui``.

Then perform ```tf apply``` it will update the state file to cloud. 