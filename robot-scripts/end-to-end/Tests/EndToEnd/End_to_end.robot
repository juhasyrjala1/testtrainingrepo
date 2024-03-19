*** Settings ***
Documentation    This suite tests Front Office Site
Resource    ../../Resources/BackOffice/BackOfficeApp.robot    #necessary for lower level keywords in tests
Resource    ../../Resources/FrontOffice/FrontOfficeApp.robot    #necessary for lower level keywords in tests
Resource    ../../Resources/Common/commonWeb.robot     #necessary for Setup & teardown level keywords in tests   
Resource    ../..//Data/InputData.robot    #necessary for lower level keywords in tests 
Test Setup        commonWeb.Begin Web Test
Test Teardown     commonWeb.End Web Test

# robot -d C:\Development\Results tests\FrontOffice/Front_Office.robot

*** Test Cases ***

Should be access to both sites
    [Documentation]    This is test 1
    [Tags]    test1
    FrontOfficeApp.Go to "Landing" Page
    BackOfficeApp.Go to "Landing" Page
