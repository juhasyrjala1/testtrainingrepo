*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LANDING_PAGE_HEADER} =    Swag Labs
${LANDING_NAVIGATION_ELEMENT} =    class=login_logo
${URL} =    blank:none


*** Keywords ***

Navigate To   
    Go To    ${URL}

Verify Page Is Not Visible Anymore
    Wait Until Page Does Not Contain    ${LANDING_PAGE_HEADER}

Verify Page Loaded
    Wait Until Page Contains Element    ${LANDING_NAVIGATION_ELEMENT}
    
