*** Settings ***
Documentation    this is a resource file
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${homePageLoc}    xpath://h1[text()="Welcome to Formy"]
${homePageRedirectLoc}    xpath://*[@class="navbar-brand" and text()="Formy"]
${CompLocInitial}    xpath://li/a[contains(text(),"

*** Keywords ***
open browser and goto formy website
    Create Webdriver    Chrome  
    Go To    https://formy-project.herokuapp.com/
    Maximize Browser Window
    Validate the home page

open browser and goto url
    [Arguments]    ${Browser}
    Create Webdriver    ${Browser}
    Go To    https://formy-project.herokuapp.com/
    Maximize Browser Window
    Validate the home page

Get back to home page
    Sleep    1
    Wait Until Element Is Visible    ${homePageRedirectLoc}
    Click Element    ${homePageRedirectLoc}

Validate the home page
    Wait Until Element Is Visible    ${homePageLoc}

Click on the Component and Validate the Component Page is Opened
    [Arguments]    ${ComponentLoc}    ${ComponentPageLoc}
    Click Element    ${ComponentLoc}
    Wait Until Element Is Visible    ${ComponentPageLoc}
    
Validate if the correct value is added
    [Arguments]    ${locator}    ${expectedValue}
    ${actualValue}=    Get Value    ${locator}
    Should Be Equal    ${actualValue}    ${expectedValue}