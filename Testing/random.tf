resource "random_uuid" "cualquiercosa" {
  
}

output "randomid" {
  value=substr(random_uuid.cualquiercosa.result,0,8)

}
