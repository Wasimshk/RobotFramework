*** Settings ***
Documentation    play around with all different components
Library     SeleniumLibrary
Resource    ../resources/resource.robot
Library    ../CustomKeywords/Formy.py
Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Variables ***
${DropDownOption}       Checkbox
@{DropDownList}
...    Autocomplete
...    Buttons
...    Checkbox
...    Datepicker
...    Drag
...    Dropdown
...    Enabled
...    File
...    File Download
...    Mouse
...    Modal
...    Page Scroll
...    Radio
...    Switch Window
...    Complete Web Form

*** Test Cases ***
Verify DropDown
    Validate All options    ${DropDownList}
    Validate single option    ${DropDownOption}

*** Keywords ***
Validate single option
    [Arguments]    ${DropDownOption}
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}Dropdown")]    dropdownMenuButton
    Sleep    0.5
    Click Button    css:.dropdown button
    Click on the Component and Validate the Component Page is Opened    xpath://div/div/a[contains(text(),"${DropDownOption}")]    xpath://h1[contains(text(),"${DropDownOption}")]
    Get back to home page
    Sleep    1

Validate All options
    [Arguments]    ${DropDownList}
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}Dropdown")]    dropdownMenuButton

    FOR    ${item}    IN    @{DropDownList}
        Click Button    css:.dropdown button
        Ctrl Click        //div/div/a[contains(text(),"${item}")]
        Switch Window    NEW
        IF    '${item}'=='Buttons'
            Wait Until Element Is Visible    css:.form-group.row
        ELSE IF    '${item}'=='Page Scroll'
            Wait Until Element Is Visible    xpath://h1[contains(text(),"Large page content")]
        ELSE IF    '${item}'=='File Download'
#            this page is not available
            Wait Until Element Is Visible    xpath://h1[contains(text(),"The page you were looking for doesn't exist.")]
        ELSE
            Wait Until Element Is Visible    xpath://h1[contains(text(),"${item}")]
        END
        Switch Window    MAIN
        Wait Until Element Is Visible    dropdownMenuButton
    END
    Get back to home page