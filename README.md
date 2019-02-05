# springSecurity_jwt_payload_encrypt

This project which have spring rest api's (courseapi's), jwt security project which have a) JwtSecurityExampleStsApplication.java for a demo on JWT token. and main class b) JWTNimbusDemo.java to have a demo on how to encryt and decrypt payload part on JWT token. For reference you can have reference on tutorial:
-----------------------------------------------------------
1. Proj: jwt-security-example-sts
Go to class com.techprimers.security.jwtsecurity.JwtSecurityExampleStsApplication, and run it. There are two controllers, one is Token Controller which generates 
token and the other one is HelloController.java which is called when we send the token on request header. 

2. Another POC is JWTNimbusDemo.java which helps to understand how a JWT token payload data can be encrypted and dcrypted at the receiving end using rsa key.

-----------------------------------------------------------
For Reference:

Spring boot spring security + JWT Example and video below:
video: https://www.youtube.com/watch?v=-HYrUs1ZCLI
Github: https://github.com/TechPrimers/jwt-security-example

Issues: https://stackoverflow.com/questions/37285016/what-is-username-and-password-when-starting-spring-boot-with-tomcat
-> https://community.auth0.com/t/why-jwt-token-allowing-to-decrypt-the-token-without-secret-key-signature/16736
--------------------------------------------------------------

