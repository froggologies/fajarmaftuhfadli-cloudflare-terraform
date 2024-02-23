resource "cloudflare_record" "resend" {
  zone_id  = var.cloudflare_zone_id
  type     = "MX"
  name     = "send.email"
  value    = "feedback-smtp.us-east-1.amazonses.com"
  priority = 10
}

resource "cloudflare_record" "resend_spf" {
  zone_id = var.cloudflare_zone_id
  type    = "TXT"
  name    = "send.email"
  value   = "v=spf1 include:amazonses.com ~all"
}

resource "cloudflare_record" "resend_dkim" {
  zone_id = var.cloudflare_zone_id
  type    = "TXT"
  name    = "resend._domainkey.email"
  value   = "p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDRL63VCGwkQd7qUm8N5UOIkPs1e1OOioU9UNXHuxlGJbOIj4i0/x41kU8kWWCeDxL28NYFKDiTLxHfSPNAzD0otZ/r3IWkXebpKdGXOnCR5HbUmlA1qfGX2P1Ge0pyv2I+Q4ctNr3MrzkyEx26IMrJ8kFpGKbrtUfpVmNUgbN0+wIDAQAB"
}
