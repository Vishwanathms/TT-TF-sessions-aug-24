

resource "aws_ecs_cluster" "name" {
  name = "ecs-${local.names}"
}