*** Settings ***
Documentation    play around with checkbox
Library     SeleniumLibrary
Resource    ../resources/resource.robot
Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Variables ***
@{checkBoxList}    id:checkbox-1    id:checkbox-2    id:checkbox-3

*** Test Cases ***
Checkbox Verification
    Select UnSelect    ${checkBoxList}
    Skip Checkbox    ${checkBoxList}

*** Keywords ***
Select UnSelect
    [Arguments]    ${checkboxlist}
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}Checkbox")]    id:checkbox-1
    FOR    ${locator}    IN    @{checkboxlist}
        Select Checkbox     ${locator}
        Checkbox Should Be Selected    ${locator}
        Run Keyword If    '${locator}'=='id:checkbox-2'    Unselect Checkbox    ${locator}
        Run Keyword If    '${locator}'=='id:checkbox-2'    Checkbox Should Not Be Selected    ${locator}
    END
    Get back to home page

Skip Checkbox
    [Arguments]    ${checkboxlist}
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}Checkbox")]    id:checkbox-1
    FOR    ${locator}    IN    @{checkboxlist}
        Continue For Loop If    '${locator}'=='id:checkbox-2'
        Select Checkbox     ${locator}
        Checkbox Should Be Selected    ${locator}
    END
    Get back to home page