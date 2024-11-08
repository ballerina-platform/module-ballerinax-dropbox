# Running Tests

## Prerequisites
You need an Access Token to access the Dropbox account via API.

To do this, refer to [Ballerina Dropbox Connector](https://github.com/ballerina-platform/module-ballerinax-dropbox/blob/main/ballerina/Module.md).

# Running Tests

There are two test environments for running the Dropbox connector tests. The default test environment is the mock server for Dropbox API. The other test environment is the actual Dropbox API. 

You can run the tests in either of these environments and each has its own compatible set of tests.

 Test Groups | Environment                                       
-------------|---------------------------------------------------
 mock_tests  | Mock server for Dropbox API (Defualt Environment) 
 live_tests  | Dropbox API                                       

## Running Tests in the Mock Server

To execute the tests on the mock server, ensure that the `IS_LIVE_SERVER` environment variable is either set to `false` or unset before initiating the tests. 

This environment variable can be configured within the `Config.toml` file located in the tests directory or specified as an environmental variable.

#### Using a Config.toml File

Create a `Config.toml` file in the tests directory and the following content:

```toml
isLiveServer = false
```

#### Using Environment Variables

Alternatively, you can set your authentication credentials as environment variables:
If you are using linux or mac, you can use following method:
```bash
   export IS_LIVE_SERVER=false
```
If you are using Windows you can use following method:
```bash
   setx IS_LIVE_SERVER false
```
Then, run the following command to run the tests:

```bash
   ./gradlew clean test
```

## Running Tests Against Dropbox Live API

#### Using a Config.toml File

Create a `Config.toml` file in the tests directory and add your authentication credentials a

```toml
   isLiveServer = true
   
   [authConfig]
   token = "<your-dropbox-access-token>"
```

#### Using Environment Variables

Alternatively, you can set your authentication credentials as environment variables:
If you are using linux or mac, you can use following method:
```bash
   export IS_LIVE_SERVER=true
   export DROPBOX_TOKEN ="<your-dropbox-access-token>"
```

If you are using Windows you can use following method:
```bash
   setx IS_LIVE_SERVER true
   setx DROPBOX_TOKEN <your-dropbox-access-token>
```
Then, run the following command to run the tests:

```bash
   ./gradlew clean test 
```