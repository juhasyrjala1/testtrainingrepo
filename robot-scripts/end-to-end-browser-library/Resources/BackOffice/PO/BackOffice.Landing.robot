*** Settings ***
Library    Browser
Resource    ../../Common/commonWeb.robot     #necessary for Setup & teardown level keywords in tests 

*** Variables ***
${LANDING_PAGE_HEADER} =    RobotFrameworkTutorial.com Demo Admin Site
${LANDING_NAVIGATION_ELEMENT} =    id=mainNav


*** Keywords ***

Navigate To   
    New Page    ${BACK_OFFICE_URL} 

Verify Page Is Not Visible Anymore
    Get Element Count    ${LANDING_PAGE_HEADER} == 0

Verify Page Loaded
    Get Element By Role   ${LANDING_NAVIGATION_ELEMENT}
    
