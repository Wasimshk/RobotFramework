*** Settings ***
Documentation    Modal Page
Library     SeleniumLibrary
Resource    ../resources/generic.robot
Resource    ../resources/home_page.robot
Library    ../CustomKeywords/Formy.py

*** Variables ***
${modalPageHeader}    //h1[text()="Modal"]
${modalButton}    //*[contains(text(),"Open modal")]
${modalHeader}    .modal-header

*** Keywords ***
Validate Model
    Click on the Component    modal
    Validate the Component Page is Visible    xpath=${modalPageHeader}
    Click Button    xpath=${modalButton}
    Wait Until Element Is Visible    css=${modalHeader}
    Element Text Should Be    css:.modal-title    Modal title
    Wait Until Element Is Visible    close-button
    Sleep    0.5
    Click Element    close-button
    Wait Until Element Is Not Visible    css:${modalHeader}
    Get back to home page