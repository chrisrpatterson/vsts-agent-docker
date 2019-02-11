az acr login -n kaniko
docker run --rm -v $(pwd)/ubuntu/16.04/standard:/workspace \
                -v ~/.docker:/kaniko/.docker \
                gcr.io/kaniko-project/executor:latest --cache=true --cache-repo=kaniko.azurecr.io/agents/vsts-agent-cache --destination=kaniko.azurecr.io/agents/vsts-agent:$(Build.BuildId) --dockerfile=/workspace/Dockerfile --context=dir://workspace
