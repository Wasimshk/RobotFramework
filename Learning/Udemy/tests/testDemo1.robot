*** Settings ***
Documentation    this is the first script
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${loginErrorMessageLoc}    css:.alert-danger


*** Test Cases ***
Validate Unsuccessful Login
    Open Browser With The URL
    Add Login Details
    Wait until error message pops up
    Verify if the error message is correct

*** Keywords ***
Open Browser With The URL
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/
#    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    Edge

Add Login Details
# for element ID specifying the locator type is not needed.
#    Input Text    username    WasimShaikh
    Input Text    id:username    WasimShaikh
    Input Password    id:password    123456
    Click Button    signInBtn

Wait until error message pops up
    Wait Until Element Is Visible    ${loginErrorMessageLoc}
#    Sleep    2s

Verify if the error message is correct
#    ${result}=     Get Text    ${loginErrorMessageLoc}
#    Should Be Equal As Strings    ${result}    Incorrect username/password.
# above and below both are ways to compare and validate the stings
    Element Text Should Be    ${loginErrorMessageLoc}    Incorrect username/password.


