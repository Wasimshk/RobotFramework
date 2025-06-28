*** Settings ***
Documentation    This is webform case
Library    SeleniumLibrary
Resource    ../resources/generic.robot
Resource    ../resources/home_page.robot

*** Variables ***
${webFormPageHeader}    //h1[text()="Complete Web Form"]

*** Keywords ***
Open Webform component and validate
    Click on the Component    form
    Validate the Component Page is Visible     ${webFormPageHeader}
    
Enter first and last name
    [Arguments]    ${firstName}    ${lastName}
    Input Text    first-name    ${firstName}
    Input Text    last-name    ${lastName}
    
Add job title
    [Arguments]    ${jobTitle}
    Input Text    job-title    ${jobTitle}

Select highest education
    [Arguments]    ${education}
#    Select Radio Button      groupname      radio-button-3
#    radio button does not have any common name attribute hence using click element
    IF    '${education}'=='High School'
        Click Element    radio-button-1
    ELSE IF    '${education}'=='College'
        Click Element    radio-button-2
    ELSE IF    '${education}'=='Grad School'
        Click Element    radio-button-3
    END

Select Sex
    [Arguments]    ${Sex}
    IF    '${Sex}'=='Male'
        Select Checkbox    checkbox-1
    ELSE IF    '${Sex}'=='Female'
        Select Checkbox    checkbox-2
    ELSE IF    '${Sex}'=='Prefer not to say'
        Select Checkbox    checkbox-3
    END

Select year of experience
    [Arguments]    ${experience}
    Select From List By Label    select-menu    ${experience}

Pick the date
    [Arguments]    ${dateOfBirth}
    Input Text    datepicker    ${dateOfBirth}

Submit the form and Validate
    Click Element        xpath://*[text()="Submit"]
    Wait Until Element Is Visible        xpath://h1[text()="Thanks for submitting your form"]
    Get back to home page