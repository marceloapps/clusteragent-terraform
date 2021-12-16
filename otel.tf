resource "kubernetes_namespace" "opentelemetry" {
  metadata {
    annotations = {
      name = "opentelemetry"
    }

    labels = {
      name = "opentelemetry"
    }  
    name = "opentelemetry"
  }
}

# Deploy Jaeger's Agent and Collector using the Official Helm Chart
resource "helm_release" "opentelemetry" {
  name = "opentelemetry"
  namespace = "opentelemetry"
  repository = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart = "opentelemetry-collector"

  values = [
    file("${path.module}/otel-values.yaml")
  ]
}