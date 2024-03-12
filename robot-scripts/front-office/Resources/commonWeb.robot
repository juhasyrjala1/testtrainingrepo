*** Settings ***
Library    SeleniumLibrary
Resource    ../../first-script/crm/Resources/crmApp.robot

*** Variables ***
${BROWSER} =    edge
${URL} =    https://automationplayground.com/front-office/

*** Keywords ***

Begin Web Test
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

End Web Test
    Close All Browsers

