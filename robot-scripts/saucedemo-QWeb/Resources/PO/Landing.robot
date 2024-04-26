*** Settings ***
Library    QWeb

*** Variables ***
${LANDING_PAGE_HEADER} =    Swag Labs
${LANDING_NAVIGATION_ELEMENT} =    Login
${URL} =    https://saucedemo.com


*** Keywords ***

Navigate To   
    QWeb.GoTo    ${URL}

Verify Page Is Not Visible Anymore
    Get Element Count    ${LANDING_PAGE_HEADER} == 0

Verify Page Loaded
    VerifyText   ${LANDING_NAVIGATION_ELEMENT}
    
