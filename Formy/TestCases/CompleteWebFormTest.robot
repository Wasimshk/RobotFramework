*** Settings ***
Documentation    This is webform case
Resource    ../resources/CompleteWebForm.robot
Test Setup    open browser and goto formy website
Test Teardown    Close Browser

*** Variables ***
&{user_details}
...    First name=Wasim
...    Last name=Shaikh
...    Job title=SDET
...    Education=Grad School
...    Sex=Male
...    Experience=2-4
...    DOB=02/11/1996

*** Test Cases ***
Test the complete Web Form
    Open Webform component and validate
    Enter first and last name    ${user_details['First name']}    ${user_details['Last name']}
    Add job title    ${user_details['Job title']}
    Select highest education    ${user_details['Education']}
    Select Sex    ${user_details['Sex']}
    Select year of experience    ${user_details['Experience']}
    Pick the date    ${user_details['DOB']}
    Submit the form and Validate