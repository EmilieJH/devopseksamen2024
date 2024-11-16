# <span style="color: #2988ab">Leveranse info:</span>
Jeg har gjort alle oppgavene, under finner du leveransene.

## <span style="color: #2988ab">Oppgaver oversikt:</span>
Kodene til alle oppgavene ligger i mapper som er kalt navnet/nummet på oppgaven. Github actions workflows ligger i en seperat mappe ".github/workflows" (alle workflows uansett oppgave nr ligger her)

### <span style="color: #2988ab">Oppgave 1.a</span>
HTTP endepunkt for lambdafunksjonen (postman url):
https://1n1xurg5gk.execute-api.eu-west-1.amazonaws.com/Prod/generate-image

### <span style="color: #2988ab">Oppgave 1.b</span>
lenke til kjørt github actions workflow:
https://github.com/EmilieJH/devopseksamen2024/actions/runs/11847732231
Hvis linken ikke funker se bilde "oppg1b"

### <span style="color: #2988ab">Oppgave 2.a</span>
Se mappe "Oppgave2" for filer

### <span style="color: #2988ab">Oppgave 2.b</span>

<span style="color: red">NB!!: </span>
Apply og plan har to linker: en før og en etter oppgave4 siden jeg endret workflow filen etter oppgaven (og glemte versjons krav på den første linken, men det er lagt til på link nr2)


**<span style="color: #106585">Terraform APPLY test på push til main:</span>**

**Link nr1:**
https://github.com/EmilieJH/devopseksamen2024/actions/runs/11847573702/job/33017510532

Hvis linken ikke funker se bilde "oppg2bapply"

**Link nr 2 (oppdatert workflow file):**
https://github.com/EmilieJH/devopseksamen2024/actions/runs/11872075054/job/33085342070

Hvis linken ikke funker se bilde "oppg2bapplyUpdate"


**<span style="color: #106585">Terraform PLAN test på push til test branch:</span>**

**Link nr 1:**
https://github.com/EmilieJH/devopseksamen2024/actions/runs/11847601156/job/33017596675

Hvis linken ikke funker se bilde "oppg2bplan"


**Link nr 2:**
PUTT INN LINK OG BILDE

Hvis linken ikke funker se bilde "oppg2bplanUpdate" (testen ble gjort i test branchen på github)


**<span style="color: #106585">SQS-kø url:</span>**

https://sqs.eu-west-1.amazonaws.com/244530008913/image_generation_queue-63

***eksempel:***

aws sqs send-message --queue-url https://sqs.eu-west-1.amazonaws.com/244530008913/image_generation_queue-63 --message-body "A cat reading a book"

### <span style="color: #2988ab">Oppgave 3.a + 3.b</span>

**<span style="color: #106585">Hva slags tags jeg har valgt og hvorfor: </span>**

Jeg har valgt å bruke to tags: "latest" og commit-sha.
Latest viser den nyeste versjonen av docker imaget og gjør det enkelt å bruke den siste stabile versjonen av imaget
Commit SHA lager en unik id for hver gang imaget blir bygd, som gjør det enkelt å spore hvilken commit som hører til hvilket image. (nyttig for feilsøking og historikk)

**<span style="color: #106585">image-navn fra dockerhub-konto:</span>**
emhal/imagegenerator


**<span style="color: #106585">SQS Url:</span>**

https://sqs.eu-west-1.amazonaws.com/244530008913/image_generation_queue-63

***eksempel (url + tag):***

.... SQS_QUEUE_URL=https://sqs.eu-west-1.amazonaws.com/244530008913/image_generation_queue-63 emhal/imagegenerator:latest "a pyramid"

### <span style="color: #2988ab">Oppgave 4.a</span>
Siden oppgave 4 bygger på oppgave 2 skriver jeg en liste med hvilke filer jeg har endret og legger til kommentarer i de filene som viser hva som tilhører oppgave 4

**ALLE FILENE UTENOM WORKFLOWS LIGGER UNDER Oppgave2/infra**

**Endrede filer:**

variables.tf
outputs.tf
main.tf
.github/workflows/terraform_deploy

**Nye filer:**

sns_topic.tf
cloudwatch_alarm.tf

Gjøre:
sjekke bilder og link til bare plan på nytt + bilde
oppgave 4 sjekke om du kan overbelaste