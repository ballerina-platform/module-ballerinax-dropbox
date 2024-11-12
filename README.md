# Ballerina Dropbox connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-dropbox/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-dropbox/actions/workflows/ci.yml)
[![Trivy](https://github.com/ballerina-platform/module-ballerinax-dropbox/actions/workflows/trivy-scan.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-dropbox/actions/workflows/trivy-scan.yml)
[![GraalVM Check](https://github.com/ballerina-platform/module-ballerinax-dropbox/actions/workflows/build-with-bal-test-graalvm.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-dropbox/actions/workflows/build-with-bal-test-graalvm.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-dropbox.svg)](https://github.com/ballerina-platform/module-ballerinax-dropbox/commits/master)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/dropbox.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%dropbox)

## Overview

[Dropbox](https://www.dropbox.com/) cloud storage service that allows users to store, share, and manage files online.

The `ballerinax/dropbox` package offers APIs to connect and interact with [Dropbox API](https://www.dropbox.com/developers/documentation/http/documentation) endpoints, specifically based on [Dropbox API v2](https://dropbox.github.io/dropbox-api-v2-explorer/).


## Setup guide

To use the Dropbox connector, you must have access to the Dropbox API. Dropbox uses OAuth 2.0, an open specification, to authorize access to data. To get an OAuth token from Dropbox to enable Dropbox Connector to access your Dropbox account via the API you’ll need to create a new app on the DBX Platform.

### Creating an App on the DBX Platform

1. Navigate to https://www.dropbox.com/developers/apps and sign up to create an account (or log in if you already have an account)
<img src=https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-dropbox/main/docs/setup/resources/dropbox-developer-portal.png alt="Dropbox Developer Portal" style="width: 70%;">

2. Select “Create app”.
<img src=https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-dropbox/main/docs/setup/resources/dropbox-apps-dashboard.png alt="Dropbox Apps Dashboard" style="width: 70%;">

3. Choose an API, type of access you need, and give your app a name.
<img src=https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-dropbox/main/docs/setup/resources/create-app-page.png alt="Create App Page" style="width: 70%;"> 

For reference, please use the [Dropbox OAuth guide](https://www.dropbox.com/lp/developers/reference/oauth-guide).

### Generating an Access Token

Once you select “Create app”, a page will load that displays information about your newly created app. To generate an access token scroll down to “OAuth 2” and click “Generate” beneath “Generated access token.” The token will display as a long string of characters. Copy this token for use with the Dropbox connector.
<img src=https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-dropbox/main/docs/setup/resources/app-settings.png alt="App Settings" style="width: 70%;">


## Quickstart

To use the `Dropbox` connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

Import the `dropbox` module.
```ballerina
import ballerinax/dropbox;
```

### Step 2: Instantiate a new connector

1. Create a `Config.toml` file and, configure the obtained credentials in the above steps as follows:

```toml
[authConfig]
token = "<Enter your token here>"
```

2. Create a dropbox:ConnectionConfig with the obtained access token and initialize the connector with it.

```ballerina
configurable string token = ?;
dropbox:ConnectionConfig config = {auth: {token}};

final dropbox:Client dropbox = check new(config, serviceUrl = "https://api.dropboxapi.com/2");
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations.

**Create a Folder**
```ballerina
public function main() returns error? {
    dropbox:FolderMetadataResponse createFolder = check dropbox->/files/create_folder_v2.post(
        payload = {
            path: "/path/to/folder",
            autorename: true
        }
    );
}
```

### Step 4: Run the Ballerina application

```ballerina
bal run
```


## Examples

The `Dropbox` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/module-ballerinax-dropbox/tree/main/examples/), covering the following use cases:

[//]: # (TODO: Add examples)

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 17. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`dropbox` package](https://central.ballerina.io/ballerinax/dropbox/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
