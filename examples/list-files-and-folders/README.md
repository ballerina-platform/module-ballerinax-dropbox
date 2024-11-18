## List files and folders in a Folder

This use case demonstrates how the Dropbox API can be utilized to list all the files and subfolders within a specific folder in your Dropbox account. The Dropbox API for listing a folder involves pagination, i.e. only few items are fetched at a time alongwith a cursor which can be utilized to fetch next set of items. This example leverages this same flow to fetch all the items (files/folders) present at a given folder path.

## Prerequisites

### 1. Setup Dropbox developer account

Refer to the [Setup guide](https://central.ballerina.io/ballerinax/dropbox/latest#setup-guide) to obtain the access token.

### 2. Configuration

Create a `Config.toml` file in the example's root directory and, provide the access token for your Dropbox account as follows:

```toml
token = "<Access Token>"
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```