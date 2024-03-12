*** Settings ***
Documentation    This suite tests Front Office Site
Resource    ../../Resources/FrontOffice/FrontOfficeApp.robot    #necessary for lower level keywords in tests
Resource    ../../Resources/commonWeb.robot     #necessary for Setup & teardown level keywords in tests    
Test Setup        commonWeb.Begin Web Test
Test Teardown     commonWeb.End Web Test


# robot -d results tests\Front_Office.robot

*** Variables ***
${BROWSER} =    chrome
${URL} =    https://automationplayground.com/front-office/


*** Test Cases ***

Should be access to "Team" page
    [Documentation]    This is test 1
    [Tags]    test1

    FrontOfficeApp.Go to "Landing" Page
    FrontOfficeApp.Go to "Team" Page


Team page should match requirements
    [Documentation]    This is test 2
    [Tags]    test2

    FrontOfficeApp.Go to "Landing" Page
    FrontOfficeApp.Go to "Team" Page
    FrontOfficeApp.Validate "Team" Page
