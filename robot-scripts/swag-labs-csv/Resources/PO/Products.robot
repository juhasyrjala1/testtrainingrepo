*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    BuiltIn    

*** Variables ***
${PRODUCTS_INVENTORY_CONTAINER} =     inventory_container
${SHOPPING_CART_ITEMS_IN_CART} =      class=shopping_cart_badge
${REMOVE_FROM_CART_BUTTON} =          //*[contains(@id, 'remove')]
${SHOPPING_CART_LINK} =               class=shopping_cart_link
${SHOPPING_CART_HEADER} =             Your Cart



*** Keywords ***

Verify Page Loaded
    Wait Until Page Contains Element    ${PRODUCTS_INVENTORY_CONTAINER}

Add Item To Shopping Cart
    [Arguments]   ${ItemToAdd}
    Click Button    ${ItemToAdd}


Verify Item Added To Shopping Cart
    Wait Until Page Contains Element    ${SHOPPING_CART_ITEMS_IN_CART}

Remove From Cart
    Click Button    ${REMOVE_FROM_CART_BUTTON}


Products.Verify Item Removed From Shopping Cart
    Wait Until Page Does Not Contain Element    ${SHOPPING_CART_ITEMS_IN_CART}

Verify Item Amount
    [Arguments]    ${expected_items}

    Page Should Contain Element    //button[contains(@id, "remove")]    limit=${expected_items}


    #This works also, but it's a lot of more complex than using "Page Should Containt Element" with limit-setting:
    #$#{cart_badge_text}=    Get Text    ${SHOPPING_CART_ITEMS_IN_CART}
    #Run Keyword If    '${cart_badge_text}' == '${expected_items}'
    # ...    Log    Cart badge text matches the expected value
    # ...    ELSE
    # ...    Fail    Test failed: Cart badge text does not match the expected value
    # ...    

Navigate to Shopping Cart Page
    Click Link    ${SHOPPING_CART_LINK}
    Wait Until Page Contains    ${SHOPPING_CART_HEADER}