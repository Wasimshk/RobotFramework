*** Settings ***
Documentation    Checkboxes Page
Library     SeleniumLibrary
Resource    ../resources/generic.robot
Resource    ../resources/home_page.robot
Library    ../CustomKeywords/Formy.py

*** Variables ***
${checkboxPageHeader}    //h1[text()="Checkboxes"]
@{checkBoxList}    id:checkbox-1    id:checkbox-2    id:checkbox-3

*** Keywords ***
Validate Select UnSelect
    [Arguments]    ${checkboxlist}
    Click on the Component    checkbox
    Validate the Component Page is Visible    xpath:${checkboxPageHeader}
    FOR    ${locator}    IN    @{checkboxlist}
        Select Checkbox     ${locator}
        Checkbox Should Be Selected    ${locator}
        Run Keyword If    '${locator}'=='id:checkbox-2'    Unselect Checkbox    ${locator}
        Run Keyword If    '${locator}'=='id:checkbox-2'    Checkbox Should Not Be Selected    ${locator}
    END
    Get back to home page

Validate Skip Checkbox
    [Arguments]    ${checkboxlist}
    Click on the Component    checkbox
    Validate the Component Page is Visible    xpath:${checkboxPageHeader}
    FOR    ${locator}    IN    @{checkboxlist}
        Continue For Loop If    '${locator}'=='id:checkbox-2'
        Select Checkbox     ${locator}
        Sleep    0.5
        Checkbox Should Be Selected    ${locator}
    END
    Get back to home page