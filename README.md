# How to Spring Boot!

<h4><strong>Setup</h4></strong>

```bash
mkdir folder
cd folder
gradle init
gradle check
gradle run
```

<h4><strong>Spring boot startup</h4></strong>

```bash
cd ~
cd folder
mkdir ./app/src/main/resources/static

touch ./app/src/main/resources/static/index.html
touch ./app/src/main/resources/static/index.css
touch ./app/src/main/resources/static/index.js
```

<h4><strong>vi ./app/build.gradle</h4></strong>

```bash
plugins {
    id 'java'
    id 'org.springframework.boot' version '2.6.2'
    id 'io.spring.dependency-management' version '1.0.12.RELEASE'
}

repositories {
     mavenCentral()
}

dependencies {
    testImplementation 'org.junit.jupiter:junit-jupiter:5.8.1'

    implementation 'org.springframework.boot:spring-boot-starter-web:'
}

tasks.named('test') {
  useJUnitPlatform()
  testLogging.showStandardStreams = true
}
```

<h4><strong>vi ./app/src/main/java/se/iths/App.java</h4></strong>

```bash
package se.iths;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class App {

    public static void main(String[] args) {
        SpringApplication.run(App.class);
    }

}
```
<h4><strong>vi ./app/src/test/java/se/iths/AppTest.java</h4></strong>

```bash
package se.iths;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class AppTest {
    @Test void appHasAGreeting() {

    }
}
```
<h4><strong>vi ./app/src/main/resources/static/index.html</h4></strong>

```bash
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <h1>Hello World</h1>
</body>
</html>
```

<h4><strong>Final steps</h4></strong>

```bash
gradle bootRun
curl localhost:8080

