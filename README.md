# Leveranse info:
Jeg har gjort alle oppgavene, under finner du leveransene.

## Oppgaver oversikt:
Kodene til alle oppgavene ligger i mapper som er kalt navnet/nummet på oppgaven. Github actions workflows ligger i en seperat mappe ".github/workflows" (alle workflows uansett oppgave nr ligger her)

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

***eksempel:***

aws sqs send-message --queue-url https://sqs.eu-west-1.amazonaws.com/244530008913/image_generation_queue-63 --message-body "A cat reading a book"

### Oppgave 3.a + 3.b

**Hva slags tags jeg har valgt og hvorfor:**
Jeg har valgt å bruke to tags: "latest" og commit-sha.
Latest viser den nyeste versjonen av docker imaget og gjør det enkelt å bruke den siste stabile versjonen av imaget
Commit SHA lager en unik id for hver gang imaget blir bygd, som gjør det enkelt å spore hvilken commit som hører til hvilket image. (nyttig for feilsøking og historikk)

**image-navn fra dockerhub-konto:** 
emhal/imagegenerator

**SQS Url:** https://sqs.eu-west-1.amazonaws.com/244530008913/image_generation_queue-63

***eksempel (url + tag):***

.... SQS_QUEUE_URL=https://sqs.eu-west-1.amazonaws.com/244530008913/image_generation_queue-63 emhal/imagegenerator:latest "a pyramid"

### Oppgave 4.a