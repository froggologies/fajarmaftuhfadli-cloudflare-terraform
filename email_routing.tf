resource "cloudflare_email_routing_settings" "main_domain" {
  zone_id = var.cloudflare_zone_id
  enabled = "true"
}

resource "cloudflare_email_routing_address" "main_email" {
  account_id = var.cloudflare_account_id
  email      = var.main_email
}

resource "cloudflare_email_routing_rule" "email" {
  zone_id = var.cloudflare_zone_id
  name    = "email"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "email@${var.main_domain}"
  }

  action {
    type  = "forward"
    value = [var.main_email]
  }
}

resource "cloudflare_email_routing_rule" "cloudflare_report" {
  zone_id = var.cloudflare_zone_id
  name    = "cloudflare_report"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "cloudflare_report@${var.main_domain}"
  }

  action {
    type  = "forward"
    value = [var.main_email]
  }
}

resource "cloudflare_email_routing_rule" "twitter1" {
  zone_id = var.cloudflare_zone_id
  name    = "twitter1"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "twitter1@${var.main_domain}"
  }

  action {
    type  = "forward"
    value = [var.main_email]
  }
}
