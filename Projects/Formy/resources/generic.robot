*** Settings ***
Documentation    this is a resource file
Library    SeleniumLibrary
Library    Collections
Resource    home_page.robot

*** Variables ***
${homePageRedirectLoc}    xpath://*[@class="navbar-brand" and text()="Formy"]
${homePageUrl}    https://formy-project.herokuapp.com/
${browserName}    Chrome

*** Keywords ***
open browser and goto formy website
    Create Webdriver    ${browserName}
    Go To    ${homePageUrl}
    Maximize Browser Window
    Validate the home page

#open browser and goto url
#    [Arguments]    ${Browser}
#    Create Webdriver    ${Browser}
#    Go To    ${homePageUrl}
#    Maximize Browser Window
#    Validate the home page

Get back to home page
    Sleep    1
    Wait Until Element Is Visible    ${homePageRedirectLoc}
    Click Element    ${homePageRedirectLoc}

Validate the Component Page is Visible
    [Arguments]    ${ComponentPageHeader}
    Wait Until Element Is Visible    ${ComponentPageHeader}

Validate if the correct value is added
    [Arguments]    ${locator}    ${expectedValue}
    ${actualValue}=    Get Value    ${locator}
    Should Be Equal    ${actualValue}    ${expectedValue}