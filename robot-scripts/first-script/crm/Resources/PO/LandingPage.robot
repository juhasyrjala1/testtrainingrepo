*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${SIGNIN_MAIN_HEADING} =        xpath=//h2

${URL} =    https://automationplayground.com/crm/

*** Keywords ***
Load
    Go To    ${URL}
Verify Page Load
    Wait Until Page Contains Element    ${SIGNIN_MAIN_HEADING}
