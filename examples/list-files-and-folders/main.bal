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

    io:println("First call...");
    dropbox:ListFolderResponse response = check dropbox->/files/list_folder.post(payload = {path});
    print_entries(response.entries);

    boolean? has_more = response.has_more;
    while (has_more !is () && has_more && response.cursor !is ()) {
        io:println("Next call...");
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
