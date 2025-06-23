*** Settings ***
Documentation    play around with buttons Component
Library    SeleniumLibrary
Library    Collections
Library    ../CustomKeywords/Formy.py
Resource    ../resources/resource.robot
Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Variables ***
${buttonsCommonLoc}    //*[contains(@class, "btn btn-lg")]
@{ButtonsList}    	Primary    Success    Info    Warning    Danger    Link    Left    Middle    Right    1    2    Dropdown
@{ButtonofChoice}    Primary    Info    Middle

*** Test Cases ***
Buttons Component Validations
    Click on the Component and Validate the Component Page is Opened    css:div>li>a[href="/buttons"]    css:.form-group.row
    validate if all the buttons are clickable and click    ${buttonsCommonLoc}
    check if the correct buttons are present
    Press Buttons Of Choice    ${buttonsCommonLoc}    ${ButtonofChoice}
    open and select from the drop down    link 1

*** Keywords ***
validate if all the buttons are clickable and click
    [Arguments]    ${locator}
    @{ButtonNamesList}=    Create List
    ${index}=    Set Variable    1
    @{elements}=    Get Webelements    xpath:${locator}
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${ButtonNamesList}    ${element.text}
        Element Should Be Visible    xpath:(${locator})[${index}]
        Element Should Be Enabled    xpath:(${locator})[${index}]
        Click Button    xpath:(${locator})[${index}]
        ${index}=    Evaluate    ${index}+1
    END
    Log    ${ButtonNamesList}
    Set Global Variable    ${ButtonNamesList}

check if the correct buttons are present
    Lists Should Be Equal    ${ButtonNamesList}    ${ButtonsList}

open and select from the drop down
    [Arguments]    ${dropDownOption}
    Click Button    css:button.dropdown-toggle
    Wait Until Element Is Visible    xpath://*[contains(text(),"Dropdown link")]
    Click Element    xpath://*[text()="Dropdown ${dropDownOption}"]
    Sleep    2
    