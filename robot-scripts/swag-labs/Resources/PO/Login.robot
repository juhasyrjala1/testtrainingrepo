*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_BUTTON} =                       id=login-button
${SIGNIN_USERNAME_TEXTBOX} =            id=user-name
${SIGNIN_PASSWORD_TEXTBOX} =            id=password
${LOGIN_ERROR_INVALID_CREDENTIALS} =    //*[@id="login_button_container"]/div/form/div[3]/h3


*** Keywords ***



Login With Credentials
    [Arguments]    ${Email}    ${Password}
    Wait Until Element Is Visible    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${SIGNIN_USERNAME_TEXTBOX}
    Wait Until Element Is Visible    ${SIGNIN_PASSWORD_TEXTBOX}

    Fill "Email" Field        ${Email}
    Fill "Password" Field     ${Password}
    Click "Login" Button

Fill "Email" Field
    [Arguments]    ${Email}
    Input Text    ${SIGNIN_USERNAME_TEXTBOX}    ${Email}

Fill "Password" Field
    [Arguments]   ${Password}
    Input Text    ${SIGNIN_PASSWORD_TEXTBOX}    ${Password}

Click "Login" Button
    Click Button    ${LOGIN_BUTTON}

Verify Error Message Loaded
    Wait Until Page Contains Element    ${LOGIN_ERROR_INVALID_CREDENTIALS}



#Data Driven Method: 

Enter Credentials
    [Arguments]    ${Credentials}
    Run Keyword If    '${Credentials.Email}' != '#BLANK'    Input Text   ${SIGNIN_USERNAME_TEXTBOX}     ${Credentials.Email}
    Run Keyword If    '${Credentials.Password}' != '#BLANK'    Input Text    ${SIGNIN_PASSWORD_TEXTBOX}    ${Credentials.Password}

Verify Error Message
    [Arguments]    ${ExpectedErrorMessage}
    Page Should Contain    ${ExpectedErrorMessage}
    
