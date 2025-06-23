*** Settings ***
Documentation    Complete Formy Test suite
Library     SeleniumLibrary
Resource    ../resources/resource.robot
Library    ../CustomKeywords/Formy.py
Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Formy Project
#    Validate Drag And Drop
#    Validate Enabled And Disabled Elements    ${enableDisableElem}
#    Validate File Upload
#    Validate Model
#    Validate Page Scroll
#    Validate Radio Button    2
#    Validate Switch Window