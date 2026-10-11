resource "google_iap_web_backend_service_iam_binding" "iap_web_backend_service_iam_bindings" {
  for_each = var.iap_web_backend_service_iam_bindings

  members             = each.value.members
  role                = each.value.role
  web_backend_service = each.value.web_backend_service
  project             = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

