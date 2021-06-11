resource "aws_eks_cluster" "ekscluster" {
  name     = "EKSCluster"
  role_arn = aws_iam_role.eksrole.arn

  vpc_config {
    subnet_ids = ["subnet-a8c4a9f1", "subnet-11d76677","subnet-1c3a9c54"]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController,
  ]
}
output "SecurityGroup" {
  value = aws_eks_cluster.ekscluster.vpc_config[0].cluster_security_group_id
}

output "endpoint" {
  value = aws_eks_cluster.ekscluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.ekscluster.certificate_authority[0].data
}