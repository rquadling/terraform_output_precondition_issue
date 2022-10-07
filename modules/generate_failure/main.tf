variable "incoming" {
  description = "Something incoming"
  type        = bool
}

// Let's pretend we did something and we want to confirm the value on the way out.
locals {
  some_result = [var.incoming]
}

output "outgoing" {
  description = "Some sort of result that can be tested to reveal a failing condition of some sort."
  value = local.some_result

  precondition {
    condition = (local.some_result == [true])
    error_message = "Something is wrong but we can't tell you what it is."
  }
}
