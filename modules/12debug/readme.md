if we encounter any erros we cann check logs 

for that we need to set env varibale ```TF_LOG=true``` and to store the valuese we can do 

```sh
TF_LOG=option TF_LOG_PATH=./logs terraform apply
```

options are

TRACE	Most verbose. Shows every step Terraform takes. Useful for deep debugging.
DEBUG	Detailed logs, including internal operations and plugin interactions.
INFO	General operational messages. Good for understanding flow without clutter.
WARN	Warnings about potential issues.
ERROR	Only shows errors. Minimal output.
JSON	Outputs logs at INFO level or higher in JSON format for structured parsing.
---
There are two tyoes of logs core and provider
core(tf logic errors) ```TF_LOG_CORE```
provider(provider api errors) ```TF_LOG_PROVIDER```
 