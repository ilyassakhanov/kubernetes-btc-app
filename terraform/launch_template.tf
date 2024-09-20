resource "aws_launch_template" "ecs_ec2" {
  name_prefix   = "ecs-template"
  image_id      = "ami-09efc42336106d2f2"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ecs_node_sg.id]

  iam_instance_profile { arn = aws_iam_instance_profile.ecs_node.arn }
  monitoring { enabled = true }

  user_data = filebase64("${path.module}/ecs.sh")
}