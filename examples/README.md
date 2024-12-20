# Examples

The `ballerinax/dropbox` connector provides practical examples illustrating usage in various scenarios.

1. [Create folder in Dropbox](https://github.com/ballerina-platform/module-ballerinax-dropbox/tree/main/examples/create-folder) - Create a new folder in your Dropbox account.

2. [List folder contents in Dropbox](https://github.com/ballerina-platform/module-ballerinax-dropbox/tree/main/examples/list-files-and-folders) - Retrieve and display all files and subfolders within a specific folder in your Dropbox account.

## Prerequisites

1. Generate Dropbox access token to authenticate the connector as described in the [Setup guide](https://central.ballerina.io/ballerinax/dropbox/latest#setup-guide).
2. For each example, create a `Config.toml` file to add the configuration parameters. Here's an example of how your `Config.toml` file should look like:

```toml
token = "<Access Token>"
```

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
