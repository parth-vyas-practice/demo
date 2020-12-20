# prerequisits
## versions
ansible = 2.5+ \
terraform = 0.12.29

## Notes
- provide bucket name in ansible-playbooks/vars  dev_vars.yml and qa_vars.yml files before running the pipeline and push to private git repo
- jenkins server should have permission to deploy full vpc with s3 as backend
- jenkins file is provided on root of project
- use ansible-demo branch for working code


### ansible module url
https://docs.ansible.com/ansible/2.5/modules/terraform_module.html

### terraform download link
https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip

### Terraform module url
https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/2.44.0
