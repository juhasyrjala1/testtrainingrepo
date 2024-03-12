*** Settings ***
Library      ../Libraries/MyCustomLibrary.py
Resource    ../Resources/commonWeb.robot     #necessary for Setup & teardown level keywords in tests 
Resource    ./PO/HamburgerMenu.robot     #necessary for Page Object level keywords in tests 
Resource    ./PO/Landing.robot    #necessary for Page Object level keywords in tests  
Resource    ./PO/Products.robot       #necessary for Page Object level keywords in tests 
Resource    ./PO/ProductItem.robot       #necessary for Page Object level keywords in tests 
Resource    ./PO/Login.robot       #necessary for Page Object level keywords in tests
Resource    ./PO/Cart.robot       #necessary for Page Object level keywords in tests 
Resource    ./PO/Checkout.robot       #necessary for Page Object level keywords in tests 



*** Keywords ****
Go to "Landing" Page
    Landing.Navigate To
    Landing.Verify Page Loaded
    
Login With Valid Credentials
    [Arguments]    ${Email}    ${Password}
    Login.Login With Credentials    ${Email}   ${Password}
    Products.Verify Page Loaded

Login With Invalid Credentials
    [Arguments]    ${Email}    ${Password}
    Login.Login With Credentials    ${Email}   ${Password}
    Login.Verify Error Message Loaded

Log Out
    HamburgerMenu.Open Hamburger Menu Options
    HamburgerMenu.Click Logout

Add Item In To Cart
    [Arguments]    ${ItemToAdd}
    Products.Add Item To Shopping Cart   ${ItemToAdd} 
    Products.Verify Item Added To Shopping Cart


Remove From Cart From Products Page
    Products.Remove From Cart
    Products.Verify Item Removed From Shopping Cart

Remove This Item
    [Arguments]    ${ItemToRemove}
    Products.Remove This Item From Cart    ${ItemToRemove}


How Many Items Should Be In Cart
    [Arguments]    ${expected_items}
    Products.Verify Item Amount    ${expected_items}

Do Some Custom Thing
    Do Something Special

Remove All Items From Cart Inside Shopping Cart Page
    Cart.Remove All Items From Cart
    Cart.Verify Cart Is Empty

Navigate To Shopping Cart
    Products.Navigate to Shopping Cart Page

Continue To Checkout Page
    Cart.Click Checkout Button

Cancel From Checkout Page
    Checkout.Click Cancel Button

Verify Products Are In Cart
    Cart.Verify Products Found In Cart Page

Continue To Checkout With Buyer's Information
    [Arguments]    ${UserData}
    
    Checkout.Fill First Name    ${UserData.FirstName}
    Checkout.Fill Last Name    ${UserData.LastName}
    Checkout.Fill Postal Code    ${UserData.PostalCode}
    Checkout.Click Continue
    Checkout.Verify Page Information
    Checkout.Finish purchase

Verify Error Message If Fields Are Left Empty
    Checkout.Verify Fields Should Not Be Empty



Attempt Login
    [Arguments]    ${Credentials}
    Login.Enter Credentials    ${Credentials}
    Login.Click "Login" Button

Verify Login Page Error Message
    [Arguments]    ${ExpectedErrorMessage}
    Login.Verify Error Message    ${ExpectedErrorMessage}

Test Multiple Login scenarios
    [Arguments]    ${Credentials}
    Go to "Landing" Page
    Attempt Login    ${Credentials}
    Verify Login Page Error Message    ${Credentials.ExpectedErrorMessage}
    



