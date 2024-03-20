*** Settings ***
Library    Browser
Library    String

*** Variables ***
${TEAM_HEADER_LABEL} =    css=#team > div > div:nth-child(1) > div > h2
${TEAM_HEADER_TEXT} =    OUR AMAZING TEAM


*** Keywords ***

Verify Page Loaded
    Get Element    ${TEAM_HEADER_LABEL}

Validate Page Contents

#   Will work on edge but not chrome

    ${ElementText} =    Get Text    ${TEAM_HEADER_LABEL}  
    Should Be Equal As Strings    ${ElementText}    ${TEAM_HEADER_TEXT}    ignore_case=true
