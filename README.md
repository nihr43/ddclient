# usage

`make`

expects:

- ${DDCLIENT_LOGIN}
- ${DDCLIENT_PASSWORD}
- ${DDCLIENT_DOMAIN}

example terraform manifest:

```
resource "kubernetes_cron_job_v1" "ddclient" {
  metadata {
    name = "ddclient"
  }
  spec {
    concurrency_policy = "Forbid"
    schedule = "@hourly"
    job_template {
      metadata {}
      spec {
        backoff_limit = 2
        template {
          metadata {}
          spec {
            container {
              image = "images.local:5000/ddclient"
              name  = "ddclient"
              env {
                name = "DDCLIENT_LOGIN"
                value_from {
                  secret_key_ref {
                    name = "ddclient-credentials"
                    key = "login"
                  }
                }
              }
              env {
                name = "DDCLIENT_PASSWORD"
                value_from {
                  secret_key_ref {
                    name = "ddclient-credentials"
                    key = "password"
                  }
                }
              }
              env {
                name = "DDCLIENT_DOMAIN"
                value = "example.org"
              }
            }
          }
        }
      }
    }
  }
}
```
