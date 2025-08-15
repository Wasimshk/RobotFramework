*** Settings ***
Documentation    play around with all different components
Library     SeleniumLibrary
Resource    generic.robot
Resource    home_page.robot
Library    ../CustomKeywords/Formy.py

*** Variables ***
${radioButtonPageHeader}    //h1[text()="Radio buttons"]

*** Keywords ***
Validate Radio Button
    [Arguments]    ${RadioButton}
    Click on the Component    radiobutton
    Validate the Component Page is Visible    xpath:${radioButtonPageHeader}
    
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