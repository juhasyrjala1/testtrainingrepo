*** Settings ***
Documentation    This suite tests Swag Labs Demo UI site
Resource    ../Resources/SwagLabsApp.robot    #necessary for lower level keywords in tests
Resource    ../Resources/commonWeb.robot     #necessary for Setup & teardown level keywords in tests    
Resource    ../Resources/Variables.robot     #necessary for variables in test cases
Resource    ../Data/InputData.robot     #necessary for variables in test cases
Resource    C:\\development\\TA\\UserListSwagLabs.robot
Test Setup        commonWeb.Begin Web Test    
Test Teardown     commonWeb.End Web Test


# robot -d Results tests\Swag_Labs1.robot

*** Variables ***

#Product item variables stored in Variables.robot file
${BROWSER} =    chrome
${URL} =    https://www.saucedemo.com/


*** Test Cases ***
Should be able to login and logout
    [Documentation]    This tests login with valid credentials
    [Tags]    login

    SwagLabsApp.Go to "Landing" Page
    SwagLabsApp.Log In With Valid Credentials    ${VALID_LOGIN_USERNAME}    ${VALID_LOGIN_PASSWORD}
    SwagLabsApp.Log Out
  

Should not be able to login with invalid credentials
    [Documentation]    Testing to login with invalid credentials
    [Tags]    login

    SwagLabsApp.Go to "Landing" Page
    SwagLabsApp.Log In With Invalid Credentials    ${INVALID_LOGIN_USERNAME}    ${VALID_LOGIN_PASSWORD}
    SwagLabsApp.Log In With Invalid Credentials    ${VALID_LOGIN_USERNAME}    ${INVALID_LOGIN_PASSWORD}
    SwagLabsApp.Log In With Invalid Credentials    ${INVALID_LOGIN_USERNAME}    ${INVALID_LOGIN_PASSWORD}


#Test login scenarios by using Dictionary
DDT - Try login without any credentials
    SwagLabsApp.Go to "Landing" Page
    SwagLabsApp.Attempt Login    ${BLANK_CREDENTIALS_USER}
    SwagLabsApp.Verify Login Page Error Message    ${BLANK_CREDENTIALS_USER.ExpectedErrorMessage}

DDT - Unregistered try to login
    SwagLabsApp.Go to "Landing" Page
    SwagLabsApp.Attempt Login    ${UNREGISTERED_USER}
    SwagLabsApp.Verify Login Page Error Message    ${UNREGISTERED_USER.ExpectedErrorMessage}

DDT - Try to login by using invalid password
    SwagLabsApp.Go to "Landing" Page
    SwagLabsApp.Attempt Login    ${INVALID_PASSWORD_USER}
    SwagLabsApp.Verify Login Page Error Message    ${INVALID_PASSWORD_USER.ExpectedErrorMessage}

DDT - Try to login with locked out user
    SwagLabsApp.Go to "Landing" Page
    SwagLabsApp.Attempt Login    ${LOCKED_OUT_USER_PASSWORD_USER}
    SwagLabsApp.Verify Login Page Error Message    ${LOCKED_OUT_USER_PASSWORD_USER.ExpectedErrorMessage}


#New way to test multiple login scenarios
Invalid login scenarios should display correct error messages
    [Template]    Test Multiple Login scenarios
    ${BLANK_CREDENTIALS_USER}
    ${UNREGISTERED_USER}
    ${INVALID_PASSWORD_USER}
    ${LOCKED_OUT_USER_PASSWORD_USER}