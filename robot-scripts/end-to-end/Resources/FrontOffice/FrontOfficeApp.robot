*** Settings ***
Resource    ../Common/commonWeb.robot     #necessary for Setup & teardown level keywords in tests 
Resource    ./PO/TopNav.robot     #necessary for Page Object level keywords in tests 
Resource    ./PO/FrontOffice.Landing.robot    #necessary for Page Object level keywords in tests  
Resource    ./PO/Team.robot       #necessary for Page Object level keywords in tests 


#Resource    PO/xxx.robot


*** Keywords ****
Go to "Landing" Page
    FrontOffice.Landing.Navigate To
    FrontOffice.Landing.Verify Page Loaded
    
Go to "Team" page
    TopNav.Click "Team" Page Link
    Team.Verify Page Loaded

Validate "Team" Page
    Team.Validate Page Contents