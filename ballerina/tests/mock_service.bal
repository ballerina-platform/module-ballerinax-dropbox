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
import ballerina/log;

listener http:Listener httpListener = new (9090);

http:Service mockService = service object {
    # set_profile_photo
    #
    # + return - set_profile_photo response 
    resource function post account/set_profile_photo(@http:Payload SetProfilePhotoArg payload) returns SetProfilePhotoResult|http:Response {
        return {
            "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
        };
    }

    # create_folder
    #
    # + return - create_folder response 
    resource function post files/create_folder_v2(@http:Payload CreateFolderArg payload) returns FolderMetadataResponse|http:Response {
        return {
            "metadata": {
                "name": "math",
                "id": "id:a4ayc_80_OEAAAAAAAAAXz",
                "path_lower": "/homework/math",
                "path_display": "/Homework/math",
                "sharing_info": {
                    "read_only": false,
                    "parent_shared_folder_id": "84528192421",
                    "traverse_only": false,
                    "no_access": false
                },
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa",
                        "fields": [
                            {
                                "name": "Security Policy",
                                "value": "Confidential"
                            }
                        ]
                    }
                ]
            }
        };
    }

    # delete
    #
    # + return - delete response 
    resource function post files/delete_v2(@http:Payload DeleteArg payload) returns MetadataResult|http:Response {
        return {
            "metadata": {
                ".tag": "file",
                "name": "Prime_Numbers.txt",
                "id": "id:a4ayc_80_OEAAAAAAAAAXw",
                "client_modified": "2015-05-12T15:50:38Z",
                "server_modified": "2015-05-12T15:50:38Z",
                "rev": "a1c10ce0dd78",
                "size": 7212,
                "path_lower": "/homework/math/prime_numbers.txt",
                "path_display": "/Homework/math/Prime_Numbers.txt",
                "sharing_info": {
                    "read_only": true,
                    "parent_shared_folder_id": "84528192421",
                    "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                },
                "is_downloadable": true,
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa",
                        "fields": [
                            {
                                "name": "Security Policy",
                                "value": "Confidential"
                            }
                        ]
                    }
                ],
                "has_explicit_shared_members": false,
                "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
                "file_lock_info": {
                    "is_lockholder": true,
                    "lockholder_name": "Imaginary User",
                    "created": "2015-05-12T15:50:38Z"
                }
            }
        };
    }

    # download
    #
    # + return - download response 
    resource function post files/download(@http:Header string? dropbox\-api\-arg) returns FileMetadata|http:Response {
        return {
            "name": "Prime_Numbers.txt",
            "id": "id:a4ayc_80_OEAAAAAAAAAXw",
            "client_modified": "2015-05-12T15:50:38Z",
            "server_modified": "2015-05-12T15:50:38Z",
            "rev": "a1c10ce0dd78",
            "size": 7212,
            "path_lower": "/homework/math/prime_numbers.txt",
            "path_display": "/Homework/math/Prime_Numbers.txt",
            "sharing_info": {
                "read_only": true,
                "parent_shared_folder_id": "84528192421",
                "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
            },
            "is_downloadable": true,
            "property_groups": [
                {
                    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa",
                    "fields": [
                        {
                            "name": "Security Policy",
                            "value": "Confidential"
                        }
                    ]
                }
            ],
            "has_explicit_shared_members": false,
            "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
            "file_lock_info": {
                "is_lockholder": true,
                "lockholder_name": "Imaginary User",
                "created": "2015-05-12T15:50:38Z"
            }
        };
    }

    # get_metadata
    #
    # + return - get_metadata response 
    resource function post files/get_metadata(@http:Payload GetMetadataArg payload) returns Metadata|http:Response {
        return {
            ".tag": "file",
            "name": "Prime_Numbers.txt",
            "id": "id:a4ayc_80_OEAAAAAAAAAXw",
            "client_modified": "2015-05-12T15:50:38Z",
            "server_modified": "2015-05-12T15:50:38Z",
            "rev": "a1c10ce0dd78",
            "size": 7212,
            "path_lower": "/homework/math/prime_numbers.txt",
            "path_display": "/Homework/math/Prime_Numbers.txt",
            "sharing_info": {
                "read_only": true,
                "parent_shared_folder_id": "84528192421",
                "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
            },
            "is_downloadable": true,
            "property_groups": [
                {
                    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa",
                    "fields": [
                        {
                            "name": "Security Policy",
                            "value": "Confidential"
                        }
                    ]
                }
            ],
            "has_explicit_shared_members": false,
            "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
            "file_lock_info": {
                "is_lockholder": true,
                "lockholder_name": "Imaginary User",
                "created": "2015-05-12T15:50:38Z"
            }
        };
    }

    # list_folder
    #
    # + return - list_folder response 
    resource function post files/list_folder(@http:Payload ListFolderArg payload) returns ListFolderResult|http:Response {
        return {
            "entries": [
                {
                    ".tag": "file",
                    "name": "Prime_Numbers.txt",
                    "id": "id:a4ayc_80_OEAAAAAAAAAXw",
                    "client_modified": "2015-05-12T15:50:38Z",
                    "server_modified": "2015-05-12T15:50:38Z",
                    "rev": "a1c10ce0dd78",
                    "size": 7212,
                    "path_lower": "/homework/math/prime_numbers.txt",
                    "path_display": "/Homework/math/Prime_Numbers.txt",
                    "sharing_info": {
                        "read_only": true,
                        "parent_shared_folder_id": "84528192421",
                        "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                    },
                    "is_downloadable": true,
                    "property_groups": [
                        {
                            "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa",
                            "fields": [
                                {
                                    "name": "Security Policy",
                                    "value": "Confidential"
                                }
                            ]
                        }
                    ],
                    "has_explicit_shared_members": false,
                    "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
                    "file_lock_info": {
                        "is_lockholder": true,
                        "lockholder_name": "Imaginary User",
                        "created": "2015-05-12T15:50:38Z"
                    }
                },
                {
                    ".tag": "folder",
                    "name": "math",
                    "id": "id:a4ayc_80_OEAAAAAAAAAXz",
                    "path_lower": "/homework/math",
                    "path_display": "/Homework/math",
                    "sharing_info": {
                        "read_only": false,
                        "parent_shared_folder_id": "84528192421",
                        "traverse_only": false,
                        "no_access": false
                    },
                    "property_groups": [
                        {
                            "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa",
                            "fields": [
                                {
                                    "name": "Security Policy",
                                    "value": "Confidential"
                                }
                            ]
                        }
                    ]
                }
            ],
            "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu",
            "has_more": false
        };
    }

    # move
    #
    # + return - move response 
    resource function post files/move_v2(@http:Payload RelocationArg payload) returns MetadataResult|http:Response {
        return {
            "metadata": {
                ".tag": "file",
                "name": "Prime_Numbers.txt",
                "id": "id:a4ayc_80_OEAAAAAAAAAXw",
                "client_modified": "2015-05-12T15:50:38Z",
                "server_modified": "2015-05-12T15:50:38Z",
                "rev": "a1c10ce0dd78",
                "size": 7212,
                "path_lower": "/homework/math/prime_numbers.txt",
                "path_display": "/Homework/math/Prime_Numbers.txt",
                "sharing_info": {
                    "read_only": true,
                    "parent_shared_folder_id": "84528192421",
                    "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                },
                "is_downloadable": true,
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa",
                        "fields": [
                            {
                                "name": "Security Policy",
                                "value": "Confidential"
                            }
                        ]
                    }
                ],
                "has_explicit_shared_members": false,
                "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
                "file_lock_info": {
                    "is_lockholder": true,
                    "lockholder_name": "Imaginary User",
                    "created": "2015-05-12T15:50:38Z"
                }
            }
        };
    }

    # search
    #
    # + return - search response 
    resource function post files/search_v2(@http:Payload SearchV2Arg payload) returns SearchV2Result|http:Response {
        return {
            "matches": [
                {
                    "metadata": {
                        ".tag": "metadata",
                        "metadata": {
                            ".tag": "file",
                            "name": "Prime_Numbers.txt",
                            "id": "id:a4ayc_80_OEAAAAAAAAAXw",
                            "client_modified": "2015-05-12T15:50:38Z",
                            "server_modified": "2015-05-12T15:50:38Z",
                            "rev": "a1c10ce0dd78",
                            "size": 7212,
                            "path_lower": "/homework/math/prime_numbers.txt",
                            "path_display": "/Homework/math/Prime_Numbers.txt",
                            "sharing_info": {
                                "read_only": true,
                                "parent_shared_folder_id": "84528192421",
                                "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                            },
                            "is_downloadable": true,
                            "property_groups": [
                                {
                                    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa",
                                    "fields": [
                                        {
                                            "name": "Security Policy",
                                            "value": "Confidential"
                                        }
                                    ]
                                }
                            ],
                            "has_explicit_shared_members": false,
                            "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
                            "file_lock_info": {
                                "is_lockholder": true,
                                "lockholder_name": "Imaginary User",
                                "created": "2015-05-12T15:50:38Z"
                            }
                        }
                    }
                }
            ],
            "has_more": false
        };
    }

    # upload
    #
    # + return - upload response 
    resource function post files/upload(@http:Header string? dropbox\-api\-arg) returns FileMetadata|http:Response {
        return {
            "name": "Prime_Numbers.txt",
            "id": "id:a4ayc_80_OEAAAAAAAAAXw",
            "client_modified": "2015-05-12T15:50:38Z",
            "server_modified": "2015-05-12T15:50:38Z",
            "rev": "a1c10ce0dd78",
            "size": 7212,
            "path_lower": "/homework/math/prime_numbers.txt",
            "path_display": "/Homework/math/Prime_Numbers.txt",
            "sharing_info": {
                "read_only": true,
                "parent_shared_folder_id": "84528192421",
                "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
            },
            "is_downloadable": true,
            "property_groups": [
                {
                    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa",
                    "fields": [
                        {
                            "name": "Security Policy",
                            "value": "Confidential"
                        }
                    ]
                }
            ],
            "has_explicit_shared_members": false,
            "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
            "file_lock_info": {
                "is_lockholder": true,
                "lockholder_name": "Imaginary User",
                "created": "2015-05-12T15:50:38Z"
            }
        };
    }

    # get_file_metadata
    #
    # + return - get_file_metadata response 
    resource function post sharing/get_file_metadata(@http:Payload GetFileMetadataArg payload) returns SharedFileMetadata|http:Response {
        return {
            "id": "id:3kmLmQFnf1AAAAAAAAAAAw",
            "name": "file.txt",
            "policy": {
                "acl_update_policy": {
                    ".tag": "owner"
                },
                "shared_link_policy": {
                    ".tag": "anyone"
                },
                "member_policy": {
                    ".tag": "anyone"
                },
                "resolved_member_policy": {
                    ".tag": "team"
                }
            },
            "preview_url": "https://www.dropbox.com/scl/fi/fir9vjelf",
            "access_type": {
                ".tag": "viewer"
            },
            "owner_display_names": [
                "Jane Doe"
            ],
            "owner_team": {
                "id": "dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I",
                "name": "Acme, Inc."
            },
            "path_display": "/dir/file.txt",
            "path_lower": "/dir/file.txt",
            "permissions": [],
            "time_invited": "2016-01-20T00:00:00Z"
        };
    }

    # unshare_file
    #
    resource function post sharing/unshare_file(@http:Payload UnshareFileArg payload) returns http:Ok {
        return http:OK;
    }

    # unshare_folder
    #
    # + return - unshare_folder response 
    resource function post sharing/unshare_folder(@http:Payload UnshareFolderArg payload) returns GenericResponseWithTag|http:Response {
        return {
            ".tag": "complete"
        };
    }

    # get_space_usage
    #
    # + return - get_space_usage response 
    resource function post users/get_space_usage() returns SpaceUsage|http:Response {
        return {
            "used": 314159265,
            "allocation": {
                ".tag": "individual",
                "allocated": 10000000000
            }
        };
    }
};

function init() returns error? {
    if isLiveServer {
        log:printInfo("Skiping mock server initialization as the tests are running on live server");
        return;
    }
    log:printInfo("Initiating mock server");
    check httpListener.attach(mockService, "/");
    check httpListener.'start();
}
