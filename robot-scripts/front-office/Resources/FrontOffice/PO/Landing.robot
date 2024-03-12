*** Settings ***
Library    SeleniumLibrary
Resource    ../../../first-script/crm/Resources/crmApp.robot

*** Variables ***
${LANDING_PAGE_HEADER} =    Welcome To Our Studio!
${LANDING_NAVIGATION_ELEMENT} =    id=mainNav


*** Keywords ***

Navigate To   
    Go To    ${URL}

Verify Page Is Not Visible Anymore
    Wait Until Page Does Not Contain    ${LANDING_PAGE_HEADER}

Verify Page Loaded
    Wait Until Page Contains Element    ${LANDING_NAVIGATION_ELEMENT}
    
