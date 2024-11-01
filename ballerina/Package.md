## Overview

[Dropbox](https://www.dropbox.com/) cloud storage service that allows users to store, share, and manage files online.

The `ballerinax/dropbox` package offers APIs to connect and interact with [Dropbox API](https://www.dropbox.com/developers/documentation/http/documentation) endpoints, specifically based on [Dropbox API v2](https://dropbox.github.io/dropbox-api-v2-explorer/).


## Setup guide

To use the Dropbox connector, you must have access to the Dropbox API. Dropbox uses OAuth 2.0, an open specification, to authorize access to data. To get an OAuth token from Dropbox to enable Dropbox Connector to access your Dropbox account via the API you’ll need to create a new app on the DBX Platform.

### Creating an App on the DBX Platform

Navigate to https://www.dropbox.com/developers/apps and select “Create app”. 
1. Choose an API  
2. Choose the type of access you need 
3. Give your app a name  
4. Choose the Dropbox account that will own your app  

For reference, please use the [Dropbox OAuth guide](https://www.dropbox.com/lp/developers/reference/oauth-guide).

### Generating an Access Token

Once you select “Create app”, a page will load that displays information about your newly created app. To generate an access token scroll down to “OAuth 2” and click “Generate” beneath “Generated access token.” The token will display as a long string of characters. Copy this token for use with the Dropbox connector.


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
configurable http:BearerTokenConfig & readonly authConfig = ?
dropbox:ConnectionConfig config = {auth: authConfig};

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
