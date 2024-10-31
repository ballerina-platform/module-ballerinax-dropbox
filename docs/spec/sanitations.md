_Author_:  @rahul1995 \
_Created_: 2024/10/25 \
_Updated_: 2024/10/25 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from Dropbox. 
The OpenAPI specification is obtained from https://www.postman.com/dropbox-api/dropbox-s-public-workspace/collection/q1zdtug/dropbox-api-reference.
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. **Change the `url` property of the `servers` object**:
    - **Original**:
        1. `https://api.dropboxapi.com`,
        2. `https://content.dropboxapi.com`
        3. `https://notify.dropboxapi.com`
    - **Updated**:
        1. `https://api.dropboxapi.com/2`,
        2. `https://content.dropboxapi.com/2`
        3. `https://notify.dropboxapi.com/2`
    - **Reason**: This change is made to ensure that all API paths are relative to the versioned base URL (`/2`), which improves the consistency and usability of the APIs.
    
2. **Update API Paths**:
   - **Original**: Paths included the version prefix in each endpoint (e.g., `/2/files/list_folder`).
   - **Updated**: Paths are modified to remove the version prefix from the endpoints, as it is now included in the base URL. For example:
     - **Original**: `/2/files/list_folder`
     - **Updated**: `/files/list_folder`
   - **Reason**: This modification simplifies the API paths, making them shorter and more readable. It also centralizes the versioning to the base URL, which is a common best practice.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/openapi.yaml --mode client  --license docs/license.txt -o ballerina
```
Note: The license year is hardcoded to 2024, change if necessary.
