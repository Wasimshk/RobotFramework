*** Settings ***
Documentation    Modal Component Test
Resource    ../resources/Modal.robot

Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Model Component
    Validate Model
