*** Settings ***
Documentation    Drag and Drop Page
Library     SeleniumLibrary
Resource    generic.robot
Resource    home_page.robot
Library    ../CustomKeywords/Formy.py

*** Variables ***
${dragDropPageHeader}    //h1[text()="Drag the image into the box"]

*** Keywords ***
Validate Drag And Drop
    Click on the Component    dragdrop
    Validate the Component Page is Visible    xpath:${dragDropPageHeader}
#    python custom keyword
    Drag And Drop Action    //img[contains(@src,"selenium-logo")]    //div/p[contains(text(),"Drop here")]
#    inbuilt selenium keyword
#    Drag And Drop    xpath://img[contains(@src,"selenium-logo")]    xpath://div/p[contains(text(),"Drop here")]
    Get back to home page