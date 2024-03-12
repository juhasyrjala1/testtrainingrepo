*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${LOGIN_EMAIL_LOCATOR} =      id=email-id   
${LOGIN_PASSWORD_LOCATOR} =    id=password 
${SUBMIT_BUTTON} =            id=submit-id
${CLICK_SIGN_IN_LINK} =       Sign In
${SIGNIN_MAIN_HEADING_AFTER_LOGIN} =        xpath=//h2


*** Keywords ***



Login With Valid Credentials
    [Arguments]     ${Username}    ${Password}
    Fill "Username" Field    ${Username}
    Fill "Password" Field    ${Password}
    Click Submit Button

Fill "Username" Field
    [Arguments]     ${Username}
    Log    Filling username with ${Username}

Fill "Password" Field
    [Arguments]    ${Password}
    Log    Filling password with ${Password}
Click Submit Button
    Click Link    ${CLICK_SIGN_IN_LINK}

    

