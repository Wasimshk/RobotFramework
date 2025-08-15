*** Settings ***
Documentation    Complete Formy Test suite
Resource    ../resources/SwitchWindow.robot
Resource    ../resources/RadioButton.robot
Resource    ../resources/PageScroll.robot
Resource    ../resources/Modal.robot
Resource    ../resources/FileUpload.robot
Resource    ../resources/EnabledDisabled.robot
Resource    ../resources/DropDown.robot
Resource    ../resources/DragDrop.robot
Resource    ../resources/DatePicker.robot
Resource    ../resources/CheckBox.robot
Resource    ../resources/Buttons.robot
Resource    ../resources/AutoComplete.robot

Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Switch Window Component
    Validate Switch Window
Radio Button Component
    Validate Radio Button    2
Page Scroll Component
    Validate Page Scroll
Model Component
    Validate Model
File Upload Component
    Validate File Upload
Enabled And Disabled Elements Component
    Validate Enabled And Disabled Elements    ${enableDisableElem}
Drag And Drop Component
    Validate Drag And Drop
Checkbox Component Select UnSelect
    Validate Select UnSelect    ${checkBoxList}
Checkbox Component Skip CheckBox
    Validate Skip Checkbox    ${checkBoxList}
Date Picker Component Valid Format
    Validate Direct input Valid Format    ${myBirthDate}
Date Picker Component Invalid Format
    [Tags]    NEGATIVE
    Validate Direct Input Invalid Format    ${incorrectFormat}
Date Picker Component different formats
    Validate Direct input different formats    ${BirthDateDiffFormat}
Date Picker Component pick from calender
    Validate Pick from calender    ${Myfuturebirthday}
DropDown Component single option click
    [Tags]    SMOKE
    Validate DropDown Single Option    ${DropDownOption}
DropDown Component all options click
    [Tags]    REGRESSION
    Validate All DropDown Options    ${DropDownList}
Buttons Component
    Validate Buttons
Autocomplete Component
    AutoComplete Suite

