// This file contains your Data Connector logic
[Version = "1.0.0"]
section OpenApiConnector;

[DataSource.Kind = "OpenApiConnector", Publish = "OpenApiConnector.Publish"]
shared OpenApiConnector.Contents = Value.ReplaceType(OpenApiConnectorImpl, OpenApiConnectorType);

OpenApiConnectorType = type function (
    openApiJson as (
        type text meta [
            Documentation.FieldCaption = Extension.LoadString("Parameters.OpenApiJson.Title"),
            Documentation.FieldDescription = Extension.LoadString("Parameters.OpenApiJson.Description"),
            Documentation.SampleValues = {
                "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/examples/v2.0/json/petstore-simple.json"
            }
        ]
    ),
    optional bearerToken as (
        type text meta [
            Documentation.FieldCaption = Extension.LoadString("Parameters.BearerToken.Title"),
            Documentation.FieldDescription = Extension.LoadString("Parameters.BearerToken.Description"),
            Documentation.SampleValues = {"<Bearer Token>"}
        ]
    )
) as table meta [
    Documentation.Name = Extension.LoadString("Title"),
    Documentation.LongDescription = Extension.LoadString("Description")
];

OpenApiConnectorImpl = (openApiJson as text, optional bearerToken as text) as table =>
    let
        apiContents = Web.Contents(openApiJson),
        header = if (bearerToken = null) then null else [#"Authorization" = "Bearer " & bearerToken],
        api = OpenApi.Document(
            apiContents,
            [
                ManualCredentials = true,
                IncludeMoreColumns = true,
                IncludeExtensions = true,
                Headers = header
            ]
        )
    in
        api;

// Data Source Kind description
OpenApiConnector = [
    Label = Extension.LoadString("Title"),
    Authentication = [
        Anonymous = []
    ]
];

// Data Source UI publishing description
OpenApiConnector.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = {Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp")},
    LearnMoreUrl = Extension.LoadString("Url"),
    SourceImage = OpenApiConnector.Icons,
    SourceTypeImage = OpenApiConnector.Icons
];

OpenApiConnector.Icons = [
    Icon16 = {
        Extension.Contents("OpenApiConnector16.png"),
        Extension.Contents("OpenApiConnector20.png"),
        Extension.Contents("OpenApiConnector24.png"),
        Extension.Contents("OpenApiConnector32.png")
    },
    Icon32 = {
        Extension.Contents("OpenApiConnector32.png"),
        Extension.Contents("OpenApiConnector40.png"),
        Extension.Contents("OpenApiConnector48.png"),
        Extension.Contents("OpenApiConnector64.png")
    }
];
