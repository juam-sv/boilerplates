provider "google" {
  project = "devops-iac-365913"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yaml")}"
}

resource "google_project" "financeiro" {
  display_name = "Financeiro" 
  name            = "devops-iac"
  project_id      = "devops-iac"
  folder_id       = "1234567890"
  billing_account = "123456-ABCDEF-123456"
}