*** Settings ***
Documentation    this is a resource file
Library    SeleniumLibrary
Library    Collections

*** Variables ***

*** Keywords ***
open browser and goto formy website
    Create Webdriver    Edge
    Go To    https://formy-project.herokuapp.com/