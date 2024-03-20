*** Settings ***
Library    Browser

*** Variables ***
${BROWSER} =    chromium
${FRONT_OFFICE_URL} =    https://automationplayground.com/front-office/
${BACK_OFFICE_URL} =    https://automationplayground.com/back-office/

*** Keywords ***

Begin Web Test
    New Browser    chromium    headless=no
    New Page  
    #Maximize Browser Window

End Web Test
    Browser.Close Browser    ALL

