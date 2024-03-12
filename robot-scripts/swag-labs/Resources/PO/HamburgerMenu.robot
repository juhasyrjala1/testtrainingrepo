*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TOPNAV_TEAM_LINK} =       //*[@id="bs-example-navbar-collapse-1"]/ul/li[5]/a
${LOGOUT_LINK} =            id=logout_sidebar_link
${HAMBURGER_NAVIGATION} =   id=react-burger-menu-btn


*** Keywords ***

Click "Team" Page Link
    Click Link    ${TOPNAV_TEAM_LINK}

Open Hamburger Menu Options
    Click Button    ${HAMBURGER_NAVIGATION}
    Wait Until Page Contains Element    ${LOGOUT_LINK}

Click Logout
    Click Link    ${LOGOUT_LINK}