***Settings***
Library    QWeb     # Import library


*** Variables ***
${BONUS_TABLE} =    xpath=//*/duet-table/table

*** Test Cases ***
Just A Random Test
    [Documentation]    Just a random test to quickly try out QWeb library
    OpenBrowser    https://www.saucedemo.com/    chrome
    VerifyText    Swag Labs
    TypeText      Username    standard_user
    Type Text    Password    secret_sauce
    Click Text    Login
    Verify Text    Sauce Labs Backpack
    CloseAllBrowsers