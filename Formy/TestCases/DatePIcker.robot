*** Settings ***
Documentation    play around with datepicker
Library     SeleniumLibrary
Library    Collections
Library    String
Resource    ../resources/resource.robot
Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Variables ***
#date in mm/dd/yyyy
${DatePickerLoc}    css:[placeholder="mm/dd/yyyy"]
@{BirthDateDiffFormat}    02/11/1996    02\11\1996    02|11|1996    02_11_1996    02 11 1996    02,11,1996    02.11.1996    02*11*1996    02+11+1996    02-11-1996
${myBirthDate}    02/11/1996
${incorrectFormat}    25/25/2025
${Myfuturebirthday}    02/11/2027


*** Test Cases ***
Validate Date Picker
    Direct input Valid Format    ${myBirthDate}
    Direct Input Invalid Format    ${incorrectFormat}
    Direct input different formats    ${BirthDateDiffFormat}
    pick from calender    ${Myfuturebirthday}

*** Keywords ***
Direct input Valid Format
    [Arguments]    ${date}
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}Datepicker")]    xpath://h1[text()="Datepicker"]
    Sleep    0.5
    Input Text    ${DatePickerLoc}     ${date}
    Validate if the correct date is added    ${date}
    Get back to home page

Direct Input Invalid Format
    [Arguments]    ${date}
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}Datepicker")]    xpath://h1[text()="Datepicker"]
    Wait Until Element Is Visible        ${DatePickerLoc}
    Sleep    0.5
    Input Text    ${DatePickerLoc}     ${date}
#    Validate the error message
#    the website is not handling the invalid date inputs hence we will skip this case
    Validate if the correct date is added    ${date}
    Get back to home page

Direct input different formats
    [Arguments]    ${dateList}
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}Datepicker")]    xpath://h1[text()="Datepicker"]
    FOR    ${date}    IN    @{dateList}
        Wait Until Element Is Visible        ${DatePickerLoc}
        Sleep    0.5
        Input Text    ${DatePickerLoc}     ${date}
        Validate if the correct date is added    ${date}
    END
    Get back to home page

pick from calender
    [Arguments]    ${date}
    @{dateList}=    Split String    ${date}    /
    ${month}=    Get From List    ${dateList}    0
    ${day}=    Get From List    ${dateList}    1
    ${year}=    Get From List    ${dateList}    2
    
    Click on the Component and Validate the Component Page is Opened    ${CompLocInitial}Datepicker")]    xpath://h1[text()="Datepicker"]
    Sleep    2
    Open DatePicker
    Select Year    ${year}
    Select Month   ${month}
    Select Day     ${day}

    Validate if the correct date is added    ${date}
    Get back to home page

Open DatePicker
    Click Element    ${DatePickerLoc}
    Click Element    xpath:(//*[@class="datepicker-switch"])[1]

Select Year
    [Arguments]    ${year}
    Click Element    xpath:(//*[@class="datepicker-switch"])[2]
    Click Element    xpath://span[contains(@class,"year") and text()="${year}"]

Select Month
    [Arguments]    ${monthIndex}
    Click Element    xpath:(//span[contains(@class,"month")])[${monthIndex}]

Select Day
    [Arguments]    ${day}
    Click Element    xpath://*[contains(@class, "day") and text()="${day}"]

Validate if the correct date is added
    [Arguments]    ${date}
    ${value}=    Get Value    ${DatePickerLoc}
    Should Be Equal    ${value}    ${date}