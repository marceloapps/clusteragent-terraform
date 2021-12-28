resource "kubernetes_namespace" "appdynamics" {
  metadata {
    annotations = {
      name = "appdynamics"
    }

    labels = {
      name = "appdynamics"
    }  
    name = "appdynamics"
  }
}

# Deploy the AppDynamics cluster agent using AppDynamic's helm chart
resource "helm_release" "appdynamics" {
  name = "k8s"
  namespace = "appdynamics"
  #repository = "https://ciscodevnet.github.io/appdynamics-charts"
  repository = "https://marceloapps.github.io/appdynamics-charts"
  chart = "cluster-agent"

  values = [
    file("${path.module}/appdynamics-values.yaml")
  ]
}