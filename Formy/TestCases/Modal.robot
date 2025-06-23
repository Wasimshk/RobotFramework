*** Settings ***
Documentation    play around with all different components
Library     SeleniumLibrary
Resource    ../resources/resource.robot
Library    ../CustomKeywords/Formy.py
Test Teardown    Close Browser
Test Setup    open browser and goto url    Edge

*** Test Cases ***
Validate Model
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}Modal")]    xpath://h1[contains(text(),"Modal")]
    Click Button    xpath://*[contains(text(),"Open modal")]
    Wait Until Element Is Visible    css:.modal-header
    Element Text Should Be    css:.modal-title    Modal title
    Wait Until Element Is Visible    close-button
    Sleep    0.5
    Click Element    close-button
    Wait Until Element Is Not Visible    css:.modal-header
    Get back to home page