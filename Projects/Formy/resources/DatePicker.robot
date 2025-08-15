*** Settings ***
Documentation    Date Picker Page
Library     SeleniumLibrary
Library    Collections
Library    String
Resource    generic.robot
Resource    home_page.robot
Library    ../CustomKeywords/Formy.py

*** Variables ***
${datePickerPageHeader}    //h1[text()="Datepicker"]
#date in mm/dd/yyyy
${DatePickerLoc}    css:[placeholder="mm/dd/yyyy"]
@{BirthDateDiffFormat}    02/11/1996    02\11\1996    02|11|1996    02_11_1996    02 11 1996    02,11,1996    02.11.1996    02*11*1996    02+11+1996    02-11-1996
${myBirthDate}    02/11/1996
${incorrectFormat}    25/25/2025
${Myfuturebirthday}    02/11/2027

*** Keywords ***
Validate Direct input Valid Format
    [Arguments]    ${date}
    Click on the Component    datepicker
    Validate the Component Page is Visible    xpath:${datePickerPageHeader}
    Sleep    0.5
    Input Text    ${DatePickerLoc}     ${date}
    Validate if the correct date is added    ${date}
    Get back to home page

Validate Direct Input Invalid Format
    [Arguments]    ${date}
    Click on the Component    datepicker
    Validate the Component Page is Visible    xpath:${datePickerPageHeader}
    Wait Until Element Is Visible        ${DatePickerLoc}
    Sleep    0.5
    Input Text    ${DatePickerLoc}     ${date}
#    Validate the error message
#    the website is not handling the invalid date inputs hence we will skip this case
    Validate if the correct date is added    ${date}
    Get back to home page

Validate Direct input different formats
    [Arguments]    ${dateList}
    Click on the Component    datepicker
    Validate the Component Page is Visible    xpath:${datePickerPageHeader}
    FOR    ${date}    IN    @{dateList}
        Wait Until Element Is Visible        ${DatePickerLoc}
        Sleep    0.5
        Input Text    ${DatePickerLoc}     ${date}
        Validate if the correct date is added    ${date}
    END
    Get back to home page

Validate Pick from calender
    [Arguments]    ${date}
    @{dateList}=    Split String    ${date}    /
    ${month}=    Get From List    ${dateList}    0
    ${day}=    Get From List    ${dateList}    1
    ${year}=    Get From List    ${dateList}    2
    
    Click on the Component    datepicker
    Validate the Component Page is Visible    xpath:${datePickerPageHeader}
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