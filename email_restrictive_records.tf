# resource "cloudflare_record" "SPF" {
#   zone_id = var.cloudflare_zone_id
#   type    = "TXT"
#   name    = var.main_domain
#   value   = "v=spf1 -all"
# }

resource "cloudflare_record" "DKIM" {
  zone_id = var.cloudflare_zone_id
  type    = "TXT"
  name    = "*._domainkey"
  value   = "v=DKIM1; p="
}

resource "cloudflare_record" "DMARC" {
  zone_id = var.cloudflare_zone_id
  type    = "TXT"
  name    = "_dmarc"
  value   = "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s; rua=mailto:cloudflare_report@${var.main_domain}"
}

# ref: */<cloudflare_domain>/dns/settings/wizard/restrictive-records
