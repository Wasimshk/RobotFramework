*** Settings ***
Documentation    this is the first script
Library    SeleniumLibrary
Test Teardown    Close Browser
Test Template    Validate Unsuccessful Login

*** Variables ***
${loginErrorMessageLoc}    css:.alert-danger

*** Test Cases ***      username       password
Invalid Username        wasims         learning
Invalid Password        rahulshetty    2312312
Spacial Characters      @$#!           learning

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    Open Browser With The URL
    Add Login Details    ${username}    ${password}
    Wait until error message pops up
    Verify if the error message is correct

Open Browser With The URL
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Add Login Details
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

Wait until error message pops up
    Wait Until Element Is Visible    ${loginErrorMessageLoc}

Verify if the error message is correct
    Element Text Should Be    ${loginErrorMessageLoc}    Incorrect username/password.