# Description


```
This app was supposed to kun in Kubernetes cluster and return current Bitcoin prices. Currently, it doesn't work due to issues in exposing the service outside Kubernetes cluster.
```
## Used software

```
kubectl v1.24.2
minikube v1.26.1
docker 20.10.8
```

## To reproduce

### With rebuiding container with app

If you choose not to use an image from Docker Hub
```
docker build -t your-image-name . 
// Upload this image to a container registry; replace image line 17 in deployment.yml
```

### Without rebuiding container with app

```
kubectl apply -f ./deployment.yml
```

## Usage

```
App is not in a working state
```