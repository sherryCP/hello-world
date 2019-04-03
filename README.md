# Hello World - Go sample
A simple web app written in Go that you can used for testing.

## Prerequisites
- A Kubernetes cluster
- [Docker](https://www.docker.com) installed and running on a machine,
  and a Docker Hub or private repository account configured.
  
## Building and deploying the sample
1. Use Docker to build the sample code into a container. 

   ```shell
   # Build the container on your local machine
   docker build -t <image-tag> .

   # Push the container to docker registry
   docker push <image-tag>
   ```

1. After the build has completed and the container is pushed to docker registry, you
   can deploy the app into your cluster. Make sure the container image value
   in `helloworld-go-v1.yaml` matches the `<image-tag>` you built in the previous step. Apply
   the configuration using `kubectl`:

   ```shell
   kubectl apply -f helloworld-go-v1.yaml
   ```
## Removing the sample app deploymentt

To remove the sample app from your cluster, delete the service record:

```shell
kubectl delete -f helloworld-go-v1.yaml
```
