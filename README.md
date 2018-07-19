# Coding_Assessment_Devops

## ATM Application Quick start

### Gradle
```
gradle bootRun
```

## Swagger
Once the application is running, a Swagger definition is available here: http://localhost:7000/swagger-ui.html.
This can be used to call the API, or [build a client](https://github.com/swagger-api/swagger-codegen) in wide range of languages.

## Details
### Interface
The best place to look for interface specification is the Swagger file. At a high-level, there are 2 API operations
 - Balance: Retrieve account balance and max withdrawal amount
   ```http://localhost:7000/balance/123456789/1234```
 - Withdraw: Withdraw cash from ATM
   ```http://localhost:7000/withdraw/123456789/1234/200```