# Power Query Connector for OpenAPI

[![GitHub release](https://img.shields.io/github/release/jamesmcroft/power-query-connector-for-openapi.svg)](https://github.com/jamesmcroft/power-query-connector-for-openapi/releases)

A Power Query connector for retrieving data from an OpenAPI (Swagger) specification that uses Bearer authentication. **Note**, only the Swagger 2.0 specification is supported.

## Building

The connector is built using Power BI's Power Query M language and requires a **[Visual Studio Code extension to build](https://marketplace.visualstudio.com/items?itemName=PowerQuery.vscode-powerquery-sdk)**.

The main source code for the connector is contained in the **OpenApiConnector.pq** file. The additional **OpenApiConnector.query.pq** file can be used to evaluate and run tests.

To build the connector:

1. Open the **OpenApiConnector.pq** file
2. Perform the keyboard shortcut `CTRL+T`
3. In the input box that appears in VS Code, input `> Power query: Evaluate current power query file`

This should start the build of the connector, which will then output to the `bin\AnyCPU\Debug` folder.

## Usage

With the connector built, you can use it within Power BI Desktop.

> ⚠️ You'll need to close Power BI Desktop first before adding the custom connector.

To do this, you'll need to copy the `mez` connector file from the output and paste it into the **Custom Connectors** folder used by the Power BI. This is nested under the **Power BI Desktop** folder in your personal **Documents** folder.

```bash
C:\Users\<user>\Documents\Power BI Desktop\Custom Connectors
```

You can now load up Power BI Desktop and connect to an OpenAPI using the **OpenAPI (Beta)** connector when you get data. You can find this using the search function or under the **Other** category.
