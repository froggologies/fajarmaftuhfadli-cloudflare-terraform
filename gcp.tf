resource "cloudflare_record" "nginx" {
  zone_id = var.cloudflare_zone_id
  type    = "A"
  name    = "nginx"
  value   = "35.209.105.78"
  proxied = false
}