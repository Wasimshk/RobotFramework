*** Settings ***
Documentation    this is the first script
Library    SeleniumLibrary
Library    Collections
Library    String
Test Setup    Open Browser With The URL
Test Teardown    Close Browser
Resource    resource.robot

*** Test Cases ***
Validate Child Window Functionality
    Select the link of child window
    Verify the user switched to Child Window
    grab the email id in the child window
    Switch to parent window and enter the Email
    
*** Keywords ***
Select the link of child window
    Click Element    xpath://*[contains(text(), 'ResumeAssistance')]
    Sleep    5
Verify the user switched to Child Window
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

grab the email id in the child window
    ${text}=    Get Text    css:.red
    @{wordslist}=    Split String    ${text}    at
    ${text_split}=    Get From List    ${wordslist}    1
    Log    ${text_split}
    @{wordslist2}=    Split String    ${text_split}
    ${Email}=    Get From List    ${wordslist2}    0
    Log    ${Email}
    Set Global Variable    ${Email}

Switch to parent window and enter the Email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${Email}
    Sleep    2