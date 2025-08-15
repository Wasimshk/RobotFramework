*** Settings ***
Documentation    Checkbox Select Unselect Test
Resource    ../resources/CheckBox.robot

Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Checkbox Component Select UnSelect
    Validate Select UnSelect    ${checkBoxList}

Checkbox Component Skip CheckBox
    Validate Skip Checkbox    ${checkBoxList}