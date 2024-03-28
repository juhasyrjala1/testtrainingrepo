*** Settings ***
Library    Browser
Library    Collections
Resource    ../../../first-script/crm/Resources/PO/Customers.robot

*** Variables ***
${CART_ITEM_ELEMENT} =    //*[@id="cart_contents_container"]/div/div[1]/div[3]
${REMOVE_BUTTON_LOCATOR} =    text=Remove
${CHECKOUT_BUTTON} =    id=checkout



*** Keywords ***

Remove All Items From Cart
#It's now deleting all added items by checking buttons that contains "Remove". It's storing these into lists and finding them ID's aswell
    Get Element   ${CART_ITEM_ELEMENT}
    ${remove_buttons}=    Get Elements    ${REMOVE_BUTTON_LOCATOR}
# Create a list, where all element ID's will be stored.
    ${button_ids}=    Create List
# Go through all found elements
    FOR    ${button}    IN    @{remove_buttons}
    # Get element ID-attribute
    ${button_id}=    Get Attribute    ${button}    id
    # Add ID-attribute to list
    ${button_locator}=    Set Variable    id=${button_id}
    Append To List    ${button_ids}    ${button_locator}
    END
# Click locator that has id=xx attribute until there is not any element existing on page.
    FOR    ${id_btn_locator}    IN    @{button_ids}
        Take Screenshot
        Click   ${id_btn_locator}   
        ${remaining_elements}=    Browser.Get Elements    ${REMOVE_BUTTON_LOCATOR}
    Run Keyword If    not ${remaining_elements}    Exit For Loop
    END
  
Verify Cart Is Empty
    ${elemcount}=    Browser.Get Element Count    ${REMOVE_BUTTON_LOCATOR}
    Should Be True    ${elemcount} == 0

Remove Item From Cart
    [Arguments]    ${remove_item_from_cart}
    Get Element    ${CART_ITEM_ELEMENT}
    Click    ${remove_item_from_cart}
    Browser.Get Element Count     ${CART_ITEM_ELEMENT} == 0

Click Checkout Button
    Get Element    ${CHECKOUT_BUTTON}
    Click    ${CHECKOUT_BUTTON}

Verify Products Found In Cart Page
    ${remove_buttons}=    Browser.Get Element Count    ${REMOVE_BUTTON_LOCATOR}
    ${status}=    Run Keyword And Return Status    Should Not Be Empty    ${remove_buttons}
    Run Keyword If    not ${status}    Fail    No any items found!
    