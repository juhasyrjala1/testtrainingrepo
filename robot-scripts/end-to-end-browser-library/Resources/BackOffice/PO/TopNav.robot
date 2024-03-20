*** Settings ***
Library    Browser

*** Variables ***
${TOPNAV_TEAM_LINK} =       //*[@id="bs-example-navbar-collapse-1"]/ul/li[5]/a


*** Keywords ***

Click "Team" Page Link
    Click    ${TOPNAV_TEAM_LINK}