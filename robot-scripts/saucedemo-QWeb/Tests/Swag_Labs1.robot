*** Settings ***
Documentation    This suite tests Swag Labs Demo UI site
Resource    ../Resources/SwagLabsApp.robot    #necessary for lower level keywords in tests
Resource    ../Resources/commonWeb.robot     #necessary for Setup & teardown level keywords in tests    
Resource    ../Resources/Variables.robot     #necessary for variables in test cases
Resource    C:\\development\\TA\\UserListSwagLabs.robot
Test Setup        commonWeb.Begin Web Test
Test Teardown     commonWeb.End Web Test


# robot -d Results tests\Swag_Labs1.robot

*** Variables ***

#Product item variables stored in Variables.robot file
${BROWSER} =    chrome
${URL} =    https://www.saucedemo.com/



*** Test Cases ***
Should be able to add one item to cart
    [Documentation]    This tests adding one item in to shopping cart
    [Tags]    login

    SwagLabsApp.Go to "Landing" Page
    SwagLabsApp.Log In With Valid Credentials    ${VALID_LOGIN_USERNAME}    ${VALID_LOGIN_PASSWORD}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_BACKPACK}
    SwagLabsApp.Remove From Cart From Products Page


Should be able to add multiple items to cart
    [Documentation]    This tests adding multiple items in to shopping cart
    [Tags]    login

    SwagLabsApp.Go to "Landing" Page
    SwagLabsApp.Log In With Valid Credentials    ${VALID_LOGIN_USERNAME}    ${VALID_LOGIN_PASSWORD}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_BACKPACK}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_BIKE_LIGHT}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_BOLT_T_SHIRT}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_FLEECE_JACKET}
    SwagLabsApp.How Many Items Should Be In Cart    4
    #This is just an example of how custom library will work:
    SwagLabsApp.Do Some Custom Thing

Should be able to remove all items from cart

    SwagLabsApp.Go to "Landing" Page
    SwagLabsApp.Log In With Valid Credentials    ${VALID_LOGIN_USERNAME}    ${VALID_LOGIN_PASSWORD}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_BACKPACK}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_BIKE_LIGHT}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_BOLT_T_SHIRT}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_FLEECE_JACKET}
    SwagLabsApp.Navigate To Shopping Cart
    SwagLabsApp.Remove All Items From Cart Inside Shopping Cart Page

Should be able to remove one item from cart

    SwagLabsApp.Go to "Landing" Page
    SwagLabsApp.Log In With Valid Credentials    ${VALID_LOGIN_USERNAME}    ${VALID_LOGIN_PASSWORD}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_BACKPACK}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_BIKE_LIGHT}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_BOLT_T_SHIRT}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_FLEECE_JACKET}
    SwagLabsApp.How Many Items Should Be In Cart    4
    SwagLabsApp.Remove This Item    ${REMOVE_SAUCE_LABS_BOLT_T_SHIRT}
    SwagLabsApp.How Many Items Should Be In Cart    3

Should be able to checkout and purchase products

    SwagLabsApp.Go to "Landing" Page
    SwagLabsApp.Log In With Valid Credentials    ${VALID_LOGIN_USERNAME}    ${VALID_LOGIN_PASSWORD}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_BACKPACK}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_BIKE_LIGHT}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_BOLT_T_SHIRT}
    SwagLabsApp.Add Item In To Cart    ${SAUCE_LAB_FLEECE_JACKET}
    SwagLabsApp.Navigate To Shopping Cart
    SwagLabsApp.Continue To Checkout Page
    SwagLabsApp.Cancel From Checkout Page
    SwagLabsApp.Verify Products Are In Cart
    SwagLabsApp.Continue To Checkout Page
    SwagLabsApp.Continue To Checkout With Buyer's Information    ${TEST_BUYER1}

Should not be able to checkout without buyer information
    SwagLabsApp.Go to "Landing" Page
    SwagLabsApp.Log In With Valid Credentials    ${VALID_LOGIN_USERNAME}    ${VALID_LOGIN_PASSWORD}
    SwagLabsApp.Navigate To Shopping Cart
    SwagLabsApp.Continue To Checkout Page
    SwagLabsApp.Verify Error Message If Fields Are Left Empty
    #Finally, add relevant buyer information to verify user is able to proceed.
    SwagLabsApp.Continue To Checkout With Buyer's Information    ${TEST_BUYER1}


