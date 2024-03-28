*** Settings ***
Library    Browser

*** Variables ***
${LOGIN_BUTTON} =                       id=login-button
${SIGNIN_USERNAME_TEXTBOX} =            id=user-name
${SIGNIN_PASSWORD_TEXTBOX} =            id=password
${LOGIN_ERROR_INVALID_CREDENTIALS} =    //*[@id="login_button_container"]/div/form/div[3]/h3


*** Keywords ***



Login With Credentials
    [Arguments]    ${Email}    ${Password}
    Get Element    ${LOGIN_BUTTON}
    Get Element   ${SIGNIN_USERNAME_TEXTBOX}
    Get Element    ${SIGNIN_PASSWORD_TEXTBOX}

    Fill "Email" Field        ${Email}
    Fill "Password" Field     ${Password}
    Click "Login" Button

Fill "Email" Field
    [Arguments]    ${Email}
    Fill Text    ${SIGNIN_USERNAME_TEXTBOX}    ${Email}

Fill "Password" Field
    [Arguments]   ${Password}
    Fill Text    ${SIGNIN_PASSWORD_TEXTBOX}    ${Password}

Click "Login" Button
    Click    ${LOGIN_BUTTON}

Verify Error Message Loaded
    Get Element    ${LOGIN_ERROR_INVALID_CREDENTIALS}



#Data Driven Method: 

Enter Credentials
    [Arguments]    ${Credentials}
    Run Keyword If    '${Credentials.Email}' != '#BLANK'    Fill Text   ${SIGNIN_USERNAME_TEXTBOX}     ${Credentials.Email}
    Run Keyword If    '${Credentials.Password}' != '#BLANK'    Fill Text    ${SIGNIN_PASSWORD_TEXTBOX}    ${Credentials.Password}

Verify Error Message
    [Arguments]    ${ExpectedErrorMessage}
    Get Element    ${ExpectedErrorMessage}
    
