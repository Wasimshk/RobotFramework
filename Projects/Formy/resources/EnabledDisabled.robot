*** Settings ***
Documentation    EnabledDisabled Page
Library     SeleniumLibrary
Resource    generic.robot
Resource    home_page.robot
Library    ../CustomKeywords/Formy.py

*** Variables ***
${enabledDisabledPageHeader}    //h1[text()="Enabled and Disabled elements"]
@{enableDisableElem}    [placeholder="Input here..."]    [placeholder="Disabled input here..."]

*** Keywords ***
Validate Enabled And Disabled Elements
    [Arguments]    ${elements}
    Click on the Component    enabled
    Validate the Component Page is Visible    xpath:${enabledDisabledPageHeader}
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