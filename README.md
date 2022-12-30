# db20222

<h3><strong><em>CRUD JDBC GUIDE</em></strong></h3>

<h3><strong><em>Instructions</em></strong></h3>
<h4><strong><em>Step 1.</em></strong></h3>

>cd ~
>
>cd ws
>
>rm -rf edu-crud-jdbc
>
>mkdir edu-crud-jdbc
>
>cd edu-crud-jdbc
>
<h4><strong><em>Step 2.</em></strong></h4>

>mkdir -p ./app/src/main/{java/se/iths,resources}
>
>mkdir -p ./app/src/test/{java/se/iths,resources}
>
>touch ./app/src/main/java/se/iths/App.java
>
>touch ./app/src/test/java/se/iths/AppTest.java
>
>touch ./app/build.gradle
>
>echo "# edu-crud-jdbc" > README.md
>
>echo "rootProject.name = 'edu-jdbc-crud'\ninclude('app')" > settings.gradle
>

<h4><strong><em>Step 3.</em></strong></h4>

>curl -L https://gist.github.com/miwashiab/987826fc0f2df3cd686a755f38a1c504/raw/build.gradle -o ./app/build.gradle
>
>curl -L https://gist.github.com/miwashiab/0ca40c177e62925e8dbb973229a4299d/raw/AppTest.java -o ./app/src/test/java/se/iths/AppTest.java
>
>curl -L https://gist.github.com/miwashiab/629757ac8e86e4caeab6835396be159b/raw/App.java -o ./app/src/main/java/se/iths/App.java
>
>curl -L https://gist.github.com/miwashiab/b1cf3a265791c60aa87aacbd3d257bff/raw/.gitignore -o .gitignore
>
>git init
>
>git add .
>
>git commit -m "Initial commit"
>

<h3><strong><em>Borrow drivers for jdbc to MySQL</em></strong></h3>

>Open vi ./app/build.gradle
>
>implementation group: 'mysql', name: 'mysql-connector-java', version: '8.0.30'
>

<h3><strong><em>AppTest.Java</h3></strong></em>

>Open vi ./app/src/test/java/se/iths/AppTest.java

[![](https://mermaid.ink/img/pako:eNp1ULsKwzAM_BWjuf0Bry2FQumSNYuwldTg2MGWh5Dk3-skLn1r0p1Op0MjKK8JJFA4GmwDdrUTuSpOmhyLadrv_fiAlbp5b4UU5IK3Nr5rxw0uZTIs9Fk_6cjBuFacTIh8xY6-Jhd8HczFf7v6JwoqRT3HN-lnkpX9EeRnhoPhodyHHXQUOjQ6f2g1rYFvlJdA5lZTg8lyDbVbpJjYV4NTIDkk2kHqNTKVt4Js0Eaa71BAdjc?type=png)](https://mermaid.live/edit#pako:eNp1ULsKwzAM_BWjuf0Bry2FQumSNYuwldTg2MGWh5Dk3-skLn1r0p1Op0MjKK8JJFA4GmwDdrUTuSpOmhyLadrv_fiAlbp5b4UU5IK3Nr5rxw0uZTIs9Fk_6cjBuFacTIh8xY6-Jhd8HczFf7v6JwoqRT3HN-lnkpX9EeRnhoPhodyHHXQUOjQ6f2g1rYFvlJdA5lZTg8lyDbVbpJjYV4NTIDkk2kHqNTKVt4Js0Eaa71BAdjc)
