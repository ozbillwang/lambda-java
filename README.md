# Deploy lambda java function with terraform/terragrunt

### Source code under `lambda-s3`

commands can be referenced in `.circleci/config.yaml`
```
gradle build
```

### deployment

```
$ docker run -ti --rm -e AWS_PROFILE=<aws_profile> -e AWS_REGION=ap-southeast-2 -v ${HOME}/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -e AWS_SDK_LOAD_CONFIG=1 -v $(pwd):/apps -w /apps alpine/terragrunt:0.12.9 bash

$ cd terragrunt/non-prod/ap-southeast-2/sit/lambda/
$ terragrunt plan
$ terragrunt apply
```
