*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${TOPNAV_SIGNIN_LINK} =       id=SignIn
${TOPNAV_SIGNOUT_LINK} =      Sign Out 
${TOPNAV_SEARCH_BAR_RESULT} =       Login


*** Keywords ***

Click "Sign In" Link
    Click Link    ${TOPNAV_SIGNIN_LINK}

Load
    Go To    https://automationplayground.com/crm/  
Verify Page Load
    Wait Until Page Contains    Customers Are Priority One 

Click "Sign Out" Link
    Click Link    ${TOPNAV_SIGNOUT_LINK}
