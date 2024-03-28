*** Settings ***
Library    Browser
Library    String
Library    Collections
Library    BuiltIn    

*** Variables ***
${PRODUCTS_INVENTORY_CONTAINER} =     //*[@id="inventory_container"]/div/div[1]/div[2]
...    #text=Sauce Labs Backpack
${SHOPPING_CART_ITEMS_IN_CART} =      //*[@id="shopping_cart_container"]/a/span
${REMOVE_FROM_CART_BUTTON} =          //*[contains(@id, 'remove')]
${SHOPPING_CART_LINK} =               //*[@id="shopping_cart_container"]/a
${SHOPPING_CART_HEADER} =             text=Your Cart



*** Keywords ***

Verify Page Loaded
    Get Element    ${PRODUCTS_INVENTORY_CONTAINER}

Add Item To Shopping Cart
    [Arguments]   ${ItemToAdd}
    Click    ${ItemToAdd}


Verify Item Added To Shopping Cart
    Get Element    ${SHOPPING_CART_ITEMS_IN_CART}

Remove From Cart
    Click    ${REMOVE_FROM_CART_BUTTON}

Remove This Item From Cart
    [Arguments]    ${RemoveThisItem}
    Click    ${RemoveThisItem}


Products.Verify Item Removed From Shopping Cart
    Browser.Get Element Count   ${SHOPPING_CART_ITEMS_IN_CART}    ==    0

Verify Item Amount
    [Arguments]    ${expected_items}

    Browser.Get Element Count    //button[contains(@id, "remove")]    ==     ${expected_items}


    #This works also, but it's a lot of more complex than using "Page Should Containt Element" with limit-setting:
    #$#{cart_badge_text}=    Get Text    ${SHOPPING_CART_ITEMS_IN_CART}
    #Run Keyword If    '${cart_badge_text}' == '${expected_items}'
    # ...    Log    Cart badge text matches the expected value
    # ...    ELSE
    # ...    Fail    Test failed: Cart badge text does not match the expected value
    # ...    

Navigate to Shopping Cart Page
    Click    ${SHOPPING_CART_LINK}
    Get Element    ${SHOPPING_CART_HEADER}