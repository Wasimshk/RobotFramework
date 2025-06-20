*** Settings ***
Documentation    This is Autocomplete TC
Library    SeleniumLibrary
Resource    ../resources/resource.robot
Test Setup    open browser and goto formy website
Test Teardown    Close Browser

*** Test Cases ***
AutoComplete Suite
    click on autocomplete component
    #update the automation complete form and click home button
    #handle the pop up to save the details
    #click again on autocomplete component
    #partially add the details and Select the option to autocomplete
    #validate if the autocomplete populate the correct details

*** Keywords ***
click on autocomplete component
    Sleep    2
    Click Element    xpath://li/a[text()="Autocomplete"]
    Sleep    2

update the automation complete form and click home button
handle the pop up to save the details
click again on autocomplete component
partially add the details and Select the option to autocomplete
validate if the autocomplete populate the correct details