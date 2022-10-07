# Demonstrate the lack of visibility for what iteration has failed when using output preconditions

When you run `terraform plan`, the output shows:
```
$ terraform plan
╷
│ Error: Module output value precondition failed
│ 
│   on modules/generate_failure/main.tf line 16, in output "outgoing":
│   16:     condition = (local.some_result == [true])
│     ├────────────────
│     │ local.some_result is tuple with 1 element
│ 
│ Something is wrong but we can't tell you what it is.
╵
╷
│ Error: Module output value precondition failed
│ 
│   on modules/generate_failure/main.tf line 16, in output "outgoing":
│   16:     condition = (local.some_result == [true])
│     ├────────────────
│     │ local.some_result is tuple with 1 element
│ 
│ Something is wrong but we can't tell you what it is.
╵

```

Whilst the testing in this example is about making sure the result value is `[true]`, and the test clearly work as two
values have been supplied to the module that triggered the precondition failure, there's no information available to
determine which iteration was the one (or ones) that failed.


<!-- BEGIN_TF_DOCS -->


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_module_generates_the_failure"></a> [module\_generates\_the\_failure](#module\_module\_generates\_the\_failure) | ./modules/generate_failure | n/a |
<!-- END_TF_DOCS -->
