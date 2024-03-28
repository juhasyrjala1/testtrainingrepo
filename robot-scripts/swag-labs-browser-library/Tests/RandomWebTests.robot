*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/SwagLabsApp.robot    #necessary for lower level keywords in tests
Resource    ../Resources/commonWeb.robot     #necessary for Setup & teardown level keywords in tests   
Documentation    This suite tests Swag Labs Demo UI site
Test Setup        commonWeb.Begin Web Test
Test Teardown     commonWeb.End Web Test


# robot -d Results tests\Swag_Labs1.robot

*** Variables ***

#Product item variables stored in Variables.robot file
${BROWSER} =    ff
${URL} =    https://www.amazon.com/
${MY_VALUE} =    1000



*** Test Cases ***
Just trying out new stuff for test automation
    [Documentation]    This is just a random test case tutorial stuff
    [Tags]    login
    New Page    ${URL}
    Wait Until Element Is Visible    xpath=//div[@id='nav-xshop']//a[contains(text(),"Today's Deals")]
    Click Link    xpath=//div[@id='nav-xshop']//a[contains(text(),"Today's Deals")]

Testing if else 
    Run Keyword If    ${MY_VALUE} > 200    Log    "Foo"
    ...    ELSE IF    ${MY_VALUE} > 101     Log     "Bar"
    ...    ELSE    FAIL

For loops
    FOR    ${element}    IN RANGE    5 
        Log    ${element}
        ${RANDOM_STRING} =    Generate Random String    ${element}
        Log    ${RANDOM_STRING}
        
    END

