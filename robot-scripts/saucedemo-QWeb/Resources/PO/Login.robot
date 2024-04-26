*** Settings ***
Library    QWeb

*** Variables ***
${LOGIN_BUTTON} =                       //*[@id="login-button"]
${SIGNIN_USERNAME_TEXTBOX} =            //*[@id="user-name"]
${SIGNIN_PASSWORD_TEXTBOX} =            Password
${LOGIN_ERROR_INVALID_CREDENTIALS} =    //*[@id="login_button_container"]/div/form/div[3]/h3


*** Keywords ***



Login With Credentials
    [Arguments]    ${Email}    ${Password}
    VerifyElement    ${LOGIN_BUTTON}
    VerifyElement    ${SIGNIN_USERNAME_TEXTBOX}

    Fill "Email" Field        ${Email}
    Fill "Password" Field     ${Password}
    Click "Login" Button

Fill "Email" Field
    [Arguments]    ${Email}
    Type Text    ${SIGNIN_USERNAME_TEXTBOX}    ${Email}

Fill "Password" Field
    [Arguments]   ${Password}
    Type Text    Password    ${Password}

Click "Login" Button
    Qweb.ClickElement    ${LOGIN_BUTTON}

Verify Error Message Loaded
    VerifyElement    ${LOGIN_ERROR_INVALID_CREDENTIALS}



#Data Driven Method: 

Enter Credentials
    [Arguments]    ${Credentials}
    Run Keyword If    '${Credentials.Email}' != '#BLANK'    Type Text   ${SIGNIN_USERNAME_TEXTBOX}     ${Credentials.Email}
    Run Keyword If    '${Credentials.Password}' != '#BLANK'    Type Text    ${SIGNIN_PASSWORD_TEXTBOX}    ${Credentials.Password}

Verify Error Message
    [Arguments]    ${ExpectedErrorMessage}
    VerifyText   ${ExpectedErrorMessage}
    
