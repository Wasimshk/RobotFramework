*** Settings ***
Documentation    play around with all different components
Library     SeleniumLibrary
Resource    ../resources/resource.robot
Library    ../CustomKeywords/Formy.py
Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Variables ***
@{enableDisableElem}    [placeholder="Input here..."]    [placeholder="Disabled input here..."]

*** Test Cases ***
Enable Diable
    Validate Enabled And Disabled Elements    ${enableDisableElem}

*** Keywords ***
Validate Enabled And Disabled Elements
    [Arguments]    ${elements}
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}Enabled")]    xpath://h1[contains(text(),"Enabled")]
    FOR    ${element}    IN    @{elements}
        Element Should Be Visible    css:${element}
        IF    '${element}'=='[placeholder="Input here..."]'
            Element Should Be Enabled    css:${element}
            Input Text    css:${element}    Enabled Text!
            Validate if the correct value is added    css:${element}    Enabled Text!
        ELSE IF    '${element}'=='[placeholder="Disabled input here..."]'
            Element Should Be Disabled    css:${element}
        END
    END
    Get back to home page