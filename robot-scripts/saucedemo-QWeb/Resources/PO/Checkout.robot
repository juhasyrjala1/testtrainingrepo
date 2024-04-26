*** Settings ***
Library    QWeb
Library    Collections
Resource    ../..//Resources/Variables.robot     #necessary for variables in test cases

*** Variables ***
${CANCEL_BUTTON} =    //*[@id="cancel"]
${CONTINUE_BUTTON} =    //*[@id="continue"]
${FINISH_CHECKOUT_BUTTON} =    //*[@id="finish"]
${ERROR_MSG_FIRST_NAME} =    xpath=//div[contains(@class,error-message-container)]//h3[contains(text(),'First Name')]
${ERROR_MSG_LAST_NAME} =    xpath=//div[contains(@class,error-message-container)]//h3[contains(text(),'Last Name')]
${ERROR_MSG_POSTAL_CODE} =    xpath=//div[contains(@class,error-message-container)]//h3[contains(text(),'Postal')]
${CHECKOUT_OVERVIEW_TITLE} =    Checkout: Overview
${CHECKOUT_READY_THANK_YOU_MSG} =    Thank you for your order!



*** Keywords ***

Click Cancel Button
    Verify Element    ${CANCEL_BUTTON}
    QWeb.ClickElement    ${CANCEL_BUTTON}

Fill First Name
    [Arguments]    ${Firstname}
    Type Text    ${CHECKOUT_FIRSTNAME}    ${Firstname}
        

Fill Last Name
    [Arguments]    ${Lastname}
    Type Text    ${CHECKOUT_LASTNAME}    ${Lastname}

Fill Postal Code
    [Arguments]    ${Postal_code}
    Type Text    ${CHECKOUT_POSTAL_CODE}    ${Postal_code}

Click Continue
    QWeb.Click Element    ${CONTINUE_BUTTON}

Verify Fields Should Not Be Empty   
    Click Continue
    VerifyElement    ${ERROR_MSG_FIRST_NAME}
    Fill First Name    John
    Click Continue
    VerifyElement    ${ERROR_MSG_LAST_NAME}
    Fill Last Name    Doe 
    Click Continue
    VerifyElement    ${ERROR_MSG_POSTAL_CODE}
    Fill Postal Code    65100

Verify Page Information
    VerifyText    ${CHECKOUT_OVERVIEW_TITLE}

Finish purchase    
    Click Finish Button
    VerifyText    ${CHECKOUT_READY_THANK_YOU_MSG}

Click Finish Button
    QWeb.ClickElement    ${FINISH_CHECKOUT_BUTTON}

    