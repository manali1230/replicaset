resource "kubernetes_service" "service" {
  metadata {
    name = "kubeser"
  }
  spec {
    selector = {
      test= "${kubernetes_deployment.dep.metadata.0.labels.test}"
    }
    port {
      port        = 80
    }
    
  }
}


resource "kubernetes_deployment" "dep" {
  metadata {
    name = "kubeser"
    labels = {
      test = "MyApp"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "MyApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "MyApp"
        }
      }

      spec {
        container {
          image = "vimal13/apache-webserver-php"
          name  = "kuberser"

          }
        }
      }
    }
}
 