*** Settings ***
Documentation    a resource file
...    A multiline documentation
...    A multiline documentation
Library    SeleniumLibrary

*** Variables ***
${Username}    rahulshettyacademy
${ValidPassword}    learning
${InvalidPassword}    123456
${SignInButton}    id:signInBtn
${MortgagePaymentURL}    https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
Open Browser With The URL
#    Create Webdriver    Edge
    Create Webdriver    Chrome
    Go To    ${MortgagePaymentURL}