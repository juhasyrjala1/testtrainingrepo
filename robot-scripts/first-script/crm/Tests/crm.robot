*** Settings ***
Documentation    This suite adds new customers 
Library    QWeb     # Import library
#Library    SeleniumLibrary
Resource    C:/development/robot-scripts/first-script/crm/Resources/crmApp.robot     #necessary for lower level keywords in tests
Resource    C:/development/robot-scripts/first-script/crm/Resources/commonApp.robot     #necessary for Setup & teardown level keywords in tests
#Resource    ${USER_LIST_FILE}
Resource    C:\\development\\TA\\UserList.robot
Test Setup        commonApp.Begin Web Test
Test Teardown     commonapp.End Web Test

*** Variables ***
${FIRSTNAME} =        Jane
${LASTNAME} =         Doe
${CITY} =             Dallas
${STATEORREGION} =    TX
${GENDER} =           male


#Run the script:
#robot -d Results\ .\Tests\crm.robot


*** Test Cases ***
Just A Random Test
    QWeb.OpenBrowser    https://automationplayground.com/crm/login.html    chrome
    QWeb.VerifyText     Login

    
Home Page should load
    [Documentation]        Test the login  
    [Tags]                 1002    Smoke    Home
    crmApp.Go to "Home" page

Should be able to Login With Valid Credentials
    [Documentation]        Test the login  
    [Tags]                 1002    Smoke    Login

    crmApp.Go to "Home" page
    crmApp.Login With Valid Credentials    ${VALID_LOGIN_EMAIL}    ${VALID_LOGIN_PASSWORD}


Should be able to Log Out
    [Documentation]        Test the logout  
    [Tags]                 1004    Smoke    Logout

    crmApp.Go to "Home" page
    crmApp.Login With Valid Credentials    ${VALID_LOGIN_EMAIL}    ${VALID_LOGIN_PASSWORD}
    crmApp.Add New Customer
    crmApp.Sign Out

User should be able to add new customer
    [Documentation]        This is some basic info about TEST   
    [Tags]                 1006    Smoke    Contacts

    crmApp.Go to "Home" page
    crmApp.Login With Valid Credentials    ${VALID_LOGIN_EMAIL}    ${VALID_LOGIN_PASSWORD}
    crmApp.Add New Customer
    crmApp.Sign Out
              


