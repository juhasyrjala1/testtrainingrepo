*** Settings ***
Library    QWeb
Resource    ../../first-script/crm/Resources/crmApp.robot

*** Variables ***
${BROWSER} =    chrome
${URL} =    https://www.saucedemo.com/

*** Keywords ***

Begin Web Test
    QWeb.Open Browser  ${URL}  ${BROWSER}
    Maximize Window

End Web Test
    QWeb.Close Browser