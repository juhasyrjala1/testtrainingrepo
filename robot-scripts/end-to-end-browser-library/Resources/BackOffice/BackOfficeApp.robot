*** Settings ***
Resource    ../Common/commonWeb.robot     #necessary for Setup & teardown level keywords in tests 
Resource    ./PO/TopNav.robot     #necessary for Page Object level keywords in tests 
Resource    ./PO/BackOffice.Landing.robot    #necessary for Page Object level keywords in tests  


#Resource    PO/xxx.robot


*** Keywords ****
Go to "Landing" Page
    BackOffice.Landing.Navigate To
