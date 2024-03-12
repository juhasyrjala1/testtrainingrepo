*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${CART_ITEM_ELEMENT} =    //*[@id="cart_contents_container"]/div/div[1]/div[3]
${REMOVE_BUTTON_LOCATOR} =    //button[contains(@id, "remove")]
${CHECKOUT_BUTTON} =    id=checkout



*** Keywords ***

Remove All Items From Cart
#It's now deleting all added items by checking buttons that contains "Remove". It's storing these into lists and finding them ID's aswell
    Element Should Be Visible    ${CART_ITEM_ELEMENT}

    ${remove_buttons}=    Get WebElements    ${REMOVE_BUTTON_LOCATOR}
    FOR    ${button}    IN    @{remove_buttons}
        ${button_locator}=    Get Element Attribute    ${button}    id
        Click Element    ${button_locator}
        Wait Until Page Does Not Contain Element    ${button_locator}
        Run Keyword If    None    ${remove_buttons}    Exit For Loop
    END

Verify Cart Is Empty
    Element Should Not Be Visible    ${REMOVE_BUTTON_LOCATOR}

Remove Item From Cart
    [Arguments]    ${remove_item_from_cart}
    Element Should Be Visible    ${CART_ITEM_ELEMENT}
    Click Button    ${remove_item_from_cart}
    Wait Until Page Does Not Contain     ${CART_ITEM_ELEMENT}

Click Checkout Button
    Wait Until Page Contains Element    ${CHECKOUT_BUTTON}
    Click Element    ${CHECKOUT_BUTTON}

Verify Products Found In Cart Page
    ${remove_buttons}=    Get WebElements    ${REMOVE_BUTTON_LOCATOR}
    ${status}=    Run Keyword And Return Status    Should Not Be Empty    ${remove_buttons}
    Run Keyword If    not ${status}    Fail    No any items found!
    