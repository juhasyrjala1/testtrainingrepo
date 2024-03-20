*** Settings ***
Library    Browser
Resource    ../../Common/commonWeb.robot     #necessary for Setup & teardown level keywords in tests 

*** Variables ***
${LANDING_PAGE_HEADER} =    Welcome To Our Studio!
${LANDING_NAVIGATION_ELEMENT} =    id=mainNav


*** Keywords ***

Navigate To   
    New Page   ${FRONT_OFFICE_URL}

Verify Page Loaded
    Get Element    ${LANDING_NAVIGATION_ELEMENT}
    
