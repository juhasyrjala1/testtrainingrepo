*** Settings ***
Documentation    This suite tests Front Office Site
Resource    ../Resources/FrontOfficeApp.robot    #necessary for lower level keywords in tests
Resource    ../Resources/commonWeb.robot     #necessary for Setup & teardown level keywords in tests    
#Test Setup        commonWeb.Begin Web Test
#Test Teardown     commonWeb.End Web Test


# robot -d results tests\Front_Office.robot

*** Variables ***
${BROWSER} =    chrome
${URL} =    https://www.saucedemo.com/


*** Test Cases ***

Tulosta Luvut
    [Documentation]    This is test 1
    [Tags]    random
  #  Open Browser  ${URL}  ${BROWSER}
  #  Maximize Browser Window
    FOR    ${i}    IN RANGE    1    10

    IF    ${i} == 3
        Log    perse
    ELSE IF    ${i} == 4
        Log    Pylly
    ELSE
        Log    ${i}
    END
    END

    Close All Browsers