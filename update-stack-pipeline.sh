#!/bin/bash

PREFIX=${1:-default}
STACK_PREFIX="helloworld-$PREFIX"

aws cloudformation update-stack --capabilities CAPABILITY_IAM --stack-name $STACK_PREFIX-pipe --template-body file://cloudformation/pipeline.yaml --parameters \
	ParameterKey=CodeCommitRepositoryARN,UsePreviousValue=true \
	ParameterKey=CodeCommitRepositoryName,UsePreviousValue=true \
	ParameterKey=DockerLocalTag,UsePreviousValue=true \
	ParameterKey=RepoUrl,UsePreviousValue=true \
	ParameterKey=FargateStackName,UsePreviousValue=true \
	ParameterKey=NetworkStack,UsePreviousValue=true \
	ParameterKey=LoadBalancerStack,UsePreviousValue=true \
	ParameterKey=DatabaseStack,UsePreviousValue=true \
	ParameterKey=DBPassSSMName,UsePreviousValue=true \
	ParameterKey=CloudFormationRole,UsePreviousValue=true \
	ParameterKey=TargetGroup,UsePreviousValue=true \
	ParameterKey=TargetGroup2,UsePreviousValue=true
