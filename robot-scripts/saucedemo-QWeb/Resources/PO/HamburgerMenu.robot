*** Settings ***
Library    QWeb

*** Variables ***
${TOPNAV_TEAM_LINK} =       //*[@id="bs-example-navbar-collapse-1"]/ul/li[5]/a
${LOGOUT_LINK} =            //*[@id="logout_sidebar_link"]
${HAMBURGER_NAVIGATION} =   //*[@id="react-burger-menu-btn"]
${RESET_APP_STATE} =        Reset App State


*** Keywords ***

Click "Team" Page Link
    QWeb.ClickElement    ${TOPNAV_TEAM_LINK}

Open Hamburger Menu Options
    QWeb.ClickElement    ${HAMBURGER_NAVIGATION}
    VerifyElement    ${LOGOUT_LINK}

Click Logout
    QWeb.ClickElement    ${LOGOUT_LINK}

Click "Reset App State"
    QWeb.ClickText    ${RESET_APP_STATE}