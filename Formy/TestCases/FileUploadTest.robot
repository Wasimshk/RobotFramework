*** Settings ***
Documentation    File Upload Component Test
Resource    ../resources/FileUpload.robot

Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
File Upload Component
    Validate File Upload
