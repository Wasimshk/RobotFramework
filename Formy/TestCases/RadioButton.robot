*** Settings ***
Documentation    play around with all different components
Library     SeleniumLibrary
Resource    ../resources/resource.robot
Library    ../CustomKeywords/Formy.py
Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Radio Button Validations
    Validate Radio Button    2

*** Keywords ***
Validate Radio Button
    [Arguments]    ${RadioButton}
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}Radio Button")]    xpath://h1[contains(text(),"Radio buttons")]
    
    Select Radio Button    exampleRadios    option${RadioButton}
    @{radiobuttons}=    Get Webelements    css:[name="exampleRadios"]
    ${index}=    Set Variable    1
    FOR    ${elem}    IN    @{radiobuttons}
        IF    '${index}'=='${RadioButton}'
            Radio Button Should Be Set To    exampleRadios    option${index}
        END
        ${index}=    Evaluate    ${index}+1
    END
    Get back to home page