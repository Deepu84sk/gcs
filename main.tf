module "bucket" {
  source = "../../modules/simple_bucket"

  name       = "${var.project_id}-bucket"
  project_id = var.project_id
  location   = "us-east1"

  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age        = 365
      with_state = "ANY"
    }
  }]

  iam_members = [{
    role   = "roles/storage.objectViewer"
    member = "group:test-gcp-ops@test.infra.cft.tips"
  }]
}
