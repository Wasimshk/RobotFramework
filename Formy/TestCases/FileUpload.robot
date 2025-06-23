*** Settings ***
Documentation    play around with all different components
Library     SeleniumLibrary
Resource    ../resources/resource.robot
Library    ../CustomKeywords/Formy.py
Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Validate File Upload
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}File Upload")]    xpath://h1[contains(text(),"File upload")]
    Choose File    file-upload-field    C:\WasimShaikh\New Text Document.txt
    Element Attribute Value Should Be    id=file-upload-field    value    C:\WasimShaikh\New Text Document.txt
    Click Button    css:span>button.btn-reset
    ${value}=    Get Element Attribute    id=file-upload-field    value
#    ${value}=    Get Value    id=file-upload-field
    Should Be Empty    ${value}
    Get back to home page