*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SIGNOUT_MAIN_HEADING} =   Signed Out   


*** Keywords ***
Verify Page Loaded 
    Wait Until Page Contains    ${SIGNOUT_MAIN_HEADING}   