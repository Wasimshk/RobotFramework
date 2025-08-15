*** Settings ***
Documentation    Enabled And Disabled Elements Component Test
Resource    ../resources/EnabledDisabled.robot

Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Enabled And Disabled Elements Component
    Validate Enabled And Disabled Elements    ${enableDisableElem}
