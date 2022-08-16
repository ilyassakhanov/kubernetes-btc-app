# Description


```
This app is supposed in Kubernetes cluster and return current Bitcoin prices in EUR and CZK. 
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
minikube start // Skip this one if it is running already
kubectl apply -f ./deployment.yml
minikube service custom-deployment-service
```

## Usage

After running previous commands, a new tab in your default browser should open with the result.
If not, copy the last URL that was shown after running all commands and curl it/put it in a browser.(i.e curl http://127.0.0.1:1234567)

 If it is not starting immidiately give it some time and make sure that you have access to the Internet

## Removal

```
kubectl delete deployment custom-deployment
kubectl delete service custom-deployment-service
```