*** Settings ***
Library    QWeb

*** Variables ***
${INVENTORY_PRODUCT_TITLE} =    Products
${URL} =    https://saucedemo.com


*** Keywords ***


Verify Page Loaded
    VerifyText   ${INVENTORY_PRODUCT_TITLE}
    
