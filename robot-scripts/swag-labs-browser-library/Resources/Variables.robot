*** Settings ***
Library    Browser
Resource    ../../first-script/crm/Resources/crmApp.robot

*** Variables ***

#All product item variables
${SAUCE_LAB_BACKPACK} =             id=add-to-cart-sauce-labs-backpack
${SAUCE_LAB_BIKE_LIGHT} =           id=add-to-cart-sauce-labs-bike-light
${SAUCE_LAB_BOLT_T_SHIRT} =         id=add-to-cart-sauce-labs-bolt-t-shirt
${SAUCE_LAB_FLEECE_JACKET} =        id=add-to-cart-sauce-labs-fleece-jacket
${ALL_ADD_TO_CART_ELEMENTS} =       xpath://*[contains(@id, 'add-to-cart')]



#Remove products
${REMOVE_SAUCE_LAB_BACKPACK} =          //*[contains(@id, 'remove')]
${REMOVE_SAUCE_LABS_BOLT_T_SHIRT} =     id=remove-sauce-labs-bolt-t-shirt



#Checkout Page personal information
&{TEST_BUYER1}                      FirstName=Seppo    LastName=Sepponen    PostalCode=68600
${CHECKOUT_FIRSTNAME} =             id=first-name
${CHECKOUT_LASTNAME} =              id=last-name
${CHECKOUT_POSTAL_CODE} =           id=postal-code





*** Keywords ***











