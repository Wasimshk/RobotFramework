*** Settings ***
Documentation    this is a resource file
Library    SeleniumLibrary
Library    Collections
Resource    generic.robot

*** Variables ***
${homePageHeader}    //h1[text()="Welcome to Formy"]
${ComponentInitialLocator}    li>a[href="/

*** Keywords ***
Validate the home page
    Wait Until Element Is Visible    xpath:${homePageHeader}

Click on the Component
    [Arguments]    ${Component}
    Wait Until Element Is Visible    css:${ComponentInitialLocator}${Component}"]
    Click Element    css:${ComponentInitialLocator}${Component}"]