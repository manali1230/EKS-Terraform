resource "null_resource" "kubeconfig" {
    provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name EKSCluster"
  }
  depends_on = [
      aws_eks_node_group.Node1,
      aws_eks_node_group.Node2,
      aws_eks_node_group.Node3
  ]
}