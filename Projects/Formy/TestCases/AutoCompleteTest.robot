*** Settings ***
Documentation    Complete Formy Test suite
Resource    ../resources/AutoComplete.robot

Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Autocomplete Component
    AutoComplete Suite

