// Use this file to write queries to test your data connector
let
    result = OpenApiConnector.Contents(
        "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/examples/v2.0/json/petstore-simple.json"
    )
in
    result
