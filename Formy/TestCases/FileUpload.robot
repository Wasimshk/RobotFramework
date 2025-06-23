*** Settings ***
Documentation    FileUpload Page
Library     SeleniumLibrary
Resource    ../resources/generic.robot
Resource    ../resources/home_page.robot
Library    ../CustomKeywords/Formy.py

*** Variables ***
${fileUploadPageHeader}    //h1[text()="File upload"]
${filePath}    C:\WasimShaikh\New Text Document.txt

*** Keywords ***
Validate File Upload
    Click on the Component    fileupload
    Validate the Component Page is Visible    xpath:${fileUploadPageHeader}
    Choose File    file-upload-field    ${filePath}
    Element Attribute Value Should Be    id=file-upload-field    value    C:\WasimShaikh\New Text Document.txt
    Click Button    css:span>button.btn-reset
    ${value}=    Get Element Attribute    id=file-upload-field    value
#    ${value}=    Get Value    id=file-upload-field
    Should Be Empty    ${value}
    Get back to home page