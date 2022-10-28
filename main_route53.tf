resource "aws_route53_zone" "wp_domain" {
  name = "eastonit.org"

}

resource "aws_route53_record" "wp_domain_ns_record" {
  zone_id = aws_route53_zone.wp_domain.zone_id
  name    = "eastonit.org"
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.wp_domain.name_servers

}
