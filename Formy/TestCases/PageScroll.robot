*** Settings ***
Documentation    PageScrollPage
Library     SeleniumLibrary
Resource    ../resources/generic.robot
Resource    ../resources/home_page.robot
Library    ../CustomKeywords/Formy.py

*** Variables ***
${scrollPageHeader}    //h1[text()="Large page content"]
${fullNameLocator}    [placeholder="Full name"]
${DOBLocator}    [placeholder="MM/DD/YYYY"]
${bottomElement}    .form-control

*** Keywords ***
Validate Page Scroll
    Click on the Component    scroll
    Validate the Component Page is Visible    xpath:${scrollPageHeader}
    Scroll Element Into View    css:${bottomElement}
    Input Text    css:${fullNameLocator}    Wasim Shaikh
    Validate if the correct value is added       css:${fullNameLocator}    Wasim Shaikh
    Input Text    css:${DOBLocator}    02/11/1996
    Validate if the correct value is added    css:${DOBLocator}    02/11/1996
    Get back to home page