*** Settings ***
Documentation    Date Picker Valid Format Test
Resource    ../resources/DatePicker.robot

Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Date Picker Component Valid Format
    Validate Direct input Valid Format    ${myBirthDate}

Date Picker Component Invalid Format
    Validate Direct Input Invalid Format    ${incorrectFormat}

Date Picker Component different formats
    Validate Direct input different formats    ${BirthDateDiffFormat}

Date Picker Component pick from calender
    Validate Pick from calender    ${Myfuturebirthday}