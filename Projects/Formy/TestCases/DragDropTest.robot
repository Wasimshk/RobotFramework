*** Settings ***
Documentation    Drag And Drop Component Test
Resource    ../resources/DragDrop.robot

Test Teardown    Close Browser
Test Setup    open browser and goto formy website

*** Test Cases ***
Drag And Drop Component
    Validate Drag And Drop
