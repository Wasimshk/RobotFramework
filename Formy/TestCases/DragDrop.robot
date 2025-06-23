*** Settings ***
Documentation    play around with all different components
Library     SeleniumLibrary
Resource    ../resources/resource.robot
Library    ../CustomKeywords/Formy.py
Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Validate Drag And Drop
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}Drag")]    xpath://h1[contains(text(),"Drag")]
#    python custom keyword
    Drag And Drop Action    //img[contains(@src,"selenium-logo")]    //div/p[contains(text(),"Drop here")]
#    inbuilt selenium keyword
#    Drag And Drop    xpath://img[contains(@src,"selenium-logo")]    xpath://div/p[contains(text(),"Drop here")]
    Get back to home page