provider "helm" {
  kubernetes {
    config_path = "${path.module}/kubeconfig.yaml"
  }
  experiments {
    manifest = true
  }
}

resource "local_file" "config_yaml" {
  filename = "${path.module}/values.yaml"
  content  = templatefile("${path.module}/values.yaml.tpl", {
    host       = var.host
    accessKey  = var.accessKey
    secretKey  = var.secretKey
    bucketName = var.bucketName
  })
}

resource "helm_release" "milvus" {
  name       = "milvus"
  repository = "https://zilliztech.github.io/milvus-helm/"
  chart      = "milvus"

  depends_on = [resource.local_file.config_yaml, resource.mgc_kubernetes_nodepool.gp1_medium, data.mgc_kubernetes_cluster_kubeconfig.cluster ]

  values = [resource.local_file.config_yaml.content]
}
