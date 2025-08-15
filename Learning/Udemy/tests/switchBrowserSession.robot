*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Switch Between Chrome And Firefox
    # Open Chrome with alias
    Open Browser    https://example.com    chrome    alias=chrome_browser

    # Open Edge with alias
    Open Browser    https://example.org    edge    alias=edge_browser

    # Open Firefox with alias
    Open Browser    https://example.org    firefox    alias=firefox_browser

    # Switch to Chrome
    Switch Browser    chrome_browser
    Page Should Contain    Example Domain

    # Switch to Firefox
    Switch Browser    edge_browser
    Page Should Contain    Example Domain

     # Switch to Firefox
    Switch Browser    firefox_browser
    Page Should Contain    Example Domain

    # Close all browsers
    Close All Browsers
