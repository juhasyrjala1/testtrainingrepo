*** Settings ***
Library    Browser
Resource    ../../first-script/crm/Resources/crmApp.robot

*** Variables ***
${BROWSER} =    chromium
${URL} =    https://www.saucedemo.com/

*** Keywords ***

Begin Web Test
    New page    ${URL}

End Web Test
    Browser.Close Browser

