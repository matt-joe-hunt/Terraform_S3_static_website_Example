output "static_website_url" {
  value = "http://${module.Bucket.static_website_url}"
}