*** Settings ***
Documentation    Complete Formy Test suite
Resource    ../resources/Buttons.robot

Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Buttons Component
    Validate Buttons

