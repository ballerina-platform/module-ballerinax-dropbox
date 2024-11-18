// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/io;
import ballerinax/dropbox;

configurable string token = ?;

final dropbox:Client dropbox = check new ({
    auth: {
        token
    }
});

public type fetch_response record {
    string cursor;
    boolean has_more;
}|error?;

public function main() returns error? {
    string path = ""; // Folder path for which you want to list files and folders

    io:println("Making the first API call to list folder contents");
    dropbox:ListFolderResult response = check dropbox->/files/list_folder.post(payload = {path});
    print_entries(response.entries);

    boolean? has_more = response.has_more;
    while (has_more !is () && has_more && response.cursor !is ()) {
        io:println("Making a continuation API call with cursor");
        response = check dropbox->/files/list_folder/'continue.post(payload = {cursor: response.cursor});
        print_entries(response.entries);
        has_more = response.has_more;
    }
}

function print_entries(dropbox:Metadata[]? entries) {
    if entries is () {
        io:println("Error: No entries in response");
    } else {
        foreach var entry in entries {
            io:println(entry.name);
        }
    }
}
