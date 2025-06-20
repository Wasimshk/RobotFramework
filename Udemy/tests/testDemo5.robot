*** Settings ***
Documentation     This is the first script
Library           SeleniumLibrary
Library           DataDriver    file=resources/data.csv    encoding=utf_8    dialect=excel
Test Template     Validate Unsuccessful Login
Test Teardown     Close Browser

*** Variables ***
${loginErrorMessageLoc}    css:.alert-danger

*** Test Cases ***
Login with user ${username} and password ${password}        Default_Wasims        UserData_1234
#Login with user ${username} and password ${password}
#Login with user and password        Default_Wasims        UserData_1234
#${username} ${password}        Default_Wasims        UserData_1234

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn
    Wait Until Element Is Visible    ${loginErrorMessageLoc}
    Element Text Should Be           ${loginErrorMessageLoc}    Incorrect username/password.