minikube start
eval $(minikube -p minikube docker-env)
docker build -t grace:2 .
minikube kubectl -- apply -f kubernetes/deployment.yaml
ab -c 20 -s 180 -t 100000 -n 100000 http://192.168.99.100:30987/
ab -n 100000 -c 20 http://192.168.99.100:30987/
minikube kubectl -- get pods -w
minikube stop
