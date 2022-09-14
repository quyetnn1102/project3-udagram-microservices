# Environment and config map
kubectl apply -f aws-secret.yaml
kubectl apply -f env-secret.yaml
kubectl apply -f env-configmap.yaml

# Pods deployment
kubectl apply -f backend-feed-deployment.yaml
kubectl apply -f backend-user-deployment.yaml
kubectl apply -f reverseproxy-deployment.yaml


# Services deployment
kubectl apply -f backend-feed-service.yaml
kubectl apply -f backend-user-service.yaml
kubectl apply -f reverseproxy-service.yaml

# exposed reverseproxy
kubectl expose deployment reverseproxy --type=LoadBalancer --name=publicreverseproxy

# forward front-end port
kubectl port-forward frontend-65d6486678-ztlf4 8100:8100

kubectl apply -f frontend-deployment.yaml
kubectl apply -f frontend-service.yaml

# exposed front end 
kubectl expose deployment frontend --type=LoadBalancer --name=publicfrontend

docker build . -t quyetnn1102/udagram-frontend:v1
docker push quyetnn1102/udagram-frontend:v1
kubectl set image deployment frontend frontend=quyetnn1102/udagram-frontend:v1
kubectl rollout restart deployment frontend