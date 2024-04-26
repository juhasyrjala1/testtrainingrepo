*** Settings ***
Library    QWeb
Library    String
Library    Collections
Library    BuiltIn    

*** Variables ***
${PRODUCTS_INVENTORY_CONTAINER} =     //*[@id="inventory_container"]
${SHOPPING_CART_ITEMS_IN_CART} =      //*[@class='shopping_cart_badge']
${REMOVE_FROM_CART_BUTTON} =          //*[contains(@id, 'remove')]
${SHOPPING_CART_LINK} =               //*[@class='shopping_cart_link']
${SHOPPING_CART_HEADER} =             Your Cart
${REMOVE_BTNS} =                      //button[contains(@id, "remove")]



*** Keywords ***

Verify Page Loaded
    VerifyElement    ${PRODUCTS_INVENTORY_CONTAINER}

Add Item To Shopping Cart
    [Arguments]   ${ItemToAdd}
    QWeb.ClickElement    ${ItemToAdd}


Verify Item Added To Shopping Cart
    VerifyElement    ${SHOPPING_CART_ITEMS_IN_CART}

Remove From Cart
    QWeb.ClickElement    ${REMOVE_FROM_CART_BUTTON}

Remove This Item From Cart
    [Arguments]    ${RemoveThisItem}
    QWeb.ClickElement    ${RemoveThisItem}


Products.Verify Item Removed From Shopping Cart
    VerifyNoElement    ${SHOPPING_CART_ITEMS_IN_CART}

Verify Item Amount
    [Arguments]    ${expected_items}
    ${expected_items}=    Convert To Integer    ${expected_items}
    ${item_count}=    QWeb.GetElementCount    ${REMOVE_BTNS}
    Should Be Equal    ${item_count}    ${expected_items}




Navigate to Shopping Cart Page
    QWeb.ClickElement    ${SHOPPING_CART_LINK}
    VerifyText    ${SHOPPING_CART_HEADER}