*** Settings ***
Library    Browser

*** Variables ***
${LANDING_PAGE_HEADER} =    Swag Labs
${LANDING_NAVIGATION_ELEMENT} =    //*[@id="login-button"]
${URL} =    blank:none


*** Keywords ***

Navigate To   
    New Page   ${URL}

Verify Page Is Not Visible Anymore
    Get Element Count    ${LANDING_PAGE_HEADER} == 0

Verify Page Loaded
    Get Element    ${LANDING_NAVIGATION_ELEMENT}
    
