*** Settings ***
Documentation    play around with all different components
Library     SeleniumLibrary
Resource    ../resources/generic.robot
Resource    ../resources/home_page.robot
Library    ../CustomKeywords/Formy.py

*** Variables ***
${switchWindowPageHeader}    //h1[text()="Switch Window"]

*** Keywords ***
Validate Switch Window
    Click on the Component    switch-window
    Validate the Component Page is Visible    xpath:${switchWindowPageHeader}
#    New TAB
    Click Button    new-tab-button
    Switch Window    NEW
    Validate the New Page
    Switch Window    MAIN
    Validate the Component Page is Visible    xpath:${switchWindowPageHeader}
    Validate and Handle Alert

Validate the New Page
    Validate the home page
    
Validate and Handle Alert
#    Alert
    Click Button    alert-button
    Handle Alert    action=ACCEPT
    Get back to home page
    Validate the home page