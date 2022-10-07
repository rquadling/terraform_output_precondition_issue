locals {
  a_map_to_iterate = {
    ok   = true
    fail = false
    bad  = false
  }
}

// This module will generate a failure for the false value.
module "module_generates_the_failure" {
  source = "./modules/generate_failure"
  for_each = local.a_map_to_iterate
  incoming = each.value
}
