import ballerina/io;
import ballerinax/dropbox;

configurable string token = ?;
dropbox:Client dropbox = check new ({
    auth: {
        token
    }
});

public function main() returns error? {
    string path = "/Home/New_Folder"; // Folder path to create

    dropbox:inline_response_200_14 response = check dropbox->/files/create_folder_v2.post(payload = {
        autorename: true,
        path
    });

    io:println(`Folder created: ${response?.metadata?.name}`);
}
