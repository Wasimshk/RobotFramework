*** Settings ***
Documentation    DropDown Single Option Test
Resource    ../resources/DropDown.robot

Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
DropDown Component single option click
    Validate DropDown Single Option    ${DropDownOption}

DropDown Component all options click
    Validate All DropDown Options    ${DropDownList}