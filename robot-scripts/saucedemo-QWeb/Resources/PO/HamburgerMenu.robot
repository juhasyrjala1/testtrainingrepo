*** Settings ***
Library    QWeb

*** Variables ***
${TOPNAV_TEAM_LINK} =       //*[@id="bs-example-navbar-collapse-1"]/ul/li[5]/a
${LOGOUT_LINK} =            //*[@id="logout_sidebar_link"]
${HAMBURGER_NAVIGATION} =   //*[@id="react-burger-menu-btn"]
${RESET_APP_STATE} =        Reset App State
${MENU_ITEM_ALL_ITEMS} =    All Items
${MENU_ITEM_ABOUT} =        About
${MENU_ITEM_LOGOUT}         Logout
${CLOSE_HAMBURGER_MENU} =   //*[@id="react-burger-cross-btn"]
  


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

Verify All Items
    QWeb.VerifyText    ${MENU_ITEM_ALL_ITEMS}
    QWeb.VerifyText    ${RESET_APP_STATE}
    QWeb.VerifyText    ${MENU_ITEM_ABOUT}
    QWeb.VerifyText    ${MENU_ITEM_LOGOUT}

Close Hamburger Menu
    QWeb.ClickElement         ${CLOSE_HAMBURGER_MENU}
    VerifyNoText    ${MENU_ITEM_ALL_ITEMS}
    VerifyNoText    ${RESET_APP_STATE}
    VerifyNoText    ${MENU_ITEM_ABOUT}
    VerifyNoText    ${MENU_ITEM_LOGOUT}