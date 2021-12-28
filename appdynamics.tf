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

data "helm_template" "appdynamics" {
  name       = "k8s"
  namespace  = "appdynamics"
  repository = "https://ciscodevnet.github.io/appdynamics-charts"

  chart   = "cluster-agent"

  templates = [
    "templates/cluster-agent.yaml",
  ]

  set {
    name  = "metadata.name"
    value = "xpto"
  }
}

resource "local_file" "appdynamics_manifests" {
  for_each = data.helm_template.appdynamics.manifests

  filename = "./${each.key}"
  content  = each.value
}

data "kustomization_overlay" "appdynamics" {
  resources = [
    "cluster=agent.yaml",
  ]

  patches {
    target = {
      kind = "Clusteragent"
      name = {{ printf "%s-%s" .Release.Name "appdynamics-cluster-agent" | trunc 63 }}
    }
    patch = <<-EOF
      kind: Namespace
      metadata:
        name: new-ns
    EOF
    options {
      allow_name_change = true
    }
  }

}

# Deploy the AppDynamics cluster agent using AppDynamic's helm chart
resource "helm_release" "appdynamics" {
  name = "k8s"
  namespace = "appdynamics"
  repository = "https://ciscodevnet.github.io/appdynamics-charts"
  chart = "cluster-agent"

  values = [
    file("${path.module}/appdynamics-values.yaml")
  ]
}