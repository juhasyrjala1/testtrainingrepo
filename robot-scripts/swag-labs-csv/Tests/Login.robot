*** Settings ***
Documentation    This suite tests Swag Labs Demo UI site
Resource    ../Resources/SwagLabsApp.robot    #necessary for lower level keywords in tests
Resource    ../Resources/commonWeb.robot     #necessary for Setup & teardown level keywords in tests    
Resource    ../Resources/Variables.robot     #necessary for variables in test cases
Resource    ../Data/InputData.robot     #necessary for variables in test cases
Resource    ../Resources/DataManager.robot    #necessary for lower level keywords in tests
Resource    C:\\development\\TA\\UserListSwagLabs.robot
Test Setup        commonWeb.Begin Web Test    
Test Teardown     commonWeb.End Web Test


# robot -d Results tests\Swag_Labs1.robot

*** Variables ***

#Product item variables stored in Variables.robot file
${BROWSER} =    chrome
${URL} =    https://www.saucedemo.com/


*** Test Cases ***

#Read CSV File - good to get the data from different source
Should show correct error msgs with invalid logins
    ${InvalidLoginScenarios} =    DataManager.Get CSV Data    ${INVALID_CREDENTIALS_PATH_CSV}
    SwagLabsApp.Login With Many Invalid Credentials    ${InvalidLoginScenarios}
