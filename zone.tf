resource "cloudflare_zone_settings_override" "default" {
  zone_id = var.cloudflare_zone_id
  settings {
    ssl = "strict"
  }
}
