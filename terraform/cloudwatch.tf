resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
  dashboard_name = "${var.project_name}-dashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x    = 0,
        y    = 0,
        width = 12,
        height = 6,
        properties = {
          metrics = [
            [ "AWS/ECS", "CPUUtilization", "ClusterName", aws_ecs_cluster.main.name, "ServiceName", aws_ecs_service.backend.name ],
            [ ".", "MemoryUtilization", ".", ".", ".", "." ]
          ],
          view       = "timeSeries",
          stacked    = false,
          region     = var.aws_region,
          title      = "ECS CPU & Memory Utilization"
        }
      }
    ]
  })
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_backend" {
  alarm_name          = "${var.project_name}-cpu-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = 70
  dimensions = {
    ClusterName = aws_ecs_cluster.main.name
    ServiceName = aws_ecs_service.backend.name
  }
  alarm_description   = "Triggers when CPU usage > 70%"
  treat_missing_data  = "missing"
  alarm_actions       = []  # No SNS hook
}
