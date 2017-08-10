// file: kubernetes_clusters.tf

module "prod" {
  source = "kubernetes_clusters/prod"
}

module "dev" {
  source = "kubernetes_clusters/dev"
}
