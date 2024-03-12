*** Settings ***
Library    SeleniumLibrary
Resource    ../../first-script/crm/Resources/crmApp.robot

*** Variables ***
${BROWSER} =    chrome
${URL} =    https://www.saucedemo.com/

*** Keywords ***

Begin Web Test
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

End Web Test
    Close All Browsers

