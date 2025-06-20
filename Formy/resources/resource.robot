*** Settings ***
Documentation    this is a resource file
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${homePageLoc}    css:.display-3
*** Keywords ***
open browser and goto formy website
    Create Webdriver    Chrome
    Go To    https://formy-project.herokuapp.com/
    Maximize Browser Window
    Validate the home page
    
Validate the home page
    Element Text Should Be    ${homePageLoc}    Welcome to Formy