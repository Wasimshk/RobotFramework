*** Settings ***
Documentation    play around with all different components
Library     SeleniumLibrary
Resource    ../resources/resource.robot
Library    ../CustomKeywords/Formy.py
Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Validate Page Scroll
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}Page Scroll")]    xpath://h1[contains(text(),"Large page content")]
    Scroll Element Into View    css:.form-control
    Input Text    css:[placeholder="Full name"]    Wasim Shaikh
    Validate if the correct value is added       css:[placeholder="Full name"]    Wasim Shaikh
    Input Text    css:[placeholder="MM/DD/YYYY"]    02/11/1996
    Validate if the correct value is added    css:[placeholder="MM/DD/YYYY"]    02/11/1996
    Get back to home page