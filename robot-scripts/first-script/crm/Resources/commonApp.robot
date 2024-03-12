*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
#${URL}    =    https://automationplayground.com/front-office

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser

