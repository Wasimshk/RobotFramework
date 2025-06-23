*** Settings ***
Documentation    play around with all different components
Library     SeleniumLibrary
Resource    ../resources/resource.robot
Library    ../CustomKeywords/Formy.py
Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Validate Switch Window
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}Switch Window")]    xpath://h1[contains(text(),"Switch Window")]
#    New TAB
    Click Button    new-tab-button
    Switch Window    NEW
    Validate the home page
    Switch Window    MAIN
#    Alert
    Click Button    alert-button
    Handle Alert    action=ACCEPT
    Get back to home page