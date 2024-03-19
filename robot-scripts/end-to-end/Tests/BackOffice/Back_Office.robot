*** Settings ***
Documentation    This suite tests Front Office Site
Resource    ../../Resources/BackOffice/BackOfficeApp.robot    #necessary for lower level keywords in tests
Resource    ../../Resources/Common/commonWeb.robot     #necessary for Setup & teardown level keywords in tests    
Test Setup        commonWeb.Begin Web Test
Test Teardown     commonWeb.End Web Test

# robot -d C:\Development\Results tests\FrontOffice/Front_Office.robot

*** Variables ***
${BROWSER} =    chrome
${BACK_OFFICE_URL} =    https://automationplayground.com/back-office/


*** Test Cases ***

Should be access to "Landing" page
    [Documentation]    This is test 1
    [Tags]    test1

    BackOfficeApp.Go to "Landing" Page
