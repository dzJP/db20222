# db20222
<h2><strong>CRUD JDBC</strong></h2>

>cd ~
>cd ws
>rm -rf edu-crud-jdbc #Försiktig med denna
>mkdir edu-crud-jdbc
>cd edu-crud-jdbc
>mkdir -p ./app/src/main/{java/se/iths,resources}
>mkdir -p ./app/src/test/{java/se/iths,resources}
>touch ./app/src/main/java/se/iths/App.java
>touch ./app/src/test/java/se/iths/AppTest.java
>touch ./app/build.gradle
>echo "# edu-crud-jdbc" > README.md
>echo "rootProject.name = 'edu-jdbc-crud'\ninclude('app')" > settings.gradle
>curl -L https://gist.github.com/miwashiab/987826fc0f2df3cd686a755f38a1c504/raw/build.gradle -o ./app/build.gradle
>curl -L https://gist.github.com/miwashiab/0ca40c177e62925e8dbb973229a4299d/raw/AppTest.java -o ./app/src/test/java/se/iths/AppTest.java
>curl -L https://gist.github.com/miwashiab/629757ac8e86e4caeab6835396be159b/raw/App.java -o ./app/src/main/java/se/iths/App.java
>curl -L https://gist.github.com/miwashiab/b1cf3a265791c60aa87aacbd3d257bff/raw/.gitignore -o .gitignore
>git init
>git add .
>git commit -m "Initial commit"

erDiagram
    Student ||--o{ StudentSchool : enrolls
    Student {
        int StudentId
        string FirstName
        string LastName
    }
    School ||--o{ StudentSchool : accepts
    School {
        int SchoolId
        string Name
        string City
    }
