# Terraform pra deploy do cluster agent do appdynamics

O arquivo appdynamics.tf contem o código terraform pra subir o cluster agent num cluster de k8s (foi testado local com minikube)
O arquivo appdynamics-values.yaml é o arquivo de values que sobem com o cluster agent pra configura-lo. Bem como a config de instrumentação da aplicação.

O terraform vai buscar o helm chart público disponibilizado pela própria appdynamics e tentar fazer o deploy no cluster.

Segue o link da doc da appdy sobre isso:
https://docs.appdynamics.com/21.5/en/infrastructure-visibility/monitor-kubernetes-with-the-cluster-agent/install-the-cluster-agent/install-the-cluster-agent-with-helm-charts

# Mas também tem deploy de Jaeger? Tem sim senhor!

Esse arquivo jaeger.tf vai rodar o helm chart oficial do Jaeger Tracing e instalar o agent e o collector dentro do cluster. O agent irá como daemonset (1 pra cada node) e o collector como deployment podendo subir até 10 replicas dentro do cluster.

Felicidade que chama? ;)