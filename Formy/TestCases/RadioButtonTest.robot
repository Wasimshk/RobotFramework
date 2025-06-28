*** Settings ***
Documentation    Radio Button Component Test
Resource    ../resources/RadioButton.robot

Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Radio Button Component
    Validate Radio Button    2
