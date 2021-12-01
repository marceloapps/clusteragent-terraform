# Terraform pra deploy do cluster agent 

O arquivo appdynamics.tf contem o código terraform pra subir o cluster agent num cluster de k8s (foi testado local com minikube)
O arquivo appdynamics-values.yaml é o arquivo de values que sobem com o cluster agent pra configura-lo. Bem como a config de instrumentação da aplicação.

O terraform vai buscar o helm chart público disponibilizado pela própria appdynamics e tentar fazer o deploy no cluster.

Segue o link da doc da appdy sobre isso:
https://docs.appdynamics.com/21.5/en/infrastructure-visibility/monitor-kubernetes-with-the-cluster-agent/install-the-cluster-agent/install-the-cluster-agent-with-helm-charts