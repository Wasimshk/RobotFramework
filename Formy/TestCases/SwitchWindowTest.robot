*** Settings ***
Documentation    Switch Window Component Test
Resource    ../resources/SwitchWindow.robot

Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Switch Window Component
    Validate Switch Window
