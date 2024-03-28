*** Settings ***
Library    Browser
Library    Collections
Resource    ../..//Resources/Variables.robot     #necessary for variables in test cases

*** Variables ***
${CANCEL_BUTTON} =    id=cancel
${CONTINUE_BUTTON} =    id=continue
${FINISH_CHECKOUT_BUTTON} =    id=finish
${ERROR_MSG_FIRST_NAME} =    xpath=//div[contains(@class,error-message-container)]//h3[contains(text(),'First Name')]
${ERROR_MSG_LAST_NAME} =    xpath=//div[contains(@class,error-message-container)]//h3[contains(text(),'Last Name')]
${ERROR_MSG_POSTAL_CODE} =    xpath=//div[contains(@class,error-message-container)]//h3[contains(text(),'Postal')]
${CHECKOUT_OVERVIEW_TITLE} =    text=Checkout: Overview
${CHECKOUT_READY_THANK_YOU_MSG} =    text=Thank you for your order!



*** Keywords ***

Click Cancel Button
    Get Element    ${CANCEL_BUTTON}
    Click    ${CANCEL_BUTTON}

Fill First Name
    [Arguments]    ${Firstname}
    Fill Text    ${CHECKOUT_FIRSTNAME}    ${Firstname}
        

Fill Last Name
    [Arguments]    ${Lastname}
    Fill Text    ${CHECKOUT_LASTNAME}    ${Lastname}

Fill Postal Code
    [Arguments]    ${Postal_code}
    Fill Text    ${CHECKOUT_POSTAL_CODE}    ${Postal_code}

Click Continue
    Click    ${CONTINUE_BUTTON}

Verify Fields Should Not Be Empty   
    Click Continue
    Get Element    ${ERROR_MSG_FIRST_NAME}
    Fill First Name    John
    Click Continue
    Get Element    ${ERROR_MSG_LAST_NAME}
    Fill Last Name    Doe 
    Click Continue
    Get Element    ${ERROR_MSG_POSTAL_CODE}
    Fill Postal Code    65100

Verify Page Information
    Get Element    ${CHECKOUT_OVERVIEW_TITLE}

Finish purchase    
    Click Finish Button
    Get Element    ${CHECKOUT_READY_THANK_YOU_MSG}

Click Finish Button
    Click    ${FINISH_CHECKOUT_BUTTON}

    