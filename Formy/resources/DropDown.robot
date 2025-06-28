*** Settings ***
Documentation    DropDown Page
Library     SeleniumLibrary
Resource    generic.robot
Resource    home_page.robot
Library    ../CustomKeywords/Formy.py
Resource    CheckBox.robot

*** Variables ***
${dropDownPageHeader}    //h1[text()="Dropdown"]
${DropDownOption}       Checkboxes
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

*** Keywords ***
Validate DropDown Single Option
    [Arguments]    ${DropDownOption}
    Click on the Component    dropdown
    Validate the Component Page is Visible    xpath:${dropDownPageHeader}
    Sleep    0.5
    Click Button    css:.dropdown button
    Click Element    xpath://div/div/a[contains(@href,"checkbox")]
    Validate the Component Page is Visible    xpath:${checkboxPageHeader}
    Get back to home page

Validate All DropDown Options
    [Arguments]    ${DropDownList}
    Click on the Component    dropdown
    Validate the Component Page is Visible    xpath:${dropDownPageHeader}

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