<h3><strong><em>Entity Relationship Diagram</h3></strong></em>
<h4><strong><em>Redovisning</h4></strong></em>

```mermaid
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

```

[![](https://mermaid.ink/img/pako:eNp1ULsKwzAM_BWjuf0Bry2FQumSNYuwldTg2MGWh5Dk3-skLn1r0p1Op0MjKK8JJFA4GmwDdrUTuSpOmhyLadrv_fiAlbp5b4UU5IK3Nr5rxw0uZTIs9Fk_6cjBuFacTIh8xY6-Jhd8HczFf7v6JwoqRT3HN-lnkpX9EeRnhoPhodyHHXQUOjQ6f2g1rYFvlJdA5lZTg8lyDbVbpJjYV4NTIDkk2kHqNTKVt4Js0Eaa71BAdjc?type=png)](https://mermaid.live/edit#pako:eNp1ULsKwzAM_BWjuf0Bry2FQumSNYuwldTg2MGWh5Dk3-skLn1r0p1Op0MjKK8JJFA4GmwDdrUTuSpOmhyLadrv_fiAlbp5b4UU5IK3Nr5rxw0uZTIs9Fk_6cjBuFacTIh8xY6-Jhd8HczFf7v6JwoqRT3HN-lnkpX9EeRnhoPhodyHHXQUOjQ6f2g1rYFvlJdA5lZTg8lyDbVbpJjYV4NTIDkk2kHqNTKVt4Js0Eaa71BAdjc)
