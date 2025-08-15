*** Settings ***
Documentation    Buttons Page
Library     SeleniumLibrary
Resource    generic.robot
Resource    home_page.robot
Library    ../CustomKeywords/Formy.py

*** Variables ***
${buttonsPageLocator}    .form-group.row
${buttonsCommonLoc}    //*[contains(@class, "btn btn-lg")]
@{ButtonsList}    	Primary    Success    Info    Warning    Danger    Link    Left    Middle    Right    1    2    Dropdown
@{ButtonofChoice}    Primary    Info    Middle

*** Keywords ***
Validate Buttons
    Click on the Component    buttons
    Validate the Component Page is Visible    css:${buttonsPageLocator}
    validate if all the buttons are clickable and click    ${buttonsCommonLoc}
    check if the correct buttons are present
    Press Buttons Of Choice    ${buttonsCommonLoc}    ${ButtonofChoice}
    open and select from the drop down    link 1

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
    