# terraform_aws_output

Content of this repo is guideline on HOW to use a terraform output variable from the state file
We are going to use AWS EC2 instance creation in this example.

**Note that all this is tested on Ubuntu OS**

## Repo content
- `main.tf` - Terraform configuration file

## Requierments
- You need to have Terraform tool installed
- You need to have functional AWS Account
Please follow the instructions below in order to run this project.

## Instructions HOW to install **Terraform**
- Download required package from [here](https://www.terraform.io/downloads.html)
- Change to directory where package is download. For example: `cd $HOME/Downloads/` 
- Type on your terminal: `unzip <Downloaded_TF_Package>`
- Type on your terminal: `sudo mv terraform /usr/local/bin/`
- Check whether Terraform is available with:  `terraform --version` command

## Instructions HOW to make **AWS Account** functional
- If you do not have AWS account click [here](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/) in order to create one.
- Set [MFA](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#multi-factor-authentication)
- Set [Access Key ID and Secret Access Key ](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys)
- Set [Key Pair](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#key-pairs)

## Instructions HOW to prepare your PC environment for this **Terraform project**
- Download the repo **berchev/terraform_aws_output**: `git clone https://github.com/berchev/terraform_aws_output.git`
- Change to terraform_aws_output: `cd terraform_aws_output`
- Create a file which ends on **.env**: `vi your_name.env`
- Populate this file with the following sensitive information:
  - Press `i` for insert mode
  - Enter the information below:
    ```
    export AWS_ACCESS_KEY_ID=<your_access_key_id>
    export AWS_SECRET_ACCESS_KEY=<your_aws_secret_key>
    export AWS_DEFAULT_REGION=<your_region>
    ```
   - Press `ESC` button
   - Type `:wq` in order to exit and save the file
- Type in your terminal `. your_name.env` or `source your_name.env`, in this way changes will take effect   
- Edit `main.tf` according to your needs:
  - Choose `ami` from your region. Note that the `ami` specified in the main.tf file could not be available in your region
  - Replace `key_name` value with name of your **key pair**

- Type in your terminal `terraform init` in order to be downloaded required providers
- Type in your terminal `terraform plan` in order to see the changes which terraform is going to be made
- Type in your terminal `terraform apply` execute changes bases on our code(main.tf)

## Expected results
After successful execution of `terraform apply` command we will have output similar to this one:
  ```
  Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

  Outputs:

  group_name = security_group
  instance_1_state = running
  instance_2_state = running
  instance_ip1 = 52.12.100.193
  instance_ip2 = 34.208.223.42
  server1 = terraform_server0
  server2 = terraform_server1
  server_id1 = i-00ba02e531e745989
  server_id2 = i-006d3c79677ff336f

  ```

## Remove all created with Terraform
- Type in your terminal `terraform destroy` in order to delete created terraform project

## TO DO
