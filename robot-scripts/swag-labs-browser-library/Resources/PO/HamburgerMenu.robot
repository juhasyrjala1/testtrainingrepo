*** Settings ***
Library    Browser

*** Variables ***
${TOPNAV_TEAM_LINK} =       //*[@id="bs-example-navbar-collapse-1"]/ul/li[5]/a
${LOGOUT_LINK} =            id=logout_sidebar_link
${HAMBURGER_NAVIGATION} =   id=react-burger-menu-btn


*** Keywords ***

Click "Team" Page Link
    Click    ${TOPNAV_TEAM_LINK}

Open Hamburger Menu Options
    Click    ${HAMBURGER_NAVIGATION}
    Get Element By Role   ${LOGOUT_LINK}

Click Logout
    Click    ${LOGOUT_LINK}