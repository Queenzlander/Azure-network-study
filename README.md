This repos contains a series of Terraform deploys created to help me learn Azure networking (in preperation for the AZ-700 exam). In this approach I am hoping prove a personal thesis that best way to learn cloud networking (or anything public cloud really...) is to work with it through API and not clicky click in the GUI.

Each folder in this repo will be a seperate deploy (its own Terraform init and state). These deploys are designed to be operated from Azure CloudShell so authentication will be via CloudShell, and as I dont intend to keep anything longer than the CloudShell session Terraform state will be kept local.

The Terraform code will be placed in seperate functional files with descriptive names so I can duplicate them between folders (deploys) i.e. I can copy the files from 01 Basic Network Setup and use the copies in 02 Basic Load balancer.

Log of deploys:
1- 01 Basic Network Setup - a RG, VNET and couple of Subnets
2- 02 Basic Load Balancer - Basic 01 network plus a load balancer

