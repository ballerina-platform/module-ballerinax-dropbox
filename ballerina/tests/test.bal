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

import ballerina/http;
import ballerina/os;
import ballerina/test;

configurable boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
configurable http:BearerTokenConfig & readonly authConfig = {
    token: isLiveServer ? os:getEnv("DROPBOX_TOKEN") : "test"
};
ConnectionConfig config = {auth: authConfig};
final Client apiClient = check new Client(config, serviceUrl = isLiveServer ? "https://api.dropboxapi.com/2" : "http://localhost:9090");
final Client contentClient = check new Client(config, serviceUrl = isLiveServer ? "https://content.dropboxapi.com/2" : "http://localhost:9090");

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testGetSpaceUsage() returns error? {
    SpaceUsage response = check apiClient->/users/get_space_usage.post();

    test:assertTrue(response?.allocation !is ());
    test:assertTrue(response?.used !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testUnshareFile() returns error? {
    check apiClient->/sharing/unshare_file.post(payload = {
        file: "id:a8oZ8ixm4ZYAAAAAAAAACA"
    });
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testDeleteV2() returns error? {
    MetadataResult response = check apiClient->/files/delete_v2.post(payload = {
        path: "/Test_Delete"
    });

    test:assertTrue(response?.metadata !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testMove() returns error? {
    MetadataResult response = check apiClient->/files/move_v2.post(
        payload = {
            from_path: "/FolderA",
            to_path: "/FolderB"
        }
    );

    test:assertTrue(response?.metadata !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testDownload() returns error? {
    FileMetadata response = check contentClient->/files/download.post(headers = {
        dropbox\-api\-arg: "{\"path\": \"/Icons/icon.png\"}"
    });

    test:assertTrue(response?.name !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testGetFileMetadata() returns error? {
    SharedFileMetadata response = check apiClient->/sharing/get_file_metadata.post(payload = {
        file: "id:a8oZ8ixm4ZYAAAAAAAAACA"
    });

    test:assertTrue(response?.name !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testUpload() returns error? {
    json params = {
        "path": "/Homework/math/Matrices.txt",
        "mode": "add",
        "autorename": true,
        "mute": false,
        "strict_conflict": false
    };
    FileMetadata response = check contentClient->/files/upload.post(
        headers = {
            dropbox\-api\-arg: params.toString()
        }
    );

    test:assertTrue(response?.name !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testListFolder() returns error? {
    ListFolderResult response = check apiClient->/files/list_folder.post(payload = {
        path: ""
    });

    test:assertTrue(response?.entries !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testSearch() returns error? {
    SearchV2Result response = check apiClient->/files/search_v2.post(payload = {
        query: "Ico"
    });

    test:assertTrue(response?.matches !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testSetProfilePhoto() returns error? {
    SetProfilePhotoResult response = check apiClient->/account/set_profile_photo.post(
        payload = {
            "photo": {
                ".tag": "base64_data",
                "base64_data": "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" // Dropbox icon converted to Base64
            }
        }
    );

    test:assertTrue(response?.profile_photo_url !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testGetMetadata() returns error? {
    Metadata response = check apiClient->/files/get_metadata.post(
        payload = {
            "path": "/Icons/icon.png",
            "include_media_info": false,
            "include_deleted": false,
            "include_has_explicit_shared_members": false
        }
    );

    test:assertTrue(response?.name !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testUnshareFolder() returns error? {
    GenericResponseWithTag response = check apiClient->/sharing/unshare_folder.post(
        payload = {
            leave_a_copy: false,
            shared_folder_id: "11860807793"
        }
    );

    test:assertTrue(response?.\.tag !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testCreateFolder() returns error? {
    FolderMetadataResponse response = check apiClient->/files/create_folder_v2.post(
        payload = {
            path: "/Test_Create_Folder",
            autorename: true
        }
    );

    test:assertTrue(response?.metadata !is ());
}
