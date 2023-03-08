Create a sequence diagram explaining the behaviour of your 
program when a request is sent to POST /artists. Make sure 
your diagram all includes the following:

The HTTP Client
The Application class (app.rb)
The Repository class (artist_repository.rb)
The Database

The HTTP Request and the data it contains
The HTTP Response and the data it contains

```mermaid

sequenceDiagram

    participant C as HTTP Client
    participant A as Application (app.rb)
    participant R as Repository class ( artist_repository.rb)
    participant D as Postgres database
    Note left of C: Flow of time <br />⬇ <br /> ⬇ <br /> ⬇ 

    C->>A: HTTP (POST) request with data
    A->>R: Method call (post /artists)
    R->>D: SQL query (INSERT INTO artists VALUES())
    D->>R: Result ("")
    R->>A: Return value ("")
    A->>C: HTTP response
    
    
    C->>A: HTTP (GET) request with data
    A->>R: Method call (get /artists)
    R->>D: SQL query (SELECT * FROM artists)
    D->>R: Result ("a, b, c, D")
    R->>A: Return value ("a, b, c, D")
    A->>C: HTTP response




```
<!-- Syntax:  
X->>Y: What happens
-->