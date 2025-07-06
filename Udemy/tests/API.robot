*** Settings ***
Library       Collections
Library       RequestsLibrary

*** Variables ***
${baseUrl}    https://jsonplaceholder.typicode.com

*** Test Cases ***
#API CRUD Operations
GET operation
    ${get_response}=    GET    ${baseUrl}/posts/2   expected_status=200
    Log    ${get_response.json()}

POST operation
    &{mydata}=    Create Dictionary    name=Wasim Shaikh    course=api automation
    ${post_response}=    POST    ${baseUrl}/posts    json=${mydata}    expected_status=201
    Log    ${post_response.json()}
    Dictionary Should Contain Key    ${post_response.json()}    id
    ${userID}=    Get From Dictionary    ${post_response.json()}    id
    Log    ${userID}
    Should Be Equal As Strings    101    ${userID}
    Status Should Be    201    ${post_response}

PUT Operation
    &{myNewData}=    Create Dictionary    name=Wasim Shaikh    job=SDET    request=This is a Put request
    ${put_response}=    PUT    ${baseUrl}/posts/2    json=${myNewData}    expected_status=200
    Log        ${put_response.json()}

PATCH Operation
    &{myPartialData}=    Create Dictionary    name=Wasim Shaikh    body=This is a Patch request
    ${patch_response}=    PATCH    ${baseUrl}/posts/2    json=${myPartialData}    expected_status=200
    Log        ${patch_response.json()}

DELETE Operation
    ${delete_request}=    DELETE    ${baseUrl}/posts/2    expected_status=200
    Status Should Be    200    ${delete_request}
    Log    ${delete_request.json()}
#    3 different ways to validate the empty dictionary
    Should Be Empty    ${delete_request.json()}

    ${dict_len}=    Get Length    ${delete_request.json()}
    Should Be Equal As Integers    0    ${dict_len}

    Length Should Be    ${delete_request.json()}    0