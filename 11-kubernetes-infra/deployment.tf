resource "kubernetes_deployment" "firstpodwithtf" {
  metadata {
    name = "firstpodwithtf"
  }
  spec {
      selector {
        match_labels = {
            "type" = "app"
        }
      }
      replicas = 2
      template {
        metadata {
            labels = {
                "type" = "app"
            }
        }
        spec {
          container {
              name = "firstpodwithtfcontainer"
              image = "pintulohargcetts/nginx_custom:v1"
              #port {
               # container_port = 80
              #}
          }
        }
      } 
  }
}

# Equivalent deployment file in kubernetes.
/*apiVersion: apps/v1
kind: Deployment
metadata:
  name: firstpodwithtf
spec:
  selector:
    matchLabels:
      app: firstpodwithtf
  replicas: 2 # tells deployment to run 2 pods matching the template
  template: # create pods using pod definition in this template
    metadata:
      labels:
        app: firstpodwithtf
    spec:
      containers:
      - name: firstpodwithtf
        image: pintulohargcetts/nginx_custom:v1
        ports:
        - containerPort: 80
*/