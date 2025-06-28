*** Settings ***
Documentation    Buttons Page
Library     SeleniumLibrary
Resource    generic.robot
Resource    home_page.robot
Library    ../CustomKeywords/Formy.py

*** Variables ***
${autoCompletePageHeader}    //h1[text()="Autocomplete"]
@{addressList}=        my address    Lane 111    ST 222    Pune    Maharashtra    411001    India

*** Keywords ***
AutoComplete Suite
    click on autocomplete component and validate the autocomplete page is opened
    update the autocomplete form and click home button
    click again on autocomplete component
    partially add the details and Select the option to autocomplete
    validate if the autocomplete populate the correct details

click on autocomplete component and validate the autocomplete page is opened
    Click on the Component    autocomplete
    Validate the Component Page is Visible    xpath:${autoCompletePageHeader}

update the autocomplete form and click home button
# instead of adding the address one by one we run for loop and add the elements
    Log    ${addressList}
    ${index}=    Set Variable    1
    FOR    ${address}    IN    @{addressList}
        Input Text    xpath:(//*[@placeholder])[${index}]        ${address}
        ${index}=    Evaluate    ${index}+1
    END
    Get back to home page
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