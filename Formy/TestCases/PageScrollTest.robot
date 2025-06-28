*** Settings ***
Documentation    Page Scroll Component Test
Resource    ../resources/PageScroll.robot

Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Page Scroll Component
    Validate Page Scroll
