*** Settings ***
Documentation    This is some basic info about the whole suite 


#C:/development/robot-scripts/first-script/crm
Resource    ../Resources/crmApp.robot     #necessary for lower level keywords in tests
Resource    ../Resources/commonApp.robot     #necessary for Setup & teardown level keywords in tests
Test Setup    commonApp.Begin Web Test
Test Teardown    Commonapp.End Web Test


#Run the script:
#robot -d Results\ .\Tests\login.robot

*** Variables ***
${BROWSER} =        chrome
${URL} =        
${LOGIN_EMAIL_ADDRESS}
${LOGIN_EMAIL_ADDRESS}
${LOGIN_EMAIL_ADDRESS} =    admin@robotframeworktutorial.com
${LOGIN_EMAIL_PASSWORD} =   qwe


*** Test Cases ***
Should be able to login with variables in use 
    crmApp.Login    ${LOGIN_EMAIL_ADDRESS}    ${LOGIN_EMAIL_PASSWORD}

Log in with right credentials
    [Documentation]        Log in with right credentials   
    [Tags]                 1006    Smoke    Contacts    LoginTest

    crmApp.Navigate CRM Front Page
    crmApp.Click Sign In
    crmApp.Type Credentials And Click Submit       

Navigate to Front Page
    [Documentation]        Navigate only to front page  
    [Tags]                 1006    Smoke    Contacts    LoginTest

    crmApp.Navigate CRM Front Page