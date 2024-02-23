resource "cloudflare_record" "main_domain" {
  zone_id = var.cloudflare_zone_id
  type    = "CNAME"
  name    = var.main_domain
  value   = "cname.vercel-dns.com"
  proxied = true
}

resource "cloudflare_record" "www" {
  zone_id = var.cloudflare_zone_id
  type    = "CNAME"
  name    = "www"
  value   = "cname.vercel-dns.com"
  proxied = true
}
