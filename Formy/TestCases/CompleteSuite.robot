*** Settings ***
Documentation    Complete Formy Test suite
Resource    SwitchWindow.robot
Resource    RadioButton.robot
Resource    PageScroll.robot
Resource    Modal.robot
Resource    FileUpload.robot
Resource    EnabledDisabled.robot
Resource    DropDown.robot
Resource    DragDrop.robot
Resource    DatePicker.robot
Resource    CheckBox.robot
Resource    Buttons.robot
Resource    AutoComplete.robot

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
    Validate Direct Input Invalid Format    ${incorrectFormat}
Date Picker Component different formats
    Validate Direct input different formats    ${BirthDateDiffFormat}
Date Picker Component pick from calender
    Validate Pick from calender    ${Myfuturebirthday}
DropDown Component single option click
    Validate DropDown Single Option    ${DropDownOption}
DropDown Component all options click
    Validate All DropDown Options    ${DropDownList}
Buttons Component
    Validate Buttons
Autocomplete Component
    AutoComplete Suite

