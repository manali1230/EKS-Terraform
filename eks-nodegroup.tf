resource "aws_eks_node_group" "Node1" {
  cluster_name    = aws_eks_cluster.ekscluster.name
  instance_types = ["t2.micro"]
  node_group_name = "node1"
  node_role_arn   = aws_iam_role.ec2role.arn
  subnet_ids      = ["subnet-645aa32c"]

  remote_access {
      ec2_ssh_key = "ekskey"
      source_security_group_ids = [aws_eks_cluster.ekscluster.vpc_config[0].cluster_security_group_id]
  }

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.ec2-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.ec2-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.ec2-AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_eks_node_group" "Node2" {
  cluster_name    = aws_eks_cluster.ekscluster.name
  instance_types = ["t2.micro"]
  node_group_name = "node2"
  node_role_arn   = aws_iam_role.ec2role.arn
  subnet_ids      = ["subnet-1aa76f7c"]

  remote_access {
      ec2_ssh_key = "ekskey"
      source_security_group_ids = [aws_eks_cluster.ekscluster.vpc_config[0].cluster_security_group_id]
  }

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.ec2-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.ec2-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.ec2-AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_eks_node_group" "Node3" {
  cluster_name    = aws_eks_cluster.ekscluster.name
  instance_types = ["t2.micro"]
  node_group_name = "node3"
  node_role_arn   = aws_iam_role.ec2role.arn
  subnet_ids      = ["subnet-0dc54254"]

  remote_access {
      ec2_ssh_key = "ekskey"
      source_security_group_ids = [aws_eks_cluster.ekscluster.vpc_config[0].cluster_security_group_id]
  }

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.ec2-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.ec2-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.ec2-AmazonEC2ContainerRegistryReadOnly,
  ]
}