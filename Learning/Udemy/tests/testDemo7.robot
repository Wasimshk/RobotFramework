*** Settings ***
Library       Collections
Library       RequestsLibrary

*** Variables ***
${base_url}    http://216.10.245.166
${base_url2}    https://jsonplaceholder.typicode.com
${bookID}
${bookID2}

*** Test Cases ***
Play around with Dictionary
    &{data}=    Create Dictionary    name=WasimShaikh    course=robot    website=wasimshaikh.com
    log     ${data}
    Dictionary Should Contain Key    ${data}    name
#    ways to get the value from the s dictionary
    log    ${data['name']}
    Log    ${data}[name]
    ${name}=    Get From Dictionary    ${data}    name
    Log    ${name}

Post Book into Library DataBase
    &{myBook}=    Create Dictionary    name=Learn Appium Automation with Java    isbn=123    aisle=1232312      author=Wasim Shaikh
    ${response}=    POST    ${base_url}/Library/Addbook.php    json=${myBook}    expected_status=200
    Log    ${response.json()}
    Dictionary Should Contain Key    ${response.json()}    ID
    ${bookID}=    Get From Dictionary    ${response.json()}    ID
    Set Global Variable    ${bookID}
    log    ${bookID}
    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
    Status Should Be    200    ${response}

Get Book from Library DataBase
    ${Getresponse}=    GET    ${base_url}/Library/GetBook.php    params=ID-${bookID}    expected_status=200
    Log    ${Getresponse.json()}

Delete the book from database
    &{delete_req}=    Create Dictionary    ID=${bookID}
    ${delete_resp}=    POST       ${base_url}/Library/DeleteBook.php    json=${delete_req}    expected_status=200
    log    ${delete_resp.json()}
#    Should Be Equal As Strings


#Post Book into Library DataBase
#    &{myBook1}=    Create Dictionary    name=Learn robot Framework      author=Wasim Shaikh
#    ${response}=    POST    ${base_url2}/posts    json=${myBook1}    expected_status=201
#    Log    ${response.json()}
#    Dictionary Should Contain Key    ${response.json()}    id
#    ${bookID2}=    Get From Dictionary    ${response.json()}    id
#    Set Global Variable    ${bookID2}
#    log    ${bookID2}
#    Status Should Be    201    ${response}
#
#Get Book from Library DataBase
#    ${Getresponse}=    GET    ${base_url2}/posts/99    expected_status=200
#    Log    ${Getresponse.json()}

