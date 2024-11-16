# Leveranse info:
## Oppgaver oversikt:
Koden til alle oppgavene ligger i mapper som er kalt navnet/nummet på oppgaven. Github actions workflows ligger i en seperat mappe ".github/workflows" (alle workflows uansett oppgave nr ligger her)

### Oppgave 1.a
HTTP endepunkt for lambdafunksjonen (postman url):
https://1n1xurg5gk.execute-api.eu-west-1.amazonaws.com/Prod/generate-image

### Oppgave 1.b
lenke til kjørt github actions workflow:
https://github.com/EmilieJH/devopseksamen2024/actions/runs/11847732231
Hvis linken ikke funker se bilde "oppg1b"

### Oppgave 2.a
Se mappe "Oppgave2" for filer

### Oppgave 2.b
**Terraform apply test på push til main:**
https://github.com/EmilieJH/devopseksamen2024/actions/runs/11847573702/job/33017510532

Hvis linken ikke funker se bilde "oppg2bapply" (testen ble gjort i main på github)

**Bare Terraform plan:**
https://github.com/EmilieJH/devopseksamen2024/actions/runs/11847601156/job/33017596675

Hvis linken ikke funker se bilde "oppg2bplan" (testen ble gjort i test branchen på github)

**SQS-kø url:**

https://sqs.eu-west-1.amazonaws.com/244530008913/image_generation_queue-63

eksempel:

aws sqs send-message --queue-url https://sqs.eu-west-1.amazonaws.com/244530008913/image_generation_queue-63 --message-body "A cat reading a book"