*** Settings ***
Library    QWeb
Library    Collections
Resource    ../../../first-script/crm/Resources/PO/Customers.robot

*** Variables ***
${CART_ITEM_ELEMENT} =    //*[@id="cart_contents_container"]/div/div[1]/div[3]
${REMOVE_BUTTON_LOCATOR} =    //*[contains(@id, "remove")]
${CHECKOUT_BUTTON} =    //*[@id="checkout"]



*** Keywords ***

Remove All Items From Cart
#It's now deleting all added items by checking buttons that contains "Remove". It's storing these into lists and finding them ID's aswell
    VerifyText   ${CART_ITEM_ELEMENT}
    Repeat Keyword    4    QWeb.ClickElement    ${REMOVE_BUTTON_LOCATOR}
  
Verify Cart Is Empty
    ${elemcount}=    QWeb.GetElementCount    ${REMOVE_BUTTON_LOCATOR}
    Should Be True    ${elemcount} == 0

Remove Item From Cart
    [Arguments]    ${remove_item_from_cart}
    VerifyElement    ${CART_ITEM_ELEMENT}
    QWeb.ClickElement    ${remove_item_from_cart}
    VerifyNoElement     ${CART_ITEM_ELEMENT}

Click Checkout Button
    VerifyElement    ${CHECKOUT_BUTTON}
    ClickText    ${CHECKOUT_BUTTON}

Verify Products Found In Cart Page
    ${REMOVE_BUTTON_COUNT}    QWeb.GetElementCount    ${REMOVE_BUTTON_LOCATOR}
    ${status}=    Run Keyword And Return Status    Evaluate    ${REMOVE_BUTTON_COUNT} > 0
    Should Be True    ${status}
    