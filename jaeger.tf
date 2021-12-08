resource "kubernetes_namespace" "jaeger" {
  metadata {
    annotations = {
      name = "jaeger"
    }

    labels = {
      name = "jaeger"
    }  
    name = "jaeger"
  }
}

# Deploy Jaeger's Agent and Collector using the Official Helm Chart
resource "helm_release" "jaeger" {
  name = "jaeger"
  namespace = "jaeger"
  repository = "https://jaegertracing.github.io/helm-charts"
  chart = "jaeger"

  values = [
    file("${path.module}/jaeger-values.yaml")
  ]
}