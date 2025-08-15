*** Settings ***
Documentation    this is the first script
Library    SeleniumLibrary
Library    Collections
Test Setup    Open Browser With The URL
Test Teardown    Close Browser
Resource    resource.robot

*** Variables ***
${loginErrorMessageLoc}    css:.alert-danger
${ShopPageLoadLoc}    css:.nav-link
${CheckBoxLoc}    css:input[type=checkbox]
${AlertPopupLoc}    css:.modal-body


*** Test Cases ***
Validate Unsuccessful Login
    Add Login Details    ${Username}    ${InvalidPassword}
    Wait Until Element Is Visible    ${loginErrorMessageLoc}
    Verify if the error message is correct
    Sleep    2s

Validate Successful Login
    Add Login Details    ${Username}    ${ValidPassword}
    Wait Until Element Is Visible    ${ShopPageLoadLoc}
    Verify the Card Titles in the Shop Page
    Select the Card    Blackberry
    Sleep    2s
    
Select the form and navigate to child window
    Fill the login Details and Login Form
    Sleep    2s

*** Keywords ***
Add Login Details
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

Verify if the error message is correct
    Element Text Should Be    ${loginErrorMessageLoc}    Incorrect username/password.

#Handle Alert If Present
#    ${alert_present}=    Run Keyword And Return Status    Alert Should Be Present    timeout=5s
#    Run Keyword If    '${alert_present}' == 'True'    Handle Alert    action=DISMISS

Verify the Card Titles in the Shop Page
    @{ExpectedList} =	Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=    Get WebElements    css:.card-title
    @{ActualList}=    Create List
    FOR    ${element}    IN    @{elements}
        log    ${element.text}
        Append To List    ${ActualList}    ${element.text}
    END
    log     ${ActualList}
    Lists Should Be Equal    ${ExpectedList}    ${ActualList}

Select the Card
    [Arguments]    ${cardName}
    ${elements}=    Get WebElements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${element.text}' == '${cardName}'
        ${index}=    Evaluate    ${index}+1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill the login Details and Login Form
    Input Text    id:username    ${Username}
    Input Password    id:password    ${ValidPassword}
    Click Element    css:input[value='user']
    Wait Until Element Is Visible    ${AlertPopupLoc}
    Click Button    css:.btn.btn-success
    Wait Until Element Is Not Visible    ${AlertPopupLoc}
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    ${CheckBoxLoc}
    Checkbox Should Be Selected    ${CheckBoxLoc}
    Click Button    id:signInBtn
