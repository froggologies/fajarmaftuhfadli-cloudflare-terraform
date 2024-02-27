resource "cloudflare_email_routing_settings" "main_domain" {
  zone_id = var.cloudflare_zone_id
  enabled = "true"
}

resource "cloudflare_email_routing_address" "main_email" {
  account_id = var.cloudflare_account_id
  email      = var.main_email
}

# The TXT record is configured to allow your domain to send incoming emails out to your preferred email provider.
resource "cloudflare_record" "enable_email_routing" {
  zone_id = var.cloudflare_zone_id
  type    = "TXT"
  name    = var.main_domain
  value   = "v=spf1 include:_spf.mx.cloudflare.net ~all"
}

locals {
  emails = [
    "email",
    "cloudflare_report",
    "twitter2"
  ]
}

resource "cloudflare_email_routing_rule" "emails" {
  for_each = toset(local.emails)

  zone_id = var.cloudflare_zone_id
  name    = each.value
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "${each.value}@${var.main_domain}"
  }

  action {
    type  = "forward"
    value = [var.main_email]
  }
}
