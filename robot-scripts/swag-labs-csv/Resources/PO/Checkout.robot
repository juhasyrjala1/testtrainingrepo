*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../..//Resources/Variables.robot     #necessary for variables in test cases

*** Variables ***
${CANCEL_BUTTON} =    id=cancel
${CONTINUE_BUTTON} =    id=continue
${ERROR_MSG_FIRST_NAME} =    xpath=//div[contains(@class,error-message-container)]//h3[contains(text(),'First Name')]
${ERROR_MSG_LAST_NAME} =    xpath=//div[contains(@class,error-message-container)]//h3[contains(text(),'Last Name')]
${ERROR_MSG_POSTAL_CODE} =    xpath=//div[contains(@class,error-message-container)]//h3[contains(text(),'Postal')]



*** Keywords ***

Click Cancel Button
    Wait Until Page Contains Element    ${CANCEL_BUTTON}
    Click Element    ${CANCEL_BUTTON}

Fill First Name
    [Arguments]    ${Firstname}
    Input Text    ${CHECKOUT_FIRSTNAME}    ${Firstname}
        

Fill Last Name
    [Arguments]    ${Lastname}
    Input Text    ${CHECKOUT_LASTNAME}    ${Lastname}

Fill Postal Code
    [Arguments]    ${Postal_code}
    Input Text    ${CHECKOUT_POSTAL_CODE}    ${Postal_code}

Click Continue
    Click Button    ${CONTINUE_BUTTON}

Verify Fields Should Not Be Empty   
    Click Continue
    Wait Until Page Contains Element    ${ERROR_MSG_FIRST_NAME}
    Fill First Name    John
    Click Continue
    Wait Until Page Contains Element    ${ERROR_MSG_LAST_NAME}
    Fill Last Name    Doe 
    Click Continue
    Wait Until Page Contains Element    ${ERROR_MSG_POSTAL_CODE}
    Fill Postal Code    65100
    