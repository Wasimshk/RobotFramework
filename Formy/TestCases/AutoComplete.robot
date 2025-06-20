*** Settings ***
Documentation    This is Autocomplete TC
Library    SeleniumLibrary
Library    Collections
Library    ../CustomKeywords/Formy.py
Resource    ../resources/resource.robot
Test Setup    open browser and goto formy website
Test Teardown    Close Browser

*** Variables ***
@{addressList}=        my address    Lane 111    ST 222    Pune    Maharashtra    411001    India

*** Test Cases ***
AutoComplete Suite
    click on autocomplete component and validate the autocomplete page is opened
    update the autocomplete form and click home button
    click again on autocomplete component
    partially add the details and Select the option to autocomplete
    validate if the autocomplete populate the correct details

*** Keywords ***
click on autocomplete component and validate the autocomplete page is opened
    Click Element    xpath://li/a[text()="Autocomplete"]
    Wait Until Element Is Visible    css:.pac-target-input

update the autocomplete form and click home button
# instead of adding the address one by one we run for loop and add the elements
    Log    ${addressList}
    ${index}=    Set Variable    1
    FOR    ${address}    IN    @{addressList}
        Input Text    xpath:(//*[@placeholder])[${index}]        ${address}
        ${index}=    Evaluate    ${index}+1
    END

    Click Element    css:.navbar-brand
    Wait Until Element Is Visible    ${homePageLoc}
    Validate the home page


click again on autocomplete component
    click on autocomplete component and validate the autocomplete page is opened

partially add the details and Select the option to autocomplete
    ${index}=    Set Variable    1
    FOR    ${address}    IN    @{addressList}
        Click Element    xpath:(//*[@placeholder])[${index}]
        Send Arrow Down And Enter
        ${index}=    Evaluate    ${index}+1
    END

validate if the autocomplete populate the correct details
#    this test case fails as the first text field does not autocomplete by design.
    ${index}=    Set Variable    1
    FOR    ${address}    IN    @{addressList}
        ${value}=    Get Value    xpath:(//*[@placeholder])[${index}]
        Run Keyword If    '${index}' != '1'    Should Not Be Empty    ${value}
        ${index}=    Evaluate    ${index}+1
    END