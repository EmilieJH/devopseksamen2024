# Leveranse info:
Jeg har gjort alle oppgavene, under finner du leveransene.

## Oppgaver oversikt:
Kodene til alle oppgavene ligger i mapper som er kalt navnet/nummet på oppgaven. 
Github actions workflows ligger i en seperat mappe ".github/workflows" (alle workflows uansett oppgave nr ligger her)
Hvis linkene ikke funker har jeg lagt til bilder som ligger i mappen "bilder"

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

<span style="color: red">NB!!: </span>
Apply og plan har to linker: en før og en etter oppgave4 siden jeg endret workflow filen etter oppgaven (og glemte versjons krav på den første linken, men det er lagt til på link nr2)

<br>

**Terraform APPLY test på push til main:**

**Link nr1:**
https://github.com/EmilieJH/devopseksamen2024/actions/runs/11847573702/job/33017510532

Hvis linken ikke funker se bilde "oppg2bapply"

**Link nr 2:**
https://github.com/EmilieJH/devopseksamen2024/actions/runs/11872075054/job/33085342070

Hvis linken ikke funker se bilde "oppg2bapplyUpdate"

<br>

**Terraform PLAN test på push til test branch:**

**Link nr 1:**
https://github.com/EmilieJH/devopseksamen2024/actions/runs/11847601156/job/33017596675

Hvis linken ikke funker se bilde "oppg2bplan"

**Link nr 2:**
https://github.com/EmilieJH/devopseksamen2024/actions/runs/11872276548/job/33085794688

Hvis linken ikke funker se bilde "oppg2bplanUpdate"

<br>

**SQS-kø url:**

https://sqs.eu-west-1.amazonaws.com/244530008913/image_generation_queue-63

***eksempel:***

aws sqs send-message --queue-url https://sqs.eu-west-1.amazonaws.com/244530008913/image_generation_queue-63 --message-body "A cat reading a book"

<br>

### Oppgave 3.a + 3.b

**<span style="color: #106585">Hva slags tags jeg har valgt og hvorfor: </span>**

Jeg har valgt å bruke to tags: "latest" og commit-sha.
Latest viser den nyeste versjonen av docker imaget og gjør det enkelt å bruke den siste stabile versjonen av imaget,
Commit SHA lager en unik id for hver gang imaget blir bygd, som gjør det enkelt å spore hvilken commit som hører til hvilket image. (nyttig for feilsøking og historikk)

**<span style="color: #106585">image-navn fra dockerhub-konto:</span>**
emhal/imagegenerator


**<span style="color: #106585">SQS Url:</span>**

https://sqs.eu-west-1.amazonaws.com/244530008913/image_generation_queue-63

***eksempel (url + tag):***

.... SQS_QUEUE_URL=https://sqs.eu-west-1.amazonaws.com/244530008913/image_generation_queue-63 emhal/imagegenerator:latest "a pyramid"

### Oppgave 4.a
Siden oppgave 4 bygger på oppgave 2 skriver jeg en liste med hvilke filer jeg har endret og legger til kommentarer i de filene som viser hva som tilhører oppgave 4

**ALLE FILENE UTENOM WORKFLOWS LIGGER UNDER Oppgave2/infra**

**Endrede filer:**

variables.tf </br>
outputs.tf </br>
main.tf </br>
.github/workflows/terraform_deploy

**Nye filer:**

sns_topic.tf </br>
cloudwatch_alarm.tf </br>

### Oppgave 5
Se oppgave5.txt

Format:
- Oppgave 1.a
- Oppgave 1.b
- Oppgave 2.a
- Oppgave 2.b
- Oppgave 3.a + b
- Oppgave 4.a
- Oppgave 5
